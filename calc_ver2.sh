#!/bin/sh

echo -n "input A : "
read A

echo -n "input OP : "
read OP

echo -n "input B : "
read B

case $OP in 
    '+') echo "$A + $B = $(expr $A + $B)" ;;
    '-') echo "$A - $B = $(expr $A - $B)" ;;
    '*') echo "$A * $B = $(expr $A \* $B)" ;;
    '/') echo "$A / $B = $(expr $A / $B)" ;;
    *) echo -n "fail" ;;
esac