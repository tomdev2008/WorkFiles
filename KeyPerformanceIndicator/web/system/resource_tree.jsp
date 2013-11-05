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
		<%@ include file="/web/pub/head.inc"%> 	
		<STYLE type=text/css><%-- 树所必须要用到的css，仅在这里使用 --%>
			TD {
				FONT-SIZE: 12px; FONT-FAMILY: 宋体
			}
			A:link {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
			A:visited {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
			A:active {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
			A:hover {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
		</STYLE>
		<script src="${ROOT}/component/MzTreeView10.js"></script>	
		<script>
			var appcontext = "";
			function listResource(id,name) {
				if(id=="root"){
					id='<%=Globals.ROOT_ID%>';
				}
				//alert(id);
				parent.fbody.location.href='${ROOT}/listResource.do?parentResourceId='+id;
			}
			
			function listResourceLevel(id,name){
				parent.fbody.location.href='${ROOT}/listResourceLevel.do?parentResourceId='+id;
			}
			
		</script>		
	</head>
	<%@ include file="/web/pub/tree.inc"%>
	<body class="textarea1">	
		<form action="" method="get" name="thisForm"> 
		<div class="treeBody">
			<script>
				${treeJS}
			</script>
		</div>
		</form> 
	</body>
</html>
