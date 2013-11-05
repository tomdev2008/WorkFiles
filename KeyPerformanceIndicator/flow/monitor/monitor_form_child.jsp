<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.system.Globals"/>
<jsp:directive.page import="com.shengdai.kpi.flow.service.IFlowService"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwFlow"/>
<jsp:directive.page import="com.shengdai.kpi.system.util.OrgTree"/>
<jsp:directive.page import="com.shengdai.kpi.system.service.IGroupService"/>
<jsp:directive.page import="com.shengdai.kpi.system.valueobject.Group"/>
<%@ include file="/web/pub/flow.inc"%>
<%
	IGroupService groupService = (IGroupService)SpringHelper.getBean("groupService");
	Group group =groupService.findGroupById(Group.ROOT_GROUP_ID);
 %>
<html>
<head>
<title>监控管理</title>
</head>
<SCRIPT src="${ROOT}/common/js/Check.js" type=text/javascript></SCRIPT>
<script type="text/javascript">

function ev_save(){

}

function ev_exit(){
	window.parent.location="monitor_list.jsp";
}

function showDocTemplet(){
	var url = "${ROOT}//listTempletForDoc.do?groupId=1";
	var value = window.showModalDialog(url,null,"dialogHeight:500px;dialogWidth:720px;status=off");
	document.all.scope_id.value = value;
	document.all.scope.value = value;
}
</script>
<body bgColor=#f0f0f0 leftMargin=0 topMargin=3>
<form name="functionForm" action="" target="_self" method="post">


<center><font size="3pt" color="#666666"><b><u>
流程监控信息
</u></b></font></center>
	
<table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
<tr>
	<td><br>
    <DIV class=tab-pane id=tabPane1>
    <SCRIPT type=text/javascript>	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );</SCRIPT>
    	
  <DIV class=tab-page id=tabPage1>
    <H2 class=tab>基本配置</H2>
    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
	<!-- 这里嵌套功能菜单基本配置 -->
	<table width="100%" class=box  style='font-size:9pt' border="0" cellspacing="1" cellpadding="5" align="center">
 	  <tr>
      <td height="22" valign=top colspan="2" nowrap class="tdbulef">
         用下面的表格修改功能<b>流程监控</b>的属性。红星（<font color="#FF0000">*</font>）是必填。 </td>
    </tr>	
    <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <font color="red" size="2">*</font><FONT size="2">监控名</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
				<input type="text" size="40" name="monitorName" check="notBlank" showName="监控名" required="true"/>
      </td>
    </tr>
    <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <font color="red" size="2">*</font><FONT size="2">流程</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
				<select name="flowCode" showName="流程" required="true"><option value="">请下拉选择绑定的流程</option>
				<%
				IFlowService service = (IFlowService)SpringHelper.getBean("flowService");
				List list =service.listFlows();
				for(int i=0; i<list.size(); i++){
					FlwFlow flow = (FlwFlow)list.get(i);
					out.println("<option value=\"" + flow.getId() +"\">" + flow.getFlowName() + "</option>");
				}
			%>
				</select>
      </td>
    </tr>
    <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <font color="red" size="2">*</font><FONT size="2">频度</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
				<select name="frequency" showName="频度" required="true">
					<option value="<%=Globals.FREQUENCY_YEAR%>">年度</option>
					<option value="<%=Globals.FREQUENCY_QUARTER%>">季度</option>
					<option value="<%=Globals.FREQUENCY_DOUBLE_MONTH%>">双月度</option>
					<option value="<%=Globals.FREQUENCY_MONTH%>">月度</option>
					<option value="<%=Globals.FREQUENCY_10_DAYS%>">旬</option>
					<option value="<%=Globals.FREQUENCY_WEEK%>">周</option>
				</select>
      </td>
    </tr>
    <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <FONT size="2">自动发起考核</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
				<input type="radio" name="flgAuto" value="1">是&nbsp;
				<input type="radio" name="flgAuto" value="0">否
      </td>
    </tr>
		<tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <FONT size="2">自动发起时间</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
				<select name="autoMonth">
					<option value="0">本月</option>
					<option value="1">下月</option>
					<option value="-1">上月</option>
				</select>&nbsp;
				<input type="text" name="autoDate" size="3" maxlength="2"/>日&nbsp;
				<input type="text" name="autoHour" size="3" maxlength="2"/>时&nbsp;
				<input type="text" name="autoMinitue" size="3" maxlength="2"/>分&nbsp;
      </td>
    </tr>
     <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <FONT size="2">自动导入上月考核时限</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
				<input type="radio" name="auto" value="1">是&nbsp;
				<input type="radio" name="auto" value="0">否
      </td>
    </tr>
     <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <FONT size="2">自动控制批量提交</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
				<input type="radio" name="flgFromPreviouse" value="1">是&nbsp;
				<input type="radio" name="flgFromPreviouse" value="0">否
      </td>
    </tr>
    <tr>
      <td height="22" valign=top  valign="top" ALIGN="right" width="85" > <font size="2">
      绑定文档模板</font> </td>
      <td height="22" valign=top width="427">
			<textarea name="scope" rows="3" cols="50"></textarea>
			<input type="button" class="button" value="选择" 
				onclick="showDocTemplet()">		
			<input type="hidden" name="scope_id" > 
		</td>
    </tr>
  </table>
  </DIV>
	
	</DIV><!-- 	整个TAB结束 -->
	</td>
</tr>
</table>
</form>
</body>
</html>

