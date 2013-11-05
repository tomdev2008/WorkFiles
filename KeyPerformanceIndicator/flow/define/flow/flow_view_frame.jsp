<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>流程定义</title>
</head>
<frameset cols="*,25%"  frameborder="no" border="0" framespacing="0">
  <frame src="<%=basePath%>//editFlowFA.do?flowCode=${param.flowCode}&orgId=${param.orgId}&busiId=${param.busiId}" name="Entrys" scrolling="no" noresize="noresize">
  <frame src="<%=basePath%>/listFlowTree.do?flowCode=${param.flowCode}&orgId=${param.orgId}&busiId=${param.busiId}" name="tree" scrolling="yes">
</frameset>
<noframes/>
</html>
