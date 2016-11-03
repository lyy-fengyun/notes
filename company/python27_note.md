# python 2.7 note 
## 输入
raw_input()
## 输出 
print 语句: print 'content'; print var
## 字符编码默认为 ansi
使用 u'' 前缀表明编码为unicode

 在Python中，字符串、整数等都是不可变的
 ## set
 add() 增加集合元素
 remove() 删除集合元素
 
 ## 在python中，退出程序的方法 
 1. os._exit() 直接退出 Python程序，其后的代码也不会继续执行。
 
2. sys.exit() 引发一个 SystemExit异常，若没有捕获这个异常，Python解释器会直接退出；捕获这个异常可以做一些额外的清理工作。0为正常退出，其他数值（1-127）为不正常，可抛异常事件供捕获。
3. exit() 跟 C 语言等其他语言的 exit() 应该是一样的。

os._exit() 用于在线程中退出
sys.exit() 用于在主线程中退出。