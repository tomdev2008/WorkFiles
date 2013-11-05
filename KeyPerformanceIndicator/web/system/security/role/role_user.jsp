<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
    <title>岗位列表</title>
	<script type="text/javascript">
	<!--
		var canEdit = '${canEdit}'
		
		var url = "${ROOT}/viewRoleResource.do";
		//赋予员工一个系统角色
		function grantRoleUser(){
			if(canEdit=='1'){
				alert("只有上级管理员可编辑!");
				return;
			}
			
			getAddressList('20','n','1','userText','userInfo');
			var userInfo = document.getElementById("userInfo").value;
			if(userInfo == ""||String(userInfo).length<=0){
				alert("没有选择任何数据");
				return;
			}
			document.form.action = "${ROOT}/grantRoleUser.do";
			document.form.submit();
		}
		
		//删除角色的人员
		function depriveRoleUser(){
			if(canEdit=='1'){
				alert("只有上级管理员可编辑!");
				return;
			}
			
			var cbs = document.getElementsByName("uid");
			if (cbs == undefined || cbs.length == 0) {
				alert("没有数据需要删除！");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
					break;
				}
			}
			if (!hadChecked) {
				alert("请至少选择一个用户来进行删除操作！");
				return;
			}
			if(confirm("确定要删除选定的人员吗?")){
				document.form.action = "${ROOT}/depriveRoleUser.do";
				document.form.submit();
			}
		}
		
		//浏览角色下的人员
		function viewRoleResource(){
			window.parent.ftree.type.value = url;
			window.location.href= "${ROOT}/viewRoleResource.do?id=${role.id }";
		}
	//-->
	</script>
 </head>
 
<body onload="setPHeight()" onmousewheel="setScrollzheight()" class="LN_body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
      <td><h2>[${role.name }]下人员列表</h2></td>
  </tr>
  <tr>
     <td class="list-caozuo">
     	<a  href="javascript:viewRoleResource();">角色下资源</a>|
	    <a  href="javascript:grantRoleUser();">新增</a>|
	    <a  href="javascript:depriveRoleUser();">删除</a>
  	</td>
  </tr>
 </table>
 <form name="form" method="post" id="form">
<table class="list-box" cellspacing="0" rules="all" border="0px"id="ctl03_GridViewUserList">
	<tr align="left">
		  <td width="40" class="list-title" >
            <input type="checkbox" id="selectAll" onclick="javascript:checkAll(this.id,'uid');"  class="checkboxInput"/>
          </td>
          <th align="center" width="15%" class="list-title">登陆帐号</th>
          <th align="center" width="15%" class="list-title">姓名</th>
          <th align="center" width="*" class="list-title">部门</th>
          <th align="center" width="35%" class="list-title">岗位</th>
	</tr>
	<c:forEach var="user" items="${userList}" varStatus="idx" >
	<tr class="list-color${idx.index%2==0?'1':'2' }">
		  <td align="left"><input name="uid" type="checkbox" value="${user.id }" class="checkboxInput"/></td>
		  <td align="left">${user.logonId }</td>
		  <td align="left">${user.name }</td>
		  <td align="left">${user.org.name }</td>
		  <td align="left">${user.positionName }</td>
     </tr>
     </c:forEach>
</table>
<input type="hidden" name="userInfo" id="userInfo"/>
<input type="hidden" name="userText" id="userText"/>
<input type="hidden" name="roleId" id="roleId" value="${role.id }" />
<kpi:page-bar formId="form" />
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

