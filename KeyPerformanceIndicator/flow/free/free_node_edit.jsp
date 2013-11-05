<%@ page contentType="text/html; charset=utf-8" language="java" import="com.shengdai.kpi.flow.valueobject.*" errorPage=""%>
<%@ include file=".//web/pub/flow.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>编辑节点</title>
		<LINK rel="stylesheet" type="text/css" href="../css/grid.css">
		<LINK rel="stylesheet" type="text/css" href="../css/kpi_style.css">
	</head>
	<script language="javascript">
function editFreeNode(){
if(checkJs()){
form1.action = "${ROOT}/editFreeNode.do";
form1.submit();
}
}

function checkJs(){
 if(document.all.nodeName.value==""){
 alert("请填写环节名称！！");
 document.all.nodeName.focus();
 return false;
 }
 if(document.all.handleWay.value==""){
 alert("请选择处理方式！！");
 document.all.handleWay.focus();
 return false;
 }
 if(document.all.nodeProcessorValue.value==""){
 alert("请您选择处理人！！");
 document.all.addHandlerButton.focus();
 return false;
 }
 return true;
}

function selectView(){
var url = "${ROOT}/selectDefaultViewPage.do?flowCode=<%=request.getAttribute("flowCode")%>";
var temps = document.all.defaultView.value;
var obj = new Object();
obj.defaultView = temps;
var returnValue = window.showModalDialog(url,obj,'dialogHeight:300px,dialogWidth:750px,status=off,scrollbars=no');
    if(returnValue!=""&&returnValue!=undefined){
    var returnTemps = returnValue.split(":");
   document.all.defaultView.value = returnTemps[1];
   document.all.defaultViewName.value = returnTemps[0];
   }
}
</script>
	<body>
		<html:base target="_self" />
		<div align="center">
			<font size="+1"><b>新增编辑节点</b></font>
		</div>
		<%FlwNode node = (FlwNode) request.getAttribute("flwNode");%>
		<form id="form1" name="form1" method="post" action="">
			<table border="1" align="center" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
				<TBODY>
					<TR>
						<TD align=left width="20%" height=35>
							环节名称:
						</TD>
						<TD width="72%" height=25>
							<INPUT type="hidden" name="nodeCode" value="<bean:write name="flwNode" property="nodeCode"/>" />
							<INPUT class=editline size=30 value="<bean:write name="flwNode" property="nodeName"/>" name="nodeName" check="notBlank" showName="环节名称" required="true">
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							环节说明:
						</TD>
						<TD height=25>
							<INPUT class=editline size=30 value="<bean:write name="flwNode" property="memo"/>" name="memo">
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							默认视图:
						</TD>
						<TD height=25>

							<INPUT class=editline size=30 value="<bean:write name="flwNode" property="defaultViewName"/>" name="defaultViewName" check="notBlank" showName="默认视图" required="true" readonly="readonly">
							<INPUT type="hidden" name="defaultView" value="<bean:write name="flwNode" property="defaultView"/>">
							<INPUT type="button" name="selectTemp" value="选择视图" onclick="javascript:selectView()" class="button">
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							处理方式:
						</TD>
						<TD height=25>
							<html:select name="nodeForm" property="handleWay">
								<option value="">
									--请选择处理方式--
								</option>
								<html:optionsCollection name="handleTypewayList" value="id" label="selectLable" />
							</html:select>
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							环节处理人:
						</TD>
						<TD height=25>
							<input type="hidden" name="nodeHandler" value="<%=node.getNodeProcessor()==null?"":node.getNodeProcessor().getId() %>" />
							<INPUT type="hidden" name="nodeProcessorValue" value="<%=node.getNodeProcessor()==null?"":node.getNodeProcessor().handlerValue() %>" />
							<INPUT id="nodeProcessorText" class=editline size=35 value="<%=node.getNodeProcessor()==null?"":node.getNodeProcessor().handlerText()%>" name="nodeProecessorText" readonly="readonly">
							<input type='button' id=addHandlerButton value='选择' class="button" onclick="javascript:showAddr('nodeProcessorText','nodeProcessorValue','0,10,20,100;n')">
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							节点权限:
						</TD>
						<TD height=25>
							<input type="checkbox">
							起草人可修改处理人 &nbsp;
							<html:checkbox name="nodeForm" property="flgModify" value="1">可修改流程</html:checkbox>
							&nbsp;
							<html:checkbox name="flwNode" property="canUpload" value="1">可上传附件</html:checkbox>
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							略过设置
						</TD>
						<TD height=25>
							<input type="checkbox" name="flgDuplicate" value="1">
							<html:checkbox name="flwNode" property="flgDuplicate" value="1">身份重复跳过</html:checkbox>
							&nbsp;
							<INPUT class=editline size=2 value="<bean:write name="flwNode" property="skipDays"/>" name="skipDays">
							天没处理则跳过
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							催办设置
						</TD>
						<TD height=25>
							<INPUT class=editline size=2 value="<bean:write name="flwNode" property="urgencyDays"/>" name="urgencyDays">
							天没处理则催办&nbsp; 催办人：
							<INPUT class=editline size=15 value="<bean:write name="flwNode" property="specialPerson"/>" name="specialPerson">
							<input type='button' name='add_attach_button' onclick='javascript:alert("选择催办人")' value='选择' class="button">
						</TD>
					</TR>
					<TR>
						<TD align=left height=35>
							传阅人
						</TD>
						<TD align=left height=35 >
							<input type="hidden" name="spreadHandler" value="<%=node.getSpreadProcessor()==null?"":node.getSpreadProcessor().getId() %>" />
							<INPUT type="hidden" name="spreadProcessorValue" value="<%=node.getSpreadProcessor()==null?"":node.getSpreadProcessor().handlerValue() %>" />
							<INPUT id="spreadProcessorText" class=editline size=35 value="<%=node.getSpreadProcessor()==null?"":node.getSpreadProcessor().handlerText()%>" name="spreadProecessorText" readonly="readonly">
							<input type='button' id='b1' value='选择' class="button" onclick="javascript:showAddr('spreadProcessorText','spreadProcessorValue','0,10,20,100;n')">
						</TD>
					</TR>
					<tr>
						<td colspan="2" align="center">
							<table width="85%" border="0" cellspacing="0">
								<tr>
									<td>
										&nbsp;
									</td>
									<td align="right">
										<input type="button" name="Submit" value="提  交" onclick="editFreeNode();">
									</td>
									<td align="left">
										<input type="submit" name="Submit2" value="关  闭" onclick="javascript:window.close();">
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
			</table>
		</form>
	</body>
</html>
