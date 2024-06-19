#!/bin/sh

useradd() {
    echo "사용자 추가"
    echo -n "추가할 사용자 이름은 무엇입니까 : "
    read uname  
    echo '------------------------------------'
    useradd $uname >/dev/null 2>&1
    [ $? -eq 0 ] && echo "[  OK  ] 정상적으로 추가 되었습니다."
    echo $uname | passwd --stdin $uname >/dev/null 2>&1
    echo '------------------------------------'
}

userverify() {
    passwd=/etc/passwd
    cat << EOF
------------------------------------
$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' $passwd | cat -n | cut -c3- )
------------------------------------
EOF
}

userdel() {
    echo "사용자 삭제"
    echo -n "삭제할 사용자 이름은 무엇입니까 : "
    read uname
    userdel -r $uname
    echo '------------------------------------'
    [ $? -eq 0 ] && echo "사용자 $uname이 삭제되었습니다"
    echo '------------------------------------'
}

while true
do
    cat << EOF
(관리 목록)
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF
    echo -n "선택 번호 : "
    read choice
    case $choice in
    1) useradd ;;
    2) userverify ;;
    3) userdel ;;
    4) 
    echo "종료하겠습니다"
    break ;;
    *) 
    echo "잘못누르셨습니다"
    echo ""
    continue ;; 
    esac
    echo ""
done
