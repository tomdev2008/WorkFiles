<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.flow.service.IRecBatchService" %>
<%@ page import="com.shengdai.kpi.system.SpringHelper" %>
<jsp:directive.page import="com.shengdai.kpi.util.StringUtils"/>
<%
	//控制有未归档批次就不能修改
	String flowId = request.getParameter("flowCode");
	String disabled = "";
	if(!StringUtils.isEmpty(flowId)){
		IRecBatchService recBatchService = (IRecBatchService)SpringHelper.getBean("recBatchService");
		if(recBatchService.countUndoRecBatchByFlow(flowId)>0){
			disabled = "disabled";
		}
	}
	request.setAttribute("disabled",disabled);
 %>