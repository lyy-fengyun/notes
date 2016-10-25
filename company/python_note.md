# python note
退出：exit()
打印： print()
文件名：必须以 .py 结尾
通过 python 文件名 运行程序
输入： input("提示内容")
python的语法：
	采用缩进的方法
	以#开头的语句是注释
	当语句以冒号 ： 结尾时，缩进的语句视为代码块
	4 个空格的缩进
	大小写敏感
## pythod 基础
### 数据类型与变量
1. 整数
2. 浮点数
3. 字符串
		以单引号或双引号括起来的文本， \ 是转义字符
		r'' 中的字符串不进行转义
		'''多行文本'''  表示多行文本
4. 布尔值： True False
		and or not
5. 空值： None
6. 变量：引用型变量
7. 常量： 用大写的变量名表示常量
8. / : 保留了小数的除法
	 // ： 保留整数的除法
### 字符串与编码
在python 3 中，字符串是以unicode编码的
1. 字符编码：
	ord()函数可以获取字符的整数
	chr()函数把编码
2. 字符串类型是str,在内存中以 unicode表示。在网络上传输时要转换为以字节为单位的bytes
 通过 b'abc'  以字节存储字符串（bytes的每个字符 者只占用一个字节）
 encode()方法可以指定字符串的编码
 decode()方法可以将 bytes类型的字符串转换成其他的编码
 len() 计算字符串的多少个字符，或是bytes类型的字节数
3. 格式化输出 ：与c语言相似
 %d %f %s %x
 %%对%进行转义输出
### list和tuple
1. list是一种有序的集合，可以随时添加和删除其中的元素 []
	索引从0开始， 使用 -1 做索引可以找到最后一个元素
	通过append()添加元素,通过pop()删除元素，直接赋值可以将元素进行替换
2. tuple 元组，一旦初始化就不能修改。()
 要在定义的时候进行初始化。
 tuple只有一个元素时，要加一个 , 号消除歧义
### 条件判断
		if True:  
	     ...  
		elif True:  
		  ...  
		else:  
		  ...  
	int()可以将字符型的数字转换成整型
### 循环
1. for var in (list/tuple)
	range() 用于生成一个整数序列
	list()可以转换成 list
2. while
	break 提前退出
	continue 退出此次循环，进入下一次循环
### 使用 dict和set
1. dict: 全称 dictionary 在其他语言中称为 map，使用键值对进行存储
	{key:value,...}
  通过 key in dict_name 判断key是否存在于dict中
	通过 get() 方法可以判断 key是否存在
	通过pop(key) 的方式将对应的value从dict中删除
	dict中的key是不可变对象
2. set集合
	通过add(key)添加集合元素
	通过remove(key)删除集合元素
	不可放入可变元素

## 函数
### 定义函数
    def function-name(paramaters):
 			...
			return ...
pass 语句什么也不做
- 定义函数时，需要确定函数名和参数个数；
- 如果有必要，可以先对参数的数据类型做检查；
- 函数体内部可以用return随时返回函数结果；
- 函数执行完毕也没有return语句时，自动return None。
- 函数可以同时返回多个值，但其实就是一个tuple。
### 函数参数
1. 默认参数
	必选参数放在前面，默认参数在后，
	变化大的参数放前面，变化小的参数放后面
	默认参数必须指向不变对象

2. 可变参数
	通过*表明参数是可变参数

3. 关键字参数
  通过 ** 将dict 对象作为参数传入函数当中
	关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict
4. 命名关键字参数
  通过 * 进行分隔，后面的是命名关键字参数的名称
5. 参数组合
	参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数.
	\*args是可变参数，args接收的是一个tuple；
	\**kw是关键字参数，kw接收的是一个dict。
## 高级特性  
### 切片
通过切片可以对 list tuple 字符串进行截取操作
 [start_index:end_index:step]
 index = 0 时可以省略
 step 为正数时，表示正序，隔step取一个数；为负数时，表示反序，隔step取一个数
 可以进行倒数切片
### 迭代
可迭代的对象都可以使用循环进行输出
### 列表生成式
通过列表生成式可以生成复杂的列表
isinstance()可以对判断变量的类型
[var for var in list/tuple if var constraint ]
### 生成器
(var for var in list/tuple if var constraint )
通过next()打印下一个生成的值
如果一个函数定义中包含yield关键字，那么这个函数就不再是一个普通函数，而是一个generator。
### 迭代器
凡是可作用于for循环的对象都是Iterable类型；

凡是可作用于next()函数的对象都是Iterator类型，它们表示一个惰性计算的序列；

集合数据类型如list、dict、str等是Iterable但不是Iterator，不过可以通过iter()函数获得一个Iterator对象。
## 函数式编程
### 高级函数
可以接收函数变量作为参数的函数  
- map()
- reduce()
- filter() 过滤序列
- sorted() 排序函数
		sorted(['bob', 'about', 'Zoo', 'Credit'],key=str.lower)['about', 'bob', 'Credit', 'Zoo']
		sorted(['bob', 'about', 'Zoo', 'Credit'], key=str.lower, reverse=True)

关键字lambda表示匿名函数，
匿名函数有个限制，就是只能有一个表达式，不用写return，返回值就是该表达式的结果。














套接字层
	套接字：用于程序之间连接的编程接口，可能运行在网络的不同计算机中
机器标识符：硬件地址
	机器名称：即IP地址或域名
		127.0.0.1与localhost等价代表了计算机本身
	端口号：用于会话时的协商数字标识符
	机器名称与端口号组合在一起可以唯一标识网络上的每一个会话
协议层：
	消息格式与套接字端口号
	消息格式提供了对话期间在套接字上交换的字节结构
	端口号是保留的数字标识符，用于底层套接字上的信息交换
端口号规则
	0——65535的整数值
	0-1023是保留的端口号
客户端与服务器
