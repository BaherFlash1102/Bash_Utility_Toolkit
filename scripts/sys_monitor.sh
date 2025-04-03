#!/bin/bash

# System Monitoring Script

echo "============================"
echo " 🔍 SYSTEM MONITOR REPORT "
echo "============================"

# Display CPU usage
echo -e "\n📊 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 "% | Idle: " $8 "%"}'

# Display RAM usage
echo -e "\n📌 Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s\n", $3, $2}'

# Display Disk usage
echo -e "\n💾 Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %s / Total: %s (%s)\n", $3, $2, $5}'

# Display System Uptime
echo -e "\n⏳ System Uptime:"
uptime -p

# Display Running Processes
echo -e "\n⚙️ Top 5 Running Processes:"
ps aux --sort=-%mem | awk 'NR<=6{print $1, $2, $3, $4, $11}' | column -t

echo -e "\n✅ System Monitor Report Completed!"
