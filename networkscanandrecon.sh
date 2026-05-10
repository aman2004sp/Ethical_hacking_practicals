#!/bin/bash

echo "======================================"
echo "P2 - NETWORK RECONNAISSANCE"
echo "======================================"

sudo apt update -y

# Install Tools
sudo apt install -y \
nmap \
wireshark \
net-tools \
dnsutils

if [ $? -ne 0 ]; then
    echo "[ERROR] Tool installation failed"
    exit 1
fi

echo ""
echo "========= IP CONFIG ========="
ip a

echo ""
echo "========= ROUTING TABLE ========="
route -n

echo ""
echo "========= ARP TABLE ========="
arp -a

echo ""
read -p "Enter Target IP/Subnet for Nmap Scan: " target

echo ""
echo "========= NMAP SCAN ========="

sudo nmap -sV -O $target

echo ""
echo "========= STARTING WIRESHARK ========="

sudo wireshark &
