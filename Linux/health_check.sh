#!/bin/bash

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

# Header
echo -e "${BLUE}========== Ubuntu System Health Check ==========${NC}"
echo

# OS and Kernel
echo -e "${YELLOW}OS & Kernel:${NC}"
lsb_release -a 2>/dev/null | grep Description
echo "Kernel: $(uname -r)"
echo

# Hostname and IP
echo -e "${YELLOW}Hostname & IP Address:${NC}"
echo "Hostname: $(hostname)"
IP=$(hostname -I | awk '{print $1}')
echo "IP Address: $IP"
echo

# CPU Info
echo -e "${YELLOW}CPU Info:${NC}"
echo "Model: $(lscpu | grep 'Model name' | awk -F ':' '{print $2}' | xargs)"
echo "Cores: $(nproc --all)"
echo "Threads per Core: $(lscpu | grep 'Thread(s) per core' | awk '{print $4}')"
echo

# Memory Info (in GB)
echo -e "${YELLOW}Memory Info:${NC}"
free -g | awk '/Mem:/ {printf "Total: %s GB, Used: %s GB, Free: %s GB\n", $2, $3, $4}'
echo

# Disk Usage (in GB)
echo -e "${YELLOW}Disk Usage:${NC}"
df -h --total | grep total | awk '{print "Total: "$2", Used: "$3", Free: "$4}'
echo

# Uptime and Load
echo -e "${YELLOW}Uptime & Load Average:${NC}"
uptime -p
echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"
echo

# Top 5 memory consuming processes
echo -e "${YELLOW}Top 5 Memory-Consuming Processes:${NC}"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo

# UFW Firewall Status
echo -e "${YELLOW}Firewall (UFW) Status:${NC}"
if command -v ufw &> /dev/null; then
    STATUS=$(ufw status | head -n1)
    echo "$STATUS"
    if [[ "$STATUS" == "Status: active" ]]; then
        echo "Allowed Ports:"
        ufw status | grep ALLOW
    fi
else
    echo "UFW is not installed."
fi
echo

# Nginx Status
echo -e "${YELLOW}Nginx Status:${NC}"
if systemctl list-unit-files | grep -q nginx.service; then
    systemctl is-active --quiet nginx && echo -e "${GREEN}Running${NC}" || echo -e "${RED}Not Running${NC}"
else
    echo "Nginx is not installed."
fi
echo

# Apache2 Status
echo -e "${YELLOW}Apache2 Status:${NC}"
if systemctl list-unit-files | grep -q apache2.service; then
    systemctl is-active --quiet apache2 && echo -e "${GREEN}Running${NC}" || echo -e "${RED}Not Running${NC}"
else
    echo "Apache2 is not installed."
fi
echo

# End
echo -e "${BLUE}========== End of Health Check ==========${NC}"
