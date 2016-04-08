
# !!IMPORTANT 以下命令只用于 CentOS 7

```sh
yum install -y mailx setuptool ntsysv system-config-firewall-tui system-config-network-tui \
              wget curl screen unzip vim rsync openssh-clients ntpdate screen 
rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
yum update


echo -e '* soft nofile 20000\n* hard nofile 20000\nroot soft nofile 20000\nroot hard nofile 20000' >> /etc/security/limits.conf;
echo -e 'net.core.somaxconn=8192\nnet.ipv4.tcp_syncookies=1\nnet.ipv4.tcp_tw_reuse=1\nnet.ipv4.tcp_tw_recycle=1\nnet.ipv4.tcp_fin_timeout=20\nnet.ipv4.tcp_keepalive_time=1200\nnet.ipv4.tcp_max_syn_backlog=8192\nnet.ipv4.tcp_max_tw_buckets=5000\nnet.nf_conntrack_max = 655360\nnet.netfilter.nf_conntrack_tcp_timeout_established = 36000' >> /etc/sysctl.conf;
sysctl -p
```

```
几个解释： 
net.ipv4.tcp_syncookies = 1 
#表示开启SYN Cookies。当出现SYN等待队列溢出时，启用cookies来处理，可防范少量SYN攻击，默认为0，表示关闭； 
net.ipv4.tcp_tw_reuse = 1 
#表示开启重用。允许将TIME-WAIT sockets重新用于新的TCP连接，默认为0，表示关闭； 
net.ipv4.tcp_tw_recycle = 1 
#表示开启TCP连接中TIME-WAIT sockets的快速回收，默认为0，表示关闭。 
net.ipv4.tcp_fin_timeout = 30 
#表示如果套接字由本端要求关闭，这个参数决定了它保持在FIN-WAIT-2状态的时间。 
net.ipv4.tcp_keepalive_time = 1200 
#表示当keepalive起用的时候，TCP发送keepalive消息的频度。缺省是2小时，改为20分钟。 
net.ipv4.ip_local_port_range = 1024 65000 
#表示用于向外连接的端口范围。缺省情况下很小：32768到61000，改为1024到65000。 
net.ipv4.tcp_max_tw_buckets = 10000 
#表示系统同时保持TIME_WAIT套接字的最大数量，如果超过这个数字， 
#TIME_WAIT套接字将立刻被清除并打印警告信息。默认为180000，改为10000 。 
#对于Apache、Nginx、Jexus 等服务器，上几行的参数可以很好地减少TIME_WAIT套接字数量 
```
