#!/bin/bash

# Backup directory
SOURCE_DIR="/company"
BACKUP_DIR="/backup"

# Create backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Generate date for filename
DATE=$(date +%F)

# Backup file name
BACKUP_FILE="$BACKUP_DIR/company_backup_$DATE.tar.gz"

# Create compressed archive
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Optional: log result
if [[ $? -eq 0 ]]; then
  echo "Backup completed successfully on $DATE"
else
  echo "Backup failed on $DATE"
fi
