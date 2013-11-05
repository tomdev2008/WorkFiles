<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<link href="/css/css.css" rel="stylesheet" type="text/css" />
		<%@ include file="/web/pub/head.inc"%>
<%--		<script type="text/javascript" src="select.js"></script>--%>
	</head>

	<body style="background-color:#eff0f4" onload="initSelectedType()">
		<form action="javascript:search()" method="post" name="form1">
			
			<hr align="center" width="90%" style="margin-left:30px;margin-top:10px;height:1px;color:#666666">
			<div align="left">
				<table width="78%" height="70%" border="1" align="center"
					cellpadding="0" cellspacing="0" bordercolor="lightsteelblue">
					<tr>
						<td width="45%" valign="top">
							<iframe src="${ROOT}/uniformTree.do?jsFunc=select_type&multi=${param.multi}&type=${param.type }"  style="width:195px;height:275px" id="fbody" scrolling="no" frameborder="0" name="fbody" width="100%" height="100%"></iframe>
						</td>
					
						<td width="45%" >
							<table>
								<tr height="70%">
									<td height="20" align="center">
										已选列表
									</td>
								</tr>
								<tr height="70%">
									<td height="70%" align="center" valign="top">
										<select id="selectedObject" onDblclick="SelectUtil.removeOption(this);" name="selectedType" multiple size="16" class="select" style="width:195px;height:275px">
										</select>
									</td>
								</tr>		
							</table>							
							<button onclick="SelectUtil.removeOption(Util.$_E('selectedObject'))">删除</button>
							<button onclick="SelectUtil.removeAllOption(Util.$_E('selectedObject'))">全部删除</button>
						</td>						
					</tr>	
				</table>
			</div>
			<hr align="center" width="90%" style="margin-left:30px;margin-top:10px;height:1px;color:#666666">
			<table width="98%" border="0" align="center" cellspacing="0">
				<br>
				<tr>
					<td width="100%" align="center">
						<input type="button" name="button4" class="button4" value="提交"
							onClick="SelectUtil.save(Util.$_E('selectedObject'),'');" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="button4" class="button4" value="退出"
							onClick="DialogUtil.exit()" />
						&nbsp;
					<td>
				</tr>
				<tr>
					<td width="100%" align="center">
					<td>
				</tr>
				</table>
		</form>
	</body>
</html>