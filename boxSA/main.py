from flask import Flask, render_template
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Configuración de la conexión a la base de datos MySQL
# Asegúrate de cambiar 'tu_contraseña' por la clave real de tu servidor MySQL local
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'boxsa'
}

def get_db_connection():
    """Función para conectarse a la base de datos."""
    try:
        conn = mysql.connector.connect(**db_config)
        return conn
    except Error as e:
        print(f"Error al conectar a MySQL: {e}")
        return None

@app.route('/')
def home():
    # En el futuro, aquí haremos consultas (ej. SELECT sum(total) FROM facturacab) 
    # para enviar los datos reales de recaudación a index.html
    return render_template('index.html')

# --- EJEMPLO PARA FUTURAS RUTAS USANDO TUS PROCEDIMIENTOS ALMACENADOS ---

@app.route('/estado-cuenta/<int:id_cliente>')
def estado_cuenta(id_cliente):
    """
    Ruta de ejemplo que utiliza el procedimiento almacenado 'EstadoCuentaCorriente'
    que ya tienes creado en tu base de datos boxsa.
    """
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor(dictionary=True)
        try:
            # Llamamos al procedimiento almacenado que espera un parámetro de entrada (v_idCliente)
            cursor.callproc('EstadoCuentaCorriente', [id_cliente])
            
            # Recuperamos los resultados del procedimiento
            resultados = []
            for result in cursor.stored_results():
                resultados.extend(result.fetchall())
            
            cursor.close()
            conn.close()
            
            # Aquí enviarías 'resultados' a un HTML nuevo (ej: estado_cuenta.html)
            # return render_template('estado_cuenta.html', datos=resultados)
            
            # Por ahora, solo retornamos los datos en crudo para probar
            return {"cliente_id": id_cliente, "estado_cuenta": resultados}
            
        except Error as e:
            return f"Error ejecutando el procedimiento: {e}"
    return "Error de conexión"

if __name__ == '__main__':
    app.run(debug=True)