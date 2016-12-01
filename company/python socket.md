# pyhthon socket 模块

- socket库可以直接访问本场c套接字库，可以与任何网络服务通信。select 监视多个套接字

- SocketServer 可以方便的创建服务器

- asyncore 实现了异步网络栈


##  socket

  套接字：程序在本地或者通过互联网进行传递数据时所用通信通道的一个端点。

-   地址簇：控制所用的OSI网络层协议

    1. AF_INET: 用于IPv4寻址

    2. AF_INET6: 用于IPV6寻址
    3. AF_UNIX: POSIX兼容系统上的进程间通信协议
-   套接字类型：控制传输协议
    1. SOC_DGRAM: UDP协议
    2. SOC_STREAM: TCP协议
-   方法

    1. socket.gethostname() 获取主机名
    2. socket.gethostbyname(hostname) 通过主机名获取ip
    3. socket.gethostbyname_ex(hostname) 通过主机名获取主机详细信息(原始主机名，域名，主机列表)
    4. socket.gethostbyaddr(ip) 通过IP得到主机详细信息
    5. socket.getsevbyname() 通过url得到网络服务器使用的端口
    6. socket.getprotobyname() 获取分配给一个传输协议的端口号
    7. getaddrinfo() 将一个服务的基本地址转换为一个元组列表

      ip地址表示：
      inet_aton()
      inet_ntoa()
      inet_pton()
      inet_ntop()

      socket() 创建套接字
      bind(address_tuple) 绑定地址
      listen() 设置套接字为服务器端监听模式

      senfall() 发送数据 
      recv() 接收数据

