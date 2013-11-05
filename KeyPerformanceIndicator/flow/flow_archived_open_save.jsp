<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<%@ include file="../common/head.inc"%>
<html>
<head>
</head>
<body leftMargin=0 topMargin=0>
<%
	String archivedOpen = request.getParameter("archivedOpen");
	Globals.setProperty("assess.archived-open",archivedOpen);
	response.sendRedirect("flow_archived_open.jsp");
 %>
</body>
</html>
