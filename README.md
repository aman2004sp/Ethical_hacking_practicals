# Practical 1 — OWASP Top 10 / DVWA or Juice Shop

Objective from syllabus:
Set up OWASP Juice Shop or DVWA and identify vulnerabilities like SQL Injection and XSS. 

---

# STEP 1 — Update Ubuntu

```bash id="bf8nl9"
sudo apt update && sudo apt upgrade -y
```

---

# STEP 2 — Install Docker

```bash id="p3r8oq"
sudo apt install docker.io -y
```

Verify:

```bash id="zn7y3u"
docker --version
```

---

# STEP 3 — Start Docker Service

```bash id="h4rvu6"
sudo systemctl start docker
sudo systemctl enable docker
```

Check status:

```bash id="2yq1ja"
sudo systemctl status docker
```

---

# STEP 4 — Download OWASP Juice Shop

```bash id="h9fzc9"
sudo docker pull bkimminich/juice-shop
```

---

# STEP 5 — Run Juice Shop

```bash id="z0g7ig"
sudo docker run -d -p 3000:3000 bkimminich/juice-shop
```

Check container:

```bash id="kg54s8"
sudo docker ps
```

---

# STEP 6 — Open Browser

Open:

```text id="7myn77"
http://localhost:3000
```

---

# PRACTICAL EXECUTION

Try:

* SQL Injection
* XSS
* Broken Authentication

Example SQL Injection payload:

```sql id="1blix8"
' OR 1=1 --
```

Example XSS payload:

```html id="grvvic"
<script>alert('XSS')</script>
```

---

# Practical 2 — Network Scanning and Reconnaissance

Objective from syllabus:
Use ipconfig/ifconfig, arp, ping, Nmap, Wireshark. 

---

# STEP 1 — Install Required Tools

```bash id="c6ih36"
sudo apt update
sudo apt install -y nmap wireshark net-tools dnsutils
```

---

# STEP 2 — Check Network Configuration

```bash id="ituv1x"
ip a
```

OR

```bash id="3j53zq"
ifconfig
```

---

# STEP 3 — Check Routing Table

```bash id="9j4wgh"
route -n
```

---

# STEP 4 — Check ARP Table

```bash id="tyrqhi"
arp -a
```

---

# STEP 5 — Ping Target System

```bash id="7v2c4o"
ping 8.8.8.8
```

---

# STEP 6 — Perform Nmap Scan

Single Host:

```bash id="ijzq5z"
nmap 192.168.1.1
```

Version Detection:

```bash id="4vzhx0"
nmap -sV 192.168.1.1
```

OS Detection:

```bash id="uh5ksn"
sudo nmap -O 192.168.1.1
```

Subnet Scan:

```bash id="u1kcbj"
nmap 192.168.1.0/24
```

---

# STEP 7 — Start Wireshark

```bash id="cjlwm1"
sudo wireshark
```

Choose interface:

* wlan0
* eth0

Start capture.

---

# Practical 3 — Password Cracking

Objective:
Use John the Ripper or Hashcat on sample hashes only. 

---

# STEP 1 — Install John the Ripper

```bash id="zvwjlwm"
sudo apt update
sudo apt install john -y
```

---

# STEP 2 — Create Sample Password Hash

```bash id="bdmpvz"
echo -n "password123" | md5sum
```

Example output:

```text id="9oqw98"
482c811da5d5b4bc6d497ffa98491e38
```

---

# STEP 3 — Save Hash

```bash id="4z4jlwm"
nano hash.txt
```

Paste hash and save.

---

# STEP 4 — Run John

```bash id="i7bl8v"
john hash.txt
```

---

# STEP 5 — Show Cracked Password

```bash id="v4mtc6"
john --show hash.txt
```

---

# Practical 4 — Metasploit Basics

Objective:
Use Metasploit with Metasploitable2 VM. 

---

# STEP 1 — Install Curl and PostgreSQL

```bash id="rrulje"
sudo apt update
sudo apt install curl postgresql -y
```

---

# STEP 2 — Install Metasploit

```bash id="u3c1y9"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
```

---

# STEP 3 — Make Installer Executable

```bash id="2l4v2j"
chmod +x msfinstall
```

---

# STEP 4 — Run Installer

```bash id="jjmxg6"
sudo ./msfinstall
```

---

# STEP 5 — Start PostgreSQL

```bash id="a63d9v"
sudo systemctl start postgresql
```

---

# STEP 6 — Start Metasploit

```bash id="h1hm2e"
msfconsole
```

---

# STEP 7 — Example Scan

Inside Metasploit:

```bash id="h7dtxv"
db_nmap 192.168.1.5
```

---

# Practical 5 — Alternate Data Streams (ADS)

Objective:
Use Windows VM for ADS practical. 

---

# STEP 1 — Install VirtualBox

```bash id="25fc8y"
sudo apt update
sudo apt install virtualbox -y
```

---

# STEP 2 — Install Windows VM

* Create VM
* Install Windows ISO
* Use NTFS filesystem

---

# STEP 3 — Create ADS

Inside Windows CMD:

```cmd id="vbvm1z"
echo secret > file.txt:hidden.txt
```

---

# STEP 4 — Open Hidden Stream

```cmd id="jlwmxy"
notepad file.txt:hidden.txt
```

---

# STEP 5 — Detect ADS

```cmd id="31fhpx"
dir /r
```

---

# Practical 6 — SQL Injection

Objective:
Perform SQL Injection on DVWA/Juice Shop. 

---

# STEP 1 — Install Docker

```bash id="jlwmt9"
sudo apt update
sudo apt install docker.io -y
```

---

# STEP 2 — Start Docker

```bash id="ndd6y2"
sudo systemctl start docker
```

---

# STEP 3 — Download DVWA

```bash id="6r3rc8"
sudo docker pull vulnerables/web-dvwa
```

---

# STEP 4 — Run DVWA

```bash id="qfdufm"
sudo docker run --rm -it -p 80:80 vulnerables/web-dvwa
```

---

# STEP 5 — Open Browser

```text id="88y8p2"
http://localhost
```

---

# STEP 6 — Login to DVWA

Default:

* username: admin
* password: password

---

# STEP 7 — Perform SQL Injection

Payload:

```sql id="jlwm1a"
' OR 1=1 --
```

---

# STEP 8 — Study Mitigation

Learn:

* Prepared Statements
* Parameterized Queries
* Input Validation

---

# Practical 7 — NIST Framework Mapping

Objective:
Map attack stages to NIST and Cyber Kill Chain. 

---

# STEP 1 — Install LibreOffice

```bash id="zq10hz"
sudo apt update
sudo apt install libreoffice -y
```

---

# STEP 2 — Create Report File

```bash id="vph8ml"
nano report.txt
```

---

# STEP 3 — Add Framework Mapping

Example:

```text id="jlwmje"
Incident: Phishing Attack

Cyber Kill Chain:
1. Reconnaissance
2. Delivery
3. Exploitation

NIST Mapping:
1. Detect
2. Respond
3. Recover
```

---

# STEP 4 — Save Report

CTRL + O
ENTER
CTRL + X

---

# Practical 8 — Vulnerability Assessment

Objective:
Use OpenVAS/GVM to perform assessment. 

---

# STEP 1 — Install GVM/OpenVAS

```bash id="z7yd1n"
sudo apt update
sudo apt install gvm -y
```

---

# STEP 2 — Setup GVM

```bash id="jlwmx2"
sudo gvm-setup
```

This may take 20–40 minutes.

At end it gives:

* Username
* Password

Save them.

---

# STEP 3 — Start GVM

```bash id="jlwmk1"
sudo gvm-start
```

---

# STEP 4 — Open Browser

```text id="jlwm1v"
https://127.0.0.1:9392
```

---

# STEP 5 — Login

Use credentials generated during setup.

---

# STEP 6 — Create Target

* Configuration
* Targets
* New Target
* Enter target IP

---

# STEP 7 — Start Scan

* Scans
* Tasks
* New Task
* Start Scan

---

# STEP 8 — Generate Report

* Reports
* Export PDF/HTML
