<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/jsp/head.jsp"%>
<%
//response.sendRedirect(request.getContextPath()+"/initIndex") ;
%>
<link href="common/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/user/js/userlogin.js"></script>
<html>
<body>
	<div class="logintable" align="center" style="background:url('common/images/logobg.jpg') repeat-x;">
	<img src="common/images/logintitle1.jpg" style="background: no-repeat; "/>
</div>

<div class="loginmain" align="center" style="background:url('common/images/mainbg0.gif') repeat-x;">
	<div class="tablemain" style="background: url('common/images/mainbg1.gif') no-repeat;">
		<div class="tableloginiinfotop" style="background: url('common/images/loginfotop.png') no-repeat; float: left;"></div><br>
		<div class="tableloginiinforight" style="background: url('common/images/loginforight.png') no-repeat; float: left;">
			<table border="0px" style="height: 250px;width: 350px;margin-left: 20px;" >
				<tr style="height: 25%;width: 50%">
					<td>用户名：</td>
					<td>
						<input id="account" type="text" style="background: url('common/images/shurukuang.jpg'); width: 228px; height: 34px;">
					</td>
				</tr>
				<tr style="height: 25%;width: 50%">
					<td>密码：</td>
					<td>
						<input id="password" type="text" style="background: url('common/images/shurukuang.jpg'); width: 228px; height: 34px;">
					</td>
				</tr>
				<tr style="height: 25%;width: 50%">
					<td>验证码：</td>
					<td>
						<input id="userVerificationCode" type="text" style="background: url('common/images/shurukuang.jpg'); width: 128px; height: 34px;">
						<img src="${ctx}/image.jsp" id="verificationCode" /><a onclick="changeVerificationCode()" href="#">换一张</a>
					</td>
				</tr>
				<tr style="height: 25%;width: 50%">
					<td colspan="2" align="center">
						<input type="button" value="登陆" onclick="userLogin()" style="background: url('common/images/login_blue.png');width: 100px;height: 35px;" />
						<a href="#">忘记密码?</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="tableloginiinfoleft" style="background: url('common/images/loginfoleft.png') no-repeat; float: left;">
			<table border="0px" style="height: 150px;width: 350px;margin-left: 20px;" >
				<tr style="height: 30%;">
					<td>还没有康讯云账号？</td>
				</tr>
				<tr style="height: 30%;">
					<td><a href="${ctx}/register.jsp">立即免费注册</a></td>
				</tr>
				<tr style="height: 30%;width: 100px;">
					<td><input type="button" value="免费注册" style="background: url('common/images/regest_gray.png')" onclick="goToRegister();"></td>
				</tr>
			</table>
		</div>
	</div>
</div>

<div class="logintable" style="background:url('common/images/footer.gif') repeat-x;">
	<div style="background: url('common/images/footer.gif') no-repeat;"></div>
</div>

</body>
</html>
