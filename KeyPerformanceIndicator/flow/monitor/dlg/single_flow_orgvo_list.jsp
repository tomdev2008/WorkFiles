<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>单独发起流程列表</title>
	<%@ include file="/web/pub/head.inc"%>
	<%@ include file="/flow/secure.inc" %>
</head>
<script language="JavaScript" type="text/javascript">
window.name = "flowSingleWin";
function FF_Start(btn){
	if(SelectUtil.checkedCount("delegate")>0){
		showProcessor();
		form1.submit();
	}else{
		alert("请先选择要发起的考核对象！");
	}
}
function FF_Add(){
	getAddressList("${busi.scopeType}",'n','3','orgNames','orgInfos');
	var orgs = document.getElementById("orgInfos").value;
	if(orgs.trim()=="") return;
	showProcessor();
	form1.action = "${ROOT}/startFlowSingleAddOrgVo.do";
	form1.submit();
}

function FF_Back(){
		location.href="${ROOT}/listWorklistForRecBatch.do?monitorId=${recBatch.monitor.id}&id=${recBatch.id}"+urlPara;
}
</script>
	<body>
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
          <input id='btnStart' type="button" class="button2" value="发 起" onclick="FF_Start(this);" />
          <input id='btnAdd' type="button" class="button2" value="添 加" onclick="FF_Add();" />
          <input id='btnBack' type="button" class="button2" value="返 回" onclick="FF_Back();" />
          </div></td>
        </tr>
        <tr>
          <td height="560" valign="top" class="address-text-bg"><div class="address-depict1">	
	
		<form id="form1" name="form1" method="post" action="${ROOT}/startFlowSingleByOrgVo.do" target="flowSingleWin">
		<input type="hidden" name="monitorId" value="${recBatch.monitor.id}"/>
		<input type="hidden" name="batchId" value="${recBatch.id}"/>
		<input type="hidden" name="orgInfos" value=""/>
		<input type="hidden" name="orgNames" value=""/>
		<input type="hidden" name="busiId" value="${busi.id}"/>
		<center class="title"><bean:write name="recBatch" property="batchName"/></center>
		<br/>
		未发起的考核对象列表:
		<br/>
		<table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" width="8%">序号<input type="checkbox" id="selectedHandler"  onclick="SelectUtil.checkAll(this,'delegate');"/></td>
				<td class="list-title" width="30%">考核对象名称</td>
				<td class="list-title" width="32%">未发起原因</td>
			</tr>
		<c:set var="idxCount" value="0"/>
		<c:forEach var="l" items="${batchLogs}" varStatus="idx2">
		<c:if test="${l.flgStatus==0}">
		<c:set var="idxCount" value="${idxCount+1}"/>
			<tr class="list-color${idx2.index%2==0?'1':'2'}">
				<td class="list-text1">${idxCount}<input type="checkbox" value="${l.addressInfo}" name="delegate" /></td>
				<td class="list-text1">${l.orgVo.name }</td>
				<td class="list-text1"><a title="${l.logContent }">${l.logContent }</a>&nbsp;</td>
			</tr>
		</c:if>
		</c:forEach>
		</table>
		</form>	
          </div></td>
        </tr>
      </table>
	</body>
</html>
