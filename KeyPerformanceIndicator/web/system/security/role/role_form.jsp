<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
  	<title>角色管理</title>
  	<script type="text/javascript">
  	<!--
  		function ev_save(){
  			var form = document.getElementById("form");
  			if(CheckForm(form))
				form.submit();
  		}
  		
  		function ev_back(type){
  			if(type=='0')
  				var url = "${ROOT}/viewRoleResource.do?id=${role.parent.id }";
  			else
  				var url = "${ROOT}/viewRoleResource.do?id=${role.id }";
  			window.location.href = url;
  		}
  	//-->
  	</script>
  </head>
  
  
<body  onmousewheel="setScrollzheight()" class="LN_body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>角色管理</h2></td></tr>
  <tr><td class="list-caozuo">
    <a id="hlinkAddNew" href="javascript:ev_save();">保存</a>|
    <a id="hlinkAddNew" href="javascript:ev_back(${type });">返回</a>
  </td></tr>
</table>

<form name="form" action="${ROOT}/saveRole.do" method="post" id="form">
<input type="hidden" name="id" id="id" value="${role.id }"/>  
<input type="hidden" name="parentid" id="parentid"  value="${role.parent.id }" />


<table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
  <tr> 
  	<td  colspan="2" style="background:#F7F9FC; color:black; padding-right:10px; font-weight:bold;">所属【<font color="#FF0000">${role.parent.name }</font>】</td>
  </tr>
  <tr> 
  	<td  width="30%" class="t"><font color="#FF0000">*</font>角色名称</td>
	<td width="70%">
		<input type="text" name="name" class="editline" size="40" value="${role.name }" check="notBlank" required="true" showName="角色名称" maxlength="100"/> 
	</td>	
  </tr>
  <tr> 
  	<td  width="30%" class="t">管理范围</td>
	<td width="70%">
		<textarea name="scopesName" id="scopesName" rows="4" cols="40" readonly="readonly">${empty adminScopeText?"":adminScopeText }</textarea>
		<input type="hidden" name="scopes" id="scopes" value="${adminScopeId }"/>
		<a href="#" onclick="getAddressList('0','n','1','scopesName','scopes');" class="choose">选择</a> 
	</td>	
  </tr>
  <tr> 
  	<td height="22" width="30%" class="t"><font color="#FF0000">*</font>排序</td>
	<td width="70%">
		<input type="text" name="priority" id="priority" class="editline" maxlength="10" size="10" value="${role.priority }" check="notBlank;isInt()" required="true" showName="排序码"/> 
	</td>	
  </tr><%-- 
  <tr> 
  	<td height="22" width="30%" class="t"><font color="#FF0000">*</font>地址本选择范围</td>
	<td width="70%">
		<select	name="addressScope">
			<option value="0" <c:if test="${role.addressScope==0 }">selected="selected"</c:if> >全省</option>
			<option value="1" <c:if test="${role.addressScope==1 }">selected="selected"</c:if> >省公司本部／市分公司</option>
		</select> 
	</td>	
  </tr> 
  --%><tr> 
  	<td height="22" width="30%" class="t">备注</td>
	<td width="70%">
		<textarea rows="4" cols="50" id="remark" class="area" name="remark">${role.remark }</textarea>
	</td>
  </tr> 
</table>
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>
<kpi:UIResponse />