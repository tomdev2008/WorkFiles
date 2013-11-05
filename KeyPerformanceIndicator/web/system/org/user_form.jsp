<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<title>员工信息</title>
	<script type="text/javascript" src="/web/system/dlg/select.js"></script>
	<script src="${ROOT}/web/system/dlg/dateselector.js"></script>
	<script type="text/javascript">
	<!--
		function ev_save(){
			var form = document.getElementById("form");
			if(CheckForm(form)){
				var pwd = form.pwd.value;
				var cpwd = form.confimPwd.value;
				if(!/^[A-Za-z0-9_]{6,16}$/.test(pwd)){
					alert("密码内应由数字，字母以及下划线组成，长度6-16个字符，请重新输入。");
					return false;
				}			
				if(pwd.trim()!=cpwd.trim()){
					alert("两次密码码不一致！");
					return false;
				}
				pageShield();
				form.action = "${ROOT}/saveUser.do";
				form.submit();
			}
		}
		
		function ev_history(){
			window.showModalDialog("${ROOT}/web/system/org/user_history_list.jsp?userID=${user.id}","","dialogHeight:350px;dialogWidth:750px;status:no; help:no;");
		}
		
		function ev_back(){
			var url = "${ROOT}/listUserByOrg.do?orgId=${user.org.id }";
			pageBack2List();
		}
		
		/**
		*调动回滚
		*/
		function ev_moveRollBack(){
			if(confirm("${previousUser.name}之前所在部门：${previousUser.org.fullName},确实需要将该员工回滚到此部门下吗?回滚之后,该员工在当前部门下不可以见,且不纳入当前部门的考核统计!")){
				var form = document.getElementById("form");
				form.action = "${ROOT}/moveRollBack.do";
				form.submit();
			}
		}
		/**
		*
		*/
		function ev_moveCheckWithPre(){
			if(confirm("确实需要调动该用户吗？调动之后，该员工在当前部门下不可见，且不纳入当前部门的考核统计！")){
				getAddressList('0','1','0','orgText','orgInfo1')
				var orgInfo = document.getElementById("orgInfo1").value;
				var moveToOrgID = String(orgInfo).split("!@!")[2];
				if(moveToOrgID == undefined){
					alert("请选择调入组织");
					return;
				}
				
				var ids = "${previousUser.id}@"
				effectDate = window.showModalDialog("${ROOT}/tip.do",
										"","dialogHeight:450px;dialogWidth:750px;status:no; help:no; scroll:no");
				if(effectDate == undefined){
					alert("请选择调动生效时间");
					return;
				}
				
			
				form.action = "${ROOT}/moveUserCheckWithPre.do?moveToOrgID="+moveToOrgID+"&effectDate="+effectDate;
				form.submit();
			}
		}
		
		function ev_editUserDuty() {
			if($_EV("id")!='' && $_EV("id").length>0){
				var form = $_E("form");
				form.action = "${ROOT}/editUserDuty.do";
				form.submit();
			}
		}
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="LN_body">
<form id="form" name="form" method="post" action="${ROOT}/saveUser.do">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>员工管理</h2></td></tr>
  <Tr><td class="list-caozuo">
  <kpi:secureBody code="010406">
    <a id="hlinkAddNew" href="#" onclick="ev_save();return false;">保存</a>&nbsp;&nbsp;|&nbsp;&nbsp;
  </kpi:secureBody>
  	
    <a id="hlinkAddNew" href="#" onclick="ev_back();return false;">返回</a>
	
    </td></Tr>
</table>
<div align="left"><font color="red">红色*号为必填项</font></div>
    <table  width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
 	 <!--  <tr>
        <td class="t">说明：</td>
        <td colspan=3>员工类型是指员工当前身份的考核类型,普通员工考核时以组织作为群组，其它类型则以考核关系配置作为群组。</td>
        </tr>
      <tr> -->
        <td   class="t"><font color="red">*</font>登录名</td>
        <td >
			<input name="logonId" type="text" class="editline"  value="${user.userCommInfo.logonId }" check="notBlank;isString('#',16)" required="true" showName="登录名" maxlength="20"/>&nbsp;
			<input name="id" id="id" type="hidden" value="${user.id }"/>
			<input name="previousID" type="hidden" value="${user.previousID }"/>
		</td>
        <td  class="t"><font color="red">*</font>用户名</td>
        <td >
		<input name="name" type="text" class="editline"  value="${user.userCommInfo.name }" check="notBlank;isString('#',32)" required="true" showName="用户名"  maxlength="100"/>&nbsp;</td>
      </tr>
       <tr>
        <td   class="t"><font color="red">*</font>SAPID</td>
        <td >
			<input name="userCode" type="text" class="editline" value="${user.userCommInfo.userCode }"  check="isString('#',20);"  maxlength="15"/>&nbsp;
		</td>
        <td  class="t"><font color="red">*</font>部门</td>
        <td>
        	<input name="orgInfo" type="hidden" value="${org.addressInfo}" />
        	<input name="orgId" id="orgId" type="hidden" value="${org.id}" />
        	<input name="orgName" type="text"class="editline" value="${org.name }" readOnly />&nbsp;
        </td> 
      </tr>
      <tr>
        <td  class="t"><font color="red">*</font>密码</td>
        <td><input name="pwd" type="text" class="editline" value="${user.userCommInfo.pwd }" check="notBlank" required="true" showName="密码"/></td>
        <td   class="t"><font color="red">*</font>确认密码</td>
        <td><input name="confimPwd" type="text" class="editline" value="${user.userCommInfo.pwd }"  /></td>
      </tr>
      <tr>
        <td  class="t">联系方式</td>
        <td><input name="xlt" type="text" class="editline" value="${user.userCommInfo.xlt }"  check="isString('#',10);isPhone"  maxlength="15"/>&nbsp;</td>
        <td  class="t">EMAIL</td>
        <td><input name="email" type="text" class="editline" value="${user.userCommInfo.email }"  isEmail="true"  maxlength="50"  />&nbsp;</td>
      </tr>
      <tr>
		<td class="t"><font color="red">*</font>岗位层级</td>
        <td>
			<input name="positionInfo" type="hidden" value="" />
			<input name="positionLayer" type="text" class="editline" value="${user.positionLayer}" maxlength="20" check="notBlank;isString('#',32);" required="true" showName="岗位层级"/>&nbsp;
		</td>
		<td  class="t"><font color="red">*</font>岗位名称</td>
        <td>
        	<input name="positionInfo" type="hidden" value="" />
	        <input name="positionName" type="text" class="editline" value="${user.positionName }"  maxlength="20" check="notBlank;isString('#',32);" required="true" showName="岗位"/>&nbsp;
	    </td>
      </tr>
      <tr>
      	<td  class="t">员工类型</td>
      	<td >
      	<kpi:dictionary-select  name='assessmentType' type='USER_ASS_TYPE' style="width:80px;" selected="${user.assTypes}" htmlType="select"/></td>
      	<td  class="t"><font color="red">*</font>上级领导</td>
      	<td ><input name="preManagerName" type="text" value="${user.preManagerName }" readOnly="true"/>
      	<input name="preManagerText" type="hidden" value="${user.preManagerText }" check="notBlank" required="true" showName="上级领导"/>
      	<a href="#" class="choose" onclick="getAddressList('20','1','0','preManagerName','preManagerText');return false;" title="选择员工">选择</a>
      	</td>
      </tr>
      <tr>
        <td class="t"><font color="red">*</font>排序码</td>
        <td colspan="3"><input name="priority" type="text" class="editline" value="${user.priority}" check="notBlank;isFloat" required="true" showName="排序码"  maxlength="11"/>&nbsp;</td>
      	<!--<td class="t">岗位职责</td>
      	 <td valign="bottom" >
      	<c:if test="${user!=null and user.id!=null}">
      	<a href="#" onclick="ev_editUserDuty();return false;" class="choose">编辑</a>
      	</c:if></td> -->
      </tr>
       <tr>
        <td class="t">角色</td>
        <td width="*" colspan="3">
        	<input name="roleInfo" type="hidden" value="${roleInfo }" />
	        <textarea name="roleName" rows="2" cols="50" class=area readOnly>${roleName }</textarea>&nbsp;
	        <a href="#"  class="choose" onclick="getAddressList('10','n','10','roleName','roleInfo');">选择</a>
	    </td>
		
      </tr>
      <tr>
        <td class="t">备注</td>
        <td width="*" colspan="3">
        <textarea name="remark" rows="3" cols="50" class=area check="isString('#',500);" onpropertychange="if(value.length>500) value=value.substr(0,500)">${user.remark }</textarea>&nbsp;</td>
      </tr>
    </table>
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function (){setPHeight3();}
//-->
</script>
<kpi:UIResponse />