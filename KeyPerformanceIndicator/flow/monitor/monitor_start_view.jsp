<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/flow.inc"%>
<html>
<head>
<title>流程发起日志</title>
</head>
	<body onmousewheel='setScrollzheight();'>
		<table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td>
        				<h2>流程发起自检信息确认</h2>
        			</td>
        		</tr>
        		<tr><td align="right"><page:route/></td></tr>
  			</tbody>
  		</table>
		<form id="form1" name="form1" method="post" action="">
		<input type="hidden" name="batchId" value="${param.batchId}" />
		<input type="hidden" name="flowCode" value="${param.flowCode}" />
		<input type="hidden" name="nodeCode" value="${param.nodeCode}" />
		<input type="hidden" name="recFlowSize" value="${recFlowSize}" />
      	<input type="hidden" name="flgFullScreen" value="${param.flgFullScreen }"/>
		<input type="hidden" name="turningUserId" value=""/>
      	<input type="hidden" name="turningHandlerName" value=""/>
			<logic:iterate id="b" name="boInfoList">
				<input type="checkbox" name="id" value="${b.worklistItemId }" boId="${b.boId }" style="display:none" checked/>
			</logic:iterate>
			
			<table height="100%" width="100%" border="0" cellpadding="0"
				cellspacing="0" class="define-box">
				<tr>
					<td height="560" valign="top" class="address-text-bg">
						<div class="address-depict">
							<table>
								<tr>
									<td><div>
										[<font color="red">${monitor.flow.flowName }</font>]流程
										<c:if test="${flag }">
										已于<bean:write name="batch" property="genDate" format="yyyy年MM月dd日hh时mm分"/>发起。
										</c:if>
										<c:if test="${!flag }">
										发起<font color="red">失败</font>!
										</c:if>
										<br/>
										<bean:size id="tSize" name="templateMap"/>
										<bean:size id="sSize" name="succLogList"/>
										<bean:size id="lSize" name="logList"/>
										流程关联<font color="red">${tSize }</font>张主考核表/绩效责任书/群组考核表，实际发起<font color="red">${sSize }</font>个被考核对象，<font color="red">${lSize }</font>个对象未发起。
									</div>
									</td>
								</tr>
							</table>
		
		<br/>
		关联模板的列表:
		<br/>
		<table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" width="8%">序号</td>
				<td class="list-title" width="50%">名称</td>
				<td class="list-title" width="42%">适用对象</td>
				
			</tr>
		<logic:iterate id="element" name="templateMap" indexId="index">
			<tr class="list-color${index%2==0?'1':'2'}">
				<td class="list-text1">${index+1 }</td>
				<td class="list-text1"><a title="${element.key.name }">${element.key.name }</a></td>
				<td class="list-text1">${element.value }</td>
			</tr>
		</logic:iterate>
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
		<c:forEach var="s" items="${succLogList}" varStatus="idx">
			<tr class="list-color${idx.index%2==0?'1':'2'}">
				<td class="list-text1">${idx.index+1 }</td>
				<td class="list-text1"><a title="${s.boName }">${s.boName }</a></td>
				<td class="list-text1">${s.orgVo.name }</td>
			</tr>
		</c:forEach>
		</table>
		<br/>
		未发起的日志列表:
		<br/>
		<table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" width="8%">序号</td>
				<td class="list-title" width="30%">名称</td>
				<td class="list-title" width="30%">适用对象</td>
				<td class="list-title" width="32%">原因</td>
			</tr>
		<c:forEach var="l" items="${logList}" varStatus="idx2">
			<tr class="list-color${idx2.index%2==0?'1':'2'}">
				<td class="list-text1">${idx2.index+1 }</td>
				<td class="list-text1"><a title="${l.boName }">${l.boName }</a></td>
				<td class="list-text1">${l.orgVo.name }</td>
				<td class="list-text1"><a title="${l.logContent }">${l.logContent }</a></td>
			</tr>
		</c:forEach>
		</table>	
		
		<br/><%--
		其他原因:<font color="red">${otherReason }</font>
						--%></div>
					</td>
				</tr>
			</table>

		</form>
	</body>
	<script>
		window.onload = function() {
			setPHeight();
		};
	</script>
</html>

