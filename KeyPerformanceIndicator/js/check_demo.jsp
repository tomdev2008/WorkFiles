<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.util.StringUtils"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@include file="../web/pub/head.inc" %>
		<title>tip演示页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="${ROOT}/js/tip.js"></script>
		<script>
		function sm1(){
			
		}
		</script>
	</head>
	<body>
	<div align="left">
		<form name="form1" action="" onsubmit="return CheckForm(this)">
			用户姓名1:<input type="text" name="name1" size="40" check="isInt" required="nullable" showName="用户姓名1"/>（校验非必填，如果有值为整数）<br/>
			用户姓名2:<input type="text" name="name2" size="40" check="notBlank" required="true" showName="用户姓名2"/>（校验必填，不能包含空格）<br/>
			用户姓名3:<input type="text" name="name3" size="40" check="isString('#',10)" required="nullable" showName="用户姓名3"/>（校验非必填，如果有不能超过10个字符）<br/>
			<input type="submit" value="提交" />
		</form>
	</div>
	</body>
</html>