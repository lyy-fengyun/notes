# centos6.5 安装python2.7.12
**使用root用户身份执行**

 - 1.下载python2.7.12源码包
```
	wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz
```
 -  2.解压与安装
```
tar -xzvf Python-2.7.12.tgz
cd Python-2.7.12
./configure --prefix=/usr/local/python
make && make altinstall
```
 - 3.备份已有的python
```
mv /usr/bin/python{,.2.6}
```
 -  4.建立软链接到python2.7.12
```
ln -s /usr/local/python/bin/python2.7 /usr/bin/python
```
 - 5.修改yum
```
vi /usr/bin/yum
将 #!/usr/bin/python 改为
#!/usr/bin/python.2.6
```