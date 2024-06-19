#!/bin/bash

PkgInstall() {
    if [ $# == 0 ]; then
    echo "ENTER YOUR PKG"
    exit 1
    else
        yum -y install $@ > /dev/null 2>&1
        echo "WE DOWNLOAD $@"
    fi
}

