<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
	<head>
		<title>流程发起</title>
	</head>
	<script language="javascript">
function startBatch(monitorId,operType,batch,status){
	var batchDate = batch;
	if(batch==1){
		batchDate = getSelectBatch();
	}
	if(status==1){
	 	alert("该流程尚未 归档，不能发起修改！");
	 	return;
	 }
	var url = "${ROOT}/monitorStartSelectOrgVo.do?batchDate="+batchDate+"&monitorId=${monitor.id}";
	var delegates = window.showModalDialog(url, "_blank", 'dialogHeight:520px;dialogWidth:600px;status=off');
	if(delegates && delegates!=""){
		form1.delegates.value = delegates;
		url = "${ROOT}/nextRecBatchStart.do?batchDate="+batchDate+"&nocache="+Math.random();
		if(operType==1)
			url = "${ROOT}/startNextRecBatchWithThread.do?batchDate="+batchDate+"&nocache="+Math.random();
		form1.action = url;
		showProcessor();
		form1.submit();
	}
}

function openWin(batchId){
	var url = "${ROOT}/monitorStartOrgVoLog.do?batchId="+batchId+"&monitorId=${monitor.id}";
	window.location = url;
}

function ev_monitor(){
	window.location = "${ROOT}/viewFlowStartJob.do?monitorId=${monitor.id}";
}


function ev_showFlowBatch(obj){
	if(obj.value==""){
		alert("请选择批次");
		return;
	}
	//alert(obj.value);
	var url = "${ROOT }/monitorStartPlanSelectOrgVo.do?monitorId=${monitor.id}&id="+obj.value;
	parent.setSelectUser(url);
	//var ifram = window.parent.document.getElementById("iframe");//document.getElementById("iframe2");
	//ifram.contentWindow.src = "${ROOT }/monitorStartPlanSelectOrgVo.do?monitorId=${monitor.id}&id="+obj.value;
}

function autoResize(){
try{document.all["iframe"].style.height=iframe.document.body.scrollHeight}
catch(e){}
}

function refresh(){
	location.reload();
}

</script>
	<body onmousewheel='setScrollzheight();' class="LN_body">
		<form id="form1" name="form1" method="post" action="${ROOT}/watchMonitorStart.do">
			<input type="hidden" name="delegates" value=""/>
			<input type="hidden" name="monitorId" value="${monitor.id}"/>
			<table height="100%" width="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
			<td nowrap="nowrap">
			</td>
			<td nowrap="nowrap" align="left">
				<div><b>&nbsp;&nbsp;&nbsp;考核周期（批次）:</b>
				<select id="monitorList" name="monitorList" onchange="ev_showFlowBatch(this)">
				<option value="">-请选择-</option>
					<c:forEach items="${monitorList}" var="o" varStatus="idx">
						<option value="${o.id}<%=Globals.INFOS_SPLITOR_SM%>${o.freqYear}" label="${o.freqYear}">${o.freqYear}</option>
					</c:forEach>
				</select>	
				</div>								
			</td>
			</tr>
			</table>
					
					

		</form>
			<!--<iframe align="top" name="iframe" id="iframe" width="100%" frameborder="0"  height="500" src=""></iframe>
	--></body>
	
</html>

