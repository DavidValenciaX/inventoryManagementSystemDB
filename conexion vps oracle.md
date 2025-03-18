# conexión vps oracle

conectarse pasando ubicación de la clave privada

```bash
ssh -i "~/.ssh\ssh-key-2025-03-03.key" ubuntu@149.130.181.250
```

Ya habiendo copiado la clave publica en el servidor se puede conectar sin el parámetro -i

```bash
ssh ubuntu@149.130.181.250
```

Restringir permisos solo a mi usuario:

```bash
icacls "C:\keys\oraclevps\ssh-key-2025-03-03.key" /inheritance:r
icacls "C:\keys\oraclevps\ssh-key-2025-03-03.key" /grant:r David:F
```

copiar carpeta de local a servidor

```bash
scp -r "C:\Users\David\Downloads\Programacion\Bases de datos\InventoryManagementSystemDataBase" ubuntu@149.130.181.250:~/
```

Darle permisos a la carpeta

```bash
chmod 755 ~
chmod 755 ~/InventoryManagementSystemDataBase/
```

Instalar PostgreSQL

```bash
sudo apt install postgresql postgresql-contrib
```

Iniciar Servicio de PostgreSQL

```bash
sudo systemctl enable postgresql.service
sudo systemctl start postgresql.service
```

Crear la base de datos

-u: usuario
createdb: comando para crear base de datos

```bash
sudo -u postgres createdb inventorymanagementsystemdb
```

Alternativa - Crear la base de datos desde la consola de psql

Ingresar a la consola de psql

```bash
sudo -u postgres psql
```

```sql
CREATE DATABASE inventorymanagementsystemdb;
```

listar bases de datos

```sql
\l
```

Creacion de tablas en la base de datos a partir del archivo sql

-d: Define la base de datos a la que se conectará
-f: Indica el archivo que contiene las instrucciones SQL que se ejecutarán.

```bash

sudo -u postgres psql -d inventorymanagementsystemdb -f ~/InventoryManagementSystemDataBase/InventoryManagementSystemDB.sql
```

Insertar datos en la base de datos a partir del archivo sql

```bash
sudo -u postgres psql -d inventorymanagementsystemdb -f ~/InventoryManagementSystemDataBase/InventoryManagementSystemData.sql
```

Ejecutar trigger de update

```bash
sudo -u postgres psql -d inventorymanagementsystemdb -f ~/InventoryManagementSystemDataBase/update_timestamp_trigger.sql
```

Conectar a la base de datos

```bash
sudo -u postgres psql -d inventorymanagementsystemdb
```

Listar tablas

```psql
\dt
```
