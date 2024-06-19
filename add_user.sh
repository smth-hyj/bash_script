#!/bin/sh

userlist=/root/cmd/user.list

cat $userlist | while read uname upass
do 
    useradd $uname > /dev/null 2>&1
    [ $? -eq 0 ] && echo "[ OK ] $uname added "
    echo $uname | passwd --stdin $upass > /dev/null 2>&1
    [ $? -eq 0 ] && echo "[ OK ] $uname's password confirmed "   
done