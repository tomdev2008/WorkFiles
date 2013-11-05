<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.system.org.service.IOrgService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.Org"/>
<jsp:directive.page import="com.shengdai.kpi.system.Globals"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Busi"/>
<jsp:directive.page import="com.shengdai.kpi.common.tree.JSTreeConfig"/>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ROOT" value="http://${header.host}${pageContext.request.contextPath}" scope="request" />
<% 
	String type = com.shengdai.kpi.util.ParamUtils.getParameter(request, "type", "0");
	IOrgService orgService = (IOrgService)SpringHelper.getBean("orgService");
	List orgList = orgService.getMaxScopeRoot();
	String jsFunc = request.getParameter("jsFunc");
	String tmpIds="";
		for (int i=0;i<orgList.size();i++){
			if(!"".equals(tmpIds)){
				tmpIds+=";"+((Org)orgList.get(i)).getId();
			}else{
				tmpIds=((Org)orgList.get(i)).getId();
			}
			
		}
	
%>
<html>
<head>
<title>组织架构</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ROOT}/component/xtree/xtree.css" rel="stylesheet" type="text/css" />
<script src="${ROOT}/js/pub.js"></script>
<script>
var context = '${ROOT}';
function openRight(id) {
	var appcontext = "";
	var targetTypeID = "<%=Globals.ROOT_ID%>"
	if(id != '0') {
		targetTypeID = id;
	}
	url="${ROOT}/orgOptions.do?id="+targetTypeID+"&type=<%=type%>&"+Math.random();
	parent.parent.fbody.fbody.location.href = url;	
}
function loadAssRel(id){
	var targetTypeID = "<%=Globals.ROOT_ID%>"
	if(id != '0') {
		targetTypeID = id;
	}
	url="${ROOT}/listInfoAssessRelationGroup.do?orgId="+targetTypeID+"&type=${param.type}&"+Math.random();
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
<script type="text/javascript">
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
				// 模板列表
				function list_template_by_org(id,name) {
					var targetTypeID = "<%=Globals.ROOT_ID%>";
					if(id != '0') {
						targetTypeID = id;
					}
					
					pageShowList('${ROOT}/listTemplates.do?orgId='+targetTypeID+'&type=${param.type}&scopeType=${param.scopeType}');
					/*
					if(id != 'root') {
						targetTypeID = id;
						pageShowList('${ROOT}/listTemplates.do?orgId='+targetTypeID+'&type=${param.type}&scopeType=${param.scopeType}');
						//parent.fbody.location.href='${ROOT}/listTemplates.do?orgId='+targetTypeID+'&type=${param.type}&scopeType=${param.scopeType}';
					} else {
						pageShowList('${ROOT}/listTemplates.do?type=${param.type}&scopeType=${param.scopeType}');
						//parent.fbody.location.href='${ROOT}/listTemplates.do?type=${param.type}&scopeType=${param.scopeType}';
					}	*/				
					
				}
				
				// 公式列表
				function list_formula_by_org(id,name) {
					var targetTypeID = "<%=Globals.ROOT_ID%>";
					if(id != '0') {
						targetTypeID = id;
					}
					//parent.fbody.location.href='${ROOT}/queryFormula.do?orgId='+targetTypeID;
					pageShowList('${ROOT}/queryFormula.do?orgId='+targetTypeID);			
					
				}
				//业务策略安全
				function getAuth(id,name){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					parent.fbody.location.href='${ROOT}/getAuthPolicy.do?resource='+targetTypeID;
				}
				function getObjectById(id){
			      if (typeof(id) != "string" || id == "") return null;
			      if (document.all) return document.all(id);
			      if (document.getElementById) return document.getElementById(id);
			      try {return eval(id);} catch(e){ return null;}
			    }
			    
			    /**
			     * 查看满意度配置列表
			     * @param id 组织架构编号
			     */
			    function listSatisfactionConfig(id) {
					pageShowList('${ROOT}/listSatisfactionConfig.do?configType=${param.configType}&orgId='+id);
				}
				
				/**
				 * 查看评分可见关系
				 * @param orgId 组织架构编号
				 */
				function listAssAnnounceConfig(orgId) {
					pageShowList('${ROOT}/listAssAnnounceConfig.do?orgId=' + orgId);
				}
				
				/**
				 * 查看满意度考核批次
				 * @param orgId 组织架构编号
				 */
				function listSatisfactionBatch(orgId) {
					pageShowList('${ROOT}/listSatisfactionBatch.do?type=${param.type}&orgId=' + orgId);
				}
				
				//UUV组织同步列表
				function list_UUVOrg(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listUUVOrg.do?id='+targetTypeID);
				}
				
				
				//UUV组织同步列表
				function list_UUVUser(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listUUVUser.do?orgID='+targetTypeID);
				}
				
				
				//UUV多重用户列表
				function list_MutiUser(id){
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listMutiUser.do?orgID='+targetTypeID);
				}
				
				/**
				 * 罗列相关部门的问卷表
				 * @param orgId 部门编号
				 */
				function listQuestionnaires(id) {
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listQuestionnaires.do?manageOrg=' + id);
				}
				/**
				 * 考核群组列表				
				*/
				function list_assgroup(id) {
					var targetTypeID = "<%=Globals.ROOT_ID%>"
					if(id != '0') {
						targetTypeID = id;
					}
					pageShowList('${ROOT}/listAssGroup.do?orgId='+targetTypeID);
				}
</script>	
<script src="${ROOT}/component/xtree/xtree.js"></script>
<script src="${ROOT}/component/xtree/xloadtree.js"></script>
<script src="${ROOT}/component/xtree/xmlextras.js"></script>
<script src="${ROOT}/js/util.js"></script>
</head>
<body style="margin-top:0px;margin-left: 0px;" class="scroll-net">
<input type="hidden" name="scope" id="scope" value="<%=tmpIds%>">
<script type="text/javascript">
	var tree = new WebFXLoadTree("<%=JSTreeConfig.getProperty("root.name")%>", "${ROOT}/treeAdminScopeRootOrg.do?js=<%=jsFunc %>");
	tree.action="javascript:<%=jsFunc %>('0');";
	document.write(tree);
	tree.expand();
</script>
</body>
</html>