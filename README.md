# Proyecto Flask - Sistema de Gestión de Órdenes de Venta (Boxsa)

Este es un sistema web desarrollado en **Python** con el framework **Flask** y **MySQL** como sistema de gestión de base de datos. Permite la administración de órdenes de venta (OV), seguimiento de productos, control de stock e insumos, procesos productivos y métricas financieras.

---

## Requerimientos Previos

Antes de comenzar, asegúrate de tener instalado el siguiente software en tu equipo:

1. **Python**: Descargar e instalar desde [python.org](https://www.python.org/). Asegúrate de marcar la opción *"Add Python to PATH"* durante la instalación.
2. **Visual Studio Code (VS Code)**: Descargar e instalar desde [code.visualstudio.com](https://code.visualstudio.com/).
3. **MySQL Server & MySQL Workbench**:
   - Descargar e instalar MySQL Server desde [mysql.com](https://dev.mysql.com/downloads/mysql/).
   - Se recomienda usar **MySQL Workbench** o **DBeaver** para la administración gráfica de la base de datos.

---

## Paso a Paso: Configuración y Ejecución

Sigue estos pasos detallados para poner en marcha el proyecto en tu entorno local.

### Paso 1: Abrir el proyecto en VS Code
1. Abre **Visual Studio Code**.
2. Ve a `Archivo` > `Abrir carpeta...` (o `File` > `Open Folder...`) y selecciona la carpeta del proyecto donde se encuentra `main.py`.
3. Abre una nueva terminal integrándote en VS Code presionando `Ctrl + Shift + \`` o desde el menú superior en `Terminal` > `Nuevo Terminal`.

---

### Paso 2: Crear y activar un entorno virtual (Recomendado)

Es una buena práctica aislar las dependencias del proyecto.

- **En Windows:**
  ```bash
  python -m venv venv
  .\venv\Scripts\activate
  ```

- **En macOS / Linux:**
  ```bash
  python3 -m venv venv
  source venv/bin/activate
  ```

*(Verás que la terminal ahora muestra `(venv)` al inicio de la línea de comandos).*

---

### Paso 3: Instalar las librerías necesarias

Con la terminal abierta y el entorno activo, ejecuta el siguiente comando para instalar **Flask** y el conector de **MySQL**:

```bash
pip install flask mysql-connector-python
```

---

### Paso 4: Preparar e importar la Base de Datos

1. Abre **MySQL Workbench** (o tu cliente MySQL de preferencia) e inicia sesión con tu usuario `root`.
2. Crea la base de datos ejecutando la siguiente consulta SQL:
   ```sql
   CREATE DATABASE IF NOT EXISTS boxsa;
   USE boxsa;
   ```
3. Importa el archivo de volcado/script SQL (`.sql`) del proyecto que contiene las tablas, vistas y datos iniciales (usuarios, productos, etc.).
   - En **MySQL Workbench**: Ve a `Server` > `Data Import` -> Selecciona el archivo `.sql` -> Selecciona la base de datos objetivo `boxsa` -> `Start Import`.

---

### Paso 5: Configurar las credenciales en `main.py`

Abre el archivo `main.py` en VS Code y ubica el diccionario de configuración `db_config` (alrededor de la línea 10):

```python
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'TU_CONTRASEÑA_AQUÍ',  # <-- Reemplazala por la contraseña de tu usuario root de MySQL
    'database': 'boxsa'
}
```

Modifica el campo `'password'` colocando la contraseña que configuraste al instalar MySQL en tu equipo local.

---

### Paso 6: Ejecutar la aplicación

Desde la terminal de VS Code, ejecuta el archivo principal:

```bash
python main.py
```

Si todo está configurado correctamente, verás una salida similar a esta:

```text
 * Serving Flask app 'main'
 * Debug mode: on
 * Running on http://127.0.0.1:5000
```

---

### Paso 7: Acceder al sistema

1. Abre tu navegador web (Chrome, Edge, Firefox, etc.).
2. Ingresa a la URL: `http://127.0.0.1:5000`
3. Serás redirigido a la pantalla de **Login**, donde podrás seleccionar un usuario para iniciar sesión y empezar a utilizar el sistema.

---

## Resumen de Comandos Rápidos

| Acción | Comando |
| :--- | :--- |
| Crear entorno virtual | `python -m venv venv` |
| Activar entorno (Windows) | `.\venv\Scripts\activate` |
| Instalar dependencias | `pip install flask mysql-connector-python` |
| Iniciar servidor Flask | `python main.py` |
