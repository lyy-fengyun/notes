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

------
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

### 偏函数
偏函数是对已有的函数进行包装的函数，将一些函数的参数设置为默认值，从而形成一个新的函数
可以通过**functools.partial**创建一个新的函数
`int2 = functools.partial(int, base=2)`

----------
## 模块
一个.py文件就称之为一个模块（Module）
为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包
每一个包目录下面都会有一个`__init__.py`的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包。\_\_init\_\_.py可以是空文件，也可以有Python代码，因为\_\_init\_\_.py本身就是一个模块，而它的模块名就是mycompany。

### 导入模块
import model_name

\_ 前缀表明变量仅在模块内部使用
正常的函数和变量名是公开的
\_\_var\_\_ 是特殊变量 可以直接访问
\_var 和 \__var 类型的函数或变量就是非公开的，不应该直接引用

### 面向对象
在Python中，所有数据类型都可以视为对象，当然也可以自定义对象。自定义的对象数据类型就是面向对象中的类（Class）的概念。
数据封装、继承和多态是面向对象的三大特点
通过 class 定义类
\_\_init\_\_方法相当于java中的构造方法，其第一个参数是 self (相当于java中的this,表示创建的实例本身，self指向创建的实例)
```
class Student(object):
    def __init__(self, name, score):
        self.name = name
        self.score = score
```
创建实例： 类名+() 可以进行对象的创建
继承：在`class Student(object)`说明了 类Studen继承于object类。
使用 **type()** 判断对象的类型
判断对象是否是函数对象可以使用 **types** 模块中定义的常量
使用 **isinstance()** 判断继承关系
使用 **dir()** 获得一个对象的所有属性和方法
使用 **\_\_slots\_\_** 限制对象的属性(动态语言中可以给对象添加属性和方法)
**\_\_slots\_\_** 定义的属性仅对当前类实例起作用，对继承的子类是不起作用的：
把一个getter方法变成属性，只需要加上@property就可以了，此时，
@property本身又创建了另一个装饰器@score.setter，负责把一个setter方法变成属性赋值，
于是，我们就拥有一个可控的属性操作
```
class Student(object):
    @property
    def score(self):
        return self._score
    @score.setter
    def score(self, value):
        if not isinstance(value, int):
            raise ValueError('score must be an integer!')
        if value < 0 or value > 100:
            raise ValueError('score must between 0 ~ 100!')
        self._score = value
```

python是多继承的语言
由于Python允许使用多重继承，因此，MixIn就是一种常见的设计。

#### `__str__()`
**\_\_str\_\_()** 相当于java语言中Object的 `toShting`方法
```
>>>s = Student('Michael')
>>>s
output: <__main__.Student object at 0x109afb310>
```
直接显示变量调用的不是__str__()，而是__repr__()，两者的区别是__str__()返回用户看到的字符串，
而`__repr__()`返回程序开发者看到的字符串，也就是说，`__repr__()`是为调试服务的。

解决办法是再定义一个__repr__()。但是通常__str__()和__repr__()代码都是一样的，所以，有个偷懒的写法：
```
class Student(object):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'Student object (name=%s)' % self.name
    __repr__ = __str__
```
`__iter__`

#### `__iter__()`
如果一个类想被用于for ... in循环，类似list或tuple那样，就必须实现一个`__iter__()`方法，该方法返回一个迭代对象，然后，Python的for循环就会不断调用该迭代对象的`__next__()`方法拿到循环的下一个值，直到遇到StopIteration错误时退出循环。

任何类，只需要定义一个__call__()方法，就可以直接对实例进行调用
Python还有另一个机制，那就是写一个__getattr__()方法，动态返回一个属性

Enum可以把一组相关常量定义在一个class中，且class不可变，而且成员可以直接比较。

### 错误处理
`try ... except...finally...`
```
try:
    print('try...')
    r = 10 / int('a')
    print('result:', r)
except ValueError as e:
    print('ValueError:', e)
except ZeroDivisionError as e:
    print('ZeroDivisionError:', e)
finally:
    print('finally...')
print('END')
```
Python的错误其实也是class，所有的错误类型都继承自BaseException，所以在使用except时需要注意的是，它不但捕获该类型的错误，还把其子类也“一网打尽”。
raise 语句

### logging
配置：
```
import logging
logging.basicConfig(level=logging.INFO)
```
日志级别： debug info waening error

### 单元测试
测试类继承于unittest.TestCase
以test开头的方法就是测试方法，不以test开头的方法不被认为是测试方法，测试的时候不会被执行
setup()方法有测试方法调用前被执行
tearDown()方法在测试方法调用后被执行

### 文档注释
'''
doc comment
'''
-------
## IO编程
### 文件读写
- 打开文件： `open('path/file-name','rw')`
- 读取文件内容： read();可以一次读完文件的全部内容。
- 关闭文件： close();
  Python引入了with语句来自动帮我们调用close()方法：
```
with open('/path/to/file', 'r',encoding='gbk') as f:
    print(f.read())
```
- read(size) 读取指定大小的内容
- readline() 读取一行内容
- readlines() 一次读取所有内容并并按行list
- write() 写文件
### StringIO 在内存中读写str
```
>>> from io import StringIO
>>> f = StringIO()
>>> f.write('hello')
5
>>> f.write(' ')
1
>>> f.write('world!')
6
>>> print(f.getvalue())
hello world!
```
- getvalue()用于获得写入后的str

### BytesIO
BytesIO操作二进制流，在内存中读写bytes
```
>>> from io import BytesIO
>>> f = BytesIO()
>>> f.write('中文'.encode('utf-8'))
6
>>> print(f.getvalue())
b'\xe4\xb8\xad\xe6\x96\x87'>>> from io import BytesIO
>>> f = BytesIO()
>>> f.write('中文'.encode('utf-8'))
6
>>> print(f.getvalue())
b'\xe4\xb8\xad\xe6\x96\x87'
```

### 操作文件和目录
操作文件和目录的函数一部分放在os模块中，一部分放在os.path模块中
```
# 查看当前目录的绝对路径:
>>> os.path.abspath('.')
'/Users/michael'
# 在某个目录下创建一个新目录，首先把新目录的完整路径表示出来:
>>> os.path.join('/Users/michael', 'testdir')
'/Users/michael/testdir'
# 然后创建一个目录:
>>> os.mkdir('/Users/michael/testdir')
# 删掉一个目录:
>>> os.rmdir('/Users/michael/testdir')
```
把两个路径合成一个时，不要直接拼字符串，而要通过os.path.join()函数，
这样可以正确处理不同操作系统的路径分隔符。
在Linux/Unix/Mac下，os.path.join()返回这样的字符串：

要拆分路径时，也不要直接去拆字符串，而要通过os.path.split()函数，
这样可以把一个路径拆分为两部分，
后一部分总是最后级别的目录或文件名：

os.path.splitext()可以直接得到文件扩展名
shutil模块提供了copyfile()的函数，你还可以在shutil模块中找到很多实用函数，
它们可以看做是os模块的补充。
最后看看如何利用Python的特性来过滤文件。比如我们要列出当前目录下的所有目录，只需要一行代码：
```
>>> [x for x in os.listdir('.') if os.path.isdir(x)]
['.lein', '.local', '.m2', '.npm', '.ssh', '.Trash', '.vim', 'Applications', 'Desktop', ...]
```
要列出所有的.py文件，也只需一行代码：
```
>>> [x for x in os.listdir('.') if os.path.isfile(x) and os.path.splitext(x)[1]=='.py']
['apis.py', 'config.py', 'models.py', 'pymonitor.py', 'test_db.py', 'urls.py', 'wsgiap
```
### 序列化
把变量从内存中变成可存储或传输的过程称之为序列化
Python提供了pickle模块来实现序列化。

尝试把一个对象序列化并写入文件：
```
>>> import pickle
>>> d = dict(name='Bob', age=20, score=88)
>>> pickle.dumps(d)
b'\x80\x03}q\x00(X\x03\x00\x00\x00ageq\x01K\x14X\x05\x00\x00\x00scoreq\x02KXX\x04\x00\x00\x00nameq\x03X\x03\x00\x00\x00Bobq\x04u.'
```
pickle.dumps()方法把任意对象序列化成一个bytes，然后，就可以把这个bytes写入文件。
或者用另一个方法pickle.dump()直接把对象序列化后写入一个file-like Object：
```
>>> f = open('dump.txt', 'wb')
>>> pickle.dump(d, f)
>>> f.close()
```
当我们要把对象从磁盘读到内存时，可以先把内容读到一个bytes，
然后用pickle.loads()方法反序列化出对象，
也可以直接用pickle.load()方法从一个file-like Object中直接反序列化出对象。

Python内置的json模块提供了非常完善的Python对象到JSON格式的转换。
Python对象变成一个JSON：
```
>>> import json
>>> d = dict(name='Bob', age=20, score=88)
>>> json.dumps(d)
'{"age": 20, "score": 88, "name": "Bob"}'
```

要把JSON反序列化为Python对象，用loads()或者对应的load()方法，
前者把JSON的字符串反序列化，
后者从file-like Object中读取字符串并反序列化

通常class的实例都有一个__dict__属性，它就是一个dict，用来存储实例变量。

如果我们要把JSON反序列化为一个Student对象实例，loads()方法首先转换出一个dict对象，
然后，我们传入的object_hook函数负责把dict转换为Student实例：
### 进程与线程
在linux中通过 fork() 建立线程
在Unix/Linux下，multiprocessing模块封装了fork()调用，
使我们不需要关注fork()的细节。由于Windows没有fork调用，
因此，multiprocessing需要“模拟”出fork的效果，
父进程所有Python对象都必须通过pickle序列化再传到子进程去，
所以，如果multiprocessing在Windows下调用失败了，要先考虑是不是pickle失败了

在Unix/Linux下，可以使用fork()调用实现多进程。
要实现跨平台的多进程，可以使用multiprocessing模块。
进程间通信是通过Queue、Pipes等实现的
#### 线程
Python的标准库提供了两个模块:\_thread和threading，\_thread是低级模块，
threading是高级模块，对_thread进行了封装。绝大多数情况下，
我们只需要使用threading这个高级模块。

#### ThreadLocal
ThreadLocal最常用的地方就是为每个线程绑定一个数据库连接，HTTP请求，用户身份信息等，
这样一个线程的所有调用到的处理函数都可以非常方便地访问这些资源。
一个ThreadLocal变量虽然是全局变量，但每个线程都只能读写自己线程的独立副本，互不干扰。
ThreadLocal解决了参数在一个线程中各个函数之间互相传递的问题。

要实现多任务，通常我们会设计Master-Worker模式，Master负责分配任务，Worker负责执行任务，因此，多任务环境下，通常是一个Master，多个Worker。

如果用多线程实现Master-Worker，主线程就是Master，其他线程就是Worker.

-------
## 内置模块
### datetime
- from datetime import datetime, timedelta, timezone
timedelta 可以对时间进行加减计算
timezone 可以对时间进行时区的设置
datetime表示的时间需要时区信息才能确定一个特定的时间，否则只能视为本地时间。
如果要存储datetime，最佳方法是将其转换为timestamp再存储，因为timestamp的值与时区完全无关
### collections
- from collections import namedtuple
namedtuple是一个函数，它用来创建一个自定义的tuple对象，并且规定了tuple元素的个数，
并可以用属性而不是索引来引用tuple的某个元素。
deque是为了高效实现插入和删除操作的双向列表，适合用于队列和栈：
使用dict时，如果引用的Key不存在，就会抛出KeyError。如果希望key不存在时，返回一个默认值，就可以用defaultdict：
使用dict时，Key是无序的。在对dict做迭代时，我们无法确定Key的顺序。
如果要保持Key的顺序，可以用OrderedDict
OrderedDict的Key会按照插入的顺序排列，不是Key本身排序
### base64
Base64是一种任意二进制到文本字符串的编码方法，常用于在URL、Cookie、网页中传输少量二进制数据。
### struct
将字符串转换为字节型的数据
### hashlib
Python的hashlib提供了常见的摘要算法，如MD5，SHA1等等。
### itertools
itertools模块提供的全部是处理迭代功能的函数，它们的返回值不是list，而是Iterator，
只有用for循环迭代的时候才真正计算。
### XML
操作XML有两种方法：DOM和SAX。DOM会把整个XML读入内存，解析为树，因此占用内存大，解析慢，
优点是可以任意遍历树的节点。SAX是流模式，边读边解析，占用内存小，解析快，缺点是我们需要自己处理事件。
from xml.parsers.expat import ParserCreate
#### HTMLParser

### urllib
urllib提供的功能就是利用程序去执行各种HTTP请求。如果要模拟浏览器完成特定功能，需要把请求伪装成浏览器。
伪装的方法是先监控浏览器发出的请求，再根据浏览器的请求头来伪装，User-Agent头就是用来标识浏览器的。

------
## TCP编程


### 套接字层
	套接字：用于程序之间连接的编程接口，可能运行在网络的不同计算机中
### 机器标识符：硬件地址
	机器名称：即IP地址或域名
		127.0.0.1与localhost等价代表了计算机本身
	端口号：用于会话时的协商数字标识符
	机器名称与端口号组合在一起可以唯一标识网络上的每一个会话
### 协议层：
	消息格式与套接字端口号
	消息格式提供了对话期间在套接字上交换的字节结构
	端口号是保留的数字标识符，用于底层套接字上的信息交换
### 端口号规则
	0——65535的整数值
	0-1023是保留的端口号
### 客户端与服务器
```

```
