<!-- struts2 -->
<%@taglib prefix ="s" uri ="/struts-tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ce" uri="/WEB-INF/ce-tag.tld" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;

	//path=/sshdemo
	//basePath=http://localhost:8080/sshdemo/
	request.setAttribute("path",path);
%>

<s:set name="ctx" value="#request.path"/>

