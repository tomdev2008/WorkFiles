<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ROOT" value="http://${header.host}${pageContext.request.contextPath}" scope="request" />
<script type="text/javascript">
	var context = "${ROOT}";
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />   
		<%@ include file="/web/pub/tree.inc"%>
		<%@ include file="/flow/secure.inc" %>
        <LINK href="${ROOT}/css/kpi.css" type=text/css rel=stylesheet />
		<script>
			var appcontext = "";
			var flowCode = "${flowCode}";
			function route_func(routeCode,routeName)	{
				parent.parent.topFrame.window.location.href="${ROOT}/flow/route_form_edit_top.jsp?routeCode="+routeCode+"&flowCode="+flowCode+urlPara;
			    parent.Entrys.window.location.href="${ROOT}/routeEditPage.do?routeCode="+routeCode+urlPara;
			
			}
			function node_func(nodeCode,nodeName){
			    parent.parent.topFrame.window.location.href="${ROOT}/flow/node_form.jsp?flowCode="+flowCode+"&flwType=NODE&nodeCode="+nodeCode+urlPara;
			    parent.Entrys.window.location.href="${ROOT}/nodeEditPage.do?nodeCode="+nodeCode+urlPara;
			}
			function flow_func(root,flowName){
			    parent.Entrys.window.location.href="${ROOT}/flowEditPage.do?flowCode="+flowCode+urlPara;
			    parent.parent.topFrame.window.location.href="${ROOT}/flow/flow_form.jsp?flowCode="+flowCode+"&flwType=FLOW"+urlPara;
			}
			function nodeEnd_func(nodeCode,nodeName){
				node_func(nodeCode,nodeName);
			}
			
		</script>		
	</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="1" cellpadding="1" class="define-right">
  <tr>
    <td height="100%" valign="top" class="define-righttext">
    	<form action="" method="get" name="thisForm"> 
		<div class="treeBody">
			<script>
				${treeJS}
			</script>
		</div>
		</form>
	</td>
  </tr>
</table>
</body>
</html>
