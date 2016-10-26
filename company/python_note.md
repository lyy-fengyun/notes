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

### 偏函数
偏函数是对已有的函数进行包装的函数，将一些函数的参数设置为默认值，从而形成一个新的函数   
可以通过**functools.partial**创建一个新的函数   
`int2 = functools.partial(int, base=2)`

----------
## 模块
一个.py文件就称之为一个模块（Module）   
为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包  
每一个包目录下面都会有一个__init__.py的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包。\_\_init\_\_.py可以是空文件，也可以有Python代码，因为\_\_init\_\_.py本身就是一个模块，而它的模块名就是mycompany。

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
