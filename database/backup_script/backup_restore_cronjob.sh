#!/bin/bash

# Before running this script, make sure .pgpass file exists in the home directory
# and contains the credentials for both source and target databases.
# Example .pgpass file:
# .pgpass file contains like:
# HOST:PORT:DATABASE:USER:PASSWORD

# This script backs up a source database and restores it to a target database.
# It removes all tables from the target database before restoring the backup.
# The script is designed to run daily and keep only the last 7 days of backups.


# Variables
SOURCE_HOST="SOURCE_DB_HOST"
SOURCE_USER="SOURCE_DB_USER"
SOURCE_PORT="5432"
SOURCE_DB="SOURCE_DB_NAME"

TARGET_HOST="TARGET_DB_HOST"
TARGET_USER="TARGET_DB_USER"
TARGET_PORT="5432"
TARGET_DB="TARGET_DB_NAME"

BACKUP_DIR="/path/to/backup/directory"

# Get Today's Date
TODAY=$(date +%Y%m%d)

# Backup File Name
BACKUP_FILE="$BACKUP_DIR/db_backup_${TODAY}.sql"

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Ensure ~/.pgpass has the correct permissions
chmod 600 ~/.pgpass

# Step 1: Check if Today's Backup Exists
if [ -f "$BACKUP_FILE" ]; then
    echo "Today's backup already exists: $BACKUP_FILE"
    echo "Skipping backup and proceeding with restore..."
else
    echo "No backup found for today. Creating a new backup..."
    
    # Backup Source Database
    pg_dump -h $SOURCE_HOST -U $SOURCE_USER -p $SOURCE_PORT -d $SOURCE_DB -f $BACKUP_FILE

    if [ $? -ne 0 ]; then
        echo "Backup failed. Exiting."
        exit 1
    fi

    echo "Backup successful: $BACKUP_FILE"
fi

# Step 2: Remove All Tables in Target Database
echo "Removing all tables from target database: $TARGET_DB..."

TABLES=$(psql -h $TARGET_HOST -U $TARGET_USER -p $TARGET_PORT -d $TARGET_DB -Atc \
    "SELECT tablename FROM pg_tables WHERE schemaname = 'public';")

for TABLE in $TABLES; do
    psql -h $TARGET_HOST -U $TARGET_USER -p $TARGET_PORT -d $TARGET_DB -c "DROP TABLE IF EXISTS \"$TABLE\" CASCADE;"
done

if [ $? -ne 0 ]; then
    echo "Failed to remove tables from target database. Exiting."
    exit 1
fi

echo "All tables removed from target database."

# Step 3: Restore Backup to Target Database Using psql
echo "Restoring backup to target database: $TARGET_DB..."
psql -h $TARGET_HOST -U $TARGET_USER -p $TARGET_PORT -d $TARGET_DB < $BACKUP_FILE

if [ $? -ne 0 ]; then
    echo "Restore failed. Exiting."
    exit 1
fi

echo "Database restored successfully."

# Cleanup older backups (keep last 7 days)
find $BACKUP_DIR -type f -name "db_backup_*.sql" -mtime +7 -exec rm {} \;