#!/bin/sh

basedir=/test

[ -d $basedir ] && rm -rf $basedir/*

for i in $(seq 1 4)
do
    mkdir -p $basedir/$i
    echo "$i 디렉토리 완성"
    for j in $(seq 1 4)
    do 
        mkdir -p $basedir/$i/$j
        echo "$j 디렉토리 완성"
    done
done