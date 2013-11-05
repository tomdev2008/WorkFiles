<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@ include file=".//web/pub/flow.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>新增编辑节点</title>
		<LINK rel="stylesheet" type="text/css" href="../css/grid.css">
		<LINK rel="stylesheet" type="text/css" href="../css/kpi_style.css">
	</head>
	<script language="JavaScript" type="text/javascript">
function addFreeNode(flwCode){
if(checkJs()){
form1.action = "${ROOT}/addFreeNode.do?";
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
var url = "${ROOT}/selectDefaultViewPage.do?flowCode=<%=request.getParameter("flwCode")%>";
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

function changetSpreadPersonStatus(flgSpread){
if(flgSpread==1){
document.all.spreadPerson.style.display="";
}
if(flgSpread==0){
document.all.spreadPerson.style.display="none";
}
}

function changetState(){
}
</script>
<html:base target="_self" />
<body>
<div align="center"><font size="+1"><b>新增编辑节点</b></font></div>
<form id="form1" name="form1" method="post" action="">
<table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
	<tr>
		<td><br>
		<DIV class=tab-pane id=tabPane1>
			<SCRIPT type=text/javascript>
			tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
			tp1.selectedIndex =0;
			</SCRIPT>
<DIV class=tab-page id=tabPage1>
	<H2 class=tab>基本配置</H2>
	<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
	<!-- 这里嵌套流程基本配置 -->
	<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
		<input name="flwCode" type="hidden" value="<%=request.getParameter("flwCode")%>" />
		<input name="priority" type="hidden" value="" />
		<input name="nodeCode" type="hidden" value="" />
		<TBODY>
		
			<TR>
				<td width="8%" align="right">
					<font color="red">*</font>
				</td>
				<TD align=left width="20%" height=35>
					环节名称:
				</TD>
				<TD width="72%" height=25>
					<INPUT class=editline size=30 value="" name="nodeName" check="notBlank" showName="环节名称" required="true">
				</TD>
			</TR>
			<TR>
				<td align="right"></td>
				<TD align=left height=35>
					环节说明:
				</TD>
				<TD height=25>
					<INPUT class=editline size=30 value="" name="memo">
				</TD>
			</TR>
			<TR>
				<td align="right"></td>
				<TD align=left height=35>
					默认视图:
				</TD>
				<TD height=25>
				
					<INPUT class=editline size=30 value="" name="defaultViewName" check="notBlank" showName="默认视图" required="true" readonly="readonly">
				<INPUT type="hidden" name="defaultView" value="">
				<INPUT type="button" name="selectTemp" value="选择视图" onclick="javascript:selectView()" class="button">
				<br><input type="hidden" name="flgFullScreen" value="0" />
				</TD>
			</TR>
			<TR>
				<td align="right">
					<font color="red" >*</font>
				</td>
				<TD align=left height=35>
					处理方式:
				</TD>
				<TD height=25 nowrap="nowrap">
				<html:select name="nodeForm" property="handleWay" onchange="changetState()">
				<option value="">--请选择处理方式--</option>
				<html:optionsCollection name="handleTypewayList" value="id" label="selectLable"/>
				</html:select>										
				</TD>
			</TR>
					<TR id="nodeHandlerTr" <logic:equal name="nodeForm" property="handleWay" value="1">style="display:none" </logic:equal>>
				<td align="right">
					
				</td>
				<TD align=left height=35>
					环节处理人:
				</TD>
				<TD height=25>
				<input type="hidden" name="nodeHandler" value=""/>
				<INPUT type="hidden" name="nodeProcessorValue" value=""/>
				<INPUT id="nodeProcessorText" class=editline size=35 value="" name="nodeProecessorText" readonly="readonly">
				<input type='button' id='b1' value='选择' class="button"
				  onclick="javascript:showAddr('nodeProcessorText','nodeProcessorValue','0,10,20,100;n')" >
				</TD>
			</TR>
			<TR  id="spreadMethod" >
				<td align="right">
					<font color="red">*</font>
				</td>
				<TD align=left height=35>
					是否抄送
				</TD>
				<TD height=25>
					<input type="radio" name="flgSpread" value="1"  onclick="changetSpreadPersonStatus(1)"/>
					是&nbsp;
					<input type="radio" name="flgSpread" value="0"  onclick="changetSpreadPersonStatus(0)" checked="checked" />
					否
				</TD>
			</TR>
			<TR  id="spreadPerson" style="display:none" >
				<td align="right">												
				</td>
				<TD align=left height=35>
					抄送人
				</TD>
				<TD align=left height=35 colspan="2">
				<input type="hidden" name="spreadHandler" value=""/>
				<INPUT type="hidden" name="spreadProcessorValue" value=""/>
				<INPUT id="spreadProcessorText" class=editline size=35 value="" name="spreadProecessorText" readonly="readonly">
				<input type='button' id='b1' value='选择' class="button"
				  onclick="javascript:showAddr('spreadProcessorText','spreadProcessorValue','0,10,20,50,100;n')" >
				</TD>
			</TR>
			<TR id="nodePermisson">
				<td align="right"></td>
				<TD align=left height=35>
					节点权限:
				</TD>
				<TD height=25>
					<input type="checkbox" name="flgModify" value="1" />可修改流程
				</TD>
			</TR>									
			<tr>
				<td colspan="3" align="left">
					<font color="#0099FF">说明：红星（</font><font color="red">*</font><font color="#0099FF">）不能为空</font>
				</td>
			</tr>
	</table>
</DIV>
			</DIV>
			<!-- 	整个TAB结束 -->
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<table width="85%" border="0" cellspacing="0">
			<tr>
				<td>&nbsp;</td>
				<td align="right">
					<input type="button" name="Submit" value="提  交" onclick="addFreeNode();">
				</td>
				<td align="left">
					<input type="submit" name="Submit2" value="关  闭" onclick="javascript:window.close();">
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table><br>			
</form>
</body>
</html>
