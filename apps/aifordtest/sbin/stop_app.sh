#!/bin/sh

# 作者:风雪了
# 创建时间:2016-09-17
# 脚本目的:启动进程
# 修改原因:
# 修改时间:
# 修改作者:

#不同应用此处修改
PROCESS_NAME="com.ai.aif.csf.run.RemoteServerStarter"
APP_CODE="crm_ord_channel"
APP_PORT="39999"



CUR_USER=`whoami`
if [[ `uname` =~ CYGWIN ]];then
	netstat -ano | grep ${APP_PORT} | grep LISTENING | awk '{print $5}' | while read pid
	do
			taskkill /F /PID ${pid}
			echo "进程名称:${PROCESS_NAME},参数:${APP_CODE},PID:${pid} 成功停止"
	done
else
	ps -ef | grep ${PROCESS_NAME} | grep ${CUR_USER} | grep ${APP_CODE} | grep java | grep -v grep | awk '{print $2}' | while read pid
	do
			kill ${pid} 2>&1 >/dev/null
			echo "进程名称:${PROCESS_NAME},参数:${APP_CODE},PID:${pid} 成功停止"
	done
fi

