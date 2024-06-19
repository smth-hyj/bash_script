#!/bin/sh

# Windows IP 구성

#    호스트 이름 . . . . . . . . : DESKTOP-I75FKDG
#    주 DNS 접미사 . . . . . . . :
#    노드 유형 . . . . . . . . . : 혼성
#    IP 라우팅 사용. . . . . . . : 아니요
#    WINS 프록시 사용. . . . . . : 아니요

# 이더넷 어댑터 이더넷:

#    연결별 DNS 접미사. . . . :
#    설명. . . . . . . . . . . . : Intel(R) Ethernet Connection (22) I219-LM
#    물리적 주소 . . . . . . . . : F4-F1-9E-23-2F-A9
#    DHCP 사용 . . . . . . . . . : 아니요
#    자동 구성 사용. . . . . . . : 예
#    링크-로컬 IPv6 주소 . . . . : fe80::ebcb:7e19:ae54:d0d0%4(기본 설정)
#    IPv4 주소 . . . . . . . . . : 172.16.6.7(기본 설정)
#    서브넷 마스크 . . . . . . . : 255.255.255.0
#    기본 게이트웨이 . . . . . . : 172.16.6.254
#    DHCPv6 IAID . . . . . . . . : 351596958
#    DHCPv6 클라이언트 DUID. . . : 00-01-00-01-2D-AF-F2-F9-F4-F1-9E-23-2F-A9
#    DNS 서버. . . . . . . . . . : 8.8.8.8
#    Tcpip를 통한 NetBIOS. . . . : 사용

SERVER=$(hostname)
cat <<EOF
Linux IP 구성
   호스트 이름..................: $SERVER
EOF

CON=$(echo $(nmcli device show $NIC | grep 'GENERAL.CONNECTION' | grep -v 'lo' | awk -F: '{print $2}'))
NIC=$(echo $(nmcli device | tail -n +2 | grep -v '^lo' | awk '{print $1}'))
MAC=$(echo $(nmcli device show $NIC | grep '^GENERAL.HWADDR:' | awk -FADDR: '{print $2}') )
DHCP=$(echo $(nmcli connection show ens160 | grep ipv4 | grep 'ipv4.method' | awk -F: '{print $2}'))
IP=$(echo $(nmcli device show $NIC | grep 'IP4.ADDRESS' | awk -F: '{print $2}'))
GW=$(echo $(nmcli device show $NIC | grep 'IP4.GATEWAY' | awk -F: '{print $2}'))
DNS=$(echo $(nmcli device show $NIC | grep 'IP4.DNS' | awk -F: '{print $2}'))

for i in $NIC
do 
    cat <<EOF
    커넥션 이름: $NIC
        이더넷 이름.................: $CON
        물리적 주소.................: $MAC
        DHCP 주소...................: $DHCP
        IPv4 주소...................: $IP
        기본 게이트 웨이............: $GW
        DNS 서버....................: $DNS

EOF
done