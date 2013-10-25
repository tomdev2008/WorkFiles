#!/bin/sh
./status.sh
if [ $? -eq 0 ]
then
        echo "mcp application is NOT running."
        echo " "
else
        proID=`ps -ef|grep com.unicom.mms.mcp.Start|grep -v grep|awk '{print $2}'`
        echo "Stopping mcp application..."
        kill -9 $proID
        sleep 1
        ./status.sh
fi
