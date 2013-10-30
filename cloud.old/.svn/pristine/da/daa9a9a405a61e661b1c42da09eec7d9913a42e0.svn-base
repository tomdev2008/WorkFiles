<%-- <!-- struts2 -->
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
	request.setAttribute("basePath", basePath);
%>
<s:set name="ctx" value="#request.path"/>
<s:set name="basePath" value="#request.basePath"></s:set>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx }/jsp/common/js/ext/resources/css/ext-all.css" /> 
<link rel="stylesheet" type="text/css" href="${ctx }/jsp/common/js/ext/resources/css/ext-patch.css" />
<script type="text/javascript" src="${ctx }/jsp/common/js/ext/adapter/ext/ext-base.js"> </script>  
<script type="text/javascript" src="${ctx }/jsp/common/js/ext/ext-all.js"> </script>
<script type="text/javascript" src="${ctx }/jsp/common/js/ext/src/locale/ext-lang-zh_CN.js"> </script>
	
<body>
</body>
</html>

 --%>
 
 <!-- struts2 -->
<%@page import="cn.com.kxcomm.common.LocalUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Locale"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	//path=/sshdemo
	//basePath=http://localhost:8080/sshdemo/
	request.setAttribute("path",path);
	request.setAttribute("ctx",path);
	request.setAttribute("basePath",basePath);
	
	String countryCode = LocalUtil.getCountryCode();
	request.setAttribute("countryCode",countryCode);
	
	String fileName = LocalUtil.getResourceFileName(request.getRequestURL().toString());
	request.setAttribute("fileName",fileName);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/jsp/common/js/extjs4/resources/css/ext-all.css" /> 
<script type="text/javascript" src="${ctx}/jsp/common/js/extjs4/bootstrap.js"> </script>
<script type="text/javascript" src="${ctx}/jsp/common/js/extjs4/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/jsp/common/js/utilTool.js"> </script>
<script type="text/javascript">
var ctx = '${ctx}';
</script>
</head>
<body>

</body>
</html>

 