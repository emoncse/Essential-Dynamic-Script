#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo -e "\033[0;31mPlease run as root (e.g., sudo ./setup_application_v2.sh)\033[0m"
  exit 1
fi

CONFIG_DIR="/etc/nginx/sites-available"
ENABLED_DIR="/etc/nginx/sites-enabled"

GREEN='\033[0;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}========================================"
echo -e "        NGINX CONFIGURATION SETUP"
echo -e "========================================${NC}"

echo -e "${YELLOW}Do you want to serve static files or proxy to a running service?${NC}"
echo "1) Static files"
echo "2) Proxy to local service"
echo -n "Select option (1/2): "
read CONFIG_TYPE

echo -e "${YELLOW}Enter the server name (e.g., example.com):${NC}"
read SERVER_NAME

echo -e "${YELLOW}Enter the port for Nginx to listen on (default 80):${NC}"
read LISTEN_PORT
LISTEN_PORT=${LISTEN_PORT:-80}

CONFIG_FILE="$CONFIG_DIR/$SERVER_NAME"

STATIC_BLOCK=""
MEDIA_BLOCK=""

echo -e "${YELLOW}Do you have a /static/ directory to serve? (y/n):${NC}"
read HAS_STATIC
if [ "$HAS_STATIC" == "y" ]; then
    echo -e "${YELLOW}Enter the absolute path to the /static/ directory:${NC}"
    read STATIC_PATH
    STATIC_BLOCK="    location /static/ {
        alias $STATIC_PATH/;
    }"
fi

echo -e "${YELLOW}Do you have a /media/ directory to serve? (y/n):${NC}"
read HAS_MEDIA
if [ "$HAS_MEDIA" == "y" ]; then
    echo -e "${YELLOW}Enter the absolute path to the /media/ directory:${NC}"
    read MEDIA_PATH
    MEDIA_BLOCK="    location /media/ {
        alias $MEDIA_PATH/;
    }"
fi

echo -e "${BLUE}----------------------------------------"
echo -e " Generating Nginx configuration..."
echo -e "----------------------------------------${NC}"

if [ "$CONFIG_TYPE" == "1" ]; then
    echo -e "${YELLOW}Enter the path to the static files root directory (e.g., /var/www/html):${NC}"
    read ROOT_DIR

    cat > "$CONFIG_FILE" <<EOL
server {
    listen $LISTEN_PORT;
    server_name $SERVER_NAME;

    root $ROOT_DIR;
    index index.html;

$STATIC_BLOCK
$MEDIA_BLOCK
    location / {
        try_files \$uri /index.html;
    }
}
EOL

elif [ "$CONFIG_TYPE" == "2" ]; then
    echo -e "${YELLOW}Enter the local running port of the application (e.g., 3000):${NC}"
    read LOCAL_PORT

    cat > "$CONFIG_FILE" <<EOL
server {
    listen $LISTEN_PORT;
    server_name $SERVER_NAME;

$STATIC_BLOCK
$MEDIA_BLOCK
    location / {
        proxy_pass http://127.0.0.1:$LOCAL_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOL

else
    echo -e "${RED}Invalid option. Exiting.${NC}"
    exit 1
fi

sudo ln -sf "$CONFIG_FILE" "$ENABLED_DIR/$SERVER_NAME"

echo -e "${BLUE}----------------------------------------"
echo -e " Testing Nginx configuration..."
echo -e "----------------------------------------${NC}"

if nginx -t; then
    sudo systemctl reload nginx
    echo -e "${GREEN}Nginx reloaded successfully!${NC}"
    echo -e "${GREEN}Configuration for $SERVER_NAME is live on port $LISTEN_PORT.${NC}"
else
    echo -e "${RED}Nginx configuration test failed. Please check your config.${NC}"
fi

echo -e "${BLUE}========================================"
echo -e "         SETUP COMPLETE"
echo -e "========================================${NC}"

