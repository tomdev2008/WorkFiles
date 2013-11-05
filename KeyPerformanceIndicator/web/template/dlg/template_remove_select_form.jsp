<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加指标</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.name = "templateRemoveWin";
	function ev_submit(){
		if(CheckForm($_E("form1"))){
			$_E("form1").submit();	
		}
	}
	

</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/removeTemplate.do" id="form1" target="templateRemoveWin">	
<input type="hidden" name="ids" value="${param.ids}"/>
<input type="hidden" name="close_window" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">添加指标</div>
<div class="LN_colorRed">红星*是必填</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
    <tr>
    	<td class="LN_tableBoxtitle">请选择要转移的目标组织</td>
    </tr>
    <tr>
    	<td class="LN_tableBoxText">
    		<input type="text" name="orgName" value="" class="LN_Input150" readOnly="true" required="true" check="notBlank;" showName="目标组织"/>
    		<input type="hidden" name="orgValue" value="" readOnly="true"/>
    		<input type="button" id="button3" name="button3" class="LN_big_button2" value="选择" onclick="getAddressList('0','1','1','orgName','orgValue');"/>
    	</td>
    </tr>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>


