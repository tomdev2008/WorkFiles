<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/web/pub/head.inc"%>
    <title>部门历史信息</title>
 </head>

<body onLoad="setPHeight()" onmousewheel="setScrollzheight()" class="main-body">
<form name="form" action="${ROOT}/listHistory.do" method="post" id="form">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td>
    <h2>部门历史信息</h2>
  </td></tr>
  <Tr><td class="list-caozuo">
	<%--<a id="hlinkAddNew" href="javascript:window.close();">关闭</a>
  --%></td></Tr>
</table>
 <table class="list-box" cellspacing="0" border="0">	
	<tr>
		<td align="center" class="list-title">组织名称</td>
		<td align="center" class="list-title">上级组织名称</td>
		<td align="center" class="list-title">版本起始时间</td>
		<td align="center" class="list-title">版本结束时间</td>
	</tr>
	<c:forEach var="history" items="${historyList }" varStatus="idx">
	<tr class="list-color${idx.index%2==0?'1':'2'}">
		<td class="list-text1"  align="center">${history.orgName }</td>
		<td class="list-text1" >${history.parentName }&nbsp;</td>
		<td class="list-text1" ><fmt:formatDate value="${history.effectINDATE }">
		  	<jsp:attribute name="pattern">yyyy-MM-dd</jsp:attribute>
		  </fmt:formatDate>
		</td>
		<td class="list-text1"  align="center">
			<fmt:formatDate value="${history.effectOUTDATE }">
		  	<jsp:attribute name="pattern">yyyy-MM-dd</jsp:attribute>
		  </fmt:formatDate>&nbsp;
		</td>
	</tr>
	</c:forEach>
</table>
<kpi:page-bar formId="form" />
</form>
</body>
</html>
