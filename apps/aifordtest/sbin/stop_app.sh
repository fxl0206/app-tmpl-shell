#!/bin/sh

# ����:��ѩ��
# ����ʱ��:2016-09-17
# �ű�Ŀ��:��������
# �޸�ԭ��:
# �޸�ʱ��:
# �޸�����:

#��ͬӦ�ô˴��޸�
PROCESS_NAME="com.ai.aif.csf.run.RemoteServerStarter"
APP_CODE="crm_ord_channel"
APP_PORT="39999"



CUR_USER=`whoami`
if [[ `uname` =~ CYGWIN ]];then
	netstat -ano | grep ${APP_PORT} | grep LISTENING | awk '{print $5}' | while read pid
	do
			taskkill /F /PID ${pid}
			echo "��������:${PROCESS_NAME},����:${APP_CODE},PID:${pid} �ɹ�ֹͣ"
	done
else
	ps -ef | grep ${PROCESS_NAME} | grep ${CUR_USER} | grep ${APP_CODE} | grep java | grep -v grep | awk '{print $2}' | while read pid
	do
			kill ${pid} 2>&1 >/dev/null
			echo "��������:${PROCESS_NAME},����:${APP_CODE},PID:${pid} �ɹ�ֹͣ"
	done
fi

