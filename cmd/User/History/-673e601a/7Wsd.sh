#!/bin/bash

usage() {
    echo "Usage: $0 <src> <dest>"
    echo "Example: $0 file.txt /tmp"
}

if [ $# -ne 2 ]; then
    usage
    exit 1
fi

ACTION=$1
SRC_FILE=$2
DEST_DIR=$3

sendfile() {
    for i in $(seq 200 202)
do 
    ping -c 1 -W 1 $NET.$i > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "-----[OK] $NET.$i-----"
        scp "$SRC_FILE" "${NET}.${i}:${DST_DIR}"
        echo
    else
        echo "---[fail] $NET.$i---"
        echo 
    fi
}

recivefile() {}

NET=192.168.10
case $ACTION in
    'send') sendfile ;;
    'recv') recivefile ;;
    *) : ;;


done