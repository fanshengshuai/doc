

```sh
# 检查防火墙状态
firewall-cmd --stat

# 临时开放ftp服务
firewall-cmd --add-service=ftp

# 永久开放ftp服务
firewall-cmd --add-service=ftp --permanent

# 关闭ftp服务
firewall-cmd --remove-service=ftp --permanent

# 配置防火墙在public区域永久开放http服务
firewall-cmd --permanent --zone=public --add-service=http

# 加入指定开放端口
firewall-cmd --add-port=1324/tcp

# 为了让之前的设定生效当然要重启服务咯
systemctl restart firewalld

# 或者使用下面的命令免去重启服务(防火墙策略配置后重新载入)
firewall-cmd --complete-reload
firewall-cmd --reload #   (这两句功能相同)

# 检查ftp服务的21端口是否开放
iptables -L -n | grep 21

ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp dpt:21 ctstate NEW

# 查询ftp服务启用状态
firewall-cmd --query-service ftp

# 查看当前规则
firewall-cmd --list-all

# 仅允许部分IP访问本机服务配置
firewall-cmd --permanent --zone=public --add-rich-rule="rule family="ipv4" \
        source address="192.168.0.4/24" service name="http" accept"

# 仅允许部分IP访问本机端口配置
firewall-cmd --permanent --zone=public --add-rich-rule="rule family="ipv4" \
     source address="192.168.0.4/24" \
     port protocol="tcp" port="8080" accept"   
```
