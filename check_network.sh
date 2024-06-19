#!/bin/bash

source /root/cmd/function.sh

# 네트워크 점검
# 1) ping 192.168.10.2
# 2) ping 8.8.8.8
# 3) ping www.google.com

IP1=192.168.10.2

ping -c 2 -W 1 $IP1 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "내부 네트워크 점검 완료"
else
    print_error "내부 네트워크 점검 이상"
    cat <<EOF
    (a) # ip addr
    (b) (WIN) services.msc > VMware*
    (c) (WIN)VMware > VM > settings(VMnet0 or VMnet8)
        * (VMnet0) VMware > Edit > Virtual Network Editor > VMnet0
        * (VMnet8) VMware > Edit > Virtual Network Editor > VMnet8
    (d) (WIN) ncpa.cpl > VMnet8(virtual network)
EOF
    exit 1
fi

IP2=8.8.8.8

ping -c 2 -W 1 $IP2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "외부 네트워크 점검 완료"
else
    print_error "외부 네트워크 점검 이상"
    cat <<EOF
    (a) # ip route
EOF
    exit 1
fi


IP3=www.google.com

ping -c 2 -W 1 $IP3 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "이름 네트워크 점검 완료"
else
    print_error "이름 네트워크 점검 이상"
    cat <<EOF
    (a) # cat /etc/resolv.conf
            => nameserver directive
    
EOF
    exit 1
fi