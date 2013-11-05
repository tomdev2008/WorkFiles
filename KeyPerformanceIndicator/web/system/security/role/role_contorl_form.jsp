<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.system.security.vo.Resource"/>
<jsp:directive.page import="com.shengdai.kpi.system.security.vo.Role"/>
<jsp:directive.page import="java.util.Iterator"/>
<jsp:directive.page import="java.util.*"/>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  	<title>模块可控制域信息</title>
  	<script type="text/javascript">
  	<!--
  		var canEdit = '${canEdit}'
  		var status = "unchecked";
  		
  		function ev_save(){
  			if(canEdit=='1'){
				alert("只有上级管理员可编辑!");
				return;
			}
  			var form = document.getElementById("form");
  			form.submit();
  		}
  		
  		
  		
  		function selectAll(){
  			var allCheckBox = document.getElementsByName("rid");
  			for(i=0;i<allCheckBox.length;i++){
  				if(status=="unchecked")
  					allCheckBox[i].checked=true;
  				else
  					allCheckBox[i].checked=false;
  			}
  			
  			if(status=="unchecked")
  				status = "checked"
  			else
  				status = "unchecked"
  			
  		}
  		
  	//-->
  	</script>
  </head>
  
 <%
 	Resource resource = (Resource)request.getAttribute("resource");
 	List contorlList = (ArrayList)request.getAttribute("domailList");
 	List parentContorlList = (ArrayList)request.getAttribute("parentDomailList");
 	Role role = (Role)request.getAttribute("role");
  %> 
<body  onmousewheel="setScrollzheight()" class="main-body">
<form name="form" action="${ROOT}/saveContorlDomain.do" method="post">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>模块可控制域信息</h2></td></tr>
  <Tr><td class="list-caozuo">
    <a id="hlinkAddNew" href="#" onclick="ev_save()">保存</a>
  </td></Tr>
</table>


<input type="hidden" name="roleId" value="${role.id }"/>  

<table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
  <tr> 
  	<td  width="30%" class="t">所属角色</td>
	<td width="70%">
		${role.name }
	</td>	
  </tr>
  <tr> 
  	<td  width="30%" class="t">所属菜单</td>
	<td width="70%">
		${resource.name }
	</td>	
  </tr>
  <tr> 
  	<td height="22" width="30%" class="t">可控制域(<a href="#" onclick="selectAll()">全选</a>)</td>
	<td width="70%">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<%

			List childList = new ArrayList(resource.getChildResourceSet());
			for(int i=0;i<childList.size();i++){
				Resource child = (Resource)childList.get(i);
				if(!parentContorlList.contains(child)&&!role.getId().equals(Role.SYS_ROLE_ID))
					continue;
				if((i+1)%4 == 1)
 					out.println("<tr>");
		 %>
				<td width="5%"><input type="checkbox" name="rid"  value="<%=child.getId() %>" <%=contorlList.contains(child)?"checked":"" %> class="checkboxInput" /></td>	
				<td width="15%"><%=child.getName() %></td>	
				<input type="hidden" name="tempIds" value="<%=child.getId() %>" />		
		 <%
		 	 	if((i+1)%4 == 0)
 					out.println("</tr>");
 			}
		 %>
		 </table>
	</td>	
  </tr>   
 
</table>
</form>
</body>
</html>
<script type="text/javascript">
<!--
	if(canEdit=='1'){//如果当前角色不能编辑,那么设置disabled
		var obj = document.getElementsByTagName("input");
		for(i=0;i<obj.length;i++){
			obj[i].disabled = true;
		}
	}
//-->
</script>
