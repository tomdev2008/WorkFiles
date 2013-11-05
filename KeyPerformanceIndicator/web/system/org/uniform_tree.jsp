
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
	<head>
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
			var context = "${ROOT}";
			//专业线/通用岗位列表
			function list_uniform(id){
				var targetTypeID = "0"
				if(id != 'root') {
					targetTypeID = id;
				}
				pageShowList('${ROOT}/listUniformType.do?id='+targetTypeID+'&type=${type}');
			}
		</script>
		
		<script type="text/javascript" src="${ROOT}/web/system/dlg/select.js"></script>
	</head>
	<%@ include file="/web/pub/tree.inc"%>
	<body class="textarea1">	
		<form action="" method="get" name="thisForm"> 
		<div class="treeBody">
			<script>
			<!--
				${treeJS}
			//-->
			</script>
		</div>
		</form> 
	</body>
</html>
