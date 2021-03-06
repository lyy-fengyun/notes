# netstat linux
netstat 用于显示各种网络相关信息
##netstat的输出结果

1. 一个是Active Internet connections，称为有源TCP连接，其中"Recv-Q"和"Send-Q"指%0A的是接收队列和发送队列。这些数字一般都应该是0。如果不是则表示软件包正在队列中堆积。这种情况只能在非常少的情况见到。

2. 另一个是Active UNIX domain sockets，称为有源Unix域套接口(和网络套接字一样，但是只能用于本机通信，性能可以提高一倍)。

## 缩写含义
- Proto显示连接使用的协议
- RefCnt表示连接到本套接口上的进程号
- Types显示套接口的类型
- State显示套接口当前的状态
- Path表示连接到套接口的其它进程使用的路径名。

## 常见参数
```
-a (all)显示所有选项，默认不显示LISTEN相关
-t (tcp)仅显示tcp相关选项
-u (udp)仅显示udp相关选项
-n 拒绝显示别名，能显示数字的全部转化成数字。
-l 仅列出有在 Listen (监听) 的服務状态

-p 显示建立相关链接的程序名
-r 显示路由信息，路由表
-e 显示扩展信息，例如uid等
-s 按各个协议进行统计
-c 每隔一个固定时间，执行该netstat命令。
```
提示：LISTEN和LISTENING的状态只有用-a或者-l才能看到

## 实例
1.  列出所有端口 netstat -a
2.  列出所有 tcp 端口 netstat -at
3.  列出所有 udp 端口 netstat -au
4.  只显示监听端口 netstat -l
5.  只列出所有监听 tcp 端口 netstat -lt
6.  只列出所有监听 udp 端口 netstat -lu
7.  只列出所有监听 UNIX 端口 netstat -lx
8.  显示所有端口的统计信息 netstat -s
9.  显示 TCP 或 UDP 端口的统计信息 netstat -st 或 -su
10.  在 netstat 输出中显示 PID 和进程名称 netstat -p
netstat -p 可以与其它开关一起使用，就可以添加 “PID/进程名称” 到 netstat 输出中，这样 debugging 的时候可以很方便的发现特定端口运行的程序。
11. 在 netstat 输出中不显示主机，端口和用户名 (host, port or user)
当你不想让主机，端口和用户名显示，使用 netstat -n。将会使用数字代替那些名称。
同样可以加速输出，因为不用进行比对查询。
12. 持续输出 netstat 信息 netstat -c
13. 显示系统不支持的地址族 (Address Families) netstat --verbose
14. 显示核心路由信息 netstat -r