<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts/struts-logic.tld" prefix="logic" %>
<%@ include file="../common/head.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>模板列表</title>
		<link rel="stylesheet" type="text/css" href="${ROOT}/css/kpi_style.css">
	</head>
<script language="JavaScript" type="text/javascript">
var obj = window.dialogArguments;
var ids = obj.ids;
function initChecked(){
if(ids==undefined) return;
var valueArray = ids.split(";");
var allcheck=document.getElementsByName("tempCheck");
  for(i=0;i<allcheck.length;i++){
  var tempValue = allcheck[i].value;
	  for(var j=0;j<valueArray.length;j++){
	  if(valueArray[j]==tempValue.split(":")[1]){
	  allcheck[i].checked = true;
	  break;
	  }
	  }
  }
}

function selectTemplet(){
var allcheck=document.getElementsByName("tempCheck");
var selectedV="";
  for(i=0;i<allcheck.length;i++){
	  if(allcheck[i].checked==true){
	  if(selectedV==""){
	   selectedV=allcheck[i].value;
	   }
		else {
		selectedV = selectedV+";"+allcheck[i].value;
		}
		}
  }
  window.returnValue = selectedV;
  window.close();
  }
</script>
<html:base target="_self"/>
	<body onload="initChecked()" class="list_body">
	<br>
		<form id="form1" name="form1" method="post" action="">
			<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
				<tr>
					<td colspan="2" align="center">
						<strong>模板列表</strong>
					</td>
				</tr>
				<logic:iterate id="templet" name="templetList">
					<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
						<td width="94" align="right">
							<input type="radio" name="tempCheck" value="<bean:write name="templet" property="name"/>:<bean:write name="templet" property="codeValue"/>" />
						</td>
						<td width="288">
							<bean:write name="templet" property="name" />
						</td>
					</tr>
				</logic:iterate>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="Submit" value="提交" onclick="selectTemplet()" class="button"/>
						<input type="button" name="Submit2" value="关闭" onclick="window.close();" class="button"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
