<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	辽宁电信KPI考核系统
</title>
<%@ include file="/web/pub/head.inc"%>
<%
	session.setAttribute(Globals.COPY_DATA_IDS,null);
%>
</head>
<body >
	<div class="kpi">
		<div id="divTree" class="sidebar">
			<h3>指标类型</h3>
			<iframe id="ftree"  src="${ROOT}/initIndicatorTypeTree.do?jsMethod=openRight_indi" scrolling="auto" frameborder="0" name="ftree" width="100%" height="100%"></iframe>
		</div>
		<div id="divList" class="content2">
			<iframe src="${ROOT}/listIndicator.do" id="fbody" scrolling="no" frameborder="0" name="fbody" width="100%" height="100%" onload="autoResize(this)" ></iframe>
		</div>
		<div id="divForm" class="content3">
			<iframe src="notBlank" id="fbody" scrolling="no" frameborder="0" name="fform" width="0" height="100%" ></iframe>
		</div>
	</div>
</body>
</html>
