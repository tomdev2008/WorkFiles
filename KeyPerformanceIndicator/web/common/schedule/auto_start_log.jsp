<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>自动任务日志</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="/web/pub/head.inc"%>
</head>
	<body>
      <form id="form1" name="form1" method="post" action="" onsubmit="">	
		<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  			<tr><td><h2>发起日志记录</h2></td></tr>
      	</table>
   <c:forEach var="log" items="${archiveList}" varStatus="idx">
	<table class="listquery" border="0" cellpadding="0" cellspacing="1" align="center">
       <tr>
       	<td align="center" width="15%" class="t">任务名称</td>
       	<td align="center" width="85%" colspan="3">${log.agentName}</td>
       	</tr>
       <tr>
       	<td align="center" class="t">开始时间</td>
       	<td align="center">${log.startTime }</td>
       	<td align="center" class="t">结束时间</td>
       	<td align="center" >${log.endTime}</td>
       	</tr>
       <tr>
       	<td align="center" class="t">耗时</td>
       	<td align="center">${log.spendTime }</td>
       	<td align="center" class="t">当前状态</td>
       	<td align="center">${log.statusDesc}</td>
       	</tr>
       <tr>
       	<td align="center" class="t">记录日志</td>
       	<td align="center" colspan="3">${log.log}</td>
       	</tr>
      </table>
      </c:forEach>
<c:forEach var="log" items="${unArchiveList}" varStatus="idx">
	<table class="listquery" border="0" cellpadding="0" cellspacing="1" align="center">
       <tr>
       	<td align="center" width="15%" class="t">任务名称</td>
       	<td align="center" width="85%" colspan="3">${log.agentName}</td>
       	</tr>
       <tr>
       	<td align="center" class="t">开始时间</td>
       	<td align="center">${log.startTime }</td>
       	<td align="center" class="t">结束时间</td>
       	<td align="center" >${log.endTime}</td>
       	</tr>
       <tr>
       	<td align="center" class="t">耗时</td>
       	<td align="center">${log.spendTime }</td>
       	<td align="center" class="t">当前状态</td>
       	<td align="center">${log.statusDesc}</td>
       	</tr>
       <tr>
       	<td align="center" class="t">记录日志</td>
       	<td align="center" colspan="3">${log.log}</td>
       	</tr>
      </table>
 </c:forEach>
    </form>
	</body>
</html>
