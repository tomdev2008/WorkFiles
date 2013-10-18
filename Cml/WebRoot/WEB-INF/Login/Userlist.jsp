<%@ page contentType="text/html; charset=GB2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 10px auto 0; width: 70%;">
<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<caption>ÏÔÊ¾ËùÓÐÓÃ»§</caption>
	<tr>
		<td>ÓÃ»§ID</td>
		<td>ÓÃ»§Ãû</td>		
		<td>ÃÜÂë</td>		
	</tr>
	<c:forEach var="user" items="${userList}">
		<tr>
			<td>${user.id}</td>
			<td>${user.name}</td>
			<td>${user.password}</td>			
		</tr>
	</c:forEach>
</table>
</div>
</body>
</html>
