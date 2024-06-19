#!/bin/bash

# hosts=/etc/hosts
hosts=hosts
NET=192.168.10

cat << EOF > hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

#
# Specific 
#
EOF

for i in $(seq 200 230)
do
    echo "$NET.$i linux$i.example.com linux$i" >> hosts
    echo "adding hosts done $i"
done