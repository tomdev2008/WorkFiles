<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<title>流程定义</title>
</head>

<%
String orgId=request.getParameter("orgId");  //群组id
String flowCode = request.getParameter("flowCode");
String busiId = request.getParameter("busiId");
String topUri = "";
String buttomUri = "";
if(flowCode==null||flowCode.equals("")){
topUri = request.getContextPath()+"/flow/flow_form_add_top.jsp?orgId="+orgId+"&busiId="+busiId;
buttomUri = request.getContextPath()+"/flow/flow_main_frame.jsp?busiId="+busiId+"&orgId="+orgId;
}else{
topUri = request.getContextPath()+"/flow/flow_form.jsp?flowCode="+flowCode+"&busiId="+busiId+"&orgId="+orgId;
buttomUri = request.getContextPath()+"/flow/flow_main_frame.jsp?flowCode="+flowCode+"&busiId="+busiId+"&orgId="+orgId;
}

%>
<frameset rows="25,*%" frameborder="0" FRAMESPACING="0"  TOPMARGIN="0"  LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0" >
  <frame src="<%=topUri%>" scrolling="no" name="topFrame"  noresize>
  <frame src="<%=buttomUri%>" name="buttomFrame">
</frameset>
<noframes/>
<body>
<FORM>

</FORM>
</body>
</html>
