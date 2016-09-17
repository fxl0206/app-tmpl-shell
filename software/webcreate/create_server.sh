#!/bin/sh

# 目的:创建web应用

# 警告:请不要随意修改
# 作者:廖雪峰
# 邮件:yangliaoxf@ainfo.com
# 创建时间:2016-09-14
# 脚本目的:启动独立java进程
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]
export CONTEXT_PATH=$2
export APP_PATH=$HOME/apps/$CONTEXT_PATH
#init dir
mkdir -p $APP_PATH/sbin
mkdir -p $APP_PATH/conf
mkdir -p $APP_PATH/html

echo hello > $APP_PATH/html/index.html
cp -R template-conf7/* $APP_PATH/conf
cp -R template-sbin/*  $APP_PATH/sbin
PORT=`expr 8009 + $1`
sed -i "s/{connectorPort}/$PORT/g" $APP_PATH/conf/server.xml
PORT=`expr 6060 + $1`
sed -i "s/{webPort}/$PORT/g" $APP_PATH/conf/server.xml
PORT=`expr 8005 + $1`
sed -i "s/{shutPort}/$PORT/g" $APP_PATH/conf/server.xml

sed -i "s/{contextPath}/$2/g" $APP_PATH/conf/server.xml
sed -i "s/{contextPath}/$2/g" $APP_PATH/sbin/start_web_console.sh
sed -i "s/{webPort}/$PORT/g" $APP_PATH/sbin/stop_web_console.sh


if [[ `uname` =~ CYGWIN ]];then
	appPath=`cygpath -p $APP_PATH -a -w`
	appPath=${appPath//\\/\\/}
else
	appPath=${APP_PATH//\//\\/}
fi
sed -i "s/{appPath}/$appPath/g" $APP_PATH/conf/server.xml
