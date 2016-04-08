```sh
yum install -y mailx setuptool ntsysv system-config-firewall-tui system-config-network-tui \
              wget curl screen unzip vim rsync openssh-clients ntpdate screen 
rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
yum update


echo -e '* soft nofile 20000\n* hard nofile 20000\nroot soft nofile 20000\nroot hard nofile 20000' >> /etc/security/limits.conf;
echo -e 'net.core.somaxconn=8192\nnet.ipv4.tcp_syncookies=1\nnet.ipv4.tcp_tw_reuse=1\nnet.ipv4.tcp_tw_recycle=1\nnet.ipv4.tcp_fin_timeout=20\nnet.ipv4.tcp_keepalive_time=1200\nnet.ipv4.tcp_max_syn_backlog=8192\nnet.ipv4.tcp_max_tw_buckets=5000\nnet.ipv4.ip_conntrack_max = 10240' >> /etc/sysctl.conf;
```
