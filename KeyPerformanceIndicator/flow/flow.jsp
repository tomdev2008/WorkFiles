<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ include file="../common/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>流程管理</title>
</head>

<frameset id="frame" cols="200,*" framespacing="0" frameborder="no" border="0">
  	<frame src="${ROOT}/flow/assessGroup_tree_forFlow.jsp?flg=5" name="leftFrame" scrolling="auto" noresize >
	<frameset id="rframe" cols="10,*" framespacing="0" frameborder="no" border="0">
  		<frame src="${ROOT}/common/mid.html" name="midFrame" scrolling="no" noresize >
		<frame src="${ROOT}/listFlowByAssessGroup.do?id=1" name="rightFrame" scrolling="auto">
</frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>