格式化:

```sh

# 可以用 cfdisk 
cfdisk

root@archiso ~ # gparted
(parted) mkpart ESP fat32 1MiB 513MiB
(parted) set 1 boot on
(parted) mkpart primary ext3 513MiB 20.5GiB
(parted) mkpart primary linux-swap 20.5GiB 24.5GiB
(parted) exit

mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon /dev/sda3
```

```sh
mount /dev/sda2 /mnt
# mkdir /mnt/boot
# mount /dev/sda1 /mnt/boot

dhcpcd
# 把 163 ustc hongkong sohu 的放前面
vim /etc/pacman.d/mirrorlist
pacman -Syy
pacstrap /mnt base
#生成fstab
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash

# 设置Locale：
vim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
# 设置时区
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

echo arch > /etc/hostname

# 安装GRUB：
pacman -S grub os-prober
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl start dhcpcd
systemctl enable dhcpcd
```

```
# 添加普通用户并设置密码：
useradd -m -g users -s /bin/bash 用户名
passwd 用户名


# 测试网络连接：
ping -c 4 http://www.baidu.com


# 安装声卡驱动：
pacman -S alsa-utils


# 安装显卡驱动：
pacman -S xf86-video-vesa


# 安装Xorg：
pacman -S xorg xorg-xinit


# 安装LXDM管理器和LXDE桌面：
pacman -S lxdm lxde


# 设置lxdm开机启动：
systemctl enable lxdm


# 安装常用软件：
pacman -S fcitx tar leafpad xarchiver firefox firefox-i18n-zh-cn firefox-adblock-plus flashplugin


# 安装常用字体：
pacman -S ttf-dejavu wqy-zenhei wqy-microhei


# 配置输入法：
nano ~/.profile


# 内容大致修改为：
export XIM=fcitx
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XIM_PROGRAM=fcitx
fcitx &


备注：每个用户都得手动创建.profile文件，否则无法启动输入法。


# 重启机器：
reboot
```
