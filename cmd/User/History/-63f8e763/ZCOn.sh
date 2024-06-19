#!/bin/bash

if [ $# -ne 1];
    echo "usage $0 <directory>"
    exit 1
fi


[ -d "$1" ] && BASEDIR=$1
SRC_EXT='ses'
DEST_EXT='txt'
all_name=$(find $BASEDIR -name "*.$SRC_EXT")

ls -l $BASEDIR | grep ".$(SRC_EXT)"
for i in $all_name
do 
    mv $all_name 
done