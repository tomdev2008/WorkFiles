<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.system.Globals"/>
<jsp:directive.page import="com.shengdai.kpi.flow.service.IFlowService"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="java.util.List,com.shengdai.kpi.flow.valueobject.Monitor"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwFlow"/>
<%@ include file="/web/pub/flow.inc"%>
<%
 %>
<html>
<head>
<title>监控管理</title>
</head>

<script type="text/javascript">

function ev_save(){

}

function ev_exit(){
	window.parent.location="monitor_list.jsp";
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
      <INPUT type="hidden" name="id" value="<bean:write name="monitor" property="id"/>"/>
				<input type="text" size="40" name="monitorName" value="<bean:write name="monitor" property="monitorName"/>" check="notBlank" showName="监控名" required="true"/>
      </td>
    </tr>
    <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <font color="red" size="2">*</font><FONT size="2">流程</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
      <%
      Monitor monitor = (Monitor)request.getAttribute("monitor");
      if(request.getParameter("isFlowIn")==null||request.getParameter("isFlowIn").equals("")){
     
      %>
				<select name="flowCode" showName="流程" required="true"><option value="">请下拉选择绑定的流程</option>
				<%
				IFlowService service = (IFlowService)SpringHelper.getBean("flowService");
				List list =service.listFlows();
				for(int i=0; i<list.size(); i++){
					FlwFlow flow = (FlwFlow)list.get(i);
					if(monitor.getFlow().getFlowCode().equals(flow.getFlowCode())){
					out.println("<option value=\"" + flow.getId() +"\" selected>" + flow.getFlowName() + "</option>");
					}else{
					out.println("<option value=\"" + flow.getId() +"\">" + flow.getFlowName() + "</option>");
					}
				}
			%>
				</select>
				<%
				}else{
				 out.print(monitor.getFlow().getFlowName());
                 }
				%>
      </td>
    </tr>
    <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <font color="red" size="2">*</font><FONT size="2">频度</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
      <html:select name="monitor" property="frequency">
      <html:option value="0">年度</html:option>
      <html:option value="10">季度</html:option>
      <html:option value="20">双月度</html:option>
      <html:option value="30">月度</html:option>
      <html:option value="40">旬</html:option>
      <html:option value="50">周</html:option>
      </html:select>
      </td>
    </tr>
    <tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <FONT size="2">自动发起考核</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
      <html:radio name="monitor" property="flgAuto" value="1">是</html:radio>&nbsp;
       <html:radio name="monitor" property="flgAuto" value="0">否</html:radio>
      </td>
    </tr>
		<tr>
      <td height="22" valign=top align="right" nowrap width="85" >
      <FONT size="2">自动发起时间</FONT> </td>
      <td height="22" valign=top valign="top" width="427">
      <html:select name="monitor" property="autoMonth">
      <html:option value="0">本月</html:option>
      <html:option value="1">下月</html:option>
      <html:option value="-1">上月</html:option>
      </html:select>&nbsp;
				<input type="text" name="autoDate" size="3" maxlength="2" value="<bean:write name="monitor" property="autoDate"/>"/>日&nbsp;
				<input type="text" name="autoHour" size="3" maxlength="2" value="<bean:write name="monitor" property="autoHour"/>"/>时&nbsp;
				<input type="text" name="autoMinitue" size="3" maxlength="2" value="<bean:write name="monitor" property="autoMinitue"/>"/>分&nbsp;
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
            <html:radio name="monitor" property="flgFromPreviouse" value="1">是</html:radio>&nbsp;
       <html:radio name="monitor" property="flgFromPreviouse" value="0">否</html:radio>
      </td>
    </tr>
    <tr>
      <td height="22" valign=top  valign="top" ALIGN="right" width="85" > <font size="2">
      绑定文档模板</font> </td>
      <td height="22" valign=top width="427">
			<textarea name="scope" rows="3" cols="50"></textarea>
			<input type="button" class="button" value="选择" 
				onclick="showAddrAndScript('scope','scope_id','0','')">		
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

