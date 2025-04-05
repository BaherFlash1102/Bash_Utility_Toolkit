#!/bin/bash
bash ./banner.sh "Disk Usage Alert" toilet
# Disk Usage Alert Script
# Alerts if disk usage goes above a specified threshold

THRESHOLD=80  # Default threshold (in %)

echo "============================"
echo " 💽 DISK USAGE MONITOR"
echo "============================"

read -p "⚠️  Set alert threshold percentage [default: 80]: " input_threshold
THRESHOLD=${input_threshold:-$THRESHOLD}

# Get disk usage info (skip tmpfs and loop)
df -H | grep -vE '^Filesystem|tmpfs|loop' | while read line; do
    usage=$(echo $line | awk '{ print $5 }' | sed 's/%//')
    partition=$(echo $line | awk '{ print $1 }')
    mount_point=$(echo $line | awk '{ print $6 }')

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "🚨 ALERT: Disk usage on $partition ($mount_point) is at $usage%!"
    else
        echo "✅ OK: $partition ($mount_point) is at $usage%"
    fi
done

echo "============================"
echo "✅ Disk check complete!"
