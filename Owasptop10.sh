#!/bin/bash

echo "======================================"
echo "P1 - OWASP TOP 10 / JUICE SHOP"
echo "======================================"

# Update System
sudo apt update -y

# Install Docker
sudo apt install docker.io -y

if [ $? -ne 0 ]; then
    echo "[ERROR] Docker installation failed"
    exit 1
fi

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Pull Juice Shop
sudo docker pull bkimminich/juice-shop

if [ $? -ne 0 ]; then
    echo "[ERROR] Juice Shop download failed"
    exit 1
fi

# Run Juice Shop
sudo docker run -d -p 3000:3000 bkimminich/juice-shop

echo ""
echo "[SUCCESS] OWASP Juice Shop Running"
echo "Open Browser:"
echo "http://localhost:3000"

echo ""
echo "Tasks:"
echo "- Explore OWASP Top 10"
echo "- Test SQL Injection"
echo "- Test XSS"
