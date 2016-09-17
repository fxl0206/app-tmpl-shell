
#cygwin��linux��Ҫ�ֿ�����

#��ͬӦ�ô˴��޸�
APP_NAME="aifordtest"

if [[ `uname` =~ CYGWIN ]];then
	APP_HOME=`cygpath -dm "$HOME/apps/${APP_NAME}"`
else
	APP_HOME=$HOME/apps/${APP_NAME}
fi

. "${HOME}/sbin/setEnv.sh"

#��ͬӦ�ô˴��޸�
PROCESS_NAME="com.ai.aif.csf.run.RemoteServerStarter"
APP_CODE="crm_ord_channel"



COMMON_LOG_ARGS="${APP_HOME}/logs/${APP_NAME}-server-%Y%m%d.log"

echo "use APP_HOME:${APP_HOME}"
echo "use JAVA_HOME:${JAVA_HOME}"
echo "use CLASSPATH:$CLASSPATH"
echo "use PROCESS_NAME:${PROCESS_NAME}"


#����������
if [[ `uname` =~ CYGWIN ]];then
	"${JAVA_HOME}/bin/java" ${MEM_ARGS} -Dappframe.server.name=${APP_CODE} ${JAVA_OPTIONS} ${PROCESS_NAME} 2>&1 | $HOME/sbin/cronolog.exe ${COMMON_LOG_ARGS} &
else
	${JAVA_HOME}/bin/java ${MEM_ARGS} -Dappframe.server.name=${APP_CODE} ${JAVA_OPTIONS} ${PROCESS_NAME} 2>&1 | $HOME/sbin/cronolog -k 5 ${COMMON_LOG_ARGS} &
fi

echo "�������,��鿴��־"