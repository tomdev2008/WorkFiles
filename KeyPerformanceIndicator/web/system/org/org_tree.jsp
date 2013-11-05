<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.system.Globals"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Busi"/>
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
		<script type="text/javascript">
		<!--
				var context = "${ROOT}";
				var appcontext = "";
				// 当前树的状态
				function reloadView(url){
					parent.fbody.location.href = url;
				}
				
				//组织列表
				function list_org(id) {
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listOrg.do?id='+targetTypeID);
				}
				
				
				
				//岗位列表
				function list_position(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listPosition.do?id='+targetTypeID);
				}
				
				//员工列表
				function list_user(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listUserByOrg.do?orgId='+targetTypeID);
				}
				
				//群组列表
				function list_group(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>";
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listGroup.do?orgId='+targetTypeID);
				}

				//流程查看
				function listFlowByBusi(id){
					if(id=='0') id = '<%=Globals.ROOT_ID%>';
					parent.fbody.location.href='${ROOT}/listFlowByOrg.do?orgId='+id+"&busiId=${param.busiId}";
				}				
						
				function getObjectById(id){
			      if (typeof(id) != "string" || id == "") return null;
			      if (document.all) return document.all(id);
			      if (document.getElementById) return document.getElementById(id);
			      try {return eval(id);} catch(e){ return null;}
			    }
			    		

				
				function list_assgroup(id) {
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listAssGroup.do?orgId='+targetTypeID);
				}

				function list_mainFlows(id) {
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listMainFlowByOrgBusiId.do?orgId='+targetTypeID);
				}				
				
				function list_relation(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listAssessRelation.do?orgId=' + targetTypeID);
				}
				
				function list_holiday(id) {
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if (id != '0')
						targetTypeID = id;
					pageShowList('${ROOT}/listHolidayConfig.do?orgId=' + targetTypeID);
				}
				
				function list_template(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listTemplate.do?orgId='+targetTypeID);
				}
				function list_grade(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList("${ROOT}/listAssessmentGradeSet.do?orgId="+targetTypeID);
				}
		//-->
		</script>
	</head>
	<%@ include file="/web/pub/tree.inc"%>
	<body class="textarea1" >	
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