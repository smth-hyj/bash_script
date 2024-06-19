  1 #!/bin/bash
  2 
  3 
  4 # 패키지 설치 및 서비스 기동
  5 # 1) 단순 패키지 설치
  6 # * epel-release
  7 # * boxes, cowsay
  8 # * gnome-tweaks
  9 #
 10 # 2) 서비스 기동
 11 # * telnet 서비스
 12 #  - telnet, telnet-server
 13 # * ftp 서비스
 14 #  - vsftpd, ftp
 15 # * httpd 서비스
 16 #  - httpd, mode_ssl
 17 
 18 #########################
 19 # 1. 단순 패키지 설치
 20 #########################
 21 PkgInstall epel-release
 22 PkgInstall gnome-tweaks boxes cowsay
 23 
 24 #########################
 25 # 2. 서비스 기동
 26 #########################
 27 # * telnet
 28 # * ftp
 29 # * web
