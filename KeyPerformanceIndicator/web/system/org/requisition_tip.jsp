<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  	<title>调动人员信息</title>
  	<script>
	<!--
		/**
		*打印预览
		**/
		function printpreview(){
			wb.execwb(7,1);
		}
		
		/**
		*打印
		**/
		function printit(){
			wb.execwb(6,6);
		}
	//-->
  	</script>
  </head>
<body>
<OBJECT id=wb height=0 width=0 classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 name=wb></OBJECT>
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2></h2></td></tr>
   <tr>
      <td class="list-caozuo">
	<a id="hlinkDelete" href="#" onclick="printpreview()">打印预览</a>|
	<a id="hlinkDelete" href="#" onclick="printit()">打印</a>
  	</td>
	</tr>
</table>
	<table  width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
		<tr>
			<td colspan="4"><br></td>
		</tr>
		
		<tr>
			<td class="t" colspan="4"><div align="left"><strong>调动人员信息:</strong></div></td>
		</tr>
		<tr>
			<td width="15%"  class="t">登录名</td>
        	<td width="35%">${requisition.user.logonId }</td>
        	<td width="15%" class="t">用户名</td>
        	<td width="35%">${requisition.user.name }</td>
		</tr>
		<tr>
			<td width="15%"  class="t">MSS</td>
        	<td width="35%">${requisition.user.mss }</td>
        	<td width="15%" class="t">email</td>
        	<td width="35%">${requisition.user.email }</td>
		</tr>
		<tr>
			<td width="15%"  class="t">所在部门</td>
			<td>${requisition.user.org.fullName }</td>
			<td width="15%"  class="t">申请调入部门</td>
			<td>${requisition.moveToOrg.fullName }</td>
		</tr>
		
		<tr>
			<td colspan="4"><br></td>
		</tr>
		<tr>
			<td class="t" colspan="4"><div align="left"><strong>申请人信息:</strong></div></td>
		</tr>
		<tr>
			<td width="15%"  class="t">姓名</td>
        	<td width="35%">${requisition.proposer.name }</td>
        	<td width="15%" class="t">联系方式</td>
        	<td width="35%">${requisition.proposer.email }</td>
		</tr>
		<tr>
			<td width="15%"  class="t">意见</td>
        	<td width="35%" colspan="3">
        		<textarea  rows="4" cols="50" class=area readOnly>${requisition.remark}</textarea>
        	</td>
		</tr>
	</table>
</body>
</html>