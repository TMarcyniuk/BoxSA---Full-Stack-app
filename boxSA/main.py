from flask import Flask, render_template, request, jsonify, session, redirect, url_for
import mysql.connector
from mysql.connector import Error
from datetime import datetime

app = Flask(__name__)
# Necesario para usar 'session' en Flask
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
        session['vendedor_id'] = request.form['vendedor_id']
        session['vendedor_nombre'] = request.form['vendedor_nombre']
        return redirect(url_for('listado_ov'))
        
    conn = get_db_connection()
    
    # 1. Cortamos la ejecución y mostramos el error si no hay conexión
    if not conn:
        return "<h1>Error Crítico:</h1><p>Flask NO se está conectando a MySQL. Revisa tu 'db_config' (¿La contraseña es realmente 'admin' o en tu servidor local está vacía '').</p>"
        
    try:
        cursor = conn.cursor(dictionary=True) 
        # Traemos todo temporalmente sin WHERE para descartar problemas de estado
        cursor.execute("SELECT * FROM usuarios")
        vendedores = cursor.fetchall()
        cursor.close()
        conn.close()
        
        # 2. Cortamos la ejecución y mostramos el error si la tabla está vacía
        if len(vendedores) == 0:
            return "<h1>Conexión Exitosa pero...</h1><p>La tabla 'usuarios' está completamente vacía. ¡Necesitas insertar al menos un usuario mediante phpMyAdmin o SQL para poder loguearte!</p>"
            
    except Exception as e:
        # 3. Mostramos error si la tabla no se llama 'usuarios' o hay un problema SQL
        return f"<h1>Error SQL:</h1><p>{str(e)}</p>"
        
    return render_template('login.html', vendedores=vendedores)

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

@app.route('/')
def home():
    # Si no hay nadie en sesión, lo mandamos a elegir su usuario
    if 'vendedor_id' not in session:
        return redirect(url_for('login'))
    return render_template('index.html')

@app.route('/ov')
def listado_ov():
    if 'vendedor_id' not in session:
        return redirect(url_for('login'))
        
    conn = get_db_connection()
    clientes = []
    ordenes = []
    if conn:
        cursor = conn.cursor(dictionary=True)
        
        # Ahora usamos la Vista limpia
        cursor.execute("SELECT * FROM vista_ordenes_venta ORDER BY idOV DESC")
        ordenes = cursor.fetchall()

        cursor.execute("SELECT idCliente, razonSocial FROM clientes WHERE estado = 'A' ORDER BY razonSocial ASC")
        clientes = cursor.fetchall()
        cursor.close()
        conn.close()
    
    return render_template('ovs.html', clientes=clientes, ordenes=ordenes)

@app.route('/api/productos/<int:id_cliente>')
def obtener_productos(id_cliente):
    conn = get_db_connection()
    productos = []
    if conn:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT idProducto, CodProd, `desc`, pUnitario FROM productos WHERE idCli = %s AND estado = 'A'", (id_cliente,))
        productos = cursor.fetchall()
        cursor.close()
        conn.close()
    return jsonify(productos)

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
    id_vendedor = session['vendedor_id']
    fecha_creacion = datetime.now().strftime('%Y-%m-%d')
    cant_total_items = sum(int(item['cantidad']) for item in items)

    conn = get_db_connection()
    if not conn:
        return jsonify({'success': False, 'mensaje': 'Error de conexión a la BD.'})

    try:
        cursor = conn.cursor(dictionary=True)
        conn.start_transaction() # Iniciamos transacción

        # --- Consigna 4 y 5: Validar stock de componentes y Reservar ---
        for item in items:
            id_prod = item['idProducto']
            cant_pedida = int(item['cantidad'])

            # Buscamos la receta de materiales para este producto
            cursor.execute("SELECT idArticulo, cant FROM recmat WHERE idProducto = %s", (id_prod,))
            receta = cursor.fetchall()

            for ingrediente in receta:
                id_art = ingrediente['idArticulo']
                cant_necesaria_un_producto = float(ingrediente['cant'])
                cant_total_necesaria = cant_necesaria_un_producto * cant_pedida

                # Verificamos stock actual del componente
                cursor.execute("SELECT codigoArticulo, stockActual FROM articulos WHERE idArticulo = %s", (id_art,))
                articulo = cursor.fetchone()

                if float(articulo['stockActual']) < cant_total_necesaria:
                    conn.rollback() # Cancelamos todo
                    return jsonify({'success': False, 'mensaje': f"Sin stock suficiente para el componente {articulo['codigoArticulo']}. Necesita {cant_total_necesaria}, tiene {articulo['stockActual']}."})
                
                # Consigna 5: Reservar (Descontamos del stock actual)
                cursor.execute(
                    "UPDATE articulos SET stockActual = stockActual - %s WHERE idArticulo = %s",
                    (cant_total_necesaria, id_art)
                )

        # --- Consigna 6: Grabar la OV (Cabecera y Detalle) ---
        # Cabecera (Estado 2 es "ON" en tu base de datos)
        query_cab = """
                    INSERT INTO ovcab (fCreacion, fEntrega, cant, subtotal, total, idEstado, idCliente, idVendedor)
                    VALUES (%s, %s, %s, %s, %s, 2, %s, %s)
                """
        cursor.execute(query_cab, (fecha_creacion, fecha_entrega, cant_total_items, subtotal, total, id_cliente, id_vendedor))
        id_ov_nueva = cursor.lastrowid # Obtenemos el ID generado

        # Detalle
        n_item = 1
        for item in items:
            query_det = """
                INSERT INTO ovdet (nItem, cantidad, precioUnitario, subtotal, idOV, idProducto)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query_det, (n_item, item['cantidad'], item['precioUnit'], item['subtotalItem'], id_ov_nueva, item['idProducto']))
            n_item += 1

        conn.commit() # Confirmamos todos los cambios
        cursor.close()
        conn.close()

        # --- Consigna 7: Mostrar el número de la OV recién generada ---
        return jsonify({'success': True, 'mensaje': f'Orden de Venta N° {id_ov_nueva} generada correctamente.'})

    except Exception as e:
        if conn:
            conn.rollback()
        print(e)
        return jsonify({'success': False, 'mensaje': str(e)})

if __name__ == '__main__':
    app.run(debug=True)