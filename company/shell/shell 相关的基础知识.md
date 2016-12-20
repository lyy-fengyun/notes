#shell 相关的基础知识
## 变量
```
var=value
var="value ${var}"  
var='$var'
```
- 定义变量时=两边不能有空格， 
- 单引号表示是字符串，其中的变量不会进行解释，
- 双引号，字符串中的变量会用它的值进行替换
## echo printf
- echo 打印输出字符串
- printf 格式化打印输出字符串，与c语言的printf()比较类似
## ｛｝ 扩展
`mv /usr/bin/file{,.bak}`
将/usr/bin下的file文件生命名为file.bak，通过 { } 可以不用多敲一遍路径 
## 字符串长度
`${#var}`
如果存在变量var则给出字符串长度，否则输出0
## shell 类型
`$0  or  $SHELL`
## 查看环境变量
```
env  
$UID  用户ID,root用户ID为0
$PS1  命令行提示符
$PATH 环境变量
$HOME 家目录 
$PWD  当前目录
$USER 当前用户

$? 上一个命令执行后的退出状态，0 ->成功执行
```
## 算术运算
```
let (()) []
expr bc
```
```
#!/bin/bash
# mathdemo.sh
no1=34
no2=20
let result=no1+no2
echo $result
res=$[ no1 - no2 ]
ans=$((no1+no2))
ans2=$(expr 3 + 4)
echo $res
echo $ans 
echo $ans2
echo '4*2.89' | bc

```
- 使用let时，变量不用加$ 符号
- bc可以进行浮点数运算
## 文件描述符及重定向

```
stdin   0
stdout  1
stderr  2
<       定向到标准输入流
>       定向到标准输出流
2>      定向到标准错误流 
>>      追加
```