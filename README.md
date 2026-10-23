# BoxSA — Sistema de Gestión de Órdenes de Venta

BoxSA es una aplicación web desarrollada en **Python** con **Flask** y **MySQL**. Permite gestionar órdenes de venta (OV), consultar productos y stock, controlar insumos y procesos productivos, y consultar información relacionada con facturación, remitos y cobros.

## Requisitos previos

Antes de ejecutar el proyecto, instalá:

- **Python 3**: https://www.python.org/downloads/ . En Windows, durante la instalación marcá la opción **Add Python to PATH**.
- **Visual Studio Code** (opcional, recomendado para editar el proyecto): https://code.visualstudio.com/.
- **MySQL Server**: https://dev.mysql.com/downloads/mysql/.
- **MySQL Workbench** (recomendado para importar el script SQL): https://dev.mysql.com/downloads/workbench/.

## Instalación y configuración

### 1. Abrir el proyecto

Abrí en Visual Studio Code la carpeta del proyecto, es decir, la carpeta que contiene `main.py` y las carpetas de plantillas y archivos estáticos. Después, abrí una terminal desde **Terminal > New Terminal** (o **Terminal > Nueva terminal**).

### 2. Crear y activar un entorno virtual

Se recomienda usar un entorno virtual para mantener separadas las dependencias del proyecto.

**Windows (PowerShell):**

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

**macOS o Linux:**

```bash
python3 -m venv venv
source venv/bin/activate
```

Cuando el entorno esté activo, normalmente verás `(venv)` al comienzo de la línea de la terminal.

### 3. Instalar las dependencias

Con el entorno virtual activado, ejecutá:

```bash
python -m pip install Flask mysql-connector-python
```

### 4. Importar la base de datos

Asegurate de que MySQL Server esté iniciado y abrí una conexión local desde MySQL Workbench.

1. Abrí el archivo `BoxSAFinal.sql` con **File > Open SQL Script**.
2. Verificá que estés conectado al servidor local correcto.
3. Ejecutá el script con el botón del rayo (**Execute**). El archivo crea y selecciona la base `boxsa`, y carga las tablas y los datos incluidos en el volcado.

**Importante:** el volcado contiene instrucciones que crean o reemplazan tablas. Si ya tenés una base `boxsa` con información que querés conservar, hacé una copia de seguridad antes de ejecutarlo.

Si estás preparando la base con los datos de prueba corregidos para mostrar OVs en distintos estados, importá primero `BoxSAFinal.sql` y luego ejecutá `reparacion_boxsa_v2_con_estados.sql` sobre una copia de seguridad de esa base.

### 5. Configurar la conexión a MySQL

Abrí `main.py` y buscá el diccionario `db_config`. Configurá los datos de conexión según tu instalación local:

```python
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'TU_CONTRASEÑA_DE_MYSQL',
    'database': 'boxsa'
}
```

Reemplazá `TU_CONTRASEÑA_DE_MYSQL` por la contraseña del usuario de MySQL que elegiste. Si usás otro usuario, modificá también el campo `user`.

No publiques contraseñas reales en el repositorio. Para un entorno compartido, conviene usar variables de entorno en lugar de guardar credenciales directamente en `main.py`.

### 6. Ejecutar la aplicación

Desde la terminal, con el entorno virtual activado y ubicada en la carpeta que contiene `main.py`, ejecutá:

```bash
python main.py
```

Si la configuración es correcta, Flask mostrará un mensaje indicando que el servidor está disponible, normalmente en `http://127.0.0.1:5000`.

### 7. Abrir BoxSA

Abrí el navegador e ingresá a:

http://127.0.0.1:5000

Se mostrará la pantalla de inicio de sesión. En la versión actual, se selecciona un usuario disponible en el sistema para ingresar.

## Comandos rápidos

| Acción | Windows | macOS / Linux |
|---|---|---|
| Crear entorno virtual | `python -m venv venv` | `python3 -m venv venv` |
| Activar entorno virtual | `venv\Scripts\Activate.ps1` | `source venv/bin/activate` |
| Instalar dependencias | `python -m pip install Flask mysql-connector-python` | `python -m pip install Flask mysql-connector-python` |
| Iniciar aplicación | `flask --app main run` |

## Solución de problemas

- **Error de conexión a MySQL:** verificá que MySQL Server esté iniciado y que `host`, `user`, `password` y `database` coincidan con tu configuración.
- **No se encuentra `main.py`:** comprobá que la terminal esté ubicada en la carpeta raíz del proyecto.
- **No se encuentra una plantilla o un archivo CSS:** verificá que las carpetas del proyecto, como `templates` y `static`, mantengan sus nombres y ubicaciones originales.
- **El puerto 5000 está ocupado:** cerrá la otra aplicación que lo esté utilizando antes de iniciar Flask nuevamente.

> **Nota:** `main.py` inicia Flask con el modo de depuración activado. Esto es útil durante el desarrollo local, pero no debe utilizarse como configuración de producción.
