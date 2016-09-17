#!/bin/sh

# 目的:启动 tomcat test 应用

# 警告:请不要随意修改
# 作者:廖雪峰
# 邮件:yangliaoxf@ainfo.com
# 创建时间:2016-09-14
# 脚本目的:启动独立java进程
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]

. "$HOME/sbin/setEnv.sh"

APP_NAME=test

export CATALINA_BASE=~/apps/${APP_NAME}

export TOMCAT_HOME=~/software/apache-tomcat-7.0.70

export PATH=${JAVA_HOME}/bin:$PATH

export CATALINA_TMPDIR=/var/tmp

echo "use APP_HOME:${APP_HOME}"
echo "use CATALINA_BASE:${CATALINA_BASE}"
echo "use TOMCAT_HOME:${TOMCAT_HOME}"
echo "use CATALINA_TMPDIR:${CATALINA_TMPDIR}"

if [[ `uname` =~ CYGWIN ]]; then
	$TOMCAT_HOME/bin/catalina.sh run 2>&1 | ${APP_HOME}/sbin/cronolog.exe ${APP_HOME}/apps/${APP_NAME}/logs/web-${APP_NAME}-srv.%Y-%m-%d.log >>/dev/null &
else
	$TOMCAT_HOME/bin/catalina.sh run 2>&1 | ${APP_HOME}/sbin/cronolog ${APP_HOME}/apps/${APP_NAME}/logs/web-${APP_NAME}-srv.%Y-%m-%d.log >>/dev/null &
fi
