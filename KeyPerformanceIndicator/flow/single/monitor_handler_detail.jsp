<%@ page contentType="text/html;charset=utf-8" language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
	<head>
		<title>流程文档监控明细--${WEB_TITLE}</title>
	</head>
	<style type="text/css">

</style>
<script language="javascript">
window.name = "monitorDetail";
function FF_TransferOpinion(){
	_edit_msg_show("意见","msg_opinion",false,"FF_Transfer()");
}

function FF_TrunItemOpnion(){
	//我靠，居然还去组装了一次，直接提交不行吗？
	var ids = getAllChecked('worklistItemId');
	if(ids==""){
		alert("请选择要转办的对象!");
		return ;
	}
	form1.id.value=ids;
	getAddressList('20','1','1','turningHandlerName','turningUserId');
	if(form1.turningUserId.value==""){
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
	$("msg_opinion").value = dg.msg;
	var url = "${ROOT}/listFlowNode.do?flowCode=${recFlow.flowCode}&fromNodeCode=${recNode.toNode}";
	var obj = new Object();
	obj.ids = "${recFlow.boId}";
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
		form1.action= url;
		form1.submit();
	}
}

function FF_Reflush(){
	window.location = window.location;
}
</script>
<body>
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
          	<c:if test="${recFlow.status!=2}">
            <input type="button" class="button4"  onClick="FF_TransferOpinion();" value="转移待办"/>
            <input type="button" class="button4" value="显示复选框" onclick="FF_Display(this);" />
            <input type="button" class="button2" value="转办" onclick="FF_TrunItemOpnion();" id="turningItem" name="turningItem" style="display:none"/>
            <input type="button" class="button2" value="刷新" onclick="FF_Reflush(this);" />
            </c:if></div></td>
        </tr>
   </table>
<form id="form1" name="form1" method="post" action="">
		<INPUT type="hidden" id="turningUserId" name="turningUserId" value="" />
		<INPUT type="hidden" id="turningHandlerName" name="turningHandlerName" value=""/>
		<INPUT type="hidden" id="msg_opinion" name="msg_opinion" value=""/>
		<INPUT type="hidden" id="id" name="id" value=""/>
<table width="90%" border="0" cellspacing="0" align="center">

								<tr align="center">
									<td colspan="2">
										<h3>详 细 处 理 信 息</h3>
									</td>
								</tr>
								<tr align="center">
									<td>
										文档名称:${recFlow.boName}
									</td>
									<td>
										所属流程:${monitor.flow.flowName}(${monitor.flow.org.fullName})
									</td>
									<td>
										文档状态:${recFlow.statusDesc}
									</td>									
								</tr>
</table>
	<table id="tb1" width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
							<tr>
								<td class="title-header" align="center" width="20%" height="20">
									环节
								</td>
								<td class="title-header" align="center" width="20%">
									<FONT style="color: #FF9900">未处理</FONT>
								</td>
								<td class="title-header" align="center" width="20%" nowrap>
									<FONT style="color: green">已处理</FONT>
								</td>
								<td class="title-header" align="center" width="20%" nowrap>
									<FONT style="color: #666666">超时未处理</FONT>
								</td>
								<td class="title-header" align="center" width="20%">
									<FONT style="color: #FF0000">超时已处理</FONT>
								</td>
							</tr>			
			<c:forEach var="n" items="${monitor.flow.nodeSet}">
				<c:if test="${!n.rootNode}">
				<tr>
					<td><b>${n.nodeName}</b></td>
					<td style="color: #FF9900">&nbsp;<c:forEach var="o" items="${details}" varStatus="idx"><c:if test="${n.id==o.nodeCode && o.status==1}">
					<a title="部门:${o.handlerUser.org.name}&#10账号:${o.handlerUser.logonId}" onDblclick="try{window.clipboardData.setData('Text','${o.handlerUser.logonId}')}catch(e){}">
					${o.handlerName}${o.handlerUser.flgActive==0?'[失效用户]':''}</a>
					<input type='checkbox' name='worklistItemId' value="${o.id}" style='display:none'/></c:if></c:forEach></td>
					<td style="color: green">&nbsp;<c:forEach var="o" items="${details}" varStatus="idx"><c:if test="${n.id==o.nodeCode && o.status==2}">
					<a title="部门:${o.handlerUser.org.name}&#10账号:${o.handlerUser.logonId}" onDblclick="try{window.clipboardData.setData('Text','${o.handlerUser.logonId}')}catch(e){}">
					${o.handlerName}${o.handlerUser.flgActive==0?'[失效用户]':''}</a>
					</c:if></c:forEach></td>
					<td style="color: #666666">&nbsp;<c:forEach var="o" items="${details}" varStatus="idx"><c:if test="${n.id==o.nodeCode && o.status==3}">
					<a title="部门:${o.handlerUser.org.name}&#10账号:${o.handlerUser.logonId}" onDblclick="try{window.clipboardData.setData('Text','${o.handlerUser.logonId}')}catch(e){}">
					${o.handlerName}${o.handlerUser.flgActive==0?'[失效用户]':''}</a>
					<input type='checkbox' name='worklistItemId' value="${o.id}" style='display:none'/></c:if></c:forEach></td>
					<td style="color: #FF0000">&nbsp;<c:forEach var="o" items="${details}" varStatus="idx"><c:if test="${n.id==o.nodeCode && o.status==4}">
					<a title="部门:${o.handlerUser.org.name}&#10账号:${o.handlerUser.logonId}" onDblclick="try{window.clipboardData.setData('Text','${o.handlerUser.logonId}')}catch(e){}">
					${o.handlerName}${o.handlerUser.flgActive==0?'[失效用户]':''}</a>
					</c:if></c:forEach></td>
				</tr>
				</c:if>
			</c:forEach>
	</table>
	<hr width="89%" align="center"/>
</form>
</body>
</html>
