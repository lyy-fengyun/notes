# ssh 命令参数
```
-l 指定登录用户
-p 指定端口
-C 声明所有通过ssh发送或接收的数据会经过压缩 
-v 调试ssh连接情况
-b 绑定源地址
-F 使用其他配置文件 
```
# bash
```
bash -n ./file.sh  检查脚本语法
bash -x ./file.sh  输出脚本执行的信息

if condition; then
    command
elif condition;
    command
else 
    command
fi

case $var in
    value:
        command;; # ;; 表示执行后结束case
    value:
        command;;
esac

wile condition 
do 
    command
done
```
