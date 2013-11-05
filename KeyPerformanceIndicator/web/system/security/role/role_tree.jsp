<%@ page contentType="text/html; charset=utf-8" %>

<html>
	<head>
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
			//响应角色树的信息,列出角色下的功能
			function listResource(id){
				var targetTypeID = "1"
				if(id != 'root') {
					targetTypeID = id;
				}
				var url = document.getElementById("type").value;
				if(url==""||String(url).length<=0)
					url = '${ROOT}/viewRoleResource.do?id='+targetTypeID;
				else
					url = url + "?id="+targetTypeID
				parent.fbody.location.href = url;
			}
		</script>
				
		<%@ include file="/web/pub/tree.inc"%>
		<script type="text/javascript" src="/web/system/dlg/select.js"></script>
	</head>
<body style="margin-top:0px;margin-left: 0px;">	
<input type="hidden" name="type">
		<form action="" method="get" name="thisForm"> 
		<div class="treebody">
			<script>
			<!--
				${treeJS}
			//-->
			</script>
		</div>
		</form> 
		
	</body>
</html>
