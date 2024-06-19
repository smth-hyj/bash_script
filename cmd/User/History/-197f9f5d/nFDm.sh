#!/bin/bash

if [ $# == 0 ]; then
echo "ENTER YOUR PKG"
exit 1
else
yum -y install $1 
fi
