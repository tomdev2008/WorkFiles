<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.shengdai.kpi.system.security.vo.Role" %>
<%@ page import="com.shengdai.kpi.system.security.vo.Resource" %>
<jsp:directive.page import="com.shengdai.kpi.system.security.service.IRoleService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<%@ include file="/web/pub/head.inc"%>
<%
	//角色系统资源
	List resourceList = (List)request.getAttribute("resourceList");
	//当前角色
	Role role = (Role)request.getAttribute("role");
	//系统资源的根对象
	Resource resourceRoot = (Resource)request.getAttribute("resourceRoot");
	//上级角色系统资源
	List parentRoleRs = new ArrayList();
	if(!role.getId().equals(Role.SYS_ROLE_ID)){
		//如果当前角色为员工,管理层,则把角色的可分配菜单默认为系统管理员拥有的菜单
		if(role.getId().equals(Role.USER_ROLE_ID)||role.getId().equals(Role.VIP_ROLE_ID)){
			IRoleService roleService = (IRoleService)SpringHelper.getBean("roleService");
			Role sa = roleService.findRoleById(Role.SYS_ROLE_ID);
			parentRoleRs = new ArrayList(sa.getResourceSet());
		}else{//角色的可分配菜单为上级管理员拥有的菜单
			parentRoleRs = new ArrayList(role.getParent().getResourceSet());
		}
	}
 %>
<html>
  <head>
  <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />   
    <title>角色菜单功能配置</title>
    <script type="text/javascript">
	<!--
	
		var canEdit = '${canEdit}'
	
		var url = "${ROOT}/viewRoleUser.do";
		//控制二级菜单下子菜单的显示／隐藏
		function ev_open(id, pid){
			if(document.getElementById(id).style.display==""){
				document.getElementById(id).style.display="none";
				document.getElementById(pid).src="${ROOT}/img/closesub.gif";
			} else {
				document.getElementById(id).style.display="";
				document.getElementById(pid).src="${ROOT}/img/opensub.gif";
			}
		}
		
	
		
		//控制二级菜单下子菜单的全选
		function selectSub(p){
		
		  	var allcheck=document.getElementsByName("rid");
		    for(i=0;i<allcheck.length;i++){
		    	if(allcheck[i].id.split("_")[1]==p.id.split("_")[1]){
					if(p.checked){
				    	if(!allcheck[i].disabled){
				    		if(allcheck[i].style.display!="none")//隐藏的控件不需要选择
								allcheck[i].checked=true;
						}
					}else{
							allcheck[i].checked=false;
					}
				}
    		}
    		
    		var layer1 = document.getElementById(p.id.split("_")[0]);
    		if(!layer1.checked)
				layer1.checked = true;
		}
		
		/**
		*点击三级菜单的时候，把对应的一级和二级菜单选上,如果三级菜单处于未选状态,则把隐藏的四级功能点置成未选
		*/
		function ev_setting(id,p){
			var layer2 = document.getElementById(id);
			if(!layer2.checked)
				layer2.checked = true;
			var layer1 = document.getElementById(id.split("_")[0])
			if(!layer1.checked)
				layer1.checked = true;
			
			if(!p.checked){
				var allcheck=document.getElementsByName("rid");
				for(i=0;i<allcheck.length;i++){
					if(allcheck[i].id.split("_")[2]==p.id.split("_")[2]){
						allcheck[i].checked=false;
					}
				}
			}
		}
		
		//保存资源分配
		function grantResource(){
		
			if(canEdit=='1'){
				alert("只有上级管理员可编辑!");
				return;
			}
			
			var form = document.getElementById("form");
			form.action = "${ROOT}/grantResource.do";
			form.submit();
		}
		
		//浏览角色下的人员
		function viewRoleUser(){
			window.parent.ftree.type.value = url;
			window.location.href = "${ROOT}/viewRoleUser.do?id=<%=role.getId()%>";
		}
		
		//添加角色
		function ev_add(id){
			var url = "${ROOT}/createRole.do?id="+id;
			//openWindow(url,750,450);
			window.location.href = url;
		}
		//编辑角色
		function ev_edit(id){
			
			if(canEdit=='1'){
				alert("只有上级管理员可编辑!");
				return;
			}
			
			//如果id是系统管理员角色,不能删除
			if(id=='1'){
				alert("系统管理员角色不可编辑!");
				return;
			}else if(id=='2'){//如果ID是员工,不能删除
				alert("员工角色不可编辑!");
				return;
			}
			if(id=='3'){
				alert("管理层角色不可编辑!");
				return;
			}
			var url = "${ROOT}/editRole.do?id="+id;
			//openWindow(url,750,450);
			window.location.href = url;
		}
		
		//删除角色
		function ev_delete(id){
			if(canEdit=='1'){
				alert("只有上级管理员可编辑!");
				return;
			}
			
			//如果id是系统管理员角色,不能删除
			if(id=='1'){
				alert("系统管理员角色不可删除!");
				return;
			}else if(id=='2'){//如果ID是员工,不能删除
				alert("员工角色不可删除!");
				return;
			}
			if(id=='3'){
				alert("管理层角色不可删除!");
				return;
			}
			if(confirm("确定要删除角色吗?")){
				var form = document.getElementById("form");
				form.action = "${ROOT}/deleteRole.do";
				form.submit();
			}
		}
		
		/**
		*设置可控制域
		*/
		function ev_setContorlDomain(resourceId,roleId){
			var url = "${ROOT}/listContorlDomain.do?resourceId="+resourceId+"&roleId="+roleId;
			openWindow(url,750,450);
		}
		
		
		
		
		
		//控制模块下所有菜单的全选
		function selectAll(p1){
			var allcheck=document.getElementsByName("rid");	
			for(i=0;i<allcheck.length;i++){
				if(allcheck[i].id.split("_")[0]==p1.id){
					if(p1.checked){
			    		if(allcheck[i].style.display!="none")//隐藏的控件不需要选择
							allcheck[i].checked=true;
					}else{
						allcheck[i].checked=false;
					}
				}
			}
		}
		
		
		
	//-->
    </script>
  </head>
<body  onmousewheel="setScrollzheight()" class="LN_body">
<form name="form" method="post" id="form">
<input  type="hidden" name="roleId" id="roleId" value="<%=role.getId()%>"/> 
<input type="hidden" name="pId" id="pId" value="<%=role.getParent().getId()%>" />
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>[<%=role.getName()%>]下菜单列表</h2></td></tr>
    <tr>
      <td class="list-caozuo">  
      			<a href="javascript:ev_add('<%=role.getId()%>');">新增子角色</a>|
             <a href="javascript:ev_edit('<%=role.getId()%>')">修改角色</a>|
             <a href="javascript:ev_delete('<%=role.getId()%>')">删除角色</a>|       
             <a href="javascript:grantResource();" >保存资源分配</a>|
             <a href="javascript:viewRoleUser();">角色下人员</a>
             
	   </td>
	 </tr>
</table> 
<table width="95%" border="0" align="center">
<%
	//输出一级菜单,如:指标库管理、绩效管理、统计分析、流程管理、系统管理
	List layer1 = new ArrayList(resourceRoot.getChildResourceSet());
	for(Iterator it = layer1.iterator();it.hasNext();){
		Resource layer1Resource = (Resource)it.next();
 %>
	<tr>
		<td bgcolor="#FFFFFF" align="left">
		<input  type="checkbox" id="sub<%=layer1Resource.getId() %>"  name="rid" value="<%=layer1Resource.getId() %>"
			onclick="selectAll(this);" class="checkboxInput" <%=resourceList.contains(layer1Resource)?"checked":"" %>  />
		<%=layer1Resource.getName() %>【模块】
			<table width="100%" bordercolor=#c0c0c0 bordercolordark=#ffffff align="center"
  				bordercolorlight=#E1E1E1 border=1 cellpadding="2" cellspacing="0">
 	<%
 		//输出二级菜单，如：指标管理、流程管理
 		List layer2 = new ArrayList(layer1Resource.getChildResourceSet());
 		for(int i=0;i<layer2.size();i++){
 			Resource layer2Resource = (Resource)layer2.get(i);
 			if(!parentRoleRs.contains(layer2Resource)&&
 				!role.getId().equals(Role.SYS_ROLE_ID)){//二级菜单只显示上级角色有的系统资源
 				continue;
 			}
 	%>
				<tr>	    	
 					<td width="100%">
 						<input type="checkbox"   id="sub<%=layer1Resource.getId()+"_"+layer2Resource.getId() %>" name="rid" 
 						value="<%=layer2Resource.getId() %>" onclick="selectSub(this);" class="checkboxInput" 
						<%=resourceList.contains(layer2Resource)?"checked":"" %> />
 							<%=layer2Resource.getName() %>
 						<a href="javascript:ev_open('y<%=i+layer2Resource.getId() %>','yp<%=i+layer2Resource.getId() %>')">
 							<img id="yp<%=i+layer2Resource.getId() %>" src="${ROOT}/img/opensub.gif" border="0" />
 						</a> 
 					</td>
 				</tr>
  				<tr id="y<%=i+layer2Resource.getId() %>" >
  					<td width="100%">
  						<table width="100%" bgcolor="#D7DFF1">
		 <%
 			//输出三级菜单，如：组织管理、岗位管理、用户管理
 			List layer3 = new ArrayList(layer2Resource.getChildResourceSet());
 			for(int x=0;x<layer3.size();x++){
 				Resource layer3Resource = (Resource)layer3.get(x);
 				//三级菜单只输出上级角色有的系统资源
 				if(!parentRoleRs.contains(layer3Resource)&&
 				!role.getId().equals(Role.SYS_ROLE_ID)){
 					continue;
 				}
 				if((x+1)%4 == 1)
 					out.println("<tr>");
 				
  		%>
								<td width=25%>
									<input id="sub<%=layer1Resource.getId()+"_"+layer2Resource.getId()+"_"+layer3Resource.getId() %>" type="checkbox" name="rid" 
										 value="<%=layer3Resource.getId() %>"  onclick="ev_setting('sub<%=layer1Resource.getId()+"_"+layer2Resource.getId() %>',this)"
										<%=resourceList.contains(layer3Resource)?"checked":"" %> class="checkboxInput" />	    			
	 			 					<a  title="设置功能点" href="javascript:ev_setContorlDomain('<%=layer3Resource.getId() %>','<%=role.getId() %>')">
	 			 						<%=layer3Resource.getName() %>
	 			 					</a>
	 							</td>
		<%
				//输出功能点,在页面上隐藏
				List layer4 = new ArrayList(layer3Resource.getChildResourceSet());
				for(int z=0;z<layer4.size();z++){
					Resource layer4Resource = (Resource)layer4.get(z);
		%>
								<input id="sub<%=layer1Resource.getId()+"_"+layer2Resource.getId()+"_"+layer3Resource.getId()+"_"+z %>" type="checkbox" name="rid" 
										 value="<%=layer4Resource.getId() %>"  
								<%=resourceList.contains(layer4Resource)?"checked":"" %> class="checkboxInput" style="display:none"  />	
		<%
				}
				if((x+1)%4 == 0)
 					out.println("</tr>");
			}//三级菜单输出结束
 		%>
						</table>
					</td>
				</tr>
	<%
		}//二级菜单输出结束
 	%>
			</table>
		</td>
	</tr>
<%
	}//一级菜单输出结束
 %>
</table>
<br/><br/><br/>
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function (){setPHeight3();}
	
	if(canEdit=='1'){//如果当前角色不能编辑,那么设置disabled
		var obj = document.getElementsByTagName("input");
		for(i=0;i<obj.length;i++){
			obj[i].disabled = true;
		}
	}
//-->
</script>
