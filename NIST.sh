#!/bin/bash

echo "======================================"
echo "P7 - NIST CYBERSECURITY FRAMEWORK"
echo "======================================"

sudo apt update -y

sudo apt install libreoffice -y

echo ""
echo "========= CYBER KILL CHAIN ========="

echo "1. Reconnaissance"
echo "2. Weaponization"
echo "3. Delivery"
echo "4. Exploitation"
echo "5. Installation"
echo "6. Command and Control"
echo "7. Actions on Objectives"

echo ""
echo "========= NIST FUNCTIONS ========="

echo "1. Identify"
echo "2. Protect"
echo "3. Detect"
echo "4. Respond"
echo "5. Recover"

echo ""
echo "========= REPORT ========="

mkdir -p reports

cat <<EOF > reports/nist_report.txt
NIST Framework Mapping Report

Incident:
Sample phishing attack

Mapped Stages:
- Reconnaissance
- Delivery
- Exploitation

NIST Functions:
- Detect
- Respond
- Recover
EOF

echo "Report Generated:"
echo "reports/nist_report.txt"
