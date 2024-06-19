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

rebootyes() {
    echo -n "[CAUTION] 재부팅 하시겠습니까(yes/no)"
    read answer
    case $answer in 
        'yes'|'YES'|'Y'|'y') shutdown -r +1 ;;
        'NO'|'no'|'n'|'N') exit 1 ;;
        *) echo "다시 입력해주세요";;
    esac
}

function print_good () {
    echo -e "\x1B[01;32m[ OK ]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[ ERROR ]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[ INFO ]\x1B[0m $1"
}