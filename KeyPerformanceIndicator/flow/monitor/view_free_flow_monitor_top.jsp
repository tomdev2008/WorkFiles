<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<title>流程批次监控管理</title>
</head>

<script language="javascript">

function ev_add(){
	location.href="${ROOT}/flow/monitor/monitor_form.jsp";
}

function ev_update(){
var ids = listFrame.getAllChecked('checkname');
if(ids==""){
alert("请您选择要修改的一项!!");
return;
}
var idArray = ids.split(",");
if(idArray.length>1){
alert("只能选择一项!!");
return;
}
location.href="${ROOT}/flow/monitor/monitor_edit_form.jsp?id="+idArray[0];
}

function ev_del(){
var ids = listFrame.getAllChecked('checkname');
if(ids=="") {alert("请您选择要删除的记录!");return;}
  if (confirm("您确认要删除记录？")) { 
listFrame.form1.action="${ROOT}/deleteMonitor.do?ids="+ids;
listFrame.form1.submit();
 }else{
    return;
    }
}

function ev_exit(){

location.href="${ROOT}/flow/monitor/free_flow_monitor_top.jsp?monitorId=<%=request.getParameter("monitorId")%>&batchId=<%=request.getParameter("batchId")%>&parentFlowCode=<%=request.getParameter("parentFlowCode")%>&type=<%=request.getParameter("type")%>";

}

function ev_save(){
listFrame.saveRecBatchLimit();
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
			<td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">退出</td>                   
		  </tr>
		</table>
		</td>
	   </tr>
	</table>    
    </td></tr>
  <tr>
	 	<td width="100%">
		<IFRAME name=listFrame src="${ROOT}/viewFreeFlowMonitor.do?boId=<%=request.getParameter("boId")%>&delegateId=<%=request.getParameter("delegateId")%>&delegateType=<%=request.getParameter("delegateType")%>&flowCode=<%=request.getParameter("flowCode")%>" width="100%" height="100%"></IFRAME>
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
