#!/bin/sh

userlist=/root/cmd/user.list
cat $userlist | while read uname upass
do 
    userdel -r $uname
    [ $? -eq 0 ] && echo " [ OK ] $uname deleted"
done
