<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:form action="login" method="post">
	<s:textfield name="name" label="name"></s:textfield>
	<s:password name="password" label="password"></s:password>
	<tr>
		<td colspan="3" align="center" class="tName">
		<input type="submit" class="tbtn" value="µÇ&nbsp;Â¼" /> &nbsp;&nbsp; 
		<input type="reset"	class="tbtn" value="ÖØ&nbsp;ÖÃ" />
		</td>
	</tr>
</s:form>
</body>
</html>
