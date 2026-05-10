#!/bin/bash

echo "======================================"
echo "P4 - METASPLOIT BASICS"
echo "======================================"

sudo apt update -y

# Install Metasploit dependencies
sudo apt install curl postgresql -y

# Install Metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall

chmod +x msfinstall

sudo ./msfinstall

if [ $? -ne 0 ]; then
    echo "[ERROR] Metasploit installation failed"
    exit 1
fi

echo ""
echo "========= STARTING POSTGRESQL ========="

sudo systemctl start postgresql

echo ""
echo "========= STARTING METASPLOIT ========="

msfconsole
