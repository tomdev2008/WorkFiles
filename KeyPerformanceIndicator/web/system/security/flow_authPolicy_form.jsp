<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.system.security.Security"/>
<%@ include file="/web/pub/head.inc"%>
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript">
<!--
	function ev_save(){
		document.form.submit();
	}
	
	function ev_change(){
		var busiType = document.getElementById("busiType").value;
		window.location.href = "${ROOT}/getAuthPolicy.do?resource=${org.id }&busiType="+busiType;
	}
//-->
</script>
</head>
<body onmousewheel="setScrollzheight()" class="main-body" >
<form name="form" action="${ROOT}/createAuthPolicy.do" method="post">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">    
     <tr><td><h2>${title }</h2></td></tr>
	 <tr><td class="list-caozuo"> <a id="libtnAdd" href="javascript:ev_save()">保存</a></td></tr>
</table>	
<input type="hidden" value="${org.id }" name="resource" />	

 
<table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
	
	<tr>
		<td align="left" class="t">
			<div align="right"><strong>组织绩效范围：</strong></div></td>
		<td>${org.fullName }</td>
	</tr>
	
	<tr>
		<td align="left" class="t">
			<div align="right"><strong>业务安全类别：</strong></div></td>
		<td>
		<html:select name="authPolicy" property="busiType" onchange="ev_change()">
          		<html:optionsCollection name="busiTypeList" value="value" label="key"/>
        </html:select>
		<%--<select name="busiType" onchange="ev_change()">
	   			<option value="<%=Security.BUSI_TYPE_FLOW_ORG %>" 
	   <%=((Integer)request.getAttribute("busiType")).intValue()==Security.BUSI_TYPE_FLOW_ORG?"selected='selected'":"" %> >组织流程管理</option>
				<option value="<%=Security.BUSI_TYPE_FLOW_USER %>"  
	  <%=((Integer)request.getAttribute("busiType")).intValue()==Security.BUSI_TYPE_FLOW_USER?"selected='selected'":"" %>>员工流程管理</option>
			</select>
		--%></td>
	</tr>
	
	<tr>
		<td align="left" class="t">
			<div align="right"><strong>查询权限：</strong></div>
		</td>
		<td>
			<textarea name="queryText" rows="2" cols="40" type="_moz" readOnly>${queryText }</textarea>
			<input type="hidden" name="queryInfo" value="${queryInfo }" />
			<a href="#" class="choose" onclick="getAddressList('0;20','n','1','queryText','queryInfo');">选择</a>
			<br/>对下级：
			<input type="radio" checked="checked" name="queryExtend" value="0" />不影响
			<input type="radio" name="queryExtend" value="1" />覆盖
			<input type="radio" name="queryExtend" value="2" />增加
		</td>
	</tr>
	<tr>
			<td align="left" class="t" ><div align="right"><strong>操作权限：</strong></div></td>
			<td>
				<textarea name="operatorText" rows="2" cols="40" type="_moz" readOnly>${operatorText }</textarea>
				<input type="hidden" name="operatorInfo" value="${operatorInfo }" />
   				<a href="#" class="choose" onclick="getAddressList('0;20','n','1','operatorText','operatorInfo');">选择</a>
     			<br/>对下级：
     			<input type="radio" checked="checked" name="operatorExtend" value="0" />不影响
     			<input type="radio" name="operatorExtend" value="1" />覆盖
     			<input type="radio" name="operatorExtend" value="2" />增加
     		</td>
     	</tr>
     	<tr>
     		<td align="left" class="t" ><div align="right"><strong>授权权限：</strong></div></td>
     		<td>
     			<textarea name="authText" rows="2" cols="40" type="_moz" readOnly>${authText }</textarea>
				<input type="hidden" name="authInfo" value="${authInfo }" />
     			<a href="#" class="choose" onclick="getAddressList('0;20','n','1','authText','authInfo');">选择</a>
     			<br/>对下级：
     			<input type="radio" checked="checked" name="authExtend" value="0" />不影响
     			<input type="radio" name="authExtend" value="1" />覆盖
     			<input type="radio" name="authExtend"  value="2" />增加
     		</td>
     	</tr>
   
</table>
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function(){setPHeight();}
//-->
</script>