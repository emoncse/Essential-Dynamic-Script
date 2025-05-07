#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${YELLOW}MySQL Backup + Optional Restore Script${NC}"

echo -e "${YELLOW}Enter SOURCE MySQL details:${NC}"
read -p "Host (e.g., 127.0.0.1): " SOURCE_HOST
read -p "Port (default 3306): " SOURCE_PORT
SOURCE_PORT=${SOURCE_PORT:-3306}
read -p "User: " SOURCE_USER
read -sp "Password for $SOURCE_USER: " SOURCE_PASSWORD
echo
read -p "Database name: " SOURCE_DB

echo -e "${YELLOW}Where should we save the backup? (Press Enter for default: /home/$(whoami)/mysql_backups)${NC}"
read BACKUP_DIR
if [ -z "$BACKUP_DIR" ]; then
    BACKUP_DIR="/home/$(whoami)/mysql_backups"
fi

TODAY=$(date +%Y%m%d)
BACKUP_FILE="$BACKUP_DIR/db_backup_${SOURCE_DB}_${TODAY}.sql"

mkdir -p "$BACKUP_DIR"

echo -e "${YELLOW}Starting backup...${NC}"
if [ -f "$BACKUP_FILE" ]; then
    echo -e "${GREEN}Today's backup already exists: $BACKUP_FILE${NC}"
else
    mysqldump -h "$SOURCE_HOST" -P "$SOURCE_PORT" -u "$SOURCE_USER" -p"$SOURCE_PASSWORD" "$SOURCE_DB" > "$BACKUP_FILE"
    if [ $? -ne 0 ]; then
        echo -e "${RED}Backup failed. Exiting.${NC}"
        exit 1
    fi
    echo -e "${GREEN}Backup successful: $BACKUP_FILE${NC}"
fi

echo -e "${YELLOW}Do you want to restore this backup to a target/local database? (y/n)${NC}"
read RESTORE_CONFIRM
if [ "$RESTORE_CONFIRM" != "y" ]; then
    echo -e "${GREEN}Backup completed. No restore performed.${NC}"
    exit 0
fi

echo -e "${YELLOW}Enter TARGET MySQL details:${NC}"
read -p "Host (e.g., 127.0.0.1): " TARGET_HOST
read -p "Port (default 3306): " TARGET_PORT
TARGET_PORT=${TARGET_PORT:-3306}
read -p "User: " TARGET_USER
read -sp "Password for $TARGET_USER: " TARGET_PASSWORD
echo
read -p "Database name: " TARGET_DB

echo -e "${RED}WARNING: This will DROP all tables in the target database $TARGET_DB!${NC}"
echo -e "Do you want to continue? (y/n)"
read DROP_CONFIRM
if [ "$DROP_CONFIRM" != "y" ]; then
    echo -e "${GREEN}Restore cancelled by user.${NC}"
    exit 0
fi

echo -e "${YELLOW}Dropping all tables in target database...${NC}"
TABLES=$(mysql -h "$TARGET_HOST" -P "$TARGET_PORT" -u "$TARGET_USER" -p"$TARGET_PASSWORD" -Nse \
    "SELECT table_name FROM information_schema.tables WHERE table_schema = '$TARGET_DB';")

for TABLE in $TABLES; do
    mysql -h "$TARGET_HOST" -P "$TARGET_PORT" -u "$TARGET_USER" -p"$TARGET_PASSWORD" -D "$TARGET_DB" -e "DROP TABLE IF EXISTS \`$TABLE\`;"
done

if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to remove tables from target database. Exiting.${NC}"
    exit 1
fi

echo -e "${GREEN}All tables dropped from target database.${NC}"

echo -e "${YELLOW}Restoring backup to target database...${NC}"
mysql -h "$TARGET_HOST" -P "$TARGET_PORT" -u "$TARGET_USER" -p"$TARGET_PASSWORD" "$TARGET_DB" < "$BACKUP_FILE"

if [ $? -ne 0 ]; then
    echo -e "${RED}Restore failed. Exiting.${NC}"
    exit 1
fi

echo -e "${GREEN}Database restored successfully!${NC}"

echo -e "${YELLOW}Cleaning up backups older than 7 days in $BACKUP_DIR...${NC}"
find "$BACKUP_DIR" -type f -name "db_backup_*.sql" -mtime +7 -exec rm {} \;

echo -e "${GREEN}Backup and restore process completed.${NC}"
