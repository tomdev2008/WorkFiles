<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*" errorPage=""%>
<%@ include file="/web/pub/flow.inc"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="${ROOT}/styleSheet/cb2.css">
<link rel="stylesheet" type="text/css" href="${ROOT}/styleSheet/layout.css">
<script type="text/javascript" src="${ROOT}/common/cb2.js"></script>      <!--生成按钮-->
		<script type="text/javascript" src="${ROOT}/common/js/Check.js"></script>
		<%request.setAttribute("flowNodeExtList2", request
					.getAttribute("flowNodeExtList"));
			String tab = request.getParameter("tab");
			if (tab == null || tab.equals("")) {
				tab = "0";
			}
			int size = ((List)request.getAttribute("nodeMineList")).size();

			%>
	</head>
<script language="javascript">

function editFreeNode(){
	if(checkJs()){
		form2.action = "${ROOT}/editFreeNode.do";
		form2.submit();
	}
}

function checkJs(){
	return true;
}

var rowsnum=<%=size%>;<%--记录行数--%>
var rindex="";
var rindex1="";
var tempRowNum = <%=size%>;
var ary = new Array();
<%
if(size==0){
out.println("ary[0] = 0;");
}
for(int i=0;i<size;i++){
out.println("ary["+i+"] = "+i+";");
}
%>
function addRow(){
  rowsnum++;
  var arow = tbl.insertRow(Number(tempRowNum));
   var td = arow.insertCell(0);
  td.innerHTML="<a href='#'><img id='remine' src='images/remine.gif' border='0' value='1'></a>";
  var td = arow.insertCell(1);
  td.innerHTML="系统将在时限前<input type='text' name=\"fromHoure"+rowsnum+"\" class=editline size=2 value='' >"+
  		"小时至<INPUT  type='text' name='toHoure"+rowsnum+"' class=editline size=2 value= >小时以"+
  		"<select name='way"+rowsnum+"'><option value='0'>小灵通短信</option><option value='1'>邮件</option></select>"+
  		"方式提醒<select name='reminder"+rowsnum+"'><option value='1'>处理人</option></select>，"+
  		"每<INPUT type='text' name='frequency"+rowsnum+"' class=editline size=2 value= >"+
  		"<select name='frequencyUnit"+rowsnum+"'><option value='0'>分钟</option><option value='1'>小时</option><option value='2'>天</option></select>"+
  		"提醒一次,提醒内容为<INPUT type='text' name='remindContent"+rowsnum+"' class=editline size=40 value= >。";
  		
  var td = arow.insertCell(2);
  td.innerHTML="<img src='images/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this)'> ";
  tempRowNum++;
  var obj = document.all.rowsnum;
  obj.value = rowsnum;
  ary[parseInt(ary.length)]=rowsnum;
  
}

function deleteCurrentRow(obj,id)
{
if(id!=""&&id!=undefined){
if(confirm("您确认要删除记录？")){
var nodeMinedeleteurl = "${ROOT}/deleteNodeMine.do?id="+id+"&nodeCode=<%=request.getParameter("nodeCode")%>&tab=1&noCache="+Math.random();
LoadAjaxContent(nodeMinedeleteurl,deleteNodeMinecallBackMethod);
}else{
return;
}
}
	var rindex=obj.parentElement.parentElement.rowIndex;
	tbl.deleteRow(rindex);<%--删除当前行--%>
	tempRowNum--;
}

function deleteNodeMinecallBackMethod(){
eval(this.request.responseText);
}

function remove(array,index)
{
    if(isNaN(index)||index>array.length){return false;}
    for(var i=0,n=0;i<array.length;i++)
    {
        if(array[i]!=array[index])
        {
            array[n++]=array[i]
        }
    }
   if(array.length!=0){
    array.length-=1
    }
}

function updateFlwNode(){
form2.action = "${ROOT}/editNode.do?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=request.getParameter("nodeCode") %>&remindIds="+ary;
form2.submit();
}

function updateFlwNodeForRoot(){
form2.action = "${ROOT}/editNodeForRoot.do?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=request.getParameter("nodeCode") %>";
form2.submit();
}

function changetState(){
	var value = document.all.handleWay.value;
	if(value!=""&&value!=1&&value!=3&&value!=41&&value!=42){
		document.all.nodeHandlerTr.style.display="";
	}else{
		document.all.nodeHandlerTr.style.display="none";
	}
	if(value==1){
		document.all.methodAlert.style.display="";
	}else{
		document.all.methodAlert.style.display="none";
	}
	/*if(value==3){//对应flw_handle_typeway中自由流的定义
		document.all.nodePermisson.style.display="";
	}else{
		document.all.nodePermisson.style.display="none";
	}*/
}

function selectView(){
var url = "${ROOT}/selectDefaultViewPage.do?nodeCode=<bean:write name="flwNode" property="nodeCode"/>";
var temps = document.all.defaultView.value;
var obj = new Object();
obj.defaultView = temps;
var returnValue = window.showModalDialog(url,obj,"dialogHeight:300px;dialogWidth:350px;status=no");
    if(returnValue!=""&&returnValue!=undefined){
    var returnTemps = returnValue.split(":");
   document.all.defaultView.value = returnTemps[1];
   document.all.defaultViewName.value = returnTemps[0];
   }
}

function addVariable(){
	form2.msgTitle.value=form2.msgTitle.value+form2.variable.value;
}

function ev_handler(){
	var url="${ROOT}/flow/select_handler.jsp";
	window.showModalDialog(url,'',"dialogHeight:550px;dialogWidth:750px;status=no");
}
function changetSpreadPersonStatus(flgSpread){
if(flgSpread==1){
document.all.spreadPerson.style.display="";
}
if(flgSpread==0){
document.all.spreadPerson.style.display="none";
}
}
</script>
	<body style="OVERFLOW: auto" text=#000000 leftMargin=0 topMargin=0 >
		<br>
		<form id="form2" name="form2" method="post" action="">
		<% FlwNode node = (FlwNode)request.getAttribute("flwNode");%>
			<table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
				<tr>
					<td>
						<br>
						<DIV class=tab-pane id=tabPane1>
							<SCRIPT type=text/javascript>
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	tp1.selectedIndex =<%=tab%>;
	</SCRIPT>



							<DIV class=tab-page id=tabPage1>
								<H2 class=tab>
									基本配置
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
								<!-- 这里嵌套流程基本配置 -->
								<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
									<input name="flowCode" type="hidden" value="" />
									<input name="nodeCode" type="hidden" value="<bean:write name="flwNode" property="nodeCode"/>" />
									<TBODY>
									
										<TR>
											<td width="8%" align="right">
												<font color="red">*</font>
											</td>
											<TD align=left width="20%" height=35>
												环节名称:
											</TD>
											<TD width="72%" height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="nodeName"/>" name="nodeName" check="notBlank" showName="环节名称" required="true">
											</TD>
										</TR>
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												环节说明:
											</TD>
											<TD height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="memo"/>" name="memo">
											</TD>
										</TR>
										<logic:equal name="flwNode" property="flgRoot" value="0">
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												默认视图:
											</TD>
											<TD height=25>
											
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="defaultViewName"/>" name="defaultViewName" check="notBlank" showName="默认视图" required="true" readonly="readonly">
											<INPUT type="hidden" name="defaultView" value="<bean:write name="flwNode" property="defaultView"/>">
											<INPUT type="button" name="selectTemp" value="选择视图" onclick="javascript:selectView()" class="button">
											<br><html:checkbox name="flwNode" property="flgFullScreen" value="1">全屏打开待办</html:checkbox>  
											</TD>
										</TR>
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												显示顺序:
											</TD>
											<TD height=25>
												<bean:write name="flwNode" property="priority" />
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
											<font color="red" id="methodAlert" style="display: none">处理人在考核模板中配置</font>
											<script type="text/javascript">
											function ev_handleType_change(){										
											}
											</script>											
											</TD>
										</TR>
												<TR id="nodeHandlerTr" <logic:equal name="nodeForm" property="handleWay" value="1">style="display:none" </logic:equal>>
											<td align="right">
												
											</td>
											<TD align=left height=35>
												环节处理人:
											</TD>
											<TD height=25>
											<input type="hidden" name="nodeHandler" value="<%=node.getNodeProcessor()==null?"":node.getNodeProcessor().getId() %>"/>
											<INPUT type="hidden" name="nodeProcessorValue" value="<%=node.getNodeProcessor()==null?"":node.getNodeProcessor().handlerValue() %>"/>
											<INPUT id="nodeProcessorText" class=editline size=35 value="<%=node.getNodeProcessor()==null?"":node.getNodeProcessor().handlerText()%>" name="nodeProecessorText" readonly="readonly">
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
												<html:radio name="flwNode" property="flgSpread" value="1"  onclick="changetSpreadPersonStatus(1)"/>
												是&nbsp;
												<html:radio name="flwNode" property="flgSpread" value="0"  onclick="changetSpreadPersonStatus(0)"/>
												否
											</TD>
										</TR>
										<TR  id="spreadPerson" <logic:equal name="flwNode" property="flgSpread" value="0" >style="display:none"</logic:equal> >
											<td align="right">												
											</td>
											<TD align=left height=35>
												抄送人
											</TD>
											<TD align=left height=35 colspan="2">
											<input type="hidden" name="spreadHandler" value="<%=node.getSpreadProcessor()==null?"":node.getSpreadProcessor().getId() %>"/>
											<INPUT type="hidden" name="spreadProcessorValue" value="<%=node.getSpreadProcessor()==null?"":node.getSpreadProcessor().handlerValue() %>"/>
											<INPUT id="spreadProcessorText" class=editline size=35 value="<%=node.getSpreadProcessor()==null?"":node.getSpreadProcessor().handlerText()%>" name="spreadProecessorText" readonly="readonly">
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
												<html:checkbox name="flwNode" property="flgModify" value="1">可修改流程</html:checkbox>
											</TD>
										</TR>
										</logic:equal>										
										<tr>
											<td colspan="3" align="left">
												<font color="#0099FF">说明：红星（</font><font color="red">*</font><font color="#0099FF">）不能为空</font>
											</td>
										</tr>
								</table>
							</DIV>
<logic:equal name="flwNode" property="flgRoot" value="0">
							<DIV class=tab-page id=tabPage2>
								<H2 class=tab>
									提醒设置
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
								<!-- 这里嵌套流程附件 -->
								<INPUT type="hidden" name="rowsnum" value="">
								<table id="tbl" class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
									<TBODY>
									<logic:iterate id="nodeMine" name="nodeMineList" indexId="index">
									<input type="hidden" name="id<bean:write name="index"/>" value="<bean:write name="nodeMine" property="id"/>"/>
									<tr>
									<td>
									<a href='#'><img id='remine' src='images/remine.gif' border='0' value='1'></a>
									</td>
									<td>
									系统将在时限前<input type='text' name="fromHoure<bean:write name="index"/>" class=editline size=2 value='<bean:write name="nodeMine" property="formHoure"/>' >小时至
									<INPUT  type='text' name='toHoure<bean:write name="index"/>' class=editline size=2 value='<logic:notEqual name="nodeMine" property="toHoure" value="<%=Integer.MAX_VALUE+""%>"><bean:write name="nodeMine" property="toHoure"/></logic:notEqual>' >小时以
									<select name='way<bean:write name="index"/>'>									
									<option value='0' <logic:equal name="nodeMine" property="way" value="0">selected</logic:equal>>小灵通短信</option>
									<option value='1' <logic:equal name="nodeMine" property="way" value="1">selected</logic:equal>>邮件</option>
									</select>
									方式提醒
									<select name='reminder<bean:write name="index"/>'>
									<option value='1' <logic:equal name="nodeMine" property="reminder" value="1">selected</logic:equal>>处理人</option>
									</select>
									，每<INPUT type='text' name='frequency<bean:write name="index"/>' class=editline size=2 value='<bean:write name="nodeMine" property="frequency"/>' >
									<select name='frequencyUnit<bean:write name="index"/>'>									
									<option value='0' <logic:equal name="nodeMine" property="frequencyUnit" value="0">selected</logic:equal>>分钟</option>
									<option value='1' <logic:equal name="nodeMine" property="frequencyUnit" value="1">selected</logic:equal>>小时</option>
									<option value='2' <logic:equal name="nodeMine" property="frequencyUnit" value="2">selected</logic:equal>>天</option>
									</select>
									提醒一次,提醒内容为<INPUT type='text' name='remindContent<bean:write name="index"/>' class=editline size=30 value='<bean:write name="nodeMine" property="remineContent"/>' >。
									</td>
									<td>
									<img src='images/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this,"<bean:write name="nodeMine" property="id"/>")'> 
									</td>
									</tr>
									</logic:iterate>
										<tr>																			
											<td colspan="2">
												<font color="red">*</font>起始时间小于结束时间，如前1个小时至前4个小时；结束时间可以不填，表示没有上限。<br>
												<font color="red">*</font>您可以<a href="javascript:addRow()" title="增加提醒"><font color="#0000FF">增加</font></a>提醒点，也可以点击上面的
												<img src="images/delete_1.gif" border="0" onclick="">
												删除
											</td>
										</tr>
								</table>
							</DIV>
							
</logic:equal>
						</DIV>
						<!-- 	整个TAB结束 -->
					</td>
				</tr>
			</table><br>
		</form>
		<div align="center">
		<input type="button" class="button" name="Submit" value="提交" onclick="editFreeNode();">
		<input type="button" class="button" name="Submit2" value="关闭" onclick="javascript:window.close();">
		</div>
	</body>
</html>
