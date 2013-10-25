#!/bin/sh
if [ $? -eq 0 ]
then
       lib=../conf/:../lib/antlr-2.7.6.jar:../lib/asm-1.5.3.jar:../lib/asm-attrs-1.5.3.jar:../lib/cglib-2.1_3.jar:../lib/commons-collections-2.1.1.jar:../lib/commons-logging-1.0.4.jar:../lib/dom4j-1.6.1.jar:../lib/ehcache-1.2.3.jar:../lib/hibernate-3.2.1.ga.jar:../lib/hibernate-annotations-3.3.0.ga.jar:../lib/jta-1.1.jar:../lib/log4j-1.2.16.jar:../lib/mms-share-1.0-SNAPSHOT.jar:../lib/mms-task-1.0-SNAPSHOT.jar:../lib/mybatis-3.2.2.jar:../lib/persistence-api-1.0.jar:../lib/slf4j-api-1.6.1.jar:../lib/slf4j-nop-1.6.4.jar
        nohup java -cp $lib -Xms256m -Xmx512m com.unicom.mms.concurrent.RunTask  &
	./status.sh
else
        echo "Task is already running."
        echo " "
fi
