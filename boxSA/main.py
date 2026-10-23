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
    'password': 'admin',
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
    # Valores por defecto en caso de que la vista falle
    metrics = {'recaudacion_total': 0, 'ganancias_mes': 0, 'a_cobrar': 0, 'a_pagar': 180000} 
    
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            # Consultamos la vista general directamente
            cursor.execute("SELECT * FROM vw_dashboard_kpis")
            row = cursor.fetchone()
            if row:
                metrics['recaudacion_total'] = row['recaudacion_total']
                metrics['ganancias_mes'] = row['ganancias_mes']
                metrics['a_cobrar'] = row['a_cobrar']
                
            cursor.close()
            conn.close()
        except Exception as e:
            if conn:
                conn.close()
            print(f"Error cargando dashboard: {e}")

    return render_template('index.html', metrics=metrics)

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
                if ov.get('fEntrega') and ov['fEntrega'] < fecha_actual and ov['estado_tipo'] in ('OFP', 'OFF'):
                    atrasadas_list.append(ov)
                
                cursor.execute("""
                    SELECT IFNULL(SUM(rd.importeAplicado), 0) as pagado
                    FROM facturacab f
                    JOIN facturasdet fd ON f.idFactura = fd.idFactura
                    JOIN ovdet d ON fd.idProducto = d.idProducto AND d.idOV = %s
                    LEFT JOIN rpdeta rd ON rd.idFactura = f.idFactura
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
                SELECT rp.ordenProceso as seq, pr.codigoProceso as ct, pr.descripcion as proceso_nombre,
                       pr.idProceso
                FROM recprocesos rp
                JOIN procesos pr ON rp.idProceso = pr.idProceso
                WHERE rp.idOV = %s AND rp.idProducto = %s
                ORDER BY rp.ordenProceso ASC
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
                notificado = prod_map.get(paso['idProceso'], 0.0)
                pendiente = max(0.0, cant_ordenada - notificado)
                
                if idx == 0:
                    ct_anterior = "— inicio —"
                    habilitado = cant_ordenada
                else:
                    prev_notif = pasos_procesados[-1]['notificado']
                    ct_anterior = f"{pasos[idx-1]['ct']}: {int(prev_notif)}"
                    habilitado = prev_notif

                pct_avance = round((notificado / cant_ordenada * 100), 1) if cant_ordenada > 0 else 0
                
                if notificado >= cant_ordenada:
                    estado_paso = "COMPLETADO"
                    total_pasos_completos += 1
                elif notificado > 0 or (idx == 0 or pasos_procesados[-1]['notificado'] > 0):
                    estado_paso = "DISPONIBLE"
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
            JOIN facturasdet fd ON f.idFactura = fd.idFactura
            JOIN ovdet d ON fd.idProducto = d.idProducto AND d.idOV = %s
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
        return jsonify({'success': False, 'mensaje': 'Sesión expirada.'})

    datos = request.json
    id_cliente = datos['idCliente']
    fecha_entrega = datos['fechaEntrega']
    subtotal = datos['subtotal']
    total = datos['total']
    items = datos['items']
    id_vendedor = int(session['vendedor_id'])
    fecha_creacion = datetime.now().strftime('%Y-%m-%d')
    cant_total_items = sum(int(item['cantidad']) for item in items)

    conn = get_db_connection()
    if not conn:
        return jsonify({'success': False, 'mensaje': 'Error de conexión a la BD.'})

    try:
        cursor = conn.cursor(dictionary=True)
        conn.start_transaction()

        for item in items:
            id_prod = item['idProducto']
            cant_pedida = int(item['cantidad'])

            cursor.execute("SELECT idArticulo, cant FROM recmat WHERE idProducto = %s", (id_prod,))
            receta = cursor.fetchall()

            for ingrediente in receta:
                id_art = ingrediente['idArticulo']
                cant_total_necesaria = float(ingrediente['cant']) * cant_pedida

                cursor.execute("SELECT codigoArticulo, stockActual FROM articulos WHERE idArticulo = %s", (id_art,))
                articulo = cursor.fetchone()

                if float(articulo['stockActual'] or 0) < cant_total_necesaria:
                    conn.rollback()
                    return jsonify({'success': False, 'mensaje': f"Sin stock suficiente para el componente {articulo['codigoArticulo']}."})
                
                cursor.execute(
                    "UPDATE articulos SET stockActual = stockActual - %s, idUsuario = %s WHERE idArticulo = %s",
                    (cant_total_necesaria, id_vendedor, id_art)
                )

        query_cab = """
            INSERT INTO ovcab (fCreacion, fEntrega, cant, subtotal, total, idEstado, idCliente, idVendedor)
            VALUES (%s, %s, %s, %s, %s, 1, %s, %s)
        """
        cursor.execute(query_cab, (fecha_creacion, fecha_entrega, cant_total_items, subtotal, total, id_cliente, id_vendedor))
        id_ov_nueva = cursor.lastrowid

        n_item = 1
        for item in items:
            query_det = """
                INSERT INTO ovdet (nItem, cantidad, precioUnitario, subtotal, idOV, idProducto)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query_det, (n_item, item['cantidad'], item['precioUnit'], item['subtotalItem'], id_ov_nueva, item['idProducto']))
            
            cursor.execute("SELECT idProceso, ordenProceso, tiempoEstimadoBase FROM procesos ORDER BY ordenProceso ASC")
            procesos_base = cursor.fetchall()
            for proc in procesos_base:
                id_rec_proc = f"RP-{id_ov_nueva}-{proc['idProceso']}"
                tiempo_est = str(proc['tiempoEstimadoBase']) if proc['tiempoEstimadoBase'] else '00:30:00'
                cursor.execute("""
                    INSERT IGNORE INTO recprocesos (idRecProceso, idOV, tiempoEstimado, ordenProceso, idProducto, idProceso)
                    VALUES (%s, %s, %s, %s, %s, %s)
                """, (id_rec_proc, id_ov_nueva, tiempo_est, proc['ordenProceso'], item['idProducto'], proc['idProceso']))
                
            n_item += 1

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'success': True, 'mensaje': f'Orden de Venta N° {id_ov_nueva} generada correctamente.'})

    except Exception as e:
        if conn:
            conn.rollback()
            conn.close()
        return jsonify({'success': False, 'mensaje': str(e)})

if __name__ == '__main__':
    app.run(debug=True)