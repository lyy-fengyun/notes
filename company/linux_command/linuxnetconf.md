## 配置linux网卡
第1步:首先咱们要切换到"/etc/sysconfig/network-scripts"目录中（该目录存放着网卡的配置文件）。

第2步:使用vim编辑器修改网卡文件"ifcfg-eno16777736"，逐项写入配置参数，并保存退出。

设备类型:TYPE=Ethernet

地址分配模式:BOOTPROTO=static

网卡名称:NAME=eno16777736

是否启动:ONBOOT=yes

IP地址:IPADDR=192.168.10.10

子网掩码:NETMASK=255.255.255.0

网关地址:GATEWAY=192.168.10.1

DNS地址:DNS1=192.168.10.1

第3步:重启网卡设备并测试网络是否联通。



## 配置YUM仓库
第1步:首先咱们要进入到"/etc/yum.repos.d/"目录中（因为该目录存放着yum仓库的配置文件）

第2步:使用vim编辑器创建一个名为rhel7.repo的新配置文件（文件名称可随意，但后缀必需为repo），逐项写入配置参数并保存退出。

[rhel-media]: yum源的名称，可自定义。

name=linuxprobe : yum仓库的名称，可自定义。

baseurl=file:///media/cdrom :提供方式包括FTP（ftp://..）、HTTP（http://..）、本地（file:///..）

enabled=1 : 设置此源是否可用，1为可用，0为禁用。

gpgcheck=1 : 设置此源是否校验文件，1为校验，0为不校验。

gpgkey=file:///media/cdrom/RPM-GPG-KEY-redhat-release :若为校验请指定公钥文件地址。

第3步:按配置参数的路径将光盘挂载，并将光盘挂载信息写入到/etc/fstab文件中。

第4步:使用"yum install httpd -y"命令检查Yum仓库是否已经可用。