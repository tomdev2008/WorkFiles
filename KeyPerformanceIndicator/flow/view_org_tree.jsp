<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<c:set var="ROOT" value="http://${header.host}${pageContext.request.contextPath}" scope="request" />
<script src="${ROOT}/component/MzTreeView10.js"></script>	
<script type="text/javascript">
	var context = "${ROOT}";
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
		<%@ include file="/web/pub/tree.inc"%>  
		<script>
			var appcontext = "";
			function listFlow(id,name) {
				parent.fbody.location.href='${ROOT}/listFlowByOrg.do?orgId='+id;
			}
			function listFlow(id) {
				if(id=='root') id = '<%=Globals.ROOT_ID%>';
				parent.fbody.location.href='${ROOT}/listFlowByOrg.do?orgId='+id;
			}
		</script>		
	</head>	
	<body style="margin-top:0px;margin-left: 0px;">	
		<form action="" method="get" name="thisForm"> 
		<div class="treeBody">
			<script>
				${treeJS}
			</script>
		</div>
		</form> 
	</body>
</html>
