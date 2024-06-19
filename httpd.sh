#!/bin/sh
# 필수 패키지: cowsay, boxes

# 패키지 설치
pkg="httpd mod_ssl"
yum -y install $pkg > /dev/null 2>&1
[ $? -eq 0 ] \
    && echo "[ ok ] $pkg installed" \
    || echo "[ fail ] $pkg uninstalled"

# 서비스 설정
cat << EOF > /var/www/html/index.html
<pre>
$(cowsay -f dragon-and-cow HTTPD | boxes -d girl)
</pre>
EOF


# 서비스 기동
systemctl enable httpd
systemctl restart httpd

# seLinux 기동 