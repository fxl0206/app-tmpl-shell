#!/bin/sh

# 目的:启动zookeeper

# 警告:请不要随意修改
# 作者:风雪了
# 邮件:fxl0206@gmail.com
# 创建时间:2016-09-14
# 脚本目的:启动独立java进程
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]

# *************************************************************************
# JAVA_OPTIONS - java启动选项
# JAVA_VM      - jvm选项
# MEM_ARGS     - 内存参数
# *************************************************************************
#echo "*************************************************"

#echo "启动zookeeper"

#cygwin和linux需要分开处理
if [[ `uname` =~ CYGWIN ]];then
	APP_HOME=`cygpath -dm "$HOME/apps/zookeeper"`
else
	APP_HOME=$HOME/apps/zookeeper
fi

ZK_HOME="${APP_HOME}/zookeeper-3.4.6"

COMMON_LIB_HOME=${ZK_HOME}/lib

. "$HOME/sbin/setEnv.sh"



ZK_CP="${ZK_HOME}/conf${S_FIX}$ZK_HOME/zookeeper-3.4.6.jar"

if [ -n "${CLASSPATH}" ];then
	CLASSPATH=${ZK_CP}${S_FIX}${CLASSPATH}
fi

echo "use APP_HOME:${APP_HOME}"
echo "use JAVA_HOME:${JAVA_HOME}"
echo "use ZK_HOME:${ZK_HOME}"
echo "use CLASSPATH:$CLASSPATH"

PROCESS_NAME="org.apache.zookeeper.server.quorum.QuorumPeerMain"

COMMON_LOG_ARGS="${APP_HOME}/logs/zookeeper-server-%Y%m%d.log"

if [[ `uname` =~ CYGWIN ]];then
   "$JAVA_HOME/bin/java" ${MEM_ARGS} ${JAVA_OPTIONS} -cp ${CLASSPATH} ${PROCESS_NAME} ${APP_HOME}/conf/zoo.cfg 2>&1 | $HOME/sbin/cronolog.exe ${COMMON_LOG_ARGS} &
else
   "$JAVA_HOME/bin/java" ${MEM_ARGS} ${JAVA_OPTIONS} -cp ${CLASSPATH} ${PROCESS_NAME} ${APP_HOME}/conf/zoo.cfg 2>&1 | $HOME/sbin/cronolog -k 5 ${COMMON_LOG_ARGS} &
fi
