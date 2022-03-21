#!/bin/bash

app=项目的jar包.jar
prop=application.properties
args='-Xms2g -Xmx2g'
active='--spring.profiles.active='

cmd=
env=$2

pid=`ps -ef|grep java|grep $app|awk '{print $2}'`
logpath=启动日志.log
###输入启动环境dev, test,pro 这个也可以不用配置
checkEnv(){
	if [ ! $env == "dev" ] || [ ! $env == "pro" ] || [ ! $env == "test" ];then
		echo "......"
	else
		echo "Please input the environment ' dev | pro | test' you want to run!"
		echo "Example : #sh start.sh start dev"
		exit 0
	fi
}
###启动服务
startup(){
	echo "******************************************************"
	echo "**  $app is starting......                          **"
	echo "**  JVM args is [ $args ] !                         **"
	echo "**  Springboot Environment is [ $env ] !            **"
	echo "**  LogFile is located in [ $logpath ] !            **"
	echo "******************************************************"
	nohup /usr/java/jdk1.8.0_45/bin/java -jar -Xms2g -Xmx2g  $args $app $prop $active$env > nohup.out 2>&1 &
	tail -f $logpath
}

echo "=============$cmd=============="
if [ ! $cmd ];then
	echo "Please input args 'start | restart | stop'!"
	echo "Example : #sh start.sh start dev"
	exit

if [ $cmd == "start" ];then
	checkEnv
	if [ ! $pid ];then
		startup
	else
		echo "start failed!!!"
		echo "$app is running! pid = $pid"
	fi
fi
if [ $cmd == "restart" ];then
	checkEnv
	if [ $pid ];then
		echo "$pid will be killed after 3 seconds!!!"
		sleep 3
		kill -9 $pid
	fi
	startup
fi
if [ $cmd == "stop" ];then
	if [ $pid ];then
		echo "$pid will be killed after 3 seconds!!!"
		sleep 3
		kill -9 $pid
	fi
	echo "$pid is stopped!!!"
fi
