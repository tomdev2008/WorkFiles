<%@ page contentType="text/html;charset=utf-8" language="java"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>流程自动发起任务列表</title>
<script type="text/javascript" >
function FF_Show(id){
	window.showModalDialog("${ROOT}/showSystemAutoTaskLog.do?agentId="+id,window,"dialogWith:600px;dialogHeigth:600px;status:no;");
}
</script>
</head>
<body onmousewheel="setScrollzheight();">
<form name="form1" method="post">
  <table border="0" cellspacing="0" cellpadding="0" class="list-top">
    <tr>
      <td><h2>[${monitor.name}]自动发起任务列表</h2></td>
    </tr>
  </table>
  <table class="list-box" cellspacing="0" cellpadding="0" border="0" id="ctl03_GridViewUserList">
	<tr>
	  <td class="list-title" width="5%">序号</td>
	  <td class="list-title" width="50%">任务名称</td>
	  <td class="list-title" width="10%">发起批次</td>
	  <td class="list-title" width="15%">计划发起时间</td>
	  <td class="list-title" width="10%">是否处理</td>
	  <td class="list-title" width="10%"></td>
	</tr>
	<logic:iterate id="jobFlow" name="jobFlowList" indexId="index">
	<tr class="list-color${index%2==0?'1':'2' }">
	  <td class="list-text1">${index+1}</td>
	  <td class="list-text1">${jobFlow.jobName }</td>
	  <td class="list-text1"> ${jobFlow.batchDateDesc }</td>
	  <td class="list-text1"><bean:write name="jobFlow" property="flowStartTime" format="yyyy-MM-dd HH:mm"/></td>
	  <td class="list-text1">${jobFlow.handlerDesc }</td>
	  <td class="list-text1"><a href="#" style="color:blue;" onclick="FF_Show('${jobFlow.id}');return false;">${jobFlow.flgHandler==1?"发起日志":""}</a></td>
	</tr>
	</logic:iterate>
  </table>
  <kpi:page-bar formId="form1" />
</form>

</body>
</html>
