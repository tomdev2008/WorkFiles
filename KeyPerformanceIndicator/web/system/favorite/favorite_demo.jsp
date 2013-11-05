<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	添加到收藏夹
</title>
<%@ include file="/web/pub/head.inc"%>



</head>
<body  class="main-body" >
	<form method="post" name="form">
	<table border="0" cellspacing="0" cellpadding="0" class="list-top">
	<tr >
	<td rowspan = "3" height="90" width="12%" align="center">要添加的<br>数 据： &nbsp;</td>
	<td rowspan = "3" height="90" width="72%">
	<textarea cols="40" rows="3" class="textarea1"  name="data" readonly= "true" >xxxx,xxx,xxx</textarea>
    </td>
    <td width="16%" height="30" align="left">&nbsp;<input type="button" class="button4" value=" 确 定 ">
    </td>
    </tr>
    <tr>
	<td align="left" height="30">
	&nbsp;<input type="button" class="button4" value=" 取 消 ">
	</td>
	</tr>
	
	<tr>
	<td align="left" height="30">
	&nbsp;<input type="button" class="button4" value="新建文件夹">
	</td>
	</tr>
	
	</table>
	<table border="0" cellspacing="0" cellpadding="0" class="list-top" height="70%">
	<tr>
	  <td height="288" width="12%" align="left" >
	    添加到：
	  </td>
	  <td height="288"  width="88%" >
	    <div id="divTree2" class="sidebar">
		<iframe id="ftree" src="${ROOT}/treePersonFolder.do?jsFunc=list_folder&listType=favorite"  scrolling="auto"  frameborder="0" name="ftree" width="100%" height="100%"></iframe>
        </div>
	  </td>
	<tr>
	</table>
	
	






</body>
</html>