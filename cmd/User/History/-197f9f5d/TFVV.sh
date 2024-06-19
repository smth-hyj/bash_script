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

srvstart() {
    if [ $# == 0 ]; then
    echo "ENTER YOUR PKG"
    exit 1
    else
        for i in $@
        do 
        systemctl enable --now $i > /dev/null 2>&1
        systemctl restart $i > /dev/null 2>&1
        echo "WE STARTED $i"
        done
    fi
}

srvdisable() {
    if [ $# == 0 ]; then
    echo "ENTER YOUR PKG"
    exit 1
    else
        for i in $@
        do 
        systemctl stop $i > /dev/null 2>&1
        systemctl disable --now $i > /dev/null 2>&1
        echo "WE STOPPED $i"
        done
    fi
}