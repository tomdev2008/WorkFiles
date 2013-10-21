<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/jsp/head.jsp"%>
<%
//response.sendRedirect(request.getContextPath()+"/initIndex") ;
%>
<style>
body {font-family:SimSun;background-color: #E2E2E2; font-size:12px; color:#333; }
.logintable {background:url('common/images/logobg.jpg') repeat-x;width: 100%;height: 60px;border:'0';cellpadding:'0';cellspacing:'0';}
.loginmain {background:url('common/images/mainbg0.gif') repeat-x;width: 100%;height: 650px;border:'0';cellpadding:'0';cellspacing:'0';}
.tabletitle {background: no-repeat; height: 100%;}
.tablemain {background: no-repeat; height: 100%; margin-left:12%;}
.loginbottom {background: no-repeat; height: 100%; margin-left:12%;}
.tableloginiinfotop {background: no-repeat;width:778px; height: 55px; margin-left:18%; margin-top: 10%;}
.tableloginiinforight {background: no-repeat;width:560px; height: 321px; margin-left:18%; }
.tableloginiinfoleft {background: no-repeat;width:218px; height: 321px;  }

</style>
<script type="text/javascript" src="${ctx}/user/js/register.js"></script>
<html>
<body>
	<div class="logintable" align="center" style="background:url('common/images/logobg.jpg') repeat-x;">
	<img src="common/images/logintitle1.jpg" style="background: no-repeat; "/>
</div>

<div class="loginmain" align="center" style="background:url('common/images/mainbg0.gif') repeat-x;">
	<div class="tablemain" style="background: url('common/images/mainbg1.gif') no-repeat;">
		<div class="tableloginiinfotop" style="background: url('common/images/register.jpg') no-repeat; float: left;"></div><br>
		<ul></ul>
		<div class="tableloginiinforight" style="float: left;background-color:#ECECEC; ">
			<table border="0px;" style="height: 250px;width: 560px;margin-left: 20px;" >
				<tr>
					<td align="right">账号：</td>
					<td>
						<input id="account" type="text" style="background: url('common/images/shurukuang.jpg'); width: 228px; height: 34px;" onblur="vacText(this)" >
					</td>
					<td id="vacAcc" style="width: 30%;display: none;"><font style="color: red;font-size: 15px;">账号不能为空。</font></td>
				</tr>
				<tr>
					<td align="right">密码：</td>
					<td>
						<input id="password" type="password" style="background: url('common/images/shurukuang.jpg'); width: 228px; height: 34px;" onblur="vacText(this)">
					</td>
					<td id="vacPwd" style="width: 30%;display: none;"><font style="color: red;font-size: 15px;">密码不能为空。</font></td>
				</tr>
				<tr style="width: 50%">
					<td align="right">确认登陆密码：</td>
					<td>
						<input id="surePassword" type="password" style="background: url('common/images/shurukuang.jpg'); width: 228px; height: 34px;" onblur="vacSurePwd(this)">
					</td>
					<td id="vacSurePwd" style="width: 30%;display: none;"><font style="color: red;font-size: 15px;">两次密码不一致。</font></td>
				</tr>
				<tr style="width: 50%">
					<td align="right">用户名：</td>
					<td>
						<input id="username" type="text" style="background: url('common/images/shurukuang.jpg'); width: 228px; height: 34px;" onblur="vacText(this)">
					</td>
					<td id="vacUserName" style="width: 30%;display: none;"><font style="color: red;font-size: 15px;">用户名不能为空。</font></td>
				</tr>
				<tr style="width: 50%">
					<td align="right">邮箱：</td>
					<td>
						<input id="email" type="text" style="background: url('common/images/shurukuang.jpg'); width: 228px; height: 34px;" onblur="vacText(this)">
					</td>
					<td id="vacEmail" style="width: 30%;display: none;"><font style="color: red;font-size: 15px;">邮箱不能为空。</font></td>
				</tr>
				<tr style="width: 50%">
					<td colspan="3" align="center">
						<input type="button" value="同意协议并注册" onclick="register()" style="background: url('common/images/login_blue.png');width: 100px;height: 35px;" />
						<font style="font-size: 12px;">已有账号?<a href="${ctx}/index.jsp">登陆</a></font>
					</td>
				</tr>
				<tr style="width: 50%">
					<td colspan="3" align="center">
						<font style="font-size: 12px;"><a href="javascript:showKXAgree();">《康讯云服务协议》</a></font>
					</td>
				</tr>
			</table>
		</div>
		<div class="tableloginiinfoleft" style="background: url('common/images/loginfoleft.png') no-repeat; float: left;">
			<table border="0px;" style="margin-left: 20px;" >
				<tr style="height: 50px; " >
					<td><font style="font-size: 15px;color: #7A7A7C;">康讯云，公开开放的云计算平台！</font></td>
				</tr>
				<tr style="height: 50px; "  >
					<td><font style="font-size: 15px;color: #7A7A7C;">产品稳定、数据可靠</font></td>
				</tr>
				<tr style="height: 50px; ">
					<td><font style="font-size: 15px;color: #7A7A7C;">弹性伸缩、按需付费</font></td>
				</tr>
				<tr style="height: 50px; "  >
					<td><font style="font-size: 15px;color: #7A7A7C;">首创金牌服务，让您省心更安心！</font></td>
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
