#!/bin/sh

echo "欢迎使用 lnmp 脚本 (fanshengshuai@gmail.com) ";
echo "增加资源。。。";
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-7.noarch.rpm
rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm

yum install -y mailx setuptool ntsysv system-config-firewall-tui system-config-network-tui  wget curl screen unzip vim rsync openssh-clients ntpdate

yum install -y nginx memcached nload spawn-fcgi
yum install -y php-cgi php-mysql php-gd php-mcrypt php-mbstring php-mysql php-odbc php-pdo  php-xml php-zip php-pecl-memcache

yum install -y mysql-server

wget http://bash.cyberciti.biz/dl/419.sh.zip
unzip 419.sh.zip
mv 419.sh /etc/init.d/php_cgi
chmod +x /etc/init.d/php_cgi

/etc/init.d/httpd stop
/etc/init.d/nginx start
/etc/init.d/php_cgi start
/etc/init.d/mysqld start

chkconfig nginx on
chkconfig php_cgi on
chkconfig mysqld on
