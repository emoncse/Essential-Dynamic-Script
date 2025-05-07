
# PostgreSQL Setup and Management Guide

---

## 📦 Install PostgreSQL

```
sudo apt update
sudo apt install postgresql postgresql-contrib
```

---

## 🔑 Set Password for `postgres` User

1️⃣ Switch to the postgres user:
```
sudo -i -u postgres
```

2️⃣ Enter PostgreSQL prompt:
```
psql
```

3️⃣ Set password:
```sql
ALTER USER postgres WITH PASSWORD 'YourStrongPassword';
```

4️⃣ Exit:
```
\q
exit
```

---

## 👤 Create New PostgreSQL User

```
sudo -i -u postgres
psql
```

```sql
CREATE USER yourusername WITH PASSWORD 'YourPassword';
```

---

## 🏗️ Create New Database

```sql
CREATE DATABASE yourdbname;
```

---

## 🛡️ Grant All Access to Database for User

```sql
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO yourusername;
```

---

## 🔄 Flush Privileges (PostgreSQL automatically applies changes)

In PostgreSQL, **there’s no explicit FLUSH PRIVILEGES** command like MySQL — changes apply immediately.

---

## 📋 Common SQL Commands

### Select Data
```sql
SELECT * FROM your_table;
```

### Insert Data
```sql
INSERT INTO your_table (column1, column2) VALUES ('value1', 'value2');
```

### Update Data
```sql
UPDATE your_table SET column1 = 'new_value' WHERE condition;
```

### Delete Data
```sql
DELETE FROM your_table WHERE condition;
```

### Alter Table
```sql
ALTER TABLE your_table ADD COLUMN new_column datatype;
ALTER TABLE your_table RENAME COLUMN old_name TO new_name;
ALTER TABLE your_table DROP COLUMN column_name;
```

### Truncate Table (delete all rows, reset identity)
```sql
TRUNCATE TABLE your_table RESTART IDENTITY;
```

### Drop Table or Database
```sql
DROP TABLE your_table;
DROP DATABASE yourdbname;
```

---

## 🌐 Configure PostgreSQL to Listen on All IPs

Edit:
```
sudo nano /etc/postgresql/<version>/main/postgresql.conf
```

Find:
```
#listen_addresses = 'localhost'
```

Change to:
```
listen_addresses = '*'
```

---

## 🌍 Allow Remote Access (pg_hba.conf)

Edit:
```
sudo nano /etc/postgresql/<version>/main/pg_hba.conf
```

Add line:
```
host    all             all             0.0.0.0/0               md5
```

This allows all IPs — **you may restrict by specific IP or subnet** for security.

---

## 🔄 Restart PostgreSQL

```
sudo systemctl restart postgresql
```

---

## 🔍 Verify Remote Connection (example)

From remote machine:
```
psql -h your.server.ip -U yourusername -d yourdbname
```

---

## 📦 Helpful PostgreSQL Commands

### Show All Databases
```sql
\l
```

### Connect to Database
```
psql -d yourdbname -U yourusername
```

### List Tables
```sql
\dt
```

### Describe Table
```sql
\d your_table
```

### Exit psql
```sql
\q
```

---

## ⚠ Security Tips

✅ Always use strong passwords.  
✅ Limit `pg_hba.conf` to trusted IP ranges.  
✅ Use firewalls to block unused ports.  
✅ Keep PostgreSQL updated.

---

**Done! 🚀**