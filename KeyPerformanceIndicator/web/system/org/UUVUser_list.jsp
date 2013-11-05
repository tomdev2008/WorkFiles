<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="/web/pub/head.inc"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>UUV用户同步列表</title>
	<script type="text/javascript">
	<!--
		
		function ev_sync(operateCode,orgID,logID){
			var effectDate 
			effectDate = window.showModalDialog("${ROOT}/getRemarkInfo.do?operateCode="+operateCode+"&logID="+logID,
									"","dialogHeight:450px;dialogWidth:750px;status:no; help:no; scroll:no");
			
			
			if(effectDate == undefined){
				alert("请选择同步生效时间");
				return;
			}
			
			if(confirm("确定要同步选择的数据吗？")){
				form.action = "${ROOT}/doSync.do?logID="+logID+"&orgID="+orgID+
								"&effectDate="+effectDate+"&operateCode="+operateCode;
				form.submit();
			}
		}
		
	//-->
	</script>
 </head>
 
<body onmousewheel="setScrollzheight()" class="main-body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>UUV用户同步列表</h2></td></tr>
  <tr>
	<td class="list-caozuo">
		<%--<a href="javascript:ev_batchSync();">批量同步</a>
	--%></td>
   </tr>
 </table>
 

<form method="post" name="form" id="form">
<div align="left">
	[<font color="#CC3300">${org.fullName }</font>]下的用户同步列表
</div>
<input type="hidden" name="orgID" value="${org.id }" />
<table class="list-box" cellspacing="0" rules="all" border="0">
	<tr align="left">
		<td width="40" class="list-title" >
			<%--<input id="selectAll"  type="checkbox"  onclick="javascript:checkAll(this.id,'id');" 
			class="checkboxInput" />
        --%>序号</td>
        <th align="center" width="*" class="list-title">用户名</th>
        <th align="center" width="25%" class="list-title">登陆帐号</th>
        <th align="center" width="35%" class="list-title">同步时间</th>
        <th align="center" width="15%" class="list-title">操作</th>
   </tr>
<c:forEach var="uuvUser" items="${uuvUserList }" varStatus="idx">
	<tr class="list-text${idx.index%2==0?'1':'2' }">
		<td >
			<%--<input id="id" name="" onclick="" type="checkbox" value='${uuvUser.syncInfo }'/>
		--%>${idx.count }</td>
		<td >
			${uuvUser.chsName }	
		</td>
		<td>
			${uuvUser.accountName }
		</td>
		<td align="center">
			<fmt:formatDate value="${uuvUser.syncDate }">
		  	<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
		  </fmt:formatDate>
		</td>
		<td align="center">
			<a href="javascript:ev_sync('${uuvUser.operatorCode }','${org.id }','${uuvUser.logId }');">${uuvUser.displayAction }</a>
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
	window.onload=function(){setPHeight();}
//-->
</script>
<kpi:UIResponse/>