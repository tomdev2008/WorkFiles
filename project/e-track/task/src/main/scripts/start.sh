#!/bin/sh
if [ $? -eq 0 ]
then
       lib=../conf/:../lib/e-track-task-1.0-SNAPSHOT.jar:../lib/gson-2.2.2.jar:../lib/kuaidi-1.0.jar:../lib/log4j-1.2.16.jar:../lib/mybatis-3.2.2.jar:../lib/mysql-connector-java-5.1.22.jar:../lib/slf4j-api-1.6.1.jar:../lib/slf4j-nop-1.6.4.jar:../lib/jta-1.1.jar:../lib/quartz-2.1.7.jar   
        nohup java -cp $lib -Xms256m -Xmx512m com.etrack.MainService  &
	./status.sh
else
        echo "Task is already running."
        echo " "
fi
