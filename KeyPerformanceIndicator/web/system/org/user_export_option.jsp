<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript">
	<!--
	function ev_returnValue(){
			var rad = document.getElementsByName("exportType");
			for(i=0;i<rad.length;i++){
				if(rad[i].checked){
					window.returnValue = rad[i].value;
					window.close();
				}
			}
		}
	//-->
    </script>
    <title>导出选项</title>
  </head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
 <tr><td><h2>导出选项</h2></td></tr>
 <tr>
 	<td class="list-caozuo">
 	</td>
 </tr>
</table>

<table class="listquery" border="0" cellpadding="0" cellspacing="1">
<tr align="center">
<td align="center">
	<div align="center">
	<input type="radio" name="exportType"  value="0" checked />递归导出组织下所有员工&nbsp;&nbsp;
	<input type="radio" name="exportType"  value="1" />导出组织下直属员工&nbsp;&nbsp;
	</div>
</td>
</tr>
<tr align="center">
<td align="center">
	<div align="center">
		<input name="btnQuery" type="submit" value="确定" class="button2" onclick="ev_returnValue()"/>
	</div>
</td>
</tr>
</table>


</body>
</html>