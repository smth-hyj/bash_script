#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 <httpd|nginx>"
    exit 1
fi

websvc=$1

HTTPD() {
    systemctl disable --now httpd > /dev/null 2>&1
    ./httpd.sh
}

NGINX() {
    systemctl disable --now nginx /dev/null 2>&1
    ./nginx.sh
}

case $websvc in 
    httpd) HTTPD ;;
    nginx) NGINX ;;
    *) echo "[fail] 다시 실행하세요" ;;
esac