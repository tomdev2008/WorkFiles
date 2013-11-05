<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<%@ include file="../common/head.inc"%>
<html>
<head>
<title>修改已归档流程是否在监控中可见</title>
<SCRIPT src="${ROOT}/common/js/commonfunction.js" type=text/javascript></SCRIPT>
<SCRIPT src="${ROOT}/document/dlg/doc_functions.js" type=text/javascript></SCRIPT>
<script src="${ROOT}/component/calendar/Calendar.js"></script>
<script type="text/javascript" src="${ROOT}/common/js/Check.js"></script>
<script  src="${ROOT}/component/dhtmlxTree/js/prototype.js"></script>
<script>
function ev_save(){
	var url="flow_archived_open_save.jsp";
	form1.action=url;
	form1.submit();
}
function ev_close()
{
	if(confirm("你确定关闭吗？"))
	window.close();
}
</script>
</head>
<body leftMargin=0 topMargin=0>
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
   <tr> 
     <td class=coolButton align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
     <td class=coolbutton id=search width="380" >
	 <div id="buttons">
	 <input type="button" class="button" value="保存" onclick="javascript:ev_save();">
	 </div>  
	 </td>
	 <td align="right"><input type="button" class="button" value="关闭" onclick="javascript:ev_close();">
     </td></tr></table></td></tr></table>
<form name="form1" method="post">
<div align="center" class="title" id="title"></div><br>

<table align="center" border="0" cellspacing="0" cellpadding="0" >
  <tr height="27">
	<td align="right">修改已归档流程是否在监控中可见：</td>
	<td align="left">
		<select name="archivedOpen">
			<option value="true" <%if("true".equals(Globals.getProperty("assess.archived-open"))) out.println("selected"); %>>是</option>
			<option value="false" <%if("false".equals(Globals.getProperty("assess.archived-open"))) out.println("selected"); %>>否</option>
		</select>
	</td>
  </tr>
</table>
</form>
</body>
</html>
