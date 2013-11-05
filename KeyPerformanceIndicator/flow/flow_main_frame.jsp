
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/flow/secure.inc" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String flowCode = request.getParameter("flowCode");
String entrysUri = "";
String treeUri = "";
if(flowCode==null||flowCode.equals("")||flowCode.equals("null")){
entrysUri = request.getContextPath()+"/listFlowPage.do?"+urlPara;
treeUri = request.getContextPath()+"/listFlowTree.do?flowCode="+flowCode+urlPara;
}else{
entrysUri = request.getContextPath()+"/flowEditPage.do?flowCode="+flowCode+urlPara;
treeUri = request.getContextPath()+"/listFlowTree.do?flowCode="+flowCode+urlPara;
}
%>

<frameset cols="*,25%"  frameborder="no" border="0" framespacing="0">
  <frame src="<%=entrysUri%>" name="Entrys" scrolling="no" noresize="noresize">
  <frame src="<%=treeUri%>" name="tree" scrolling="yes">
</frameset>
<noframes><body>
</body>
</noframes>