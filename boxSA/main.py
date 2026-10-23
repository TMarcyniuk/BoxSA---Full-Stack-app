from flask import Flask, render_template, request, jsonify, session, redirect, url_for
import mysql.connector
from mysql.connector import Error
from datetime import datetime
import traceback

app = Flask(__name__)
app.secret_key = 'clave_secreta_boxsa_123'  

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Kiro2907',
    'database': 'boxsa'
}

def get_db_connection():
    try:
        conn = mysql.connector.connect(**db_config)
        return conn
    except Error as e:
        print(f"Error al conectar a MySQL: {e}")
        return None

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        session['vendedor_id'] = int(request.form['vendedor_id'])
        session['vendedor_nombre'] = request.form['vendedor_nombre']
        return redirect(url_for('home'))
        
    conn = get_db_connection()
    if not conn:
        return "<h1>Error Crítico:</h1><p>Flask NO se está conectando a MySQL.</p>"
        
    try:
        cursor = conn.cursor(dictionary=True) 
        cursor.execute("SELECT * FROM usuarios")
        vendedores = cursor.fetchall()
        cursor.close()
        conn.close()
        
        if len(vendedores) == 0:
            return "<h1>Tabla usuarios vacía</h1>"
            
    except Exception as e:
        return f"<h1>Error SQL:</h1><p>{str(e)}</p>"
        
    return render_template('login.html', vendedores=vendedores)

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

@app.route('/')
def home():
    if 'vendedor_id' not in session:
        return redirect(url_for('login'))
        
    conn = get_db_connection()
    metrics = {'recaudacion_total': 0, 'ganancias_mes': 0, 'a_cobrar': 0, 'a_pagar': 0}
    chart_labels = []
    chart_data = []
    
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            
            # 1. KPIs Generales
            cursor.execute("SELECT * FROM vw_dashboard_kpis")
            row = cursor.fetchone()
            if row:
                metrics['recaudacion_total'] = row['recaudacion_total']
                metrics['ganancias_mes'] = row['ganancias_mes']
                metrics['a_cobrar'] = row['a_cobrar']
                metrics['a_pagar'] = row['a_pagar']
            
            # 2. Datos para el Gráfico (Últimos 6 meses)
            cursor.execute("SELECT * FROM vw_ganancias_mensuales")
            meses_bd = cursor.fetchall()
            
            nombres_meses = {1: 'Ene', 2: 'Feb', 3: 'Mar', 4: 'Abr', 5: 'May', 6: 'Jun', 7: 'Jul', 8: 'Ago', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dic'}
            
            # Revertimos la lista para que el gráfico empiece del mes más antiguo al más nuevo
            for mes_data in reversed(meses_bd):
                nombre_mes = f"{nombres_meses[mes_data['mes']]} {mes_data['anio']}"
                chart_labels.append(nombre_mes)
                chart_data.append(float(mes_data['total_ganancia']))
                
            cursor.close()
            conn.close()
        except Exception as e:
            if conn:
                conn.close()
            traceback.print_exc()

    return render_template('index.html', metrics=metrics, chart_labels=chart_labels, chart_data=chart_data)

@app.route('/ov')
def listado_ov():
    if 'vendedor_id' not in session:
        return redirect(url_for('login'))
        
    conn = get_db_connection()
    clientes = []
    ordenes = []
    kpis = {
        'total_activas': 0,
        'atrasadas': 0,
        'sin_pagar': 0,
        'mayor_demora': '-'
    }

    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("""
                SELECT o.idOV, o.fCreacion, o.fEntrega, o.subtotal, o.total, o.cant as cant_items,
                       c.razonSocial, e.tipo as estado_tipo, e.descripcion as estado_desc,
                       IFNULL(ent.descripcion, 'ENVIO') as tipo_entrega
                FROM ovcab o
                JOIN clientes c ON o.idCliente = c.idCliente
                JOIN estados e ON o.idEstado = e.idEstado
                LEFT JOIN entregas ent ON o.idEntrega = ent.idEntrega
                ORDER BY o.idOV DESC
            """)
            ordenes = cursor.fetchall()

            cursor.execute("SELECT idCliente, razonSocial FROM clientes WHERE estado = 'A' ORDER BY razonSocial ASC")
            clientes = cursor.fetchall()

            fecha_actual = datetime.now().date()
            atrasadas_list = []
            
            for ov in ordenes:
                if ov.get('fEntrega') and ov['fEntrega'] < fecha_actual and ov['estado_tipo'] in ('OVP', 'OVF'):
                    atrasadas_list.append(ov)
                
                cursor.execute("""
                    SELECT COALESCE(SUM(pagos.pagado), 0) AS pagado
                    FROM (
                        SELECT DISTINCT fd.idFactura
                        FROM facturasdet fd
                        JOIN ovdet d ON d.idOVDet = fd.idOVDet
                        WHERE d.idOV = %s
                    ) facturas_ov
                    LEFT JOIN (
                        SELECT idFactura, SUM(importeAplicado) AS pagado
                        FROM rpdeta
                        GROUP BY idFactura
                    ) pagos ON pagos.idFactura = facturas_ov.idFactura
                """, (ov['idOV'],))
                res_pago = cursor.fetchone()
                pagado = float(res_pago['pagado']) if res_pago and res_pago['pagado'] else 0.0
                
                ov['pagado'] = (pagado >= float(ov['total'] or 0)) if ov['total'] else False
                if not ov['pagado']:
                    kpis['sin_pagar'] += 1

            kpis['total_activas'] = len(ordenes)
            kpis['atrasadas'] = len(atrasadas_list)
            
            if atrasadas_list:
                atrasadas_list.sort(key=lambda x: x['fEntrega'])
                mas_atrasada = atrasadas_list[0]
                dias = (fecha_actual - mas_atrasada['fEntrega']).days
                kpis['mayor_demora'] = f"OV #{mas_atrasada['idOV']} ({dias} días)"

            cursor.close()
            conn.close()
        except Exception as e:
            if conn:
                conn.close()
            print(f"Error en listado_ov: {e}")
    
    return render_template('ovs.html', clientes=clientes, ordenes=ordenes, kpis=kpis)

@app.route('/ov/<int:id_ov>')
def ov_detalle(id_ov):
    if 'vendedor_id' not in session:
        return redirect(url_for('login'))
        
    conn = get_db_connection()
    if not conn:
        return "Error de conexión a la Base de Datos", 500
        
    try:
        cursor = conn.cursor(dictionary=True)
        
        # 1. Cabecera de la Orden
        cursor.execute("""
            SELECT o.*, c.razonSocial, c.marca, e.tipo as estado_tipo, e.descripcion as estado_desc
            FROM ovcab o
            JOIN clientes c ON o.idCliente = c.idCliente
            JOIN estados e ON o.idEstado = e.idEstado
            WHERE o.idOV = %s
        """, (id_ov,))
        ov = cursor.fetchone()
        
        if not ov:
            cursor.close()
            conn.close()
            return "Orden de Venta no encontrada", 404

        # Formatear fechas de la OV a string seguro
        if ov.get('fCreacion') and hasattr(ov['fCreacion'], 'strftime'):
            ov['fCreacion_str'] = ov['fCreacion'].strftime('%d/%m/%Y')
        else:
            ov['fCreacion_str'] = str(ov.get('fCreacion') or '')

        if ov.get('fEntrega') and hasattr(ov['fEntrega'], 'strftime'):
            ov['fEntrega_str'] = ov['fEntrega'].strftime('%d/%m/%Y')
        else:
            ov['fEntrega_str'] = str(ov.get('fEntrega') or '')

        # 2. Ítems de la Orden
        cursor.execute("""
            SELECT d.*, p.CodProd, p.desc as prod_desc
            FROM ovdet d
            JOIN productos p ON d.idProducto = p.idProducto
            WHERE d.idOV = %s
            ORDER BY d.nItem ASC
        """, (id_ov,))
        items = cursor.fetchall()

        detalles_items = []
        total_pasos_completos = 0
        total_pasos_totales = 0

        for item in items:
            cursor.execute("""
                SELECT rp.ordenProceso AS seq, pr.codigoProceso AS ct,
                       pr.descripcion AS proceso_nombre, pr.idProceso
                FROM recprocesos rp
                JOIN procesos pr ON rp.idProceso = pr.idProceso
                JOIN productos p ON p.idProducto = rp.idProducto
                WHERE rp.idOV = %s
                  AND rp.idProducto = %s
                  AND (pr.idProceso <> 3 OR p.CC IS NOT NULL)
                ORDER BY rp.ordenProceso ASC, rp.idRecProceso ASC
            """, (id_ov, item['idProducto']))
            pasos = cursor.fetchall()

            cursor.execute("""
                SELECT idPro, IFNULL(SUM(cantP), 0) as notificado
                FROM produccion
                WHERE idOVDet = %s
                GROUP BY idPro
            """, (item['idOVDet'],))
            prod_map = {row['idPro']: float(row['notificado'] or 0) for row in cursor.fetchall()}

            pasos_procesados = []
            cant_ordenada = float(item['cantidad'] or 0)

            for idx, paso in enumerate(pasos):
                notificado = min(cant_ordenada, prod_map.get(paso['idProceso'], 0.0))
                pendiente = max(0.0, cant_ordenada - notificado)

                if idx == 0:
                    ct_anterior = "— inicio —"
                    habilitado = pendiente
                else:
                    prev_paso = pasos_procesados[-1]
                    prev_notif = prev_paso['notificado']
                    ct_anterior = f"{prev_paso['ct']}: {int(prev_notif)}"
                    # Solo se habilita la cantidad ya procesada en el centro anterior
                    # que todavía no fue procesada en este centro.
                    habilitado = max(0.0, min(pendiente, prev_notif - notificado))

                pct_avance = min(100.0, round((notificado / cant_ordenada * 100), 1)) if cant_ordenada > 0 else 0

                if notificado >= cant_ordenada:
                    estado_paso = "COMPLETADO"
                    total_pasos_completos += 1
                elif habilitado > 0:
                    estado_paso = "DISPONIBLE"
                elif notificado > 0:
                    estado_paso = "EN PROCESO"
                else:
                    estado_paso = "EN ESPERA"

                total_pasos_totales += 1

                pasos_procesados.append({
                    'seq': paso['seq'],
                    'ct': paso['ct'],
                    'proceso': paso['proceso_nombre'],
                    'ordenado': int(cant_ordenada),
                    'ct_anterior': ct_anterior,
                    'notificado': int(notificado),
                    'pendiente': int(pendiente),
                    'habilitado': int(habilitado),
                    'pct_avance': pct_avance,
                    'estado': estado_paso
                })

            detalles_items.append({
                'item': item,
                'pasos': pasos_procesados
            })

        pct_avance_total = round((total_pasos_completos / total_pasos_totales * 100), 1) if total_pasos_totales > 0 else 0

        # 3. Documentos vinculados (Remito, Factura, Recibos)
        cursor.execute("SELECT * FROM remitoscab WHERE idOV = %s", (id_ov,))
        remito = cursor.fetchone()
        if remito and remito.get('fecha') and hasattr(remito['fecha'], 'strftime'):
            remito['fecha_str'] = remito['fecha'].strftime('%d/%m/%Y')

        cursor.execute("""
            SELECT DISTINCT f.*
            FROM facturacab f
            JOIN facturasdet fd ON fd.idFactura = f.idFactura
            JOIN ovdet d ON d.idOVDet = fd.idOVDet
            WHERE d.idOV = %s
            ORDER BY f.fecha DESC, f.idFactura DESC
            LIMIT 1
        """, (id_ov,))
        factura = cursor.fetchone()
        if factura and factura.get('fecha') and hasattr(factura['fecha'], 'strftime'):
            factura['fecha_str'] = factura['fecha'].strftime('%d/%m/%Y')

        recibos = []
        if factura:
            cursor.execute("""
                SELECT rp.*, rd.importeAplicado 
                FROM rpcab rp
                JOIN rpdeta rd ON rp.idRecibo = rd.idRecibo
                WHERE rd.idFactura = %s
            """, (factura['idFactura'],))
            recibos = cursor.fetchall()

        cursor.close()
        conn.close()

        return render_template('detalle.html', 
                               ov=ov, 
                               detalles_items=detalles_items,
                               total_pasos_completos=total_pasos_completos,
                               total_pasos_totales=total_pasos_totales,
                               pct_avance_total=pct_avance_total,
                               remito=remito,
                               factura=factura,
                               recibos=recibos)

    except Exception as e:
        if conn:
            conn.close()
        err_msg = traceback.format_exc()
        print(f"Error crítico en ov_detalle({id_ov}):\n{err_msg}")
        return f"<h1>Error 500 al cargar la OV #{id_ov}</h1><pre>{str(e)}</pre>", 500

@app.route('/api/productos/<int:id_cliente>')
def obtener_productos(id_cliente):
    conn = get_db_connection()
    productos = []
    if conn:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT idProducto, CodProd, `desc`,
                   COALESCE(pUnitario, Get_Costo(idProducto) * (1 + IFNULL(margen, 30)/100), 0) as pUnitario
            FROM productos 
            WHERE idCli = %s AND estado = 'A'
        """, (id_cliente,))
        productos = cursor.fetchall()
        cursor.close()
        conn.close()
    return jsonify(productos)

@app.route('/api/ov/simular_insumos', methods=['POST'])
def simular_insumos():
    datos = request.json
    items = datos.get('items', [])
    
    if not items:
        return jsonify([])

    conn = get_db_connection()
    if not conn:
        return jsonify([])

    try:
        cursor = conn.cursor(dictionary=True)
        insumos_acumulados = {}

        for item in items:
            id_producto = item['idProducto']
            cantidad_prod = float(item['cantidad'])

            cursor.execute("""
                SELECT a.idArticulo, a.codigoArticulo, a.descripcion, a.stockActual,
                       (r.cant * %s) as cant_necesaria
                FROM recmat r
                JOIN articulos a ON r.idArticulo = a.idArticulo
                WHERE r.idProducto = %s
            """, (cantidad_prod, id_producto))
            receta = cursor.fetchall()

            for art in receta:
                id_art = art['idArticulo']
                if id_art not in insumos_acumulados:
                    insumos_acumulados[id_art] = {
                        'codigoArticulo': art['codigoArticulo'],
                        'descripcion': art['descripcion'],
                        'qtyNecesaria': 0.0,
                        'stockActual': float(art['stockActual'] or 0)
                    }
                insumos_acumulados[id_art]['qtyNecesaria'] += float(art['cant_necesaria'] or 0)

        resultado = []
        for id_art, data in insumos_acumulados.items():
            estado_stock = "Stock OK" if data['stockActual'] >= data['qtyNecesaria'] else "Sin Stock"
            resultado.append({
                'codigoArticulo': data['codigoArticulo'],
                'descripcion': data['descripcion'],
                'qtyNecesaria': round(data['qtyNecesaria'], 2),
                'stockActual': round(data['stockActual'], 2),
                'estado': estado_stock
            })

        cursor.close()
        conn.close()
        return jsonify(resultado)

    except Exception as e:
        if conn:
            conn.close()
        print(f"Error en simular_insumos: {e}")
        return jsonify([])

@app.route('/api/ov/guardar', methods=['POST'])
def guardar_ov():
    if 'vendedor_id' not in session:
        return jsonify({'success': False, 'mensaje': 'Sesión expirada.'}), 401

    datos = request.get_json(silent=True) or {}
    try:
        id_cliente = int(datos['idCliente'])
        fecha_entrega = datos['fechaEntrega']
        items = datos['items']
        subtotal = float(datos['subtotal'])
        total = float(datos['total'])
    except (KeyError, TypeError, ValueError):
        return jsonify({'success': False, 'mensaje': 'Faltan datos válidos para generar la OV.'}), 400

    if not fecha_entrega or not isinstance(items, list) or not items:
        return jsonify({'success': False, 'mensaje': 'Indique la fecha de entrega y al menos un producto.'}), 400

    try:
        productos_repetidos = set()
        for item in items:
            cantidad = int(item['cantidad'])
            id_producto = int(item['idProducto'])
            if cantidad <= 0 or id_producto in productos_repetidos:
                raise ValueError
            productos_repetidos.add(id_producto)
    except (KeyError, TypeError, ValueError):
        return jsonify({
            'success': False,
            'mensaje': 'Cada producto debe aparecer una sola vez y tener una cantidad positiva.'
        }), 400

    conn = get_db_connection()
    if not conn:
        return jsonify({'success': False, 'mensaje': 'Error de conexión a la BD.'}), 500

    cursor = None
    try:
        cursor = conn.cursor(dictionary=True)
        conn.start_transaction()
        id_vendedor = int(session['vendedor_id'])
        fecha_creacion = datetime.now().date()
        cant_total_items = sum(int(item['cantidad']) for item in items)

        # Validar productos, ruta elegida y stock antes de registrar la orden.
        productos_orden = {}
        for item in items:
            id_prod = int(item['idProducto'])
            cantidad = int(item['cantidad'])

            cursor.execute("""
                SELECT idProducto, CC, CodProd
                FROM productos
                WHERE idProducto = %s AND idCli = %s AND estado = 'A'
                FOR UPDATE
            """, (id_prod, id_cliente))
            producto = cursor.fetchone()
            if not producto:
                raise ValueError(f"El producto {id_prod} no pertenece al cliente seleccionado o no está activo.")
            productos_orden[id_prod] = producto

            cursor.execute("SELECT idArticulo, cant FROM recmat WHERE idProducto = %s", (id_prod,))
            receta_insumos = cursor.fetchall()
            for ingrediente in receta_insumos:
                id_art = ingrediente['idArticulo']
                cant_necesaria = float(ingrediente['cant'] or 0) * cantidad
                cursor.execute("""
                    SELECT codigoArticulo, stockActual
                    FROM articulos
                    WHERE idArticulo = %s
                    FOR UPDATE
                """, (id_art,))
                articulo = cursor.fetchone()
                if not articulo:
                    raise ValueError(f"No existe el artículo de insumo {id_art} para {producto['CodProd']}.")
                if float(articulo['stockActual'] or 0) < cant_necesaria:
                    raise ValueError(f"Sin stock suficiente para el componente {articulo['codigoArticulo']}.")
                cursor.execute("""
                    UPDATE articulos
                    SET stockActual = stockActual - %s, idUsuario = %s
                    WHERE idArticulo = %s
                """, (cant_necesaria, id_vendedor, id_art))

        cursor.execute("""
            INSERT INTO ovcab (fCreacion, fEntrega, cant, subtotal, total, idEstado, idCliente, idVendedor)
            VALUES (%s, %s, %s, %s, %s, 1, %s, %s)
        """, (fecha_creacion, fecha_entrega, cant_total_items, subtotal, total, id_cliente, id_vendedor))
        id_ov_nueva = cursor.lastrowid

        procesos = {}
        cursor.execute("""
            SELECT idProceso, tiempoEstimadoBase
            FROM procesos
            WHERE idProceso IN (1, 2, 3, 4, 5, 6, 7, 8)
        """)
        for proc in cursor.fetchall():
            procesos[int(proc['idProceso'])] = proc

        for indice, item in enumerate(items, start=1):
            id_prod = int(item['idProducto'])
            cantidad = int(item['cantidad'])
            precio_unit = float(item['precioUnit'])
            subtotal_item = float(item.get('subtotalItem', precio_unit * cantidad))
            producto = productos_orden[id_prod]

            cursor.execute("""
                INSERT INTO ovdet (nItem, cantidad, precioUnitario, subtotal, idOV, idProducto)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (indice, cantidad, precio_unit, subtotal_item, id_ov_nueva, id_prod))

            # Etapa 3 fijada por el sistema: PIN (Pintura), nunca TAP (Tapicería).
            ruta = [(1, 1), (4, 2), (7, 3), (2, 4), (5, 5), (6, 6)]
            if producto['CC'] is not None:
                ruta.append((3, 7))

            for id_proceso, orden_proceso in ruta:
                if id_proceso not in procesos:
                    raise ValueError(f"No existe el proceso {id_proceso} en el catálogo de procesos.")
                tiempo = procesos[id_proceso]['tiempoEstimadoBase']
                tiempo_est = str(tiempo) if tiempo else '00:30:00'
                id_rec_proc = f"RP-{id_ov_nueva}-{id_proceso}"
                cursor.execute("""
                    INSERT INTO recprocesos
                        (idRecProceso, idOV, tiempoEstimado, ordenProceso, idProducto, idProceso)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """, (id_rec_proc, id_ov_nueva, tiempo_est, orden_proceso, id_prod, id_proceso))

        conn.commit()
        return jsonify({'success': True, 'mensaje': f'Orden de Venta N° {id_ov_nueva} generada correctamente.'})

    except Exception as e:
        conn.rollback()
        mensaje = str(e) if isinstance(e, ValueError) else 'No se pudo guardar la OV por un error de base de datos.'
        if not isinstance(e, ValueError):
            traceback.print_exc()
        return jsonify({'success': False, 'mensaje': mensaje}), 400 if isinstance(e, ValueError) else 500
    finally:
        if cursor:
            cursor.close()
        conn.close()

@app.route('/productos')
def productos():
    if 'vendedor_id' not in session:
        return redirect(url_for('login'))

    conn = get_db_connection()
    lista_productos = []

    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            query = """
                SELECT 
                    p.idProducto,
                    p.CodProd,
                    p.`desc`,
                    p.costo,
                    p.margen,
                    p.pUnitario,
                    p.estado,
                    c.marca AS cliente_marca,
                    tp.descripcion AS tipo_descripcion
                FROM productos p
                LEFT JOIN clientes c ON p.idCli = c.idCliente
                LEFT JOIN tiprod tp ON p.idTipProd = tp.idTipProd
                ORDER BY p.idProducto ASC;
            """
            cursor.execute(query)
            lista_productos = cursor.fetchall()
            cursor.close()
            conn.close()
        except Exception as e:
            if conn:
                conn.close()
            print(f"Error consultando productos: {e}")

    return render_template('productos.html', productos=lista_productos) 

if __name__ == '__main__':
    app.run(debug=True)