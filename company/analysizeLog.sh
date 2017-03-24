#!/bin/bash

##################################
# 计算在线计费应急系统 平均TPS,最大耗时，最小耗时，平均耗时
# 文件名： 
# 注意事项：
# 脚本需要与 $WORK_PYTHON_FILE 文件相互配合才能完成工作
#
# 使用方法：
# ./analysizeLog.sh (当前目录下存在 work.py 预处理得到的文件或日志文件)
# ./analysizeLog.sh file_dir (指定日志目录)
# ./analysizeLog.sh file_dir result_file_name (指定日志目录,结果存储文件)
#
#
# 变量描述：
# FILE_PATH 存放日志的目录，绝对路径
# RESULT_FILE 统计结果存放的文件,参数缺省时为result
# WORK_PYTHON_FILE 进行主要计算的python文件的文件名
#
# CRM_LOG 省前置总的日志文件汇总
# MIGU_LOG 咪咕前置总的日志文件汇总
# CRM_RECEVIE_LOG  recv_from_crm  收到省前置的报文，id,time
# CRM_SEND_LOG  send_to_crm  送往省前置的报文 id,time
# MIGU_RECEVIE_LOG  recv_from_migu 收到咪咕的报文 id,time
# MIGU_SEND_LOG  send_to_migu 发往咪咕的报文 id,time
# START_TIME  请求发起时间
# END_TIME 请求结束时间
#
# version: 1.0
# author: liyy quanyq
# 2017年3月21日 21:51:17
##################################

# 错误码
E_PARAMATER=20  # 参数不正确
E_NOLOGFILE=21  # 日志文件可能不存在
E_NO_PRIMARY_WORK_FILE=22 # 进行运算的 python 文件不存在

# 变量定义 
FILE_PATH=$1
CRM_LOG=crmfront.log
MIGU_LOG=migufront.log

CRM_RECEVIE_LOG=recv_from_crm
CRM_SEND_LOG=send_to_crm
MIGU_RECEVIE_LOG=recv_from_migu
MIGU_SEND_LOG=send_to_migu
RESULT_FILE=result

WORK_PYTHON_FILE=work.py

START_TIME=''
END_TIME=''


# 参数2不为空
if [ x$2 != x ];then 
	RESULT_FILE=$2
fi

##################################
# 遍历文件夹
# author: liyy quanyq
##################################
listDir()
{
    dir=$1
    find $dir -type f -name '*.log' 
    return 0
}

##################################
# 日志文件分类及归并
# author: liyy quanyq
##################################
categoryLogFile()
{
    logFiles=$@
	if [[ x$logFiles != x ]]
	then
		cat $(grep -L "DCC省前置" $logFiles) > $MIGU_LOG
		cat $(grep -L "咪咕在线前置" $logFiles) > $CRM_LOG
		return 0
	else
		echo "没有发现日志文件！脚本退出"
		exit $E_NOLOGFILE
	fi
}

##################################
# 日志文件预处理
# author: liyy quanyq
##################################
preprocessLogFile()
{
    grep -a "接收咪咕在线计费/退费请求,返回同步应答" $MIGU_LOG | awk 'BEGIN{FS="#";OFS=","}{print $4,$2,$8}' > $MIGU_RECEVIE_LOG
    grep -a "咪咕前置-接收到核心返回消息" $MIGU_LOG | awk 'BEGIN{FS="#";OFS=","}{print $4,$2,$8}' > $MIGU_SEND_LOG
    grep -a "DCC省前置-在线计费/退费响应-收到CCA响应" $CRM_LOG | awk 'BEGIN{FS="#";OFS=","}{print $4,$2,$8}' > $CRM_RECEVIE_LOG
    grep -a "DCC省前置-在线计费/退费-发往网状网报文" $CRM_LOG | awk 'BEGIN{FS="#";OFS=","}{print $4,$2,$8}' > $CRM_SEND_LOG
    return 0
}

##################################
# 预处理得到的文件是否存在
# author: liyy quanyq
##################################
all_preFiel_is_exists(){
[[ -s $MIGU_RECEVIE_LOG && -s $MIGU_SEND_LOG && -s $CRM_RECEVIE_LOG && -s $CRM_SEND_LOG ]]
}

##################################
# 归并得到的日志文件是否在当前目录存在且非空
# author: liyy quanyq
##################################
log_file_is_exists(){
[[ -s $MIGU_LOG && -s $CRM_LOG ]]
}

##################################
# 处理得到的日志文件
# author: liyy quanyq
##################################
handle_log_file(){

	# 预处理得到的日志文件
	preprocessLogFile
	
	# 运行python文件进行计算
	run_py_file
	exit 0
}

##################################
# 运行python文件
# author: liyy quanyq
##################################
run_py_file(){
	get_start_end_time
	# 运行python文件进行计算
	python $WORK_PYTHON_FILE "$START_TIME" "$END_TIME" | tee $RESULT_FILE
}


##################################
# 得到请求发起与结束的时间
# author: liyy quanyq
##################################
get_start_end_time(){
	sort -t "," -k 2 $MIGU_RECEVIE_LOG > tmp.tmp
	START_TIME=$(head -n1 tmp.tmp| awk 'BEGIN{FS=","}{print $2}')
	sort -t "," -k 2 $MIGU_SEND_LOG > tmp.tmp.tmp
	END_TIME=$(tail -n1 tmp.tmp.tmp| awk 'BEGIN{FS=","}{print $2}')
	echo $START_TIME
	echo $END_TIME
	#rm tmp.tmp tmp.tmp.tmp
	return 0
}

##################################
# 程序主入口
# author: liyy quanyq
##################################

# 判断 $WORK_PYTHON_FILE 是否在当前文件
if [[ ! -e "$WORK_PYTHON_FILE" ]]
then
    echo "$WORK_PYTHON_FILE 不在当前目录，无法进行计算！"
    exit $E_NO_PRIMARY_WORK_FILE
fi

# 判断参数为空时
if [[ x$1 == x ]]
then
    if all_preFiel_is_exists
    then 
        # 运行python文件进行计算
        run_py_file
        exit 0
    elif log_file_is_exists  
    then
		# 处理日志文件
        handle_log_file
    else
        echo "Usage: $0 [logfile_Path] [resultFile_name] "
        exit $E_PARAMATER
    fi
else 
	# 参数不为空时
    if [[ -d "$FILE_PATH" ]]
    then
        logFiles=$(listDir $FILE_PATH)
        categoryLogFile $logFiles
        if log_file_is_exists
        then 
		    # 处理日志文件
			handle_log_file
		else
            echo "日志文件归并未完成，缺少省前置或咪咕前置日志文件。"
            exit $E_NOLOGFILE
        fi
    else 
        echo "日志目录不正确"
        exit $E_PARAMATER
    fi
fi
