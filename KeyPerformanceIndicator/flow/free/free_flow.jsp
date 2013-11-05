<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*" errorPage=""%>
<%@ include file=".//web/pub/flow.inc"%>
<html><html:base target="_self" />
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>自由流操作</title>
	</head>
	<%Map map = (Map) request.getAttribute("handlerMap");
			Map nodeStatusMap = (Map) request.getAttribute("nodeStatusMap");
			int size = map.keySet().size();
   String hasWorklistItemStr = (String) request.getAttribute("isStartFreeFlow");
	boolean hasWorklistItem = Boolean.valueOf(hasWorklistItemStr).booleanValue();
	String isNextRootStr = (String) request.getAttribute("isNextRoot");
	boolean isNextRoot = Boolean.valueOf(isNextRootStr).booleanValue();
	int undoNumCurrentNode = Integer.parseInt((String) request.getAttribute("undoNumCurrentNode"));
	String worklistItemId = (String)request.getAttribute("worklistItemId");
%>

<script type="text/javascript" src="${ROOT}/common/js/ajax.js"></script>
<script type="text/javascript" src="${ROOT}/common/upload/attach.js"></script>
<script type="text/javascript">
window.onload=function (){
	window.resizeTo(750, 600);
	window.moveTo(150,50);
	window.document.body.scroll="auto";
}

function viewFreeNode(nodeCode){
var url = "${ROOT}/freeeNodeEditPage.do?nodeCode="+nodeCode;
var value=window.open(url,'',"width=700,height=480;status=off");
//if(value=="success"){
//location.reload();
//}
}

function ev_addFreeNode(){
var flowCode = document.all.flwCode.value;
var url = "${ROOT}/freeeNodeAddPage.do?flwCode="+flowCode;
var value=window.showModalDialog(url,window,"dialogHeight:500px;dialogWidth:720px;status=off");
if(value=="success"){
location.reload();
}
}

function deleteFreeNode(nodeCode){
var url = "${ROOT}/deleteFreeNode.do?nodeCode="+nodeCode;
 if (confirm("您确认要删除记录？")) { 
LoadAjaxContent(url,returnBackMethod);
}
}

function returnBackMethod(){
eval(this.request.responseText);
if(value=="success"){
alert("删除成功");
window.location.reload();
}
}

function sortFreeNode(nodeCode,type){
var url = "${ROOT}/sortFreeNode.do?nodeCode="+nodeCode+"&type="+type+"&noCache="+Math.random();
LoadAjaxContent(url,sortFreeNodeBackMethod);
}

function sortFreeNodeBackMethod(){
eval(this.request.responseText);
if(value=="success"){
window.location.reload();
}
}
var result = true;
function ev_start(){

checkHandler();
if(!result) return;
<%
if(hasWorklistItem){
%>
var flowCode = document.all.flwCode.value;
form1.action = "${ROOT}/startFreeFlow.do?boClass=<%=request.getParameter("boClass")%>&boId=<%=request.getParameter("boId")%>&flwCode="+flowCode+"&parentWorklistItemId=<%=request.getParameter("parentWorklistItemId")%>&jsStr=window.opener.location.reload();";
form1.submit();
<%
}else{
%>
var flowCode = document.all.flwCode.value;
form1.action = "${ROOT}/submitFreeFlowNext.do?thisNodeCode=<%=request.getParameter("thisNodeCode")%>&id=<%=request.getParameter("boInfo")%>&boId=<%=request.getParameter("boId")%>&flwCode="+flowCode+"&parentWorklistItemId=<%=request.getParameter("parentWorklistItemId")%>&jsStr=window.opener.location.reload();";
form1.submit();
<%
}
%>
}

function checkHandler(){
var url = "";
<%
if(hasWorklistItem){
%>
url = "${ROOT}/checkHandler.do?id=<%=request.getParameter("boInfo")%>&flowCode="+document.all.flwCode.value+"&noCache="+Math.random();
<%
}else{
%>
url = "${ROOT}/checkHandler.do?id=<%=request.getParameter("boInfo")%>&thisNodeCode=<%=request.getParameter("thisNodeCode")%>&noCache="+Math.random();
<%
}
%>
LoadAjaxContentSyn(url,checkHandlerMethod);
}

function checkHandlerMethod(){
eval(this.request.responseText);
}

function ev_back(){
var boinfo ="<%=request.getParameter("boInfo")%>";
var boid = boinfo.split(",")[0];
var url = "${ROOT}/listBackPage.do?boId="+boid+"&fromNodeCode=<%=request.getParameter("thisNodeCode")%>";
var value=window.showModalDialog(url,'',"dialogHeight:230px;dialogWidth:300px;status=off");
if(value=="success"){
window.returnValue = "success";
window.opener.location.reload();
window.close();
}
}

</script>
	<body style="overflow-x:hidden">
	<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
   <tr> 
     <td align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
     <td width="500"> 
	 <input type="button" class="button1" value="新增环节" onclick="javascript:ev_addFreeNode()" >
	 <input type="button" class="button" value="提交" onclick="javascript:ev_start();" >
	 <input type="button" class="button" value="驳回" onclick="javascript:ev_back()" >
     </td>
     <td align="right">
     <input type="button" class="button" value="关闭" onclick="if(confirm('确定关闭')){window.close();}" >
     </td>
     </tr></table></td></tr></table><br>
	<form id="form1" name="form1" method="post" action="">
	<input type="hidden" name="flwCode" value="<%=request.getAttribute("flwCode")%>"/>
		<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
			<tr>
				<td class=title-header align="center" width="5%" height="20">
					序号
				</td>
				<td class=title-header align="center" width="18%">
					环节
				</td>
				<td class=title-header align="center" width="18%">
					处理人
				</td>
				<td class=title-header align="center" width="15%">
					处理方式
				</td>
				<td class=title-header align="center" width="12%">
					编辑
				</td>
				<td class=title-header align="center" width="9%">
					排序
				</td>
				<td class=title-header align="center" width="9%">
					处理状态
				</td>
			</tr>
			<%
			Map preStatusMap = new HashMap();
			%>
			<logic:iterate id="freeFlowNode" name="freeFlowNodeList">
				<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
					<td align="center" height="20">
						<bean:write name="freeFlowNode" property="priority" />
					</td>
					<td align="center">
						<bean:write name="freeFlowNode" property="nodeName" />
					</td>
					<td align="center">
						<%
						FlwNode flwNode = (FlwNode) freeFlowNode;
			String flwNodeId = flwNode.getNodeCode();
			List list = (List) map.get(flwNodeId);
			int priority = flwNode.getPriority();
			out.print(flwNode.getNodeProcessor()==null?"":flwNode.getNodeProcessor().handlerText());

			%>
						&nbsp;
					</td>
					<td align="center">
						<logic:equal name="freeFlowNode" property="flgRoot" value="0">
							<bean:write name="freeFlowNode" property="handleTypeway.handleWayName" />
						</logic:equal>
						&nbsp;
					</td>
					<%int status = ((Integer) nodeStatusMap.get(flwNodeId)).intValue();

			%>
					<td align="center">
						<%if (status ==0) {
						preStatusMap.put(String.valueOf(priority),"UNDO");
				%>
						<a href="javascript:viewFreeNode('<%=flwNodeId%>');"><img src="${ROOT}/web/flow/img/button_edit.gif" border="0"></a> 
						<a href="javascript:deleteFreeNode('<%=flwNodeId%>');"><img src="${ROOT}/web/flow/img/delete_1.gif" border="0"></a>
						<%} else {
				out.println("&nbsp;");
			}

			%>
					</td>
					<td align="center">
					<%
					if (status ==0) {
					if(priority!=1&&preStatusMap.get(String.valueOf(priority-1))!=null){
					%>
						<logic:notEqual name="freeFlowNode" property="priority" value="1">
							<a href="javascript:sortFreeNode('<%=flwNodeId%>','up')" title="点击将环节上移"><img src="${ROOT}/web/flow/img/up.gif" border="0"></a>
						</logic:notEqual>
						<%
						}
						if((size-1)!=priority){
						%>
						<a href="javascript:sortFreeNode('<%=flwNodeId%>','down')" title="点击将环节下移"><img src="${ROOT}/web/flow/img/down.gif" border="0"></a>
						<%
						}
						}
						%>&nbsp;
					</td>
					<td align="center">
						<font color="red"> <%if (status == 0)
				out.print("未处理");
			if (status == 1)
				out.print("处理中");
			if (status == 2)
				out.print("已处理");

		%> </font>
					</td>
				</tr>
			</logic:iterate>
		</table>
	
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td align="left" nowrap="nowrap">意见：<textarea name="option" cols="70" rows="3"></textarea></td>
  </tr>
</table>

</form>
<br>
<jsp:include page="/flow/list_bo_options.jsp" flush="true">
	<jsp:param name="id" value="<%=request.getParameter("boInfo")%>"/>
	<jsp:param name="nodeCode" value="<%=request.getParameter("thisNodeCode")%>"/>
</jsp:include>  

<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td align="left" nowrap="nowrap">
   			<jsp:include page="/common/upload/attachList.jsp" flush="true">
				<jsp:param name="id" value="<%=worklistItemId %>" />
				<jsp:param name="delete" value="false"/>
				<jsp:param name="isupload" value="true"/>
			</jsp:include>
    </td>
  </tr>
</table>

	</body>
	<SCRIPT language=javascript>
  //创建按钮
  var cells = document.getElementById("toolBar").rows[0].cells;
  for (var i = 1; i < cells.length; i++){
     createButton(cells[i]);
  }

</SCRIPT>
</html>
