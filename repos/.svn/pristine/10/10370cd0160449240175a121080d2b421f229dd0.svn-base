./status.sh
if [ $? -eq 0 ]
then
       echo "e-track-task gateway is NOT running."
        echo " "
else
        proID=`ps -ef|grep java|grep e-track-task|grep -v grep|awk '{print $2}'`
        echo "e-track-task callLog gateway..."
        kill -9 $proID
        sleep 1
        ./status.sh
fi
