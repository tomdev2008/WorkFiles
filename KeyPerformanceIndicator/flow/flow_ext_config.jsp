<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="GBK"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.flow.service.IFlowService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<%@ include file="/web/pub/flow.inc"%>
<%
	String mainId = request.getParameter("mainId");
	if(request.getAttribute("flowNodeExtList")==null){		
		IFlowService flowService = (IFlowService)SpringHelper.getBean("flowService");
		List flowNodeExtList = flowService.listExts(mainId);
		pageContext.setAttribute("flowNodeExtList", flowNodeExtList);
	}
%>
<table id=tabPro height=23 cellSpacing=1 borderColorDark=#f4f5ff align="center" cellPadding=1 width="100%" borderColorLight=#b5caff border=1>
  <tr>
	<td class="title-header" align="center" width="40%" height="22" >
	参数名称
	</td>
	<td class="title-header" align="center" width="30%" >
	参数显示名
	</td>
	<td class="title-header" align="center" width="15%" >
	参数值
	</td>
	<td class="title-header" align="center" width="15%" >
	操作
	</td>
  </tr>
  <logic:iterate id="ext" name="flowNodeExtList" >
  <tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td align="center" width="30%" height="20">
		<bean:write name="ext" property="paraName" />
	</td>
	<td align="center" width="20%">
		<bean:write name="ext" property="paraDisName" />
	</td>
	<td align="center" width="20%">
		<bean:write name="ext" property="paraValue"/>
	</td>
	<td align="center" width="10%">
		<a href="javascript:editNodeExt('<bean:write name="ext" property="id"/>');" title="编辑参数"><img src="${ROOT}/web/flow/img/edit.gif" border="0"></a> <a
		href="javascript:deleteNodeExt('<bean:write name="ext" property="id"/>');"><img src="${ROOT}/web/flow/img/delete_1.gif" border="0"></a>
	</td>
  </tr>
  </logic:iterate>
</table>
<input type='button' name='add_attach_button' onclick="javascript:add_para('<%=mainId %>');" value='新增' class="button">