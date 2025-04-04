#!/bin/bash
bash ./banner.sh "Speed Tester" toilet
# Install speedtest-cli
# ----> sudo apt install speedtest-cli  # Debian/Ubuntu
# If it’s not available via apt, try:
# ----> pip install speedtest-cli

# Network Speed Test Script using speedtest-cli

echo "============================"
echo " 🚀 NETWORK SPEED TEST"
echo "============================"

# Check if speedtest-cli is installed
if ! command -v speedtest &> /dev/null
then
    echo "❌ speedtest-cli not found. Please install it first."
    exit 1
fi

# Run the speed test
speedtest --simple

echo "============================"
echo "✅ Speed test completed!"
