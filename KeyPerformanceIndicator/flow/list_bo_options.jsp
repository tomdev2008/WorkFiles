<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*, com.shengdai.kpi.common.*,com.shengdai.kpi.flow.valueobject.*,com.shengdai.kpi.flow.service.*" errorPage=""%>
<%@ page import="com.shengdai.kpi.common.attach.AttachUtil" %>
<%@ include file="../common/head.inc"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<LINK rel="stylesheet" type="text/css" href="css/grid.css">
		<link rel="stylesheet" type="text/css" href="css/kpi_style.css">
		<title>流程提交意见</title>
	</head>
	
	<%
			try{
			IWorklistItemService worklistItemService = (IWorklistItemService)SpringHelper.getBean("worklistItemService");
			List listBoOptions = worklistItemService.listOptions(request.getParameter("id"),request.getParameter("nodeCode"));
			if(listBoOptions.size()==0) return;
			request.setAttribute("flwNodeMap",listBoOptions.get(0));
			request.setAttribute("map",listBoOptions.get(1));
			request.setAttribute("nodeSize",listBoOptions.get(2));
			

		}catch(Exception e){
		e.printStackTrace();
		}
			Map flwNodeMap = (Map) request.getAttribute("flwNodeMap");
			Map nodeSize = (Map) request.getAttribute("nodeSize");
		%>
	<body>
		<br>
			<logic:notEmpty name="map">
			<table height=23 cellSpacing=1 borderColorDark=#f4f5ff align="center" cellPadding=1 
			borderColorLight=#b5caff border=1 width="100%"  >
				<tr>
					<td colspan="4" align="center" height="24">
						<b>意见记录</b>
					</td>
				</tr>
				
					<logic:iterate id="list" name="map">
						<logic:iterate id="bean" name="list" property="value" indexId="index">
							<%WorklistItem worklistItem = (WorklistItem) bean;%>
							<tr>
								<logic:equal name="index" value="0">
									<td rowspan="<%=nodeSize.get(worklistItem.getNodeCode())%>" width="15%" nowrap align="center" valign="middle">
										<%out.print(flwNodeMap.get(worklistItem.getNodeCode()));%>
									</td>
								</logic:equal>
								<td width="10%" align="center" height="22">
									<bean:write name="bean" property="handlerName" />&nbsp;
								</td>
								<td align="left" width="60%" >
									<logic:empty name="bean" property="opinion">&nbsp;</logic:empty>
									<bean:write name="bean" property="opinion" />&nbsp;
								</td>
								<td id="uploadOpinion<%=worklistItem.getId()%>" width="15%" align="center" height="22">
									<%=
									AttachUtil.flowOpinionInfo(worklistItem.getId(),"false","false","uploadOpinion"+worklistItem.getId())
									 %>
									 &nbsp;
								</td>
							</tr>
						</logic:iterate>
					</logic:iterate>
				
			</table>
			</logic:notEmpty>
	</body>
</html>
