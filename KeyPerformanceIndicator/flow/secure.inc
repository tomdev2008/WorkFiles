<%
	String busiId = request.getParameter("busiId");
	String orgId = request.getParameter("orgId");
	pageContext.setAttribute("orgId",orgId);
	pageContext.setAttribute("typeCode","TESTCODE");
	String urlPara = "&orgId="+orgId+"&busiId="+busiId;
	//out.println("<script>alert('orgId:"+ orgId +",busiId="+busiId+",url:"+request.getRequestURL()+"');</script>");
	out.println("<script>var urlPara = '"+urlPara+"';</script>");
 %>