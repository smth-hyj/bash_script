#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <src> <dest>"
    echo "Example: $0 file.txt /tmp"
    exit 1
fi

SRC_FILE=$1
DEST_DIR=$2