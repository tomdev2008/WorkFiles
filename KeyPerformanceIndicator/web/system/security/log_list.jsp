<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>日志管理</title>
<script src="${ROOT}/js/kpiCalendar.js"></script>
<script type="text/javascript">
<!--
	/**
	*日志等级设置
	*/
	function ev_setLevel(){
		var url = "${ROOT}/listLogLevels.do"
		//window.location.href = url;
		openWindow(url,450,250);
	}
	
	function ev_setResouce(){
		var url = "${ROOT}/web/system/security/log_resource_frame.jsp"
		window.location.href = url;
	}
	
	/**
	*打开查询表单
	*/
	function ev_openForm(param){
		var queryForm = document.getElementById("queryForm");
		if(param == "close")
			queryForm.style.display = "";
		if(queryForm.style.display == "")
			queryForm.style.display = "none";
		else
			queryForm.style.display = "";
	}
	
	
	function ipCheck(sIPAddress){
		 if(String(sIPAddress).length<=0)
		 	return true;
		 var exp=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
		 var reg = sIPAddress.match(exp);
		 var ErrMsg="您输入的是一个非法的IP地址段！\nIP段为：:xxx.xxx.xxx.xxx（xxx为0-255)！"       
		 if(reg==null){
		    alert(ErrMsg);
		    return false;
		 }
		return true;
	}
	
	function ev_submit(){
		var queryForm = window.document.getElementById("form");
		
		if(ipCheck(queryForm.fromIp.value)&&ipCheck(queryForm.endIp.value)&&checkTime("fromDate","endDate")){
			queryForm.submit();
		}
		return false;
	}
		
//-->
</script>
</head>
<body onmousewheel="setScrollzheight()" class="main-body">
<form name="form" method="post" action="${ROOT}/queryLog.do">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
    <td><h2>日志管理</h2></td>
  </tr>	
  <tr>
	<td class="list-caozuo">
	<a id="hlinkAddNew" href="javascript:ev_openForm('open');">高级查询</a>|
	<a id="hlinkDelete" href="javascript:ev_setResouce();">功能日志级别设定</a>|
	<a id="hlinkDelete" href="javascript:ev_setLevel();">日志级别启用设定</a> 
  	</td>
  </tr>
</table>

<div id="queryForm" style="display:none;">
	<table class="listquery" border="0" cellpadding="0" cellspacing="1">
	<tr>
		<td width="30%" class="t">操作时间段</td>
		<td> <input type="text" name="fromDate" value="${fromDate }" readonly="readonly" onfocus="calendar()" />
		<a href="#" onclick="calendar(form.fromDate,false);" class="choose">选择</a>
		&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
		<input type="text" name="endDate" readonly="readonly" value="${endDate }" onfocus="calendar()"/>
		<a href="#" onclick="calendar(form.endDate,false);" class="choose">选择</a>
		</td>
	</tr>
	<tr>
		<td width="30%" class="t">IP地址段</td>
		<td> <input type="text" name="fromIp" value="${fromIp }"/>
		&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
		<input type="text" name="endIp" value="${endIp }"/></td>
	</tr>
	<tr>
		<td width="30%" class="t">排序</td>
		<td>
			<select name="order">
				<option value="createDate" >时间</option>
				<option value="ip">IP地址</option>
				<option value="creator">操作人</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="30%" class="t">操作人</td>
		<td><textarea rows="2" cols="50" name="creatorText" readonly="readonly" value="${creatorText }"></textarea>
			<a href="#" onclick="getAddressList('20','n','1','creatorText','creator');" class="choose">选择</a>
			<input type="hidden" name="creator" value="${creator }" />
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
		 	<kpi:page-sortTr title="动作名称" column="actName" width="20%" tdClass="list-title"/>
        	<kpi:page-sortTr title="模块" column="moduleName" width="20%" tdClass="list-title"/>
        	<kpi:page-sortTr title="登陆IP地址" column="ip_num" width="20%" tdClass="list-title"/>
        	<kpi:page-sortTr title="操作人" column="creator" width="10%" tdClass="list-title"/>
        	<kpi:page-sortTr title="时间" column="createDate" width="20%" tdClass="list-title"/>
		</tr>
		<c:forEach var="log" items="${logList }" varStatus="idx">
		<tr class="list-color${idx.index%2==0?'1':'2' }">
		  <td class="list-text1" align="center">${idx.count }</td>
		  <td class="list-text1" align="left">${log.actName } </td>
		  <td class="list-text1" align="left">${log.moduleName } </td>
		  <td class="list-text1" align="center">${log.ip }</td>
		  <td class="list-text1" align="left">${log.creatorName }</td>
		  <td class="list-text1" align="center">
		  <fmt:formatDate value="${log.createDate }">
		  	<jsp:attribute name="pattern">yyyy-MM-dd HH:mm</jsp:attribute>
		  </fmt:formatDate>
		  
		  </td>
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