<%@ page contentType="text/html;charset=utf-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<title>传阅信息查询</title>
</head>
<script src="../../component/calendar/CompareAbleCalendar.js"></script>
<script src="../../component/calendar/Calendar.js"></script>
<script language="javascript">
function ev_query(){
	document.form1.submit();
	window.close();
}

</script>

<body >
<div align="center" class="title">查询条件设定</div>
<form name="form1" method="post" target="_parent" action="${ROOT}/querySpread.do">
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
	bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
	<tr>
		<td align="center" width=30% >状态</td>
		<td align="center">
			<input type=checkbox name=status value="<%=WorklistItem.STATUS_UNREAD%>">未阅&nbsp;&nbsp;&nbsp;
			<input type=checkbox name=status value="<%=WorklistItem.STATUS_HASREAD%>">已阅
		</td>
	</tr>
	<tr>
		<td align="center">到达时间</td>
		<td align="center">
			<input id=beginDate type=text class=editline size=12 name=beginDate value="" onclick="calendar(this);" readonly >&nbsp;至&nbsp;
			<input id=endDate type=text class=editline size=12 name=endDate value="" onclick="calendar(this);" readonly >
		</td>
	</tr>		
</table><br>
<div align="center">
<input type="button" class="button" value="确定" onClick="ev_query()">&nbsp; &nbsp; 
<input type="button" class="button" value="取消" onClick="window.close();"> </div>
</form>

</body>

</html>
