<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
	<head>
		<title>流程发起</title>
	</head>
	<script language="javascript">
function startBatch(monitorId,operType){
	var batchDate = getSelectBatch();
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
</script>
	<body>
		<form id="form1" name="form1" method="post" action="${ROOT}/watchMonitorStart.do">
			<input type="hidden" name="delegates" value=""/>
			<input type="hidden" name="monitorId" value="${monitor.id}"/>
			<table height="100%" width="100%" border="0" cellpadding="0"
				cellspacing="0" class="define-box">
				<tr>
					<td class="dialog-titlebg">
						<div class="dialog-title">
							<input type="button" class="button6" value="同步发起" onclick="startBatch('${monitor.id }',0);" title="屏蔽当前页面，发起新的考核批次"/>
						</div>
					</td>
				</tr>
					<tr>
						<td width="100%" nowrap="nowrap">
						发起考核频度<page:singleBatchLN batch1="0" batchType="${batchType}"/>
						</td>
					</tr>
				<tr>
					<td height="560" valign="top" class="address-text-bg">
						<div class="address-depict">

							<table width="100%" border="0" align="center">
								<tr>
									<td align="left">
										流程名称：
										<font color="#CC3300">${monitor.flow.flowName}
										</font>
									</td>
								</tr>
							</table>
							<table class="list-box" cellspacing="0" border="0">
								<tr>

									<td class="list-title" width="50%">
										考核周期
									</td>
									<td class="list-title" width="25%">
										发起时间
									</td>
									<td class="list-title" width="25%">
										归档时间
									</td>
								</tr>
								<c:forEach var="o" items="${batchList}" varStatus="idx">
									<tr class="list-color${idx.count%2==0?1:2}">
									<td class="list-text1" align="left">
										<a href="javascript:void(0)" onclick="openWin('${o.id}')">${o.bacthDateToDesc}</a>
									</td>
									<td class="list-text1" align="left">
									<fmt:formatDate value="${o.genDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td class="list-text1" align="left">
									<fmt:formatDate var="archiveDate" value="${o.archiveDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									${o.status==1?'未归档':archiveDate}
									</td>
									</tr>
								</c:forEach>
							</table>
							<kpi:page-bar formId="form1" />
						</div>
					</td>
				</tr>
			</table>

		</form>
	</body>
</html>

