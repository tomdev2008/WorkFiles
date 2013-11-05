<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.shengdai.kpi.system.CommonLoginUser"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.service.IUserService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<%
	String nodeCode = request.getParameter("nodeCode");
 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>个人考核</title>
		<%
		//request.setAttribute("flowNodeExtList2", request.getAttribute("flowNodeExtList"));
			String tab = request.getParameter("tab");
			if (tab == null || tab.equals("")) {
				tab = "0";
			}
			int size = ((List)request.getAttribute("nodeMineList")).size();

			%>
	</head>
<script language="javascript">

//新增，编辑业务参数弹出窗口
function add_para(id){
	var returnValue = window.showModalDialog('${ROOT}/flow/flow_busi_param_add.jsp?id='+id,'','dialogHeight:380px;dialogWidth:470px;status=off')
     if(returnValue=="success"){
    location.href = "${ROOT}/nodeEditPage.do?nodeCode=<%=nodeCode%>&tab=3"+urlPara;   
    }
}

function editNodeExt(id){
var returnValue = window.showModalDialog('${ROOT}/busiParamEditPage.do?busiParamId='+id,'','dialogHeight:380px;dialogWidth:470px;status=off')
    if(returnValue=="success"){
    location.href = "${ROOT}/nodeEditPage.do?nodeCode=<%=nodeCode%>&tab=3"+urlPara;  
   }
}

function deleteNodeExt(id){
if (confirm("您确认要删除记录？")) { 
document.form2.action = "${ROOT}/deleteBusiParam.do?nodeCode=<%=nodeCode%>&type=nodeEdit&id="+id;
document.form2.submit();
}else{
return;
}
}

function checkJs(){
/*if(checkSelectByName("flgHead",1,"是否流程发起环节")){
 //if(document.all.handleType.value==""){
 //alert("请选择处理方式！！");
 //document.all.handleType.focus();
 //return false;
 //}
 //if(!document.all.addHandlerButton.disabled){
 //if(document.all.flwNodeHandlerValue.value==""){
 //alert("请您选择处理人！！");
 //document.all.addHandlerButton.focus();
 //return false;
 //}
 //}
 return true;
 }*/
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
  td.innerHTML="<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>";
  var td = arow.insertCell(1);
  td.innerHTML="系统将在时限前<input type='text' name=\"fromHoure"+rowsnum+"\" class=editline size=2 value='' >"+
  		"小时至<INPUT  type='text' name='toHoure"+rowsnum+"' class=editline size=2 value= >小时以"+
  		"<select name='way"+rowsnum+"'><option value='0'>小灵通短信</option><option value='1'>邮件</option></select>"+
  		"方式提醒<select name='reminder"+rowsnum+"'><option value='1'>处理人</option></select>，"+
  		"每<INPUT type='text' name='frequency"+rowsnum+"' class=editline size=2 value= >"+
  		"<select name='frequencyUnit"+rowsnum+"'><option value='0'>分钟</option><option value='1'>小时</option><option value='2'>天</option></select>"+
  		"提醒一次,提醒内容为<INPUT type='text' name='remindContent"+rowsnum+"' class=editline size=40 value= >。";
  		
  var td = arow.insertCell(2);
  td.innerHTML="<img src='${ROOT}/web/flow/img/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this)'> ";
  tempRowNum++;
  var obj = document.all.rowsnum;
  obj.value = rowsnum;
  ary[parseInt(ary.length)]=rowsnum;
  
}

function deleteCurrentRow(obj,id)
{
if(id!=""&&id!=undefined){
if(confirm("您确认要删除记录？")){
var nodeMinedeleteurl = "${ROOT}/deleteNodeMine.do?id="+id+"&nodeCode=<%=nodeCode%>&tab=1&noCache="+Math.random()+urlPara;
LoadAjaxContent(nodeMinedeleteurl,deleteNodeMinecallBackMethod);
}else{
return;
}
}
	var rindex=obj.parentElement.parentElement.rowIndex;
	tbl.deleteRow(rindex);<%--删除当前行--%>
	tempRowNum--;
	remove(ary,rindex)
	//alert(ary);
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
form2.action = "${ROOT}/editNode.do?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=nodeCode %>&remindIds="+ary+urlPara;
form2.submit();
}

function updateFlwNodeForRoot(){
form2.action = "${ROOT}/editNodeForRoot.do?flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=nodeCode %>"+urlPara;
form2.submit();
}

function changetState(flag){
	var value = document.all.handleWay.value;
	if(value==12){
		document.all.methodAlert.innerText="对每个指标设置处理人,在责任书/考核表设置考核关系;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==11){
		document.all.methodAlert.innerText="对所有指标设置评分人,在责任书/考核表设置考核关系;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==13){
		document.all.methodAlert.innerText="";//满意度处理方式;
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==1){
		document.all.methodAlert.innerText="针对设置人按顺序进行处理,第一个人处理后,第二个人才能收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==2){
		document.all.methodAlert.innerText="针对设置处理人,一个人处理后其他人不做处理;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==3){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==7){
		document.all.methodAlert.innerHTML="必须等批次中的所有流程都走到此环节才能提交到下一环节,<br/>一个人处理后其他人不做处理;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==15){
		document.all.methodAlert.innerHTML="问卷中设置处理人(会签方式提交);";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==""){
		document.all.methodAlert.innerText="请选择处理方式;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==16){				//add by dkm 08-03-26
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==17){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==18){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==19){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}
	if(flag==1){
	    document.all.viewName.value = "";
	    document.all.viewId.value = "";
    }
}

function selectView(){
var handleWay = document.all.handleWay.value;
if(handleWay.length==0){
	alert("请选择处理方式!");
	return ;
}
var url = "${ROOT}/selectDefaultViewPage.do?nodeCode=<bean:write name="flwNode" property="nodeCode"/>&handleWay="+handleWay+urlPara;
var temps = document.all.viewId.value;
var obj = new Object();
obj.defaultView = temps;
var returnValue = window.showModalDialog(url,obj,"dialogHeight:450px;dialogWidth:700px;status=no");
    if(returnValue!=""&&returnValue!=undefined){
    var returnTemps = returnValue.split(":");
    //alert(returnValue);
   document.all.viewName.value = returnTemps[0];
   document.all.viewId.value = returnTemps[1];
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


function saveNodeTemplate(){
	if(document.getElementById("nodeCode").value!=""){
		form2.action="editNodeTemplate.do?remindIds="+ary;
	}else{
		form2.action="addNodeTemplate.do?remindIds="+ary;
	}

	form2.submit();
	window.close();
	window.setTimeout(window.opener.location.reload(),3000);
}

function changeHandleWay(){
	form2.action="getNodeTemplate.do";
	$_E("HTW").value = 1;
	$_E("remindIds").value = ary;
	form2.submit();
}
</script>
	<body style="OVERFLOW: auto" text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=3 >
	
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">
		<br>
		
		<form id="form2" name="form2" method="post" action="">
			<input id="remindIds" name="remindIds" type="hidden">
			<input id="HTW" name="HTW" type="hidden">
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
												业务类型：
											</TD>
											<TD width="72%" height=25>											
											<html:select name="flwNode" property="busiId" onchange="changeHandleWay();">
											<%--<option value="" selected>--请选择业务方式--</option>--%>
											<html:optionsCollection name="busiList" value="id" label="busiName"/>
											
											</html:select>
											</TD>
										</TR>
										
										<TR>
											<td width="8%" align="right">
												<font color="red">*</font>
											</td>
											<TD align=left width="20%" height=35>
												环节名称：
											</TD>
											<TD width="72%" height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="nodeName"/>" name="nodeName" check="notBlank" showName="环节名称" required="true" maxlength="50"/>
											</TD>
										</TR>
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												环节说明：
											</TD>
											<TD height=25>
												<INPUT class=editline size=30 value="<bean:write name="flwNode" property="memo"/>" name="memo" maxlength="50">
											</TD>
										</TR>
										<logic:equal name="flwNode" property="flgRoot" value="0">
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												显示顺序：
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
												处理方式：
											</TD>
											<TD height=25 nowrap="nowrap">
											<html:select name="nodeForm" property="handleWay" onchange="changetState(1)">
											<option value="">--请选择处理方式--</option>
											<html:optionsCollection name="handleTypewayList" value="id" label="selectLable"/>
											</html:select>
											<br/>
											<font color="red" id="methodAlert"></font>
											</TD>
										</TR>
										<TR id="nodeHandlerTr">
											<td align="right">
												
											</td>
											<TD align=left height=35>
												环节处理人：
											</TD>
											<TD height=25>
											<input type="hidden" name="nodeHandler" value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getId() %>"/>
											<INPUT type="hidden" name="nodeProcessorValue" value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getValue() %>"/>
											<INPUT id="nodeProcessorText" class=editline size=35 value="<%=node.getNodeHandler()==null?"":node.getNodeHandler().getText()%>" name="nodeProecessorText" readonly="readonly">
											<input type='button' id='b1' value='选择' class="button"
											  onclick="javascript:getAddressList('0;10;20;100','n','1','nodeProcessorText','nodeProcessorValue');" >
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												界面显示方式：
											</TD>
											<TD height=25>
											
											  <INPUT class=editline size=30 value="${flwNode.viewName }" name="viewName" check="notBlank" showName="界面显示方式" required="true" readonly="readonly">
											  <INPUT type="hidden" name="viewId" value="${flwNode.viewId }">
											  <INPUT type="button" name="selectTemp" value="选择" onclick="javascript:selectView()" class="button">
											  <br><html:checkbox name="flwNode" property="flgFullScreen" value="1">全屏打开待办</html:checkbox>  
											</TD>
										</TR>
										<TR  id="spreadMethod" style="display:none">
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
											<input type="hidden" name="spreadHandler" value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getId() %>"/>
											<INPUT type="hidden" name="spreadProcessorValue" value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getValue() %>"/>
											<INPUT id="spreadProcessorText" class=editline size=35 value="<%=node.getSpreadHandler()==null?"":node.getSpreadHandler().getText()%>" name="spreadProecessorText" readonly="readonly">
											<input type='button' id='b1' value='选择' class="button"
											  onclick="javascript:getAddressList('0;10;20','n','1','spreadProcessorText','spreadProcessorValue');" >
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
									<input type="hidden" name="srcId<bean:write name="index"/>" value="<bean:write name="nodeMine" property="srcId"/>"/>
									<tr>
									<td>
									<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>
									</td>
									<%
										String maxValue = Integer.MAX_VALUE+"";
										pageContext.setAttribute("maxValue",maxValue);
									%>
									<td>
									系统将在时限前<input type='text' name="fromHoure<bean:write name="index"/>" class=editline size=2 value='<bean:write name="nodeMine" property="formHoure"/>' >小时至
									<INPUT  type='text' name='toHoure<bean:write name="index"/>' class=editline size=2 value='<logic:notEqual name="nodeMine" property="toHoure" value="${maxValue }"><bean:write name="nodeMine" property="toHoure"/></logic:notEqual>' >小时以
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
									<img src='${ROOT}/web/flow/img/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this,"<bean:write name="nodeMine" property="id"/>")'> 
									</td>
									</tr>
									</logic:iterate>
										<tr>																			
											<td colspan="2">
												<font color="red">*</font>起始时间小于结束时间，如前1个小时至前4个小时；结束时间可以不填，表示没有上限。<br>
												<font color="red">*</font>您可以<a href="javascript:addRow()" title="增加提醒"><font color="#0000FF">增加</font></a>提醒点，也可以点击上面的
												<img src="${ROOT}/web/flow/img/delete_1.gif" border="0" onclick="">
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
			</table>
<div align="center"><br>
			<input type="button" onclick="saveNodeTemplate()" value="保存并关闭">&nbsp;&nbsp;	
			<%--<input type="button" onclick="window.close();" value="关闭">--%>
		</div>
		</form>
</div></td></tr></table>
	</body>
<script>
<logic:equal name="flwNode" property="flgRoot" value="0">
	changetState();	
</logic:equal>
</script>
</html>
