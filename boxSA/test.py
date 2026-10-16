import mysql.connector
from mysql.connector import Error

try:
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='kiro2907' # Pon tu contraseña aquí
    )
    if conexion.is_connected():
        print("¡Conexión exitosa! La contraseña es correcta.")
        conexion.close()
except Error as e:
    print(f"Error de conexión: {e}")