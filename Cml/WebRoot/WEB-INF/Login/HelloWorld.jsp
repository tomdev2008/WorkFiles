<%@ page contentType="text/html; charset=GBK"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:property value="username" />
<s:form action="userlist.action" method="post">
	<tr>
		<td colspan="3" align="center" class="tName">
		<s:property value="msg"/>
		<p>
		<input type="submit" class="tbtn" value="²é¿´ËùÓÐÓÃ»§" /></td>
	</tr>
</s:form>
</body>
</html>
