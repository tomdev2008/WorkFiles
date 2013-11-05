<%@ page contentType="text/html; charset=utf-8" %>

<html>
	<head>
	<%@ include file="/web/pub/head.inc"%>
	
		<script>				
			var appcontext = "";
			//响应角色树的信息,列出角色下的功能
			function listResource(id){
				var targetTypeID = "1"
				if(id != 'root') {
					targetTypeID = id;
				}else{
					targetTypeID = "<%=com.shengdai.kpi.system.Globals.ORGVO_ROOT_ID%>";
				}
				var url = document.getElementById("type").value;
				if(url==""||String(url).length<=0)
					url = '${ROOT}/addressListChildRole.do?id='+targetTypeID;
				else
					url = url + "?id="+targetTypeID
				parent.parent.fbody.fbody.location.href = url;
			}
		</script>
		<script language="javascript">
			ie4 = (document.all) ? true : false; 
			function keyDown(e){ 

				if(ie4){ 
					var realkey=String.fromCharCode(event.keyCode); 
					if(event.keyCode==27){
						//window.close();
						parent.parent.fbody.saveSelectedValue();
					} 
				} 
			} 
			document.onkeydown = keyDown; 
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
