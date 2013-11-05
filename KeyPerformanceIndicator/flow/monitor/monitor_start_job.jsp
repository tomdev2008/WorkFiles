<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/flow.inc"%>
<html>
	<head>
		<title>流程发起任务监控</title>
	</head>
<script language="javascript">
	/**
	  * 返回按钮
	  **/
	function ev_back(){
		window.location = "${ROOT}/watchMonitorStart.do?id=${monitor.id}";
	}
	/**
	  * 撤销发起按钮
	  **/
	function ev_undo(){
		if(SelectUtil.checkedCount('jobId') > 0) {
			var checkDOM = $_EN("jobId");
			if(checkDOM){
				for(var i=0;i<checkDOM.length;i++){
					if(checkDOM[i].checked && checkDOM[i].vstatus==2){
						alert(checkDOM[i].batchDesc+"正在发起中不可撤销发起！");
						return false;
					}
				}
			}
			$_E("form1").action = "${ROOT}/undoFlowStartJob.do";
			$_E("form1").submit();
		}else{
			alert("请先选择要进行操作的项!");
		}
	}
	
	function ev_showLog(index){
		var log = $_E("errorLog"+index);
		if(log){
			if(log.style.display=='none') log.style.display='';
			else log.style.display='none';
		} 
	}
</script>
	<body>
		<form id="form1" name="form1" method="post" action="">
		<input type="hidden" name="monitorId" value="${monitor.id}" />
		<input type="hidden" name="busiId" value="${monitor.flow.commBusi.id}"/>
			<table height="100%" width="100%" border="0" cellpadding="0"
				cellspacing="0" class="define-box">
				<tr>
					<td class="dialog-titlebg">
						<div class="dialog-title">
						<input type="button" class="button4" value="撤销发起" onclick="ev_undo();" />
						<input type="button" class="button2" value="返回" onclick="ev_back();" />
						</div>
					</td>
				</tr>
				<tr>
					<td height="560" valign="top" class="address-text-bg">
						<div class="address-depict">
							<table width="100%" border="0" align="center">
								<tr>
									<td align="left">
										流程名称：<font color="#CC3300">${flow.flowName}</font>
									</td>
								</tr>
							</table>
							<table class="list-box" cellspacing="0" border="0">
								<tr>
									<td class="list-title" width="10%">序号
									<input type="checkbox" id="checkAllHandler" class="checkboxInput" onclick="checkAll(this.id, 'jobId');"
									</td>
									<td class="list-title" width="20%">创建时间</td>
									<td class="list-title" width="20%">发起时间</td>
									<td class="list-title" width="20%">发起类型</td>
									<td class="list-title" width="15%">发起人</td>
									<td class="list-title" width="20%">发起地址</td>
									<td class="list-title" width="15%">状态</td>
								</tr>
								<c:forEach var="o" items="${monitor.flowJobs}" varStatus="idx">
									<tr class="list-color${idx.count%2==0?'1':'2'}" ondblclick="ev_showLog(${idx.count});">
										<c:set var="fontColor" value="${o.status==4?'red':''}"></c:set>
										<td class="list-text1" style="color:${fontColor}">${idx.count}
										<input type="checkbox" name="jobId" value="${o.id}" vstatus="${o.status}" batchDesc="${o.batchDateDesc}" />
										</td>
										<td class="list-text1" style="color:${fontColor}"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
										<td class="list-text1" style="color:${fontColor}">
										<c:if test="${o.status!=1}">
										<fmt:formatDate value="${o.startDate}" pattern="yyyy-MM-dd HH:mm"/>
										</c:if>&nbsp;</td>
										<td class="list-text1" style="color:${fontColor}">${o.batchDateDesc}&nbsp;</td>
										<td class="list-text1" style="color:${fontColor}">${o.createName}&nbsp;</td>
										<td class="list-text1" style="color:${fontColor}">${o.createIp}&nbsp;</td>
										<td class="list-text1" style="color:${fontColor}">${o.statusDesc}&nbsp;</td>
									</tr>
									<c:if test="${o.status==4}">
									<tr id="errorLog${idx.count}" style="display:'';color:red;">
										<td>&nbsp;</td>
										<td colspan="6" >
											<textarea rows="4" cols="70">${o.recordLog}</textarea>
										</td>
									</tr>
									</c:if>
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

