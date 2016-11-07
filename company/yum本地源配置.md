# yum 本地源配置

1.建立本地源目录及挂载临时目录
```
#mkdir   /mnt/centosyum
#mkdir   /mnt/cdrom
```
2.挂载CentOS光盘(我这里用的IOS镜像，有两块分别定为盘1，和盘2)
插入盘1然后挂载盘1
`#mount   /dev/cdrom    /mnt/cdrom`
拷贝盘1内所有rpm包到本地源目录
`#cp  /mnt/cdrom/*    /mnt/centosyum`
同理挂载并将盘2内的rpm包拷贝到本地源目录
3.进入/etc/yum.repos.d目录，可以看到四个文件分别为CentOS-Base.repo、 CentOS-Media.repo 、CentOS-Vault.repo、CentOS-Vault.repo.repo,将其中三个改名或者移走留下CentOS-Media.repo
```
#cd /etc/yum.repos.d
#mv  CentOS-Base.repo     CentOS-Base.repo.bak
#mv  CentOS-Vault.repo     CentOS-Vault.repo.bak
#mv  CentOS-Vault.repo     CentOS-Vault.repo.bak
#vi  CentOS-Media.repo
```
将以下内容
```
[c6-media]
name=CentOS-$releasever - Media
baseurl=file:///media/CentOS/
        file:///media/cdrom/
        file:///media/cdrecorder/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
修改为
[c6-media]
name=CentOS-$releasever - Media
baseurl=file:///mnt/centosyum     ##这里为本地源路径
        file:///media/cdrom/
        file:///media/cdrecorder/
gpgcheck=1
enabled=1    ##开启本地源
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
```
修改好保存并退出

`#yum   clean       清除原来的缓存`
到此配置就完成！