<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ include file="/web/pub/flow.inc" %>
<SCRIPT src="${ROOT}/common/js/Check.js" type=text/javascript></SCRIPT>
<html>
<head>
<title>流程批次监控管理</title>
</head>

<script language="javascript">

function ev_save(){
if(CheckForm(formFrame.functionForm)){
	formFrame.functionForm.action = "${ROOT}/createMonitor.do";
	formFrame.functionForm.submit();
	}
}
function ev_exit(){
location.href = "${ROOT}/flow/monitor/monitor_list.jsp";
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
			<td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">退出</td>                   
		  </tr>
		</table>
		</td>
	   </tr>
	</table>    
    </td></tr>
  <tr>
	 	<td width="100%">
		<IFRAME name=formFrame src="monitor_form_child.jsp" width="100%" height="100%"></IFRAME>
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
