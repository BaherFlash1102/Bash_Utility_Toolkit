#!/bin/bash

# Define source and backup directories
SOURCE_DIR="$HOME/FolderName"   # Change this to the folder you want to back up
BACKUP_DIR="$HOME/Backups"      # Backup folder directory

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Generate a timestamp for the backup filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Perform the backup
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Display success message
echo "✅ Backup completed successfully!"
echo "📂 Backup saved to: $BACKUP_FILE"
