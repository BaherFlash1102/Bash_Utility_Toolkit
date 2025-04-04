#!/bin/bash
bash ./banner.sh "Log Cleaner" toilet
# Log Cleaner Script
# Deletes log files older than a certain number of days

LOG_DIR="/var/log"
DAYS_OLD=7  # Default: delete logs older than 7 days

echo "============================"
echo " 🧹 SYSTEM LOG CLEANER"
echo "============================"

# Ask for custom settings
read -p "🔧 Enter log directory [default: /var/log]: " input_dir
read -p "📅 Delete logs older than how many days? [default: 7]: " input_days

# Use defaults if nothing entered
LOG_DIR=${input_dir:-$LOG_DIR}
DAYS_OLD=${input_days:-$DAYS_OLD}

echo "📁 Cleaning logs in: $LOG_DIR"
echo "🗓️ Deleting logs older than $DAYS_OLD days..."
echo ""

# Find and delete old log files
sudo find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS_OLD -exec rm -v {} \;

echo ""
echo "✅ Log cleanup complete!"
echo "============================"
