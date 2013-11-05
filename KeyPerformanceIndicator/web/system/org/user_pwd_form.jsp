<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>员工修改密码</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />	
	<script language="javascript" type="text/JavaScript">
	<!--
		function ev_save(flag){
			var fm = $_E('form1');
			if(CheckForm(fm) && ev_regTest()) {
				if (confirm("确定要修改密码吗？")) {
					$_E('form1').action = "${ROOT}/changeLoginUserPwd.do?flag="+flag;
					$_E('form1').submit();
				}
			}
		}
		
		function ev_regTest(){
			var regText = /^[A-Za-z0-9_]{1,16}$/;
			if(!regText.test($_EV('newPwd'))){
				alert("新密码格式不正确！");
				$_E('newPwd').style.borderColor = 'red';
				return false;
			}else if($_EV("newPwd")!=$_EV("confirmNewPwd")){
				alert("两次密码不一致！");
				$_E('newPwd').style.borderColor = 'red';
				return false;
			}
			return true;
		}
		
		function ev_reset() {
			$_E("oldPwd").value = "";
			$_E("newPwd").value = "";
			$_E("confirmNewPwd").value = "";
		}
	</script>
</head>
<body class="LN_body">
<iframe src="blank" frameborder="0" id="blankFrame" name="blankFrame" style="display:none;">
</iframe>
<form name="form1" id="form1" method="post" action="">
<div class="LN_popupsBox">
	<div class="LN_formBox">
		<div class="LN_formTitle">员工密码修改</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">员工密码修改</div>
					</div>
				</td>
			</tr>
			<tr/>
			<tr>
    			<td>
    				<font color="red">&nbsp;&nbsp;注：密码长度在6-16字符之间，且只能是大小写字母，数字和下划线。</font>
    			</td>
    		</tr>
			<tr>
				<td class="LN_press">
		
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
      		<tr>
				<td class="LN_tableBoxtitle" width="40%" align="right">
					<font color="red">*</font>旧密码&nbsp;&nbsp;
				</td>
				<td class="LN_tableBoxText" width="60%">&nbsp;&nbsp;
					<input name="oldPwd" id="oldPwd" type="password" class="LN_Input"  value="" check="notBlank;" required="true" showName="旧密码" maxlength="20"/>
				</td>
			</tr>
			<tr>
				<td class="LN_tableBoxtitle" width="40%" align="right">
					<font color="red">*</font>新密码&nbsp;&nbsp;
				</td>
        		<td class="LN_tableBoxText" width="60%">&nbsp;&nbsp;
					<input name="newPwd" id="newPwd" type="password" class="LN_Input"  value="" check="notBlank;" required="true" showName="新密码" maxlength="20"/>
				</td>
			</tr>
			<tr>
				<td class="LN_tableBoxtitle" width="40%" align="right">
					<font color="red">*</font>确认密码&nbsp;&nbsp;
				</td>
				<td class="LN_tableBoxText" width="60%">&nbsp;&nbsp;
					<input name="confirmNewPwd" id="confirmNewPwd" type="password" class="LN_Input"  value="" check="notBlank;" required="true" showName="确认密码" maxlength="20"/>
				</td>
			</tr>
		</table>
		
		<tr>
			<td align="center" style="height:25px">
				<input type="button" id="button3" name="button3" class="LN_big_button3" value="确定" onclick="ev_save(0);return false;"/>
				<input type="button" id="button3" name="button3" class="LN_big_button3" value="重置" onclick="ev_reset();return false;"/>
			</td>
		</tr>

				</td>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html>
