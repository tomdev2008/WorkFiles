<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/flow.inc"%>
<%@ include file="/flow/secure.inc" %>
<html>
<head>
<title>流程发起日志</title>
<script language="JavaScript" type="text/javascript">
function FF_Monitor(){
	location.href="${ROOT}/listWorklistForRecBatch.do?monitorId=${batch.monitor.id}&id=${batch.id}"+urlPara;
}
</script>
</head>
	<body onload="setTemplateStat();">
		<form id="form1" name="form1" method="post" action="">
			<table height="100%" width="100%" border="0" cellpadding="0"
				cellspacing="0" class="define-box">
				<tr>
					<td class="dialog-titlebg">
						<div class="dialog-title">
						<c:if test="${!(batch.monitor.id==null || batch.id==null || batch.monitor.id=='' || batch.id=='')}">
							<input type="button" class="button2" value="监 控" onclick="FF_Monitor();" ${batch.status==2?"disabled='true'":""}/>
						</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td valign="top" class="address-text-bg">
						<div>
							<table>
								<tr>
									<td><div>
										[<font color="red">${monitor.flow.flowName }</font>]流程
										发起于<bean:write name="batch" property="genDate" format="yyyy年MM月dd日HH时mm分"/>,考核周期[
										<font color="red">${batch.bacthDateToDesc}</font>]。
										<br/>
									</div>
									</td>
								</tr>
							</table>
		<br/>
		已经发起的考核表列表:
		<br/>
		<table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" width="8%">序号</td>
				<td class="list-title" width="50%">名称</td>
				<td class="list-title" width="42%">被考核对象</td>
			</tr>
		<c:set var="idxCount1" value="0"/>
		<c:forEach var="s" items="${logList}" varStatus="idx">
			<c:if test="${s.flgStatus==1}">
			<c:set var="idxCount1" value="${idxCount1+1}"/>
			<tr class="list-color${idx.index%2==0?'1':'2'}">
				<td class="list-text1">${idxCount1}</td>
				<td class="list-text1"><a title="${s.boName }" name="success" checkName="${s.boName }">${s.boName }</a></td>
				<td class="list-text1">${s.orgVo.name }</td>
			</tr>
			</c:if>
		</c:forEach>
		</table>
		
		
		<br/>
		未发起的考核对象列表:
		<br/>
		<table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" width="8%">序号</td>
				<td class="list-title" width="30%">考核对象名称</td>
				<td class="list-title" width="32%">原因</td>
			</tr>
		<c:set var="idxCount" value="0"/>
		<c:forEach var="l" items="${logList}" varStatus="idx2">
		<c:if test="${l.flgStatus==0}">
		<c:set var="idxCount" value="${idxCount+1}"/>
			<tr class="list-color${idx2.index%2==0?'1':'2'}">
				<td class="list-text1">${idxCount}</td>
				<td class="list-text1">${l.orgVo.name }</td>
				<td class="list-text1"><a title="${l.logContent }">${l.logContent }</a>&nbsp;</td>
			</tr>
		</c:if>
		</c:forEach>
		</table>	
	
		<br/>
		其他原因:<font color="red">${otherReason }</font>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

