#!/bin/bash
bash ./banner.sh "Let's Make Some Fun" toilet
# Install Required Tools
# sudo apt install figlet toilet  # for Debian/Ubuntu

# ASCII Art Generator

echo "============================"
echo " 🎨 ASCII ART GENERATOR"
echo "============================"

# Ask user for input
read -p "Enter text to convert into ASCII art: " user_text

# Ask user to choose style
echo "Choose a style:"
echo "1) figlet (classic)"
echo "2) toilet (fancier)"
read -p "Enter choice [1-2]: " choice

# Generate ASCII art
echo ""
case $choice in
    1)
        figlet "$user_text"
        ;;
    2)
        toilet "$user_text"
        ;;
    *)
        echo "❌ Invalid choice."
        ;;
esac

echo "============================"
echo "✅ ASCII art generated!"
