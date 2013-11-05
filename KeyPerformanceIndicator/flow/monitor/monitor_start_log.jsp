<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/flow.inc"%>

<html>
<head>
<title>流程发起日志</title>
</head>
	<body onload="setTemplateStat();">
		<form id="form1" name="form1" method="post" action="">
			<table height="100%" width="100%" border="0" cellpadding="0"
				cellspacing="0" class="define-box">
				<tr>
					<td class="dialog-titlebg">
						<div class="dialog-title">
							
							<input type="button" class="button2" value="返回" onclick="window.history.back();" />
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
										<c:if test="${flag }">
										已于<bean:write name="batch" property="genDate" format="yyyy年MM月dd日HH时mm分"/>发起。
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
				<td class="list-title" width="30%">适用对象</td>
				<!-- <td class="list-title" width="12%">是否发起</td> -->
				
			</tr>
		<logic:iterate id="element" name="templateMap" indexId="index">
			<tr class="list-color${index%2==0?'1':'2'}">
				<td class="list-text1">${index+1 }</td>
				<td class="list-text1"><a title="${element.key.name }">${element.key.name }</a></td>
				<td class="list-text1">${element.value }</td>
			<!-- 	<td class="list-text1"><a href="#${element.key.name }" name="templateStatus" templateName="${element.key.name }" style="color:red">未发起</a></td> -->
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
				<td class="list-text1"><a title="${s.boName }" name="success" checkName="${s.boName }">${s.boName }</a></td>
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
				<td class="list-text1"><a title="${l.boName }" name="fail" checkName="${l.boName }" >${l.boName }</a></td>
				<td class="list-text1">${l.orgVo.name }</td>
				<td class="list-text1"><a title="${l.logContent }">${l.logContent }</a>&nbsp;</td>
			</tr>
		</c:forEach>
		</table>	
	
		<br/>
		其他原因:<font color="red">${otherReason }</font>
						</div>
					</td>
				</tr>
			</table>

		</form>

	<script language="javascript">
	
	function setTemplateStat(){
		var templateStatusList = document.getElementsByName("templateStatus");
		
		var successList = document.getElementsByName("success");
		for(var i=0;i<successList.length;i++){
			var checkName = successList[i].checkName.split("_")[0];
			//alert(checkName);
			for(var j=0;j<templateStatusList.length;j++) {
				//alert(templateStatusList[j].templateName);
				if(successList[i].checkName.indexOf(templateStatusList[j].templateName) != -1) {
					templateStatusList[j].innerText="已发起";
					templateStatusList[j].style.color="#2262E8";
				}
			}
		}		
	}
	setTemplateStat();
	</script>
	</body>
</html>

