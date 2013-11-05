<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" /> 
<title>登陆日志管理</title>
<script src="${ROOT}/js/kpiCalendar.js"></script>
<script type="text/javascript">
<!--
	
	function ev_change(){
		var form = document.getElementById("form");
		form.action = "${ROOT}/listLogonLog.do";
		form.submit();
	}
	
	
	/**
	*打开查询表单
	*/
	function ev_openForm(param){
		setPHeight();
		var queryForm = document.getElementById("queryForm");
		if(param == "close")
			queryForm.style.display = "";
		if(queryForm.style.display == "")
			queryForm.style.display = "none";
		else
			queryForm.style.display = "";
	}
	
	function ev_submit(){
		var form = document.getElementById("form");
		form.action = "${ROOT}/queryLogonLog.do";
		form.submit();
	}
	
	function ev_refresh(){
		var form = document.getElementById("form");
		form.action = "${ROOT}/refreshLogonLogBuffer.do";
		form.submit();
	}
	
//-->
</script>
</head>
<body onmousewheel="setScrollzheight()" class="LN_body">
<form name="form" method="post">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
    <td><h2>登陆日志管理</h2></td>
  </tr>	
  <tr>
	<td class="list-caozuo">
	<a id="hlinkAddNew" href="javascript:ev_refresh();">刷新</a>|
	<a id="hlinkAddNew" href="javascript:ev_openForm('open');">查询</a>
  	</td>
  </tr>
</table>

<div align="left">
       <select name="type" onChange="ev_change()">
       		<option value="0" ${type=='0'?'selected':'' }>在线用户</option>
       		<option value="1" ${type=='1'?'selected':'' }>历史信息</option>
       </select>
        <font color="#CC3300">${onlineCount }</font>
</div> 


<div id="queryForm" style="display:none;">
	<table class="listquery" border="0" cellpadding="0" cellspacing="1">
	<tr>
		<td width="30%" class="t">登陆时间段</td>
		<td> <input type="text" name="fromDate" value="${fromDate }" readonly="readonly" onfocus="calendar()" />
		<a href="#" onclick="calendar(form.fromDate,false);" class="choose">选择</a>
		&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
		<input type="text" name="toDate" readonly="readonly" value="${toDate }" onfocus="calendar()"/>
		<a href="#" onclick="calendar(form.endDate,false);" class="choose">选择</a>
		</td>
	</tr>
	<tr>
		<td width="30%" class="t">IP地址段</td>
		<td> <input type="text" name="fromIp" value="${fromIp }"/>
		&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
		<input type="text" name="toIp" value="${toIp }"/></td>
	</tr>
	<tr>
		<td width="30%" class="t">登陆人</td>
		<td><textarea rows="2" cols="50" name="userText" readonly="readonly" value="${userText }"></textarea>
			<a href="#" onclick="getAddressList('20','n','1','userText','userInfo');" class="choose">选择</a>
			<input type="hidden" name="userInfo" value="${userInfo }" />
		</td>
	</tr>
</table>
<div align="center">
	<input type="submit" class="button2" value="确定" onclick="return ev_submit();" />
    <input name="btn1" type="button" class="button2" value="关 闭" onClick="ev_openForm('close')"/>
</div>
</div>

<table class="list-box" cellspacing="0" rules="all"  border="0" width="95%" >
	<tr align="left">
		<th align="center" width="10%" class="list-title">序号</th>
        <th align="center" width="10%" class="list-title">登陆帐号</th>
        <th align="center" width="15%" class="list-title">用户名</th>
        <th align="center" width="15%" class="list-title">登陆IP地址</th>
        <th align="center" width="25%" class="list-title">登陆时间</th>
        <c:choose>
        	<c:when test="${type=='1' }"><th align="center" width="25%" class="list-title">离开时间</th></c:when>
        	<c:when test="${type=='0' }"><th align="center" width="25%" class="list-title">在线时间</th></c:when>
        </c:choose>
        
	</tr>
	<c:forEach var="logonLog" items="${logonLogList }" varStatus="idx">
	<tr class="list-color${idx.index%2==0?'1':'2' }">
		<td align="center" class="list-text1">${idx.count }</td>
		<td align="center" class="list-text1">${logonLog.logonId}</td>
		<td align="center" class="list-text1">${logonLog.userName }</td>
		<td align="center" class="list-text1">${logonLog.ip }</td>
		<td align="center" class="list-text1">
			<fmt:formatDate value="${logonLog.logonDate }">
		  		<jsp:attribute name="pattern">yyyy-MM-dd HH:mm</jsp:attribute>
		  	</fmt:formatDate>
		</td>
		
		<c:choose>
        	<c:when test="${type=='1' }">
	        	<td align="center">
					<fmt:formatDate value="${logonLog.logoutDate }">
				  		<jsp:attribute name="pattern">yyyy-MM-dd HH:mm</jsp:attribute>
				  	</fmt:formatDate>
				</td>
			</c:when>
        	<c:when test="${type=='0' }"><td align="center">${logonLog.onlineTime }</td></c:when>
        </c:choose>
		
		
	</tr>
	</c:forEach>
</table>
  <kpi:page-bar formId="form" />
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>