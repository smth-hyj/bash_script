#!/bin/bash

PowerOff() {
    sleep 2; echo "root"
    sleep 0.5; echo "soldesk1."
    sleep 0.5; echo "poweroff"
}

net="192.168.10"
serverlist="$net.201 $net.202"
for i in $serverlist
do 
    PowerOff | telnet "$i"
done

echo "please wait for a few minutes"
sleep 15
poweroff