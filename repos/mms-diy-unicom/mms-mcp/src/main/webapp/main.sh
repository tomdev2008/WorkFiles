#!/bin/sh
export LANG=zh_CN.GBK
./status.sh
if [ $? -eq 0 ]
then
   JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre
     lib=.:./WEB-INF/classes/:./WEB-INF/lib/commons-logging-1.1.1.jar:./WEB-INF/lib/jetty-ajp-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-annotations-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-continuation-8.1.7.v20120910.jar:./WEB-INF/lib/jetty-http-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-io-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-jndi-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-plus-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-security-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-server-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-servlet-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-util-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-webapp-8.0.1.v20110908.jar:./WEB-INF/lib/jetty-xml-8.0.1.v20110908.jar:./WEB-INF/lib/log4j-1.2.17.jar:./WEB-INF/lib/servlet-api-3.0.20100224.jar 
	nohup $JAVA_HOME/bin/java -cp $lib com.unicom.mms.mcp.Start > stdout.log &
  sleep 1
  ./status.sh
else
        echo "mcp application is already running."
        echo " "
fi
