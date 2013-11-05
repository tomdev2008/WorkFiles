<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.system.org.dao.IUserHistoryDao"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工冻结历史</title>
    <%
    	String userID = request.getParameter("userID");
    	IUserHistoryDao userHistoryDao = (IUserHistoryDao)SpringHelper.getBean("userHistoryDao");
    	pageContext.setAttribute("historyList",userHistoryDao.listHistoryByID(userID));
     %>
 </head>

<body onLoad="setPHeight()" onmousewheel="setScrollzheight()" class="main-body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td>
    <h2>员工冻结历史</h2>
  </td></tr>
  <Tr><td class="list-caozuo">
	<%--<a id="hlinkAddNew" href="javascript:window.close();">关闭</a>
  --%></td></Tr>
</table>
<table width="100%" class="list-box"  border="0" cellpadding="0" cellspacing="1">
	<tr>
		<td align="center" class="list-title" width="10%">操作类型</td>
		<td align="center" class="list-title" width="10%">操作人</td>
		<td align="center" class="list-title" width="20%">操作时间</td>
		<td align="center" class="list-title" width="*">说明</td>
	</tr>
	<c:forEach var="history" items="${historyList }" varStatus="idx">
	<tr class="list-text1">
		<td>
			<c:if test="${history.flag==1 }">恢复</c:if>
			<c:if test="${history.flag==0 }">冻结</c:if>
		</td>
		<td>${history.modifyName }</td>
		<td><fmt:formatDate value="${history.modifyDate }">
		  	<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
		  </fmt:formatDate>
		</td>
		<td>
			${history.remark }
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
