
# Linux User, Permissions, Groups, and ACL Management Guide

---

## 👤 Create a New User

```bash
sudo adduser username
```

Set password:
```bash
sudo passwd username
```

---

## 👥 Create a New Group

```bash
sudo groupadd groupname
```

Add user to group:
```bash
sudo usermod -aG groupname username
```

List groups for user:
```bash
groups username
```

---

## 📂 Manage File and Directory Ownership

Change ownership (user and group):
```bash
sudo chown user:group file_or_directory
```

Example:
```bash
sudo chown alice:developers /var/www/project
```

---

## 🔐 Manage File and Directory Permissions

### Numeric (octal) format
- 7 = rwx (read, write, execute)
- 6 = rw- (read, write)
- 5 = r-x (read, execute)
- 4 = r-- (read only)

Change permissions:
```bash
sudo chmod 755 file_or_directory
```

### Symbolic format
```bash
sudo chmod u+rwx file
sudo chmod g+rw file
sudo chmod o-r file
```

---

## 🛡️ Set Default Permissions (umask)

Check current umask:
```bash
umask
```

Set new umask (temporary for session):
```bash
umask 027
```

To make permanent, add to `~/.bashrc` or `/etc/profile`.

---

## 📦 Manage ACL (Access Control Lists)

Enable ACL on filesystem (if needed):
```bash
sudo tune2fs -o acl /dev/sdX
```

### Check current ACL
```bash
getfacl file_or_directory
```

### Set ACL for user
```bash
sudo setfacl -m u:username:rw file_or_directory
```

### Set ACL for group
```bash
sudo setfacl -m g:groupname:r file_or_directory
```

### Set default ACL for new files (directories only)
```bash
sudo setfacl -d -m u:username:rw directory
```

### Remove ACL entry
```bash
sudo setfacl -x u:username file_or_directory
```

### Remove all ACLs
```bash
sudo setfacl -b file_or_directory
```

---

## 🔍 Check Effective Access

```bash
namei -l /path/to/file
```

Check for a user:
```bash
sudo getfacl file_or_directory
```

---

## 🛠 Common Use Cases

✅ Allow `www-data` group to write to directory:
```bash
sudo chown -R ubuntu:www-data /var/www/html
sudo chmod -R 775 /var/www/html
```

✅ Allow specific user extra write permissions using ACL:
```bash
sudo setfacl -m u:deployer:rwx /var/www/html
```

✅ Make sure permissions apply to new files:
```bash
sudo setfacl -d -m u:deployer:rwx /var/www/html
```

---

## ⚠ Best Practices

✅ Use groups to manage permissions across multiple users.  
✅ Use ACLs when fine-grained control is needed beyond traditional Unix permissions.  
✅ Regularly review `getfacl` and `ls -l` outputs to audit access.

---

**Done! 🚀**