#!/bin/bash

if [ $# -ne 1];
    echo "usage $0 <directory>"
    exit 1
fi


[ -d "$1" ] && BASEDIR=$1
SRC_EXT=


ls -l $BASEDIR | grep ".$(SRC_EXT)"
