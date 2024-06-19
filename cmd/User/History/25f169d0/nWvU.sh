#!/bin/bash

source /root/cmd/function.sh

# 패키지 설치 및 서비스 기동
# 1) 단순 패키지 설치
# * epel-release
# * boxes, cowsay
# * gnome-tweaks
#
# 2) 서비스 기동
# * telnet 서비스
#  - telnet, telnet-server
# * ftp 서비스
#  - vsftpd, ftp
# * httpd 서비스
#  - httpd, mode_ssl

#########################
# 1. 단순 패키지 설치
#########################
PkgInstall epel-release
PkgInstall gnome-tweaks boxes cowsay

#########################
# 2. 서비스 기동
#########################
# * telnet
PkgInstall telnet
# * ftp
# * web