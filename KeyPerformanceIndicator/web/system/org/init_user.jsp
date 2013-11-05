
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工列表</title>
  </head>

<body>
<form name="upLoadForm" id="upLoadForm" method="post" enctype="multipart/form-data" action="${ROOT}/initUser.do">
<div  >
 	<table class="listquery" border="0" cellpadding="0" cellspacing="1">
 		<tr>
 			<td width="30%" class="t">用户导入</td>
 			<td >
 				<input type="file" name="excelFile" id="excelFile" style="height:21px;"/>
 				<input type="submit" value="导入" class="button2"
							onclick="if(this.form.excelFile.value==''){alert('请先选择上传文件！');return false;}" />
 			</td>
 		</tr>
 	</table>
 </div>
</form>
</body>
</html>