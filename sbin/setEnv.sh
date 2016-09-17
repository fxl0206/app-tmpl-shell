#!/bin/sh

# Ŀ��:����ͨ�û�������

# ����:�벻Ҫ�����޸�
# ����:��ѩ��
# �ʼ�:fxl0206@gmail.com
# ����ʱ��:2016-09-14
# �ű�Ŀ��:��������java����
# �޸�ԭ��:[�޸���ע��ԭ��]
# �޸�ʱ��:[�޸���ע��ʱ��]
# �޸�����:[�޸���ע������]

# *************************************************************************
# JAVA_OPTIONS - java����ѡ��
# JAVA_VM      - jvmѡ��
# MEM_ARGS     - �ڴ����
# *************************************************************************
#echo "*************************************************"

#echo "��ʼ��ͨ�û�������"
if [ ! -n "${APP_HOME}" ];then
	
	if [[ `uname` =~ CYGWIN ]];then
		APP_HOME=`cygpath -dm "$HOME"`
	else
		APP_HOME="$HOME"
	fi
fi

if [ ! -n "$JAVA_HOME" ];then
	
	if [[ `uname` =~ CYGWIN ]];then
		echo "use cygWin"
	else
		JAVA_HOME=$HOME/software/java
		export JAVA_HOME
	fi
fi

if [[ `uname` =~ CYGWIN ]];then
	S_FIX=";"
else
	S_FIX=":"
fi

if [ ! -n "${COMMON_LIB_HOME}" ];then
	COMMON_LIB_HOME="${APP_HOME}/lib"
	export COMMON_LIB_HOME
fi

if [ ! -n "${COMMON_LIBEXT_HOME}" ];then
	COMMON_LIBEXT_HOME="${APP_HOME}/libext"
	export COMMON_LIBEXT_HOME
fi
if [ ! -n "${COMMON_CONFIG_HOME}" ];then
	COMMON_CONFIG_HOME="${APP_HOME}/config"
fi

if [ ! -n "${COMMON_CONFIGEXT_HOME}" ];then
	COMMON_CONFIGEXT_HOME="${APP_HOME}/configext"
fi

CP=
if [ -d ${COMMON_LIB_HOME} ];then
	for i in `find ${COMMON_LIB_HOME} -name "*.jar"`
	do
		CP=${CP}${S_FIX}$i
	done
fi

if [ -d ${COMMON_LIBEXT_HOME} ];then
	for i in `find ${COMMON_LIBEXT_HOME} -name "*.jar"`
	do
		CP=${CP}${S_FIX}$i
	done
fi
CLASSPATH="${COMMON_CONFIGEXT_HOME}${S_FIX}${COMMON_CONFIG_HOME}${S_FIX}${CP}"
export CLASSPATH

#JAVA_OPTIONS=" -Djava.util.logging.config.file=${HOME}/configext/jdk-logging.properties -Djava.net.preferIPv4Stack=true -Dsun.net.inetaddr.ttl=10 -Djava.security.egd=file:/dev/zero -Dfile.encoding=GBK -Doracle.jdbc.V8Compatible=true -Dsun.rmi.transport.tcp.maxConnectionThreads=4 -Dcom.bes.ejb.spark.serializeCollectionType=true -Dcom.bes.ejb.spark.allowCustomerCollection=false -Dcom.bes.jndi.spark.lb.policy=requestRoundRobin -Dcom.bes.jndi.spark.lb.checkTime=5 -Dcom.bes.jndi.spark.tcp.requestTimeOut=600 -Dcom.bes.jndi.spark.tcp.minConnections=1 -Dcom.bes.jndi.spark.tcp.maxConnections=2 -Dcom.bes.jndi.spark.tcp.adjustInterval=30"
JAVA_OPTIONS="-Djava.util.logging.config.file=${HOME}/configext/jdk-logging.properties -Djava.net.preferIPv4Stack=true -Dsun.net.inetaddr.ttl=10 -Djava.security.egd=file:/dev/zero -Dfile.encoding=GBK -Doracle.jdbc.V8Compatible=true"

MEM_ARGS="-Xms128m -Xmx256m"

echo "��ʼ��ͨ�û����������"
echo "*************************************************************************"
echo "use JAVA_HOME:${JAVA_HOME}"
echo "APP_HOME=${APP_HOME}"
echo "COMMON_LIB_HOME=${COMMON_LIB_HOME}"
echo "COMMON_LIBEXT_HOME=${COMMON_LIBEXT_HOME}"
echo "COMMON_CONFIG_HOME=${COMMON_CONFIG_HOME}"
echo "COMMON_CONFIGEXT_HOME=${COMMON_CONFIGEXT_HOME}"
echo "CLASSPATH=$CLASSPATH"
echo "JAVA_OPTIONS=$JAVA_OPTIONS"
echo "MEM_ARGS=${MEM_ARGS}"
echo "*************************************************"


