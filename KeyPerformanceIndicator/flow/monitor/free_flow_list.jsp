<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.system.*,com.shengdai.kpi.flow.valueobject.*" errorPage="" %>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ include file="/web/pub/flow.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>自由流列表</title>
</head>
<script type="text/javascript">
function viewFreeFlowMonitor(boId,userId,type,flowCode,flowType){
	//parent.location.href = "${ROOT}/flow/monitor/view_free_flow_monitor_top.jsp?batchId=<%=request.getParameter("batchId")%>&monitorId=<%=request.getParameter("monitorId")%>&boId="+boId+"&delegateId="+userId+"&delegateType="+type+"&flowCode="+flowCode+"&parentFlowCode=<%=request.getParameter("parentFlowCode")%>&type="+flowType;
	location.href="${ROOT}/viewFreeFlowMonitor.do?batchId=<%=request.getParameter("batchId")%>&monitorId=<%=request.getParameter("monitorId")%>&boId="+boId+"&delegateId="+userId+"&delegateType="+type+"&flowCode="+flowCode+"&parentFlowCode=<%=request.getParameter("parentFlowCode")%>&type="+flowType;
}

function ev_back(){
	location.href="${ROOT}/listWorklistForRecBatch.do?monitorId=<%=request.getParameter("monitorId")%>&id=<%=request.getParameter("batchId")%>";
}

</script>
<%
Map orgMap = (Map)request.getAttribute("orgMap");
Map typeMap = (Map)request.getAttribute("typeMap");
Map delegateOrgMap = (Map)request.getAttribute("delegateOrgMap");
Map delegateTypeMap = (Map)request.getAttribute("delegateTypeMap");
%>
<body>
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
	<tr> 
		<td align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
		<td width="500"> 			 
		<input type="button" class="button" value="退出" onclick="ev_back()" >
		</td>
		<td align="right"> 
		<input type="button" class="button" value="关闭" onclick="if(confirm('确定退出？')) window.close();" >
		</td>
	</tr></table></td></tr></table>
		     
<form id="form1" name="form1" method="post" action="">
<div class="title" align="center">自由流流程信息</div>
  <table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
    <tr>      
      <td align="center" width="25%">被考核对象</td>
      <td align="center" width="50%">处理流程</td>
      <td align="center" width="25%">创建时间</td>
    </tr>
    <%
    Set orgSet = orgMap.keySet();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    for(Iterator iterator = orgSet.iterator();iterator.hasNext();){
      String boId = (String) iterator.next();
      OrgVo orgVo = (OrgVo)orgMap.get(boId);
      RecFlow recFlow = (RecFlow)typeMap.get(boId);
      RecFlow delegateRecFlow = (RecFlow)delegateTypeMap.get(boId);
      OrgVo delegateOrgVo = (OrgVo)delegateOrgMap.get(boId);
      if(delegateOrgVo==null) continue;
    %>
    <tr>      
      	<td align="center" ><a href="javascript:viewFreeFlowMonitor('<%=delegateRecFlow.getBoId()%>','<%=delegateOrgVo.getId()%>','<%=delegateOrgVo.getOrgType()%>','<%=delegateRecFlow.getFlowCode()%>','<%=request.getParameter("type") %>');"><font color=blue ><%=orgVo.getDisplayName()%></font></a></td>
    	<td ><%=recFlow.getFlowName()%></td>
    	<td align="center"><%=sdf.format(recFlow.getGenDate())%></td>
    </tr>
    <%
    }
    %>
  </table>
</form>
</body>
</html>
