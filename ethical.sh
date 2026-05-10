#!/bin/bash

# =====================================================
# ETHICAL HACKING LAB COMPLETE FRAMEWORK
# Ubuntu Based Practical Automation
# =====================================================

check_status() {
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $1 completed."
    else
        echo "[ERROR] $1 failed."
        exit 1
    fi
}

install_dependencies() {

    echo "========================================"
    echo " INSTALLING ALL DEPENDENCIES"
    echo "========================================"

    sudo apt update && sudo apt upgrade -y

    sudo apt install -y \
    docker.io \
    nmap \
    wireshark \
    net-tools \
    dnsutils \
    john \
    hashcat \
    curl \
    wget \
    git \
    python3 \
    python3-pip \
    sqlite3 \
    postgresql \
    libreoffice \
    virtualbox \
    gvm

    check_status "APT Packages"

    sudo systemctl enable docker
    sudo systemctl start docker

    sudo systemctl start postgresql

    echo ""
    echo "[+] Pulling OWASP Juice Shop..."
    sudo docker pull bkimminich/juice-shop

    echo ""
    echo "[+] Pulling DVWA..."
    sudo docker pull vulnerables/web-dvwa

    check_status "Docker Containers"

    echo ""
    echo "========================================"
    echo " INSTALLATION COMPLETED"
    echo "========================================"
}

# =====================================================
# PRACTICAL 1
# =====================================================

practical1() {

    clear

    echo "========================================"
    echo " PRACTICAL 1 - OWASP TOP 10"
    echo "========================================"

    sudo docker run -d -p 3000:3000 bkimminich/juice-shop

    echo ""
    echo "Open Browser:"
    echo "http://localhost:3000"

    echo ""
    echo "Try SQL Injection Payload:"
    echo "' OR 1=1 --"

    echo ""
    echo "Try XSS Payload:"
    echo "<script>alert('XSS')</script>"
}

# =====================================================
# PRACTICAL 2
# =====================================================

practical2() {

    clear

    echo "========================================"
    echo " PRACTICAL 2 - NETWORK RECON"
    echo "========================================"

    echo ""
    echo "IP Configuration:"
    ip a

    echo ""
    echo "Routing Table:"
    route -n

    echo ""
    echo "ARP Table:"
    arp -a

    echo ""
    read -p "Enter Target IP/Subnet: " target

    echo ""
    echo "Running Nmap Scan..."
    sudo nmap -sV -O $target

    echo ""
    echo "Launching Wireshark..."
    sudo wireshark &
}

# =====================================================
# PRACTICAL 3
# =====================================================

practical3() {

    clear

    echo "========================================"
    echo " PRACTICAL 3 - PASSWORD CRACKING"
    echo "========================================"

    echo -n "password123" | md5sum | awk '{print $1}' > hash.txt

    echo ""
    echo "Generated Hash:"
    cat hash.txt

    echo ""
    echo "Running John the Ripper..."

    john hash.txt

    echo ""
    echo "Cracked Password:"
    john --show hash.txt
}

# =====================================================
# PRACTICAL 4
# =====================================================

practical4() {

    clear

    echo "========================================"
    echo " PRACTICAL 4 - METASPLOIT"
    echo "========================================"

    echo ""
    echo "Launching Metasploit..."
    msfconsole
}

# =====================================================
# PRACTICAL 5
# =====================================================

practical5() {

    clear

    echo "========================================"
    echo " PRACTICAL 5 - ADS"
    echo "========================================"

    echo ""
    echo "ADS requires Windows NTFS."

    echo ""
    echo "Use Windows VM in VirtualBox."

    echo ""
    echo "Commands inside Windows CMD:"
    echo ""
    echo "echo secret > file.txt:hidden.txt"
    echo "notepad file.txt:hidden.txt"
    echo "dir /r"
}

# =====================================================
# PRACTICAL 6
# =====================================================

practical6() {

    clear

    echo "========================================"
    echo " PRACTICAL 6 - SQL INJECTION"
    echo "========================================"

    sudo docker run --rm -it -p 80:80 vulnerables/web-dvwa

    echo ""
    echo "Open Browser:"
    echo "http://localhost"

    echo ""
    echo "Default Login:"
    echo "username: admin"
    echo "password: password"

    echo ""
    echo "Payload:"
    echo "' OR 1=1 --"
}

# =====================================================
# PRACTICAL 7
# =====================================================

practical7() {

    clear

    echo "========================================"
    echo " PRACTICAL 7 - NIST FRAMEWORK"
    echo "========================================"

    mkdir -p reports

cat <<EOF > reports/nist_report.txt
NIST Framework Mapping Report

Incident:
Sample Phishing Attack

Cyber Kill Chain:
1. Reconnaissance
2. Delivery
3. Exploitation

NIST Functions:
1. Detect
2. Respond
3. Recover
EOF

    echo ""
    echo "Report Generated:"
    echo "reports/nist_report.txt"

    cat reports/nist_report.txt
}

# =====================================================
# PRACTICAL 8
# =====================================================

practical8() {

    clear

    echo "========================================"
    echo " PRACTICAL 8 - VULNERABILITY ASSESSMENT"
    echo "========================================"

    echo ""
    echo "Initializing GVM/OpenVAS..."

    sudo gvm-setup

    echo ""
    echo "Starting GVM..."

    sudo gvm-start

    echo ""
    echo "Open Browser:"
    echo "https://127.0.0.1:9392"
}

# =====================================================
# MAIN MENU
# =====================================================

while true
do

clear

echo "================================================"
echo " ETHICAL HACKING COMPLETE LAB"
echo "================================================"
echo "1. Install All Dependencies"
echo "2. Practical 1 - OWASP Top 10"
echo "3. Practical 2 - Network Recon"
echo "4. Practical 3 - Password Cracking"
echo "5. Practical 4 - Metasploit"
echo "6. Practical 5 - ADS"
echo "7. Practical 6 - SQL Injection"
echo "8. Practical 7 - NIST Framework"
echo "9. Practical 8 - Vulnerability Assessment"
echo "10. Exit"
echo "================================================"

read -p "Enter Choice: " choice

case $choice in

1) install_dependencies ;;
2) practical1 ;;
3) practical2 ;;
4) practical3 ;;
5) practical4 ;;
6) practical5 ;;
7) practical6 ;;
8) practical7 ;;
9) practical8 ;;
10) exit ;;

*) echo "Invalid Choice" ;;

esac

echo ""
read -p "Press ENTER to continue..."

done
