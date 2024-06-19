echo -n "INPUT A : "
read A

echo -n "INPUT B : "
read B

cat <<EOF
=====================
1) + 2) - 3) * 4) /
=====================
EOF
echo -n "Enter Your OP : "
read OP

case $OP in
    1) echo "$A + $B = $(expr $A + $B)" ;;
    2) echo "$A - $B = $(expr $A - $B)" ;;
    3) echo "$A * $B = $(expr $A \* $B)" ;;
    4) echo "$A / $B = $(expr $A / $B)" ;;
    *) echo "FAIL" ;;
esac