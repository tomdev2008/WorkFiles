<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>专业线条</title>
	<script type="text/javascript">
	<!--
		/**
		*保存日志登记分配
		*/
		function ev_save(){
			var form = document.getElementById("form");
			form.submit();
		}
	//-->
	</script>
 </head>

<body  onmousewheel="setScrollzheight()" class="main-body">
<form name="form" method="post" action="${ROOT}/updateResourceLevel.do">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
      <td><h2>功能日志级别设定</h2></td>
    </tr>
	<tr>
		<td class="list-caozuo">
		    <a href="javascript:ev_save();">保存</a>
		</td>
	</tr>
</table>
	  <table class="list-box" cellspacing="0" rules="all"  border="0" >
		<tr align="left">
		  <th align="center" width="50px" class="list-title">序号</th>
          <th align="center" width="20%" class="list-title">动作名称</th>
          <th align="center" width="*" class="list-title">动作</th>
          <th align="center" width="15%" class="list-title">日志级别</th>
		</tr>
		<c:forEach var="resource" items="${parentResource.childResourceSet}" varStatus="idx" >
		<tr class="list-text${idx.index%2==0?'1':'2' }">
		  <td align="center">${idx.count }</td>
		  <td>${resource.name }</td>
		  <td>${resource.url }</td>
		  <td>
		  <select name="resource_${resource.id }">
		  	<c:forEach var="level" items="${levelList }">
		  	<option value="${level.id }" ${resource.logLevel.id == level.id?'selected':''  }>${level.levelName }</option>
		  	</c:forEach>
		  </select>
		  </td>
		</tr>
		</c:forEach>
	</table>
	<input type="hidden" name="parentResourceId" value="${parentResource.id }" />
  <kpi:page-bar formId="form" />	
</form>
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>