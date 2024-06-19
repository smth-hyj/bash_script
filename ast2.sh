#!/bin/bash

echo -n "enter your intput : "
read max

for i in $(seq 1 $max)
do 
    max2=$( expr $max - $i )
    for j in in $(seq $max2 -1 1 )
    do
        echo -n ' '
    done
    for k in $(seq 1 $i)
    do
        echo '*'
    done
done