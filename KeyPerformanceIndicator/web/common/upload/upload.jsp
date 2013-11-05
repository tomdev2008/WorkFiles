<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.common.attach.AttachConfig"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>附件上传</title>
	<%@ include file="/web/pub/head.inc" %>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javaScript">
	window.name = "uploadWin";
	var fileCount = 0;
	function ev_add() 
	{
		fileCount++;
		var tab = $_E("attachFileTable");
		var newRow = tab.insertRow();
		var newCell = newRow.insertCell();
			newCell.width = "12%";
			newCell.className = "LN_tableBoxtitle";
			newCell.innerHTML = "附件名:";
		newCell = newRow.insertCell();
			newCell.width = "78%";
			newCell.className = "LN_tableBoxtitle";
			newCell.innerHTML = "<input type=\"text\" name=\"name\" class=\"LN_InputBorder\" check=\"isString('#',30)\" required=\"nullable\" showName=\"附件名称\"/>"+
        						"<input type=\"file\" name=\"uploadFile("+fileCount+")\" class=\"LN_InputBorder\" check=\"notBlank;isString('#',200)\" required=\"true\" showName=\"附件名称\"/>";
		newCell = newRow.insertCell();
			newCell.width = "10%";
			newCell.className = "LN_tableBoxtitle";
			newCell.innerHTML = "<input name=\"Submit12\" type=\"button\" onclick=\"ev_delete(this)\" class=\"LN_button3\" value=\"删除\" />";
	}
	
  function ev_delete(contral) 
	{
		var trDom = contral.parentNode;
		while(trDom.nodeName != 'TR'){
			trDom = trDom.parentNode;
		}
		if(trDom) trDom.removeNode(true);
	}
	
	function ev_submit()
	{
		if(CheckForm($_E('UploadForm'))){
			$_E('UploadForm').submit();
		}
	}
	
</script>
</head>
<body class="LN_body">
<form action="${ROOT}/uploadFile.do"  method="post" enctype="multipart/form-data" name="UploadForm" target="uploadWin">
  <input type="hidden" name="close_window" id="close_window" value="1"/>	
  <input type="hidden" name="resourceId" id="resourceId" value="${param.resourceId}"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
<div class="LN_popupsAdd"><a href="#" onclick="ev_add();return false;">添加</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">附件上传</div>
<div class="LN_colorRed">当附件名称为空时，自动将名称等同于上传文件的名称.</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="attachFileTable">
      <tr>
        <td width="12%" class="LN_tableBoxtitle">附件名:</td>
        <td width="78%" class="LN_tableBoxText"><input type="text" name="name" class="LN_InputBorder" check="isString('#',30)" required="nullable" showName="附件名称"/>
        <input accept="application/msExcel" type="file" name="uploadFile(0)" id="uploadFile(0)" class="LN_InputBorder" check="notBlank;isString('#',200)" required="true" showName="上传文件路径"/>
		</td>
		<td width="10%" class="LN_tableBoxText"></td>
      </tr>
   </table>
  </td>
  </tr>
  </table>
  </div>
  </div>

</form>
</body>
</html>
