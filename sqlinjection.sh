#!/bin/bash

echo "======================================"
echo "P6 - SQL INJECTION"
echo "======================================"

sudo apt update -y

# Install Docker
sudo apt install docker.io -y

sudo systemctl start docker

# Run DVWA
sudo docker pull vulnerables/web-dvwa

sudo docker run --rm -it -p 80:80 vulnerables/web-dvwa

if [ $? -ne 0 ]; then
    echo "[ERROR] DVWA failed to start"
    exit 1
fi

echo ""
echo "Open Browser:"
echo "http://localhost"

echo ""
echo "Sample Payload:"
echo "' OR 1=1 --"

echo ""
echo "Mitigation:"
echo "- Prepared Statements"
echo "- Input Validation"
echo "- Parameterized Queries"
