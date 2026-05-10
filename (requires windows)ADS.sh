#!/bin/bash

echo "======================================"
echo "P5 - ALTERNATE DATA STREAMS"
echo "======================================"

echo ""
echo "NOTE:"
echo "ADS only works on Windows NTFS."

echo ""
echo "Install VirtualBox for Windows VM"

sudo apt update -y
sudo apt install virtualbox -y

if [ $? -ne 0 ]; then
    echo "[ERROR] VirtualBox installation failed"
    exit 1
fi

echo ""
echo "Use these commands INSIDE Windows CMD"

echo ""
echo "Create ADS:"
echo "echo secret > file.txt:hidden.txt"

echo ""
echo "Open ADS:"
echo "notepad file.txt:hidden.txt"

echo ""
echo "Detect ADS:"
echo "dir /r"

echo ""
echo "Countermeasure:"
echo "- Use antivirus"
echo "- Scan NTFS streams"
