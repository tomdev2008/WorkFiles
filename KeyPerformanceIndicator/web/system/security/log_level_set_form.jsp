<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  	<title>日志级别</title>
  	<script type="text/javascript">
  	<!--
  		function ev_save(){
  			var form = document.getElementById("form");
  			form.submit();
  		}
  		
  	//-->
  	</script>
  </head>
  
  
<body  onmousewheel="setScrollzheight()" class="main-body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>日志级别启用设定</h2></td></tr>
  <Tr><td class="list-caozuo">
    <a id="hlinkAddNew" href="javascript:ev_save();">保存</a>
  </td></Tr>
</table>

<form name="form" action="${ROOT}/updateLogLevels.do" method="post">
<input type="hidden" name="id" value="${role.id }"/>  
<input type="hidden" name="parentid" value="${role.parent.id }" />


<table width="80%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
<c:forEach var="level" items="${levelList }" varStatus="idx">
  <tr> 
  	<td  width="30%" class="t">${level.levelName }</td>
	<td width="70%">
		<input type="radio" name="level_${level.id }" value="1" ${level.flgLog==1?'checked' :''} />启用&nbsp;&nbsp;
		<input type="radio" name="level_${level.id }" value="0" ${level.flgLog==0?'checked' :''} />暂停
	</td>	
  </tr>
</c:forEach>
</table>
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>
