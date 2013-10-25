proStatus=`ps -ef|grep java|grep com.unicom.mms.mcp.Start|grep -v grep`
echo " "
echo "Process           Status          ID"
echo "======================================"
if [ -n "$proStatus" ]
then
        proID=`echo $proStatus|awk '{print $2}'`
        echo " mcp application      Up              $proID"
        echo " "
        exit 1
else
        echo " mcp  application      Down            null"
        echo " "
        exit 0
fi
