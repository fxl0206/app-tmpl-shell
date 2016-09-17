#!/bin/sh

# 目的:停止zookeeper 进程

# 警告:请不要随意修改
# 作者:风雪了
# 邮件:fxl0206@gmail.com
# 创建时间:2016-09-14
# 脚本目的:启动独立java进程
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]


CUR_USER=`whoami`
WEB_PORT={webPort}
PROCESS_NAME="org.apache.catalina.startup.Bootstrap"

if [[ `uname` =~ CYGWIN ]];then
	netstat -ano | grep ${WEB_PORT} | awk '{print $5}' | while read pid
	do
			taskkill /F /PID ${pid}
			echo "success stop zookeeper-server pid:${pid}"
	done
else
	ps -ef | grep ${PROCESS_NAME} | grep ${CUR_USER} | grep -v grep | awk '{print $2}' | while read pid
	do
			kill ${pid} 2>&1 >/dev/null
			echo "success stop zookeeper-server pid:${pid}"
	done
fi
