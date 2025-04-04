#!/bin/bash

# Simple Bash Port Scanner

# Ask user for target IP or domain
read -p "Enter target IP or domain: " target

# Define the range of ports to scan
start_port=1
end_port=100

echo "============================"
echo " 🔎 PORT SCANNER"
echo " Target: $target"
echo " Ports: $start_port - $end_port"
echo "============================"

# Scan ports
for ((port=$start_port; port<=$end_port; port++)); do
    # Try to connect using nc (netcat) with timeout
    # you need first to install (netcat) package by use following command:
    #---> sudo apt install netcat ++ (ubuntu machine)
    nc -z -w 1 $target $port &> /dev/null
    if [ $? -eq 0 ]; then
        echo "🟢 Port $port is OPEN"
    fi
done

echo "============================"
echo "✅ Scan Complete!"
