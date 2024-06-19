#!/bin/bash 

NET=192.168.10
for i in $(seq 203 -1 200)
do 
    ping -c 3 -W 1 "$NET.$i" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "-----[OK] $NET.$i-----"
    else
        echo "-----[Fail] $NET.$i-----"
    fi 
done