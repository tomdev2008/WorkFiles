<%@ page contentType="text/html;charset=utf-8" language="java" import="com.shengdai.kpi.flow.valueobject.*, com.shengdai.kpi.flow.service.*"%>
<%@ page import="com.shengdai.kpi.common.SpringHelper" %>
<%@ include file="/web/pub/flow.inc" %>
<SCRIPT src="${ROOT}/common/js/Check.js" type=text/javascript></SCRIPT>
<html>
<head>
<title>流程批次监控管理</title>
</head>
<%
String monitorId = request.getParameter("id");
String flowCode = request.getParameter("flowCode");
if(monitorId==null||monitorId.equals("")){
IMonitorService monitorService = (IMonitorService)SpringHelper.getBean("monitorService");
System.out.println(flowCode);
monitorId = monitorService.findMonitorByFlowId(flowCode).getId();
}
%>
<script language="javascript">

function ev_save(){
if(CheckForm(formFrame.functionForm)){
		formFrame.functionForm.action = "${ROOT}/updateMonitor.do";
	formFrame.functionForm.submit();
	}
}

function ev_exit(){
<%
if(request.getParameter("isFlowIn")==null||request.getParameter("isFlowIn").equals("")){
%>
location.href = "${ROOT}/flow/flow.jsp";
<%
}else{
%>
location.href="${ROOT}/flow/flow.jsp";
<%
}
%>

}

function view_flow(){
location.href = "${ROOT}/flow/flow_view_frame.jsp?flowCode=<%=flowCode%>";
}

</script>

<body class="command_body">
<table width="100%" height="100%"   cellpadding=0 border=0>
  <tr>
  	<td width="100%" height="5%" valign="top" colspan="2">
    <table cellpadding=0 cellspacing=0 width="100%" border="0" bgcolor="#eceae6" class="toolBar1">
      <tr>
		<td>
		<table id="toolBar" border="0">
	    <tr>
		  <td class="coolButton" align="left" width="3"><img src="${ROOT}/web/flow/img/toolbar.gif"></td>
			<td class="coolButton" onaction="javascript:ev_save()" id="newbtn">保存</td>
			<td class="coolButton" onaction="javascript:view_flow()" id="newbtn">查看流程</td>				
			<td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">退出</td>                   
		  </tr>
		</table>
		</td>
	   </tr>
	</table>    
    </td></tr>
  <tr>
	 	<td width="100%">
		<IFRAME name=formFrame src="${ROOT}/editMonitor.do?isFlowIn=<%=request.getParameter("isFlowIn")%>&id=<%=monitorId%>" width="100%" height="100%"></IFRAME>
 	</td></tr>
</table>

</body>

<SCRIPT language=javascript>
  //创建按钮
  var cells = document.getElementById("toolBar").rows[0].cells;
  for (var i = 1; i < cells.length; i++){
     createButton(cells[i]);
  }

</SCRIPT>
</html>
