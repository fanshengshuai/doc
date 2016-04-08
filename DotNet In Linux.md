##### mono
  mono是指由Novell公司(由Xamarin发起，并由Miguel de lcaza领导的，一个致力于开创·NET在Linux上使用的开源工程



##### Jexus
  Jexus 即 Jexus Web Server，简称JWS，是Linux平台上 的一款ASP.NET WEB服务器。它是 Linux、Unix、FreeBSD 等非Windows系统架设 ASP.NET WEB 服务器的核心程序。
  
  百科：http://baike.baidu.com/view/4562810.htm
  官网：http://www.jexus.org/
  

##### 安装

```bash
yum -y install wget glib2-devel libtiff libtiff-devel libjpeg libjpeg-devel giflib giflib-devel libpng libpng-devel libX11 libX11-devel freetype freetype-devel fontconfig fontconfig-devel libexif libexif-devel gcc-c++ gettext unzip zip bzip2 bzip2-devel curl-devel gtk2-devel boost-devel
yum -y install yum-utils
yum –y install mono-complete.x86_64 # 安装所有的软件包
yum install -y dejavu-sans-mono-fonts # 安装字体
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
```

```bash
cd /tmp
mkdir -p /data/software; cd /data/software;
wget linuxdot.net/down/jexus-5.8.1.tar.gz 
tar -zxvf jexus-5.8.1.tar.gz 
cd jexus-5.8.1 
sudo ./install 
```
