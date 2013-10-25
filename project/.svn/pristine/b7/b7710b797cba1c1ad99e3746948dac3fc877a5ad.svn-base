#!/bin/sh
proStatus=`ps -ef|grep java|grep e-track-task|grep -v grep`
echo " "
echo "Process           Status  ID"
echo "======================================"
if [ -n "$proStatus" ]
then
        proID=`echo $proStatus|awk '{print $2}'`
        echo "e-track-task   Up      $proID"
        echo " "
        exit 1
else
        echo "e-track-task   Down    null"
        echo " "
        exit 0
fi
