#!/bin/bash
bash ./banner.sh "Weather App" toilet
# Simple Weather App using wttr.in
# install curl package:
# ---> apt install curl

echo "============================"
echo " ☁️  TERMINAL WEATHER APP"
echo "============================"

# Ask for location
read -p "📍 Enter your city or location: " location

# Show weather using wttr.in
echo ""
curl -s "wttr.in/${location}?format=3"

echo "============================"
echo "✅ Weather check complete!"
