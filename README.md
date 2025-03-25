# 📖 Periodic Table Database

## 🌟 Descripción
Este proyecto es parte del curso de freeCodeCamp y tiene como objetivo construir una base de datos de la tabla periódica y un script en Bash para consultar información sobre los elementos químicos.

## 🚀 Características
- Base de datos con información detallada sobre elementos químicos.
- Corrección y mejora de la estructura de la base de datos.
- Script en Bash que permite consultar elementos por número atómico, símbolo o nombre.
- Control de versiones con Git.

## 🛠️ Instalación y Uso
### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/tuusuario/periodic_table.git
cd periodic_table
```

### 2️⃣ Configurar la base de datos
Ejecuta el siguiente comando para restaurar la base de datos:
```bash
psql -U postgres < periodic_table.sql
```

### 3️⃣ Dar permisos de ejecución al script
```bash
chmod +x element.sh
```

### 4️⃣ Ejecutar el script
Consultar un elemento por número atómico, símbolo o nombre:
```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen
```

Si el elemento no existe:
```bash
I could not find that element in the database.
```

## 📂 Estructura del Proyecto
```
📁 periodic_table
 ├── 📄 periodic_table.sql  # Base de datos
 ├── 📄 element.sh          # Script de consulta
 ├── 📄 README.md          # Documentación
```

## 📜 Licencia
Este proyecto es de código abierto y se rige por la licencia MIT.

🔬 ¡Explora la química con la tabla periódica! 🔬

