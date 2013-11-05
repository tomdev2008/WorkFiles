<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.util.StringUtils"/><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@include file="/web/pub/head.inc" %>
		<title>tip演示页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="${ROOT}/js/query.js"></script>
		<script>
			function query_out(){
			    var name=document.getElementById("name").value;
			    var code=document.getElementById("code").value;
			    var value=document.getElementById("value").value;
			    
				var q1 = new Query("www.163.com");
				q1.addCondition({"name":name,"code":code,"value":value});
				return q1;
			}
			
			function query_in(query){
				document.getElementById("name").value = query.conditions[0].name;
			    document.getElementById("code").value = query.conditions[0].code;
			    document.getElementById("value").value = query.conditions[0].value;
			}
		</script>
	</head>
	<body>
	<form name="form1" action="">
		<input type="text" id="name" name="name" size="40" value="张三，李四" /><br/>
		<input type="text" id="code" name="code" size="40" value="org_id" /><br/>
		<input type="text" id="value" name="value" size="40" value="id001,d002"/>
	</form>

	</body>
</html>
