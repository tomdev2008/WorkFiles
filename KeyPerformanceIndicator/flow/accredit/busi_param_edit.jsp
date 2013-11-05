<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../common/head.inc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="javascript">
//新增，编辑业务参数弹出窗口
function editBusiPara(){
if(checkJs()){
	document.all.form1.submit();
	window.returnValue = "success";
	}
}

function checkJs(){
var obj = document.all.paraType.value;
var paramObj = document.all.listValues;
if(obj=="select"||obj=="check"||obj=="radion"){
if(paramObj.value==""){
alert("请输入代选参数！！");
document.all.listValues.focus();
return false;
}
try{
var strs = paramObj.value.split(";");
for(var i=0;i<strs.length;i++){
var chstr = strs[i].split(",");
if(chstr.length!=3){
alert("请输入正确格式的代选参数！！");
document.all.listValues.focus();
return false;
}
}
}catch(e){
alert("请输入正确格式的代选参数！！");
document.all.listValues.focus();
return false;
}
}
return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>业务参数配置</title>
<LINK rel="stylesheet" type="text/css" href="css/kpi_style.css">
</head>
<html:base target="_self"/>
<body text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=0>
<div align="center"><font size="+1"><b>业务参数配置</b></font></div>
<FORM action="${ROOT}/editBusiParam.do?id=<%=request.getParameter("busiParamId")%>" name="form1"  method="post">
<INPUT type="hidden" name="flowNode" value="<bean:write name="busiParam" property="flowNode"/>"/>
<table id=tabPro width="450" align="center">
  <tr>
    <td width="20%" nowrap="nowrap">业务参数名</td>
	<td width="80%"><INPUT class=editline size=30 value="<bean:write name="busiParam" property="paraName"/>" name="paraName"></td></tr>
  <tr>
    <td nowrap="nowrap">业务参数显示名</td>
	<td ><INPUT class=editline size=30 value="<bean:write name="busiParam" property="paraDisName"/>" name="paraDisName"></td></tr>
	<tr>
    <td nowrap="nowrap">业务参数值</td>
	<td ><INPUT class=editline size=30 value="<bean:write name="busiParam" property="paraValue"/>" name="paraValue"></td></tr>
  <tr>
    <td nowrap="nowrap">参数类型</td>
	<td >
	<html:select name="busiParam" property="paraType">
	<html:option value="hidden">隐藏</html:option>
	<html:option value="text">文本</html:option>
	<html:option value="select">下来列表</html:option>
	<html:option value="check">多选</html:option>
	<html:option value="radion">单选</html:option>
	</html:select>
	</td></tr>
  <tr>
    <td nowrap="nowrap">待选参数</td>
	<td ><INPUT class=editline size=45 value="<bean:write name="busiParam" property="listValues"/>" name="listValues"></td></tr>
  <tr>
    <td colspan="2"><font color="red">待选参数格式为:参数1的名字，参数1的值，是否默认值；参数2...,参数格式仅对下来列表，多选，单选有效</font></td></tr>
  <tr>
    <td nowrap="nowrap">业务参数说明</td>
	<td ><textarea cols="45" rows="3" name="remark"><bean:write name="busiParam" property="remark"/></textarea> </td></tr>
</table>
<div align="center"><br><input type='button' value='确定' class="kpi_button" onClick="javascript:editBusiPara();" >&nbsp;
						<input type='button' value='取消' class="kpi_button" onclick="javascript:window.close();return;"></div>	  
</FORM>	  
</body>
</html>
