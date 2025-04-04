#!/bin/bash

# List of websites or IPs to check
sites=("www.google.com" "www.github.com" "www.w3schools.com" "www.LeetCode.com" "www.GeeksforGeeks.com")

echo "============================"
echo " 🌐 PING CHECKER REPORT"
echo "============================"

# Loop through each site
for site in "${sites[@]}"
do
    echo -n "🔎 Checking $site ... "
    
    # Ping each site once (-c 1), with a timeout of 2 seconds (-W 2)
    if ping -c 1 -W 2 $site &> /dev/null
    then
        echo "✅ ONLINE"
    else
        echo "❌ OFFLINE"
    fi
done

echo "============================"
echo "✅ Ping check complete!"
