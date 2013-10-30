<%@taglib prefix ="s" uri ="/struts-tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ce" uri="/WEB-INF/ce-tag.tld" %>
<head>
<%
	String realPath = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"; 
	String ctx = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	String path = request.getContextPath();
	session.setAttribute("realPath",realPath);
	session.setAttribute("ctx",ctx);
	session.setAttribute("ctxPath", path);
%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%= realPath%>common/css/jquery.msgbox.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript"  src="<%= realPath%>common/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=realPath %>common/js/msgbox/jquery.dragndrop.js"></script>
	<script type="text/javascript" src="<%=realPath %>common/js/msgbox/jquery.dragndrop.min.js"></script>
	<script type="text/javascript" src="<%=realPath %>common/js/msgbox/jquery.msgbox.js"></script>
	<script type="text/javascript" src="<%=realPath %>common/js/msgbox/jquery.msgbox.min.js"></script>
	<script type="text/javascript">
		var ctx = '${realPath}';
		var ctxPath ='${ctxPath}';
	</script>
</head>