<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />   
		<script>
			var context = "";
			function flow_func(id,name){}
			function node_func(id,name){}
			function route_func(id,name){}
			function nodeEnd_func(id,name){}			
		</script>
		<%@ include file="/web/pub/head.inc"%>
		<script src="${ROOT}/js/util.js"></script>
		<script src="${ROOT}/web/indicator/dlg/tye_select.js"></script>
		<%@ include file="/web/pub/tree.inc"%>
	</head>
	<body class="LN_body">	
		<form action="" method="get" name="thisForm"> 
		<div class="treeBody">
			<script>
				${treeJS}
			</script>
		</div>
		</form> 
	</body>
</html>
