<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>流程列表</title>
	</head>
<script type="text/javascript">
function selectFlow(){
	var allcheck=document.getElementsByName("flowCheck");
	var selectedV="";
	for(i=0;i<allcheck.length;i++){
		if(allcheck[i].checked){
			if(selectedV==""){
				selectedV=allcheck[i].value;
			}else {
				selectedV = selectedV+";"+allcheck[i].value;
			}
		}
	}
	window.returnValue = selectedV;
	window.close();
}
</script>
<html:base target="_self"/>
	<body class="list_body">
	<br><div align="center"><font size="+1">流程列表</font></div><br>
		<form id="form1" name="form1" method="post" action="">
			<table width="90%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
				<logic:notEmpty name="flowList">
				<logic:iterate id="flow" name="flowList" indexId="index">
					<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
						<td width="100%" align="left" height="22">
							<input type="radio" name="flowCheck" id="radio_${index }" value="<bean:write name="flow" property="flowCode"/>,<bean:write name="flow" property="flowName"/>" />
							&nbsp;<a title="<bean:write name="flow" property="memo" />"><label for="radio_${index }"><bean:write name="flow" property="flowName" /></label></a></td>
					</tr>
				</logic:iterate>
				</logic:notEmpty>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="Submit" value="确定" onclick="selectFlow()" class="button"/>
						<input type="button" name="Submit2" value="关闭" onclick="window.close();" class="button"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
