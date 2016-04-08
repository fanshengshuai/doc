在启用了iptables web服务器上，流量高的时候经常会出现下面的错误： 
```
    ip_conntrack: table full, dropping packet 
```
这个问题的原因是由于web服务器收到了大量的连接，在启用了iptables的情况下，iptables会把所有的连接都做链接跟踪处理，这样iptables就会有一个链接跟踪表，当这个表满的时候，就会出现上面的错误。 

iptables的链接跟踪表最大容量为/proc/sys/net/ipv4/ip_conntrack_max，链接碰到各种状态的超时后就会从表中删除。 

所以解決方法一般有两个： 

(1) 加大 ip_conntrack_max 值 

    vi /etc/sysctl.conf 

    net.ipv4.ip_conntrack_max = 393216
    net.ipv4.netfilter.ip_conntrack_max = 393216 

(2): 降低 ip_conntrack timeout时间 

    vi /etc/sysctl.conf 

    net.ipv4.netfilter.ip_conntrack_tcp_timeout_established = 300
    net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait = 120
    net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait = 60
    net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait = 120 


in CentOS 7, should be:
```
net.core.somaxconn = 8192
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_fin_timeout = 20
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 5000
net.nf_conntrack_max = 393216
net.netfilter.nf_conntrack_max = 393216
net.netfilter.nf_conntrack_tcp_timeout_established = 300
net.netfilter.nf_conntrack_tcp_timeout_time_wait = 120
net.netfilter.nf_conntrack_tcp_timeout_close_wait = 60
net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 120
```

上面两种方法打个比喻就是烧水水开的时候，换一个大锅。一般情况下都可以解决问题，但是在极端情况下，还是不够用，怎么办？ 

这样就得反其道而行，用釜底抽薪的办法。iptables的raw表是不做数据包的链接跟踪处理的，我们就把那些连接量非常大的链接加入到iptables raw表。 

如一台web服务器可以这样： 

    iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp –dport 80 -j NOTRACK
    iptables -A FORWARD -m state –state UNTRACKED -j ACCEP
