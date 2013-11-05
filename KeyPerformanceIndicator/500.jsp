<%@ page contentType="text/html; charset=UTF-8" language="java" isErrorPage="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息提示</title>
<link rel="stylesheet" href="css/kpi.css" type="text/css" />
<script>
function closeWin()
{
  window.close();
}
function showMsg(){
	var msg=document.getElementById("msg");
	if(msg!=null){
		if(msg.style.display=="")
			msg.style.display="none";
		else
			msg.style.display="";
	}
}
</script>
</head>

<body ondblclick="alert('<%=exception.toString()%>')">
	<div class="error-img">
	   <div class="error-text">
		<a href="javascript:showMsg()" target="_self">详细错误信息</a>&nbsp;&nbsp;&nbsp;
		<%--<a href="javascript:closeWin()">关闭</a>
		--%><div id="msg" style="display:;height:75px;width:300px;overflow:auto;" ><%=exception.getMessage()%></div>
	   
	   </div>
	   <div class="error-button">
		 <input name="closeWindown" type="submit" class="button2" value="关 闭"  onclick="closeWin();"/>&nbsp;&nbsp;&nbsp;
		 <input name="backWindown" type="submit" class="button2" value="返 回"  onclick="javascript:window.history.back()"/>
		</div>		 
    </div>
</body>
</html>
