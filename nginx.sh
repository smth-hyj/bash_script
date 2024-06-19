#!/bin/sh
# 필수 패키지: cowsay, boxes

# 패키지 설치
pkg="nginx mod_ssl"
yum -y install $pkg > /dev/null 2>&1
[ $? -eq 0 ] \
    && echo "[ ok ] $pkg installed" \
    || echo "[ fail ] $pkg uninstalled"

# 서비스 설정
cat << EOF > /usr/share/nginx/html/index.html
<pre>
$(cowsay -f dragon-and-cow NGINX | boxes -d girl)
</pre>
EOF


# 서비스 기동
systemctl enable nginx
systemctl restart nginx

# seLinux 기동 