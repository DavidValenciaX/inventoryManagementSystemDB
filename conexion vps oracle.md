# conexión vps oracle

conectarse pasando ubicación de la clave privada

```bash
ssh -i "~/.ssh\ssh-key-2025-03-03.key" ubuntu@149.130.181.250
```

configurar el archivo de configuración de ssh para no tener que pasar la clave privada cada vez que se conecte

```bash
nano ~/.ssh/config
```

config file

```conf
# Host example.com                                                                                                      
#     User  username
#     IdentityFile ~/.ssh/keys/example-key.key
#     IdentitiesOnly yes
#     Port 22                                 
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

-r: copiar de manera recursiva, es decir todos los archivos de la carpeta

```bash
scp -r "C:\Users\David\Downloads\Programacion\Bases de datos\inventoryProject" ubuntu@149.130.181.250:~/
```

Darle permisos a la carpeta

```bash
chmod 755 ~
chmod 755 /home/projects/
chmod 755 /home/projects/inventoryDB/
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

Verificar que el servicio esté corriendo

```bash
sudo systemctl status postgresql.service
```

Crear la base de datos

-u: usuario
createdb: comando para crear base de datos

```bash
sudo -u postgres createdb inventorydb
```

Alternativa - Crear la base de datos desde la consola de psql

Ingresar a la consola de psql

```bash
sudo -u postgres psql
```

```sql
CREATE DATABASE inventorydb;
```

listar bases de datos

```sql
\l
```

conectarse a la base de datos

```sql
\c inventorydb
```

listar tablas de la base de datos

```sql
\dt
```

salir de la consola de psql

```sql
\q
```

eliminar base de datos si es necesario

```sql
sudo -u postgres dropdb inventorydb
```

revisar si hay conexiones activas

```sql
SELECT * FROM pg_stat_activity;
```

Creacion de tablas en la base de datos a partir del archivo sql

-d: Define la base de datos a la que se conectará
-f: Indica el archivo que contiene las instrucciones SQL que se ejecutarán.

```bash

sudo -u postgres psql -d inventorydb -f /home/projects/inventoryDB/InventoryManagementSystemDB.sql
```

Insertar datos en la base de datos a partir del archivo sql

```bash
sudo -u postgres psql -d inventorydb -f /home/projects/inventoryDB/InventoryManagementSystemData.sql
```

Ejecutar trigger de update

```bash
sudo -u postgres psql -d inventorydb -f /home/projects/inventoryDB/update_timestamp_trigger.sql
```

Conectar a la base de datos

```bash
sudo -u postgres psql -d inventorydb
```

Listar tablas

```psql
\dt
```

Asegurarse de que se pueden aceptar conexiones remotas

```bash
sudo nano /etc/postgresql/16/main/postgresql.conf
```

Asegurarse de que la opción listen_addresses esté configurada para aceptar conexiones externas, por ejemplo:

```conf
listen_addresses = '*'
```

Asegurarse de que se pueden aceptar conexiones remotas

```bash
sudo nano /etc/postgresql/16/main/pg_hba.conf
```

Añadir la siguiente línea al final del archivo:

```conf
host    all             all             0.0.0.0/0            md5
host    all             all             ::0/0            md5
```

Reiniciar el servicio de PostgreSQL

```bash
sudo systemctl restart postgresql.service
```

Si hay un firewall activo asegurarse de permitir el puerto de PostgreSQL (por defecto es el 5432)

Primero asegurarse de tener instalado ufw

```bash
sudo apt update
sudo apt install ufw
```

Permitir el puerto 5432

```bash
sudo ufw allow 5432/tcp
```

Después de configurar las reglas de firewall, hay que habilitar UFW

```bash
sudo ufw enable
```

Verificar que el puerto 5432 esté permitido

```bash
sudo ufw status
```

Es necesario crearle una contraseña al usuario postgres

```bash
sudo -u postgres psql
```

```sql
ALTER USER postgres WITH PASSWORD 'passwordseguro';
```

Salir de la consola de psql

```sql
\q
```
