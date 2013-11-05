<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>指标导入</title>
	<%@ include file="/web/pub/head.inc" %>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javaScript">
	window.name = "uploadWin";
	
	function ev_submit()
	{
		if(CheckForm($_E('UploadForm'))){
			var fileName = $_EV("uploadFile");
			var ext;
			if(!StringUtils.isEmpty(fileName)) {
				var k = fileName.lastIndexOf('.');
				ext = fileName.substring(k+1,fileName.length);
			}
			if(!ext || ext!='xls') {
				alert("选择的文件类型错误，文件必须为EXCEL格式文件！");
				return false;
			}
			$_E('UploadForm').submit();
		}
	}
</script>
</head>
<body class="LN_body">
<form action="${ROOT}/readExcelAssessmentIndicator.do?id=${param.id}&flowCode=${param.flowCode}"  
method="post" target="uploadWin" enctype="multipart/form-data" name="UploadForm" onsubmit="ev_submit();return false;">
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</div>
<div class="LN_formBox">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="attachFileTable">
    <tr>
      	<td width="20%" class="LN_tableBoxText">说明</td>
      	<td width="20%" class="LN_tableBoxText">导入文件必须为EXCEL格式文件，在EXCEL表格中指标名称不可为空，如果为空则该指标项不导入，指标排序号须为整数形式，
      		否则自动视排序号为10,指标的类型以文字形式填写，若当前考核表上已存在对应名称的指标类型，则设置指标类型，如果没有则取默认值。</td>
    </tr>
      <tr>
      	<td width="20%" class="LN_tableBoxText">导入文件</td>
      	<td width="80%" class="LN_tableBoxText">
        <input type="file" name="uploadFile" id="uploadFile" class="LN_InputBorder" style="width:400px;" check="notBlank;isString('#',200)" required="true" showName="上传文件路径"/>
		</td>
      </tr>
   </table>
  </td>
  </tr>
  </table>
  </div>
  </div>
  </form>
</form>
</body>
</html>
