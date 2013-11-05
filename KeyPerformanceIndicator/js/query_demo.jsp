<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.util.StringUtils"/><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@include file="/web/pub/head.inc" %>
		<title>tip演示页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="${ROOT}/js/query.js"></script>
		<script>
			function qo(){
				var query = report.query_out();
				document.getElementById("name").value = query.conditions[0].name;
			    document.getElementById("code").value = query.conditions[0].code;
			    document.getElementById("value").value = query.conditions[0].value;
			}
			function qi(){
				var name=document.getElementById("name").value;
			    var code=document.getElementById("code").value;
			    var value=document.getElementById("value").value;
			    
				var q1 = new Query("www.163.com");
				q1.addCondition({"name":name,"code":code,"value":value});
				report.query_in(q1);
			}
		</script>
	</head>
	<body>
	<form name="form1" action="">
		<input type="text" id="name" name="name" size="40" value="" /><br/>
		<input type="text" id="code" name="code" size="40" value="" /><br/>
		<input type="text" id="value" name="value" size="40" value=""/><br/>
		<input type="button" value="提取条件" onclick="qo();" />
		<input type="button" value="设置条件" onclick="qi();" />
	</form><br/>
	<iframe name="report" src="query_demo_sub.jsp" width="100%" height="100px"></iframe>
	</body>
</html>
