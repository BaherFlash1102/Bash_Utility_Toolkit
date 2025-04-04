#!/bin/bash

# Auto Update Script for Debian/Ubuntu-based systems

echo "============================"
echo " 🔄 SYSTEM AUTO UPDATE"
echo "============================"

# Ask for confirmation
read -p "⚠️  This will update your system. Continue? (y/n): " confirm
if [[ $confirm != [yY] ]]; then
    echo "❌ Update canceled."
    exit 1
fi

# Update package lists
echo "📦 Updating package lists..."
sudo apt update

# Upgrade packages
echo "⬆️ Upgrading packages..."
sudo apt upgrade -y

# Optionally: remove unused packages
echo "🧹 Removing unnecessary packages..."
sudo apt autoremove -y

# Done
echo "✅ System update completed!"
