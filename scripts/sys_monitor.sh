#!/bin/bash

# System Monitoring Script

echo "============================"
echo " 🔍 SYSTEM MONITOR REPORT "
echo "============================"

# Display CPU usage
echo -e "\n📊 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 "% | Idle: " $8 "%"}'

# top -bn1 → Runs the top command in batch mode (-b) and for one iteration (-n1).
# grep "Cpu(s)" → Filters only the line that contains CPU usage information.
# awk '{print "Used: " $2 "% | Idle: " $8 "%"}' → Extracts the used and idle CPU percentages.

# Display RAM usage
echo -e "\n📌 Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s\n", $3, $2}'

# free -h → Shows RAM usage in human-readable format (-h).
# awk 'NR==2{printf "Used: %s / Total: %s\n", $3, $2}'
# NR==2 → Selects only the second row, which contains RAM usage.
# $3 and $2 → Extract used and total memory.

# Display Disk usage
echo -e "\n💾 Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %s / Total: %s (%s)\n", $3, $2, $5}'

# df -h → Displays disk usage in human-readable format (-h).
# awk '$NF=="/"{printf "Used: %s / Total: %s (%s)\n", $3, $2, $5}'
# $NF=="/" → Filters the row where the mount point is / (root partition).
# $3 and $2 → Extract used and total disk space.
# $5 → Extracts the percentage used.

# Display System Uptime
echo -e "\n⏳ System Uptime:"
uptime -p

# uptime -p → Displays how long the system has been running in a pretty format (-p).

# Display Running Processes
echo -e "\n⚙️ Top 5 Running Processes:"
ps aux --sort=-%mem | awk 'NR<=6{print $1, $2, $3, $4, $11}' | column -t

# ps aux --sort=-%mem → Lists all running processes (ps aux) and sorts them by memory usage
# $1 = User, $2 = PID, $3 = CPU usage, $4 = Memory usage, $11 = Command
# column -t → Formats output into columns

echo -e "\n✅ System Monitor Report Completed!"
