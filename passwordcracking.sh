#!/bin/bash

echo "======================================"
echo "P3 - PASSWORD CRACKING"
echo "======================================"

sudo apt update -y

# Install John
sudo apt install john -y

if [ $? -ne 0 ]; then
    echo "[ERROR] John installation failed"
    exit 1
fi

# Create Sample Password File
echo "Creating sample password hash..."

echo -n "password123" | md5sum | awk '{print $1}' > hash.txt

echo ""
echo "Generated Hash:"
cat hash.txt

echo ""
echo "Starting John the Ripper..."

john hash.txt

echo ""
echo "Showing Cracked Password"

john --show hash.txt
