<%@ page contentType="text/html; charset=utf-8" %>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.Globals"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.OrgHelper"/>
<% 
	String type = ParamUtils.getParameter(request, "type", "0");
%>
<html>
	<head>
	<title>菜单信息</title>
		<%@ include file="/web/pub/head.inc"%>
		<%@ include file="/web/pub/tree.inc"%>
		<script src="${ROOT}/component/MzTreeView10.js"></script>	
		<script type="text/javascript" src="">
			var appcontext = "";
			// 当前树的状态
			var treeState = {multi:'n',selectedCount:0};
			
			/*
			 * 根据id获取
			 * 
			 * **/
			function select_org_by_type(id,name) {
				var targetTypeID = ""
				var tm="<%=type%>";
				//不是根的情况下才显示树
				if(id != 'root') {
					//targetTypeID = id;
					parent.parent.fbody.fbody.location.href='${ROOT}/orgOptions.do?id='+id+"&type=<%=type%>";
					
				}else{
					<%
					if(OrgHelper.getCurrentUserAddressScope()==0){			//当前用户是查询全省用户的时候，点中国电信广东分公司才在待选列表中显示内容
					%>
						parent.parent.fbody.fbody.location.href="${ROOT}/orgOptions.do?id=<%=Globals.ROOT_ID%>&type=<%=type%>";
					<%}
					%>
					
				}
			}
			
			function ev_onClick(id,name){
				var targetTypeID = ""
				var tm="<%=type%>";
				//不是根的情况下才显示树
				if(id != 'root') {
					//targetTypeID = id;
					parent.parent.fbody.fbody.location.href='${ROOT}/orgOptions.do?id='+id+"&type=<%=type%>";
					
				}else{
					<%
					if(OrgHelper.getCurrentUserAddressScope()==0){			//当前用户是查询全省用户的时候，点中国电信广东分公司才在待选列表中显示内容
					%>
						parent.parent.fbody.fbody.location.href="${ROOT}/orgOptions.do?id=<%=Globals.ROOT_ID%>&type=<%=type%>";
					<%}
					%>
					
				}
			}	
			
		</script>
		
		<script language="javascript">
			ie4 = (document.all) ? true : false; 
			function keyDown(e){ 

				if(ie4){ 
					var realkey=String.fromCharCode(event.keyCode); 
					if(event.keyCode==27){
						parent.parent.fbody.saveSelectedValue();
					} 
				} 
			} 
			document.onkeydown = keyDown; 
		</script>
	</head>
	<body style="margin-top:0px;margin-left: 0px;" class="scroll-net">	
		<form action="" method="get" name="thisForm"> 
		<div class="treebody">
			<script>
			<!--
				${treeJS }
			//-->
			</script>
		</div>
		</form> 
	</body>
</html>
