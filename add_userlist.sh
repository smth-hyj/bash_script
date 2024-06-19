#!/bin/sh

userlist=/root/cmd/user.list

>$userlist

for i in $(seq 1 50)
do 
    echo "user$i    user$i" >> $userlist
done