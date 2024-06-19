#!/bin/bash

PkgInstall() {
    if [ $# == 0 ]; then
    echo "ENTER YOUR PKG"
    exit 1
    else
    yum -y install $@ 
    echo "WE DOWNLOAD $@"
    fi
}
