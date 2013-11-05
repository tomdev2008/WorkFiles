<%@ page contentType="text/html; charset=utf-8" language="java"
	import="com.shengdai.kpi.system.*,java.util.*,com.shengdai.kpi.flow.valueobject.*"
	errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.shengdai.kpi.system.OrgVo" />
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.*" />
<jsp:directive.page import="com.shengdai.kpi.system.org.OrgHelper" />
<%@ include file="/web/pub/head.inc"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>详细处理信息</title>
	</head>
	
	<script language="javascript">
function FF_TransferOpinion(){
	var ids = getAllChecked('checkname');
		if(ids==""){
			alert("请您选择要转移的项!!");
			return;
		}
	_edit_msg_show("意见","msg_opinion",false,"FF_Transfer()");
}

function FF_TrunItemOpnion(){
	//我靠，居然还去组装了一次，直接提交不行吗？
	var ids = getAllChecked('worklistItemId');
	if(ids==""){
		alert("请选择要转办的对象!");
		return ;
	}
	turnForm.id.value=ids;
	getAddressList('20','1','1','turningHandlerName','turningUserId');
	if(turnForm.turningUserId.value==""){
		alert("请选择转办人!");
		return ;
	}
	_edit_msg_show("意见","msg_opinion",false,"FF_TurnItem()");
}
function FF_Transfer(){
	if(dg.msg==''||dg.msg.trim().length<=0){
		alert("转移待办意见必须填写!");
		return;
	}
	var ids = getAllChecked('checkname');
	$("msg_opinion").value = dg.msg;
	var url = "${ROOT}/listFlowNode.do?flowCode=${currentFlow.id}&fromNodeCode=${currentNode.id}";
	var obj = new Object();
	obj.ids = ids;
	obj.msg_opinion=document.getElementById("msg_opinion").value;
	
	var retV = window.showModalDialog(url,obj,"dialogHeight:350px;dialogWidth:400px;status=off;scroll=no");
	if(retV=="success"){
	  window.location.reload();
	}
}
function FF_Display(btn){
	var turningItem = $("turningItem");
	var worklistItemIds = document.getElementsByName("worklistItemId");
	if(turningItem.style.display=="none"){
		btn.value = "隐藏复选框";
		turningItem.style.display="";
		for(var i = 0;i<worklistItemIds.length;i++){
			worklistItemIds[i].style.display = "";
		}
	}else{
		btn.value = "显示复选框";
		turningItem.style.display="none";
		for(var i = 0;i<worklistItemIds.length;i++){
			worklistItemIds[i].style.display = "none";
		}
	}
}

function FF_TurnItem(){
	if(dg.msg==''||dg.msg.trim().length<=0){
		alert("转移待办意见必须填写!");
		return;
	}
	$("msg_opinion").value = dg.msg;
	if (confirm("您确认要转办吗?")) { 
		var url = "${ROOT}/turningItem.do";
		turnForm.action= url;
		turnForm.submit();
	}
}

function ev_back(){
	location.href="${ROOT}/listWorklistForRecBatch.do?monitorId=${recBatch.monitor.id}&id=${recBatch.id}";
}
</script>
<body>
	<form name="turnForm" action="" id="turnForm" method="post">
		<INPUT type="hidden" id="turningUserId" name="turningUserId" value="" />
		<INPUT type="hidden" id="turningHandlerName" name="turningHandlerName" value=""/>
		<INPUT type="hidden" id="id" name="id" value="" />
		<INPUT type="hidden" id="close_window" name="close_window" value="0" />
		<INPUT type="hidden" id="msg_opinion" name="msg_opinion"/>
	</form>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td class="dialog-titlebg" width="100%"><div class="dialog-title">
          	<c:if test="${recBatch.status==1 }">
          	  <c:set var="pro" value="disabled" scope="request"></c:set>
          	</c:if>
          	<c:forEach items="${resourceList}" var="o" varStatus="idx">
             <input id='listSingleFlowCreate' type="button" class="button4" value="${o.name}" onclick="${o.url}" ${recBatch.id==null?"disabled='true'":""}/> 
            </c:forEach>
          	<%--<input type="button" class="button4"  onClick="FF_TransferOpinion()" value="转移待办"/>
            <input type="button" class="button4" value="显示复选框" onclick="FF_Display(this)" />
            --%>
            <input type="button" class="button2" value="转办" onclick="FF_TrunItemOpnion()" id="turningItem" name="turningItem" style="display:none"/>
            <input type="button" class="button2" value="返回" onclick="ev_back();"/>
          </div></td>
        </tr>
        <tr>
          <td>
						<center>
							<table width=" 90%" border="0" cellspacing="0" align="center">
								<tr align="center">
									<td>
										<h3>详 细 处 理 信 息</h3>
									</td>
								</tr>
							</table>
							<table width="90%" border="0" cellspacing="0" align="center">
								<tr align="center">
									<td>
										批次:${recBatch.batchName}
									</td>
									<td>
										环节:${currentNode.nodeName}
									</td>
									<td>
										频度:${recBatch.bacthTypeToDesc}
										<bean:write name="frequency" />
									</td>
									<td>
										处理状态:${recBatch.statusName}
									</td>
								</tr>
							</table>
							<form name="form1" id="form1" action="" enctype="text/plain">
								<%
									Map recNodeMindMap = (Map) request.getAttribute("recNodeMindMap");
									List flwNodeList = (List) request.getAttribute("nodeList");
									String flwNodeCode = request.getParameter("flwNodeCode");
									Map worklistItemMap = (Map) request.getAttribute("worklistItemMap");
									Map listForStatusdelegateMap = (Map) request
											.getAttribute("listForStatusdelegateMap");
								%>
								<table width="90%" border="1" cellpadding="1" cellspacing="1"
									bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF"
									height="23">
									<tr align="center" height="20">
										<td width="8%" nowrap="nowrap" rowspan="2">
											<INPUT type="hidden" name="currentCode" id="currentCode"
												value="<%=flwNodeCode%>" />
											<INPUT type="checkbox" id="selectAll" value=""
												onClick="javascript:checkAll(this.id, 'checkname');" />
											序号
										</td>
										<td width="12%" nowrap="nowrap" rowspan="2">
											被考核/沟通对象
										</td>
										<td width="80%" colspan="<%=flwNodeList.size()%>">
											处理人
										</td>
										<%--  --%>
									</tr>
									<tr>

										<%
												for (int i = 0; i < flwNodeList.size(); i++) {
												FlwNode tempFlwNode = (FlwNode) flwNodeList.get(i);
												if (tempFlwNode.getFlgRoot() == 1)
													continue;
												if (tempFlwNode.getNodeCode().equals(flwNodeCode)) {
										%>
										<td bgcolor="#D9E1F9" nowrap="nowrap" class="title-header">
											<span style="color: black"><%=tempFlwNode.getNodeName()%>处理人</span>
										</td>
										<%
										} else {
										%>
										<td nowrap="nowrap" class="title-header">
											<%=tempFlwNode.getNodeName()%>
										</td>
										<%
											}
											}
										%>
									</tr>
									<%
									int k = 0;
									%>
									<logic:iterate id="worklistItem" name="listForStatus"
										indexId="index">
										<tr bgcolor="#FFFFFF" align="center">
											<td align="left" nowrap="nowrap">
												&nbsp;&nbsp;
												<input type="checkbox" name="checkname"
													value="<bean:write name="worklistItem" property="boId"/>" />
												<%=(++k)%>
											</td>
											<%
													String boId = ((WorklistItem) worklistItem).getBoId();
													String delegate = ((WorklistItem) worklistItem).getBoDelegate();
													int delegateType = ((WorklistItem) worklistItem)
																		.getBoDelegateType();
													//String key = delegate + "_" + delegateType;
													String key = boId;
											%>
											<td>
												<%=listForStatusdelegateMap.get(key) == null ? "&nbsp;"
								: listForStatusdelegateMap.get(key)%>
											</td>
											<%
													boolean isEnd = false;
													for (int i = 1; i < flwNodeList.size(); i++) {
														FlwNode flwNode = (FlwNode) flwNodeList.get(i);
														if (flwNode == null || isEnd) {
													out.print("<td>&nbsp;</td>");
													continue;
														}
														if (flwNode.getFlgRoot() == 1)
													continue;//如果是结束环节则不需要显示
														if (flwNode.getNodeCode().equals(flwNodeCode))
													isEnd = true;
														String nodeCode = flwNode.getNodeCode();
														//List list = (List) worklistItemMap.get(nodeCode + "_"
														//+ delegate + "_" + delegateType);
														List list = (List) worklistItemMap.get(nodeCode + "_"+ boId);
											%>
											<td>
												<%
														if (list != null) {
														String userActiveStr;
														for (int j = 0; j < list.size(); j++) {
															userActiveStr = "";
															WorklistItem worklistItem2 = (WorklistItem) list
															.get(j);
															OrgVo vo = OrgHelper.getOrgObjectByIdType(
															worklistItem2.getHandler(), OrgType.USER
																	.orgInt());
															String userInfo = "";		
															if(worklistItem2.getStatus()==WorklistItem.STATUS_UNDO||worklistItem2.getStatus()==WorklistItem.STATUS_OVERTIME_UNDO){
																userInfo += "<input type='checkbox' name='worklistItemId' value='"+worklistItem2.getId()+"' style='display:none'/>";
															}
															userInfo += "<a title='";
															
																User user = (User) vo;
																//if (user.getPosition() != null) {
															//userInfo += "部门：" + user.getOrg().getName()
															//		+ "\n岗位:"
															//		+ user.getPosition().getName()
															//		+ "\n帐号:" + user.getLogonId();
															//	} else {
															try{
																userInfo += "部门：" + user.getOrg().getName()
																	+ "\n帐号:" + user.getLogonId();
															}catch(Exception ex){
																System.out.println("可能用户或组织不存在为空!userId:"+worklistItem2.getHandler()+":"+worklistItem2.getHandlerName());
																ex.printStackTrace();
															}
															//	}
															if(user.getFlgActive() == 0) {
																userActiveStr = "[用户已冻结]";
															} else if(user.getFlgActive() == 2){
																userActiveStr = "[用户已调动]";
															}
															
															
															userInfo += "' onDblclick=\"try{window.clipboardData.setData('Text','"+
																user.getLogonId()+"')}catch(e){}\">" + user.getName()+userActiveStr
															+ "</a>";
															if (isEnd) {
																//System.out.println(worklistItem2.getId());
																if (worklistItem2.getStatus() != Integer
																.parseInt(request
																.getParameter("status"))) {
															continue;
																}
															}
															if (worklistItem2.getStatus() == 2) {
																if (j == list.size() - 1) {
															out.print("<font color='green'>" + userInfo
																	+ "</font>");
																} else {
															out.print("<font color='green'>" + userInfo
																	+ "</font>" + ",");
																}
															}
															if (worklistItem2.getStatus() == 1) {
																if (j == list.size() - 1) {
															out.print("<font color='#FF9933'>"
																	+ userInfo + "</font>");
																} else {
															out.print("<font color='#FF9933'>"
																	+ userInfo + "</font>" + ",");
																}
															}
															if (worklistItem2.getStatus() == 3) {
																if (j == list.size() - 1) {
															out.print("<font color='#FF0000'>"
																	+ userInfo + "</font>");
																} else {
															out.print("<font color='#FF0000'>"
																	+ userInfo + "</font>" + ",");
																}
															}
															if (worklistItem2.getStatus() == 4) {
																if (j == list.size() - 1) {
															out.print(userInfo);
																} else {
															out.print(userInfo + ",");
																}
															}
														}
															} else {
														out.print("&nbsp;");
															}
												%>
											</td>
											<%
											}
											%>
										</tr>
									</logic:iterate>
								</table>
								<table width="200" border="0">
									<tr>
										<td colspan="4" nowrap="nowrap" bgcolor="#FFFFFF">
											处理人名称颜色为
											<font style="color: green">■</font>
											<FONT style="color: green">表示已经处理,</FONT>
											<font style="color: #FF9900">■</font>
											<FONT style="color: #FF9900">表示未处理,</FONT>
											<font style="color: #FF0000">■</font>
											<FONT style="color: #FF0000">表示超时未处理，</FONT>
											<font style="color: #666666">■</font>
											<FONT style="color: #666666">表示超时已处理</FONT>
										</td>
									</tr>
								</table>
							</form>
						</center>
				</td>
			</tr>
		</table>
	</body>
</html>
