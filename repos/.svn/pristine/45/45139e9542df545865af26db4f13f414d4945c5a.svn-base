<%@page import="cn.com.mmsweb.action.util.SessionUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/jsp/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>沃爱彩信</title>
<meta name="keywords" content="沃爱彩信" />
<meta name="description" content="沃爱彩信" />
<style >
body{text-align:center;width:100%;}  
</style>
<script type="text/javascript" src="userManager/controller/userManager_controller.js"></script>
	<%
	Random random = new Random(); 
	 int number=random.nextInt(10000);
	  request.setAttribute(SessionUtils.CHECK_CODE, number);
	  %>
<script type="text/javascript">
function checkcode()
{
/* 	var res="";
	for(var i=0;i<4;i++)
		{
		var number = (0+Math.random()*(10-1)).toFixed(0);
		res+=number;
		} 
	*/
  $("#butCode").hide();
  $("#code").show();
  $("#aa").show();
}

function nextcheck()
{
	var CHECK_CODE = '${CHECK_CODE}';
	alert(CHECK_CODE);
	var code=$("#code").val();
	var msn=$("#msn").val();
	if(null==msn || ""==msn)
		{
		alert("电话号码不能为空！");
		}else{
			  $.post(ctx+'user/user/user!initMdn.action',{//
					'msn':msn
				},
				function(data) {
				//	var data = eval('(' + data + ')');
					if(null!=data && ""!=data){
						if(data.msg=="ok"){
							if(CHECK_CODE!=code)
							{
							  alert("校验码输入错误，请重新输入！");
							}else
								{
								forgetPWD.Close();
								pwdDIV.Show();
								$("#finish").show();
								$("#next").hide();
								}
						}else if(data.msg=="error"){
							alert("您输入的号码不存在！");
						}
					}
			});
	
		}
}

function updatePWD()
{
	var msn=$("#msn").val();
	var newPWD=$("#newPWD").val();
	var againPWD=$("#againPWD").val();
	if(null==newPWD || ""==newPWD){
		alert("密码不能为空！");
	}else{
	  if(newPWD!=againPWD){
		alert("您两次输入密码不一致，请重新输入！");
		}else{
	  $.post(ctx+'user/user/user!updatePWD.action',{//
			'pwd':newPWD,
			'msn':msn
		},
		function(data) {
		//	var data = eval('(' + data + ')');
			if(null!=data && ""!=data){
				if(data.msg=="ok"){
					alert("设置成功！");
					pwdDIV.Close();
				}else if(data.msg=="error"){
					alert("设置失败！");
				}
			}
	});
		}
		}
}
</script>
</head>

<body>
	<div  class="wrap">
		<div class="top-wrap">
			<span class="top-link">
				<a href="<%=path%>/weclome.jsp">主页</a><i>|</i><a href="">在线帮助</a><i>|</i><a href="" class="wb_sina png">收藏</a><a href="" class="wb_sina png">关注我们</a>
			</span>
		</div>
		
		<div class="menu">
			<%-- <ul>
				<li class="on"><a href="<%=path%>/weclome.jsp">模版明信片</a></li>
				<li><a href="diyPostcard/diyPostcard.jsp">DIY明信片</a></li>
				<li><a href="gifPostcard/gifPostcard.jsp">动态明信片</a></li>
			</ul> --%>
			<i></i>
		</div>
		<div class="mainbox" align="center">
			<br /><br />
			<font  size="6px;">您还没有登陆,请先登录!</font>
			<br /><br />
			<div style="width:259px;">
				<div class="loginbox" id="loginbefore">
					<span class="ltitbar"></span>
					 <form>
					<ul>
						<li><cite>手机号码：</cite><input id="username" name="model.mdn" type="text" class="inputstyle1" value="15502021957"/><em>*</em></li>
						<li><cite>密&nbsp;&nbsp;&nbsp;&nbsp;码：</cite><input id="userpassword" name="model.pwd" type="password" class="inputstyle1" value="123"/><em>*</em></li>
						<li><cite>验&nbsp;证&nbsp;码：</cite><input id = "userVerificationCode" maxlength="4" name="verificationCode" type="text" class="inputstyle2"/><img src="${ctxPath}/userManager/verificationCode.jsp" id="verificationCode" /><a onclick="changeVerificationCode()" href="#">换一张</a></li>
						<li class="lbtn"><!-- <button id="delngli" name="denglu" title="登录"></button> -->
						<input class="loginButt" id="regRe" type="button" title="登录" onclick="userLogin();"/>
						<a href="#" class="orange" onclick="javascript:forgetPWD.Show();">忘记密码</a></li>
					</ul>
					</form> 
				</div>	
			</div>
			<br />
		</div>
	</div>
	<!-- FOOT begin-->
	<jsp:include page="foot.jsp" />
	<!-- FOOT end-->
	<!--失败 lightbox-->
	<div id="sendBox4" style="display:none">
		<div class="lbox466">
			<i class="lbox-tbg png"></i>
			<div class="lbox-bg png">
				<div class="lbox-wrap">
					<span class="btn-close png" title="关闭"  onclick="javascript:sendBox1.Close();"></span>
					<span class="lbox-titbar">温馨提示</span>
					<span class="lbox-cons">
						<span class="alert-tips t-no">
							<p id="xsnr"></p>
						</span>
					</span>
					<span class="lbox-btns">
						<button class="btns-close" title="关闭" type="button"  onclick="javascript:sendBox4.Close();"></button>
					</span>
				</div>
			</div>
			<i class="lbox-bbg png"></i>
		</div>
	</div>
	<!--失败 lightbox end-->
		<!--忘记密码-->
<div id="forgetPWD" style="display:none">
	<div class="lbox538">
		<i class="lbox-tbg png"></i>
		<div class="lbox-bg png">
		<form id="addVmform" method="post">
		<div class="lbox538-top"><h3>忘记密码</h3><span class="btn-close2" title="关闭" onClick="javascript:forgetPWD.Close();"></span></div>
			<div class="lbox538-cons">
			    <input id="id" name="groupContactsVo.contactsId" type="text" style="width: 250px;height: 18px; display: none;"  />
				<div style="margin-left: 50px"><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号码：</font><input id="msn" name="msn" type="text" style="width: 250px;height: 22px;" /></div>
			     <br/>
			    <div style="margin-left: 50px"><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校验码&nbsp;&nbsp;&nbsp;：</font>
			    <input type="button" style="height: 25px;" id="butCode" onclick="checkcode();" value="点此免费获取"/><!-- <input id="birthday" name="groupContactsVo.birthday" type="text" style="width: 250px;height: 22px;" />发送验证码到手机 -->
			    <input id="code" name="" type="text" style="width: 70px;height: 22px;display: none;" />&nbsp;&nbsp;<a id="aa" href="#" style="display: none;color: red;">没有收到短信效验码？</a>
			    </div>
			     <br/>
			</div>
			<div class="lbox538-bot">
				<button id="next" style="margin-left: 390px;width: 60px;" title="下一步" onClick="nextcheck();" type="button">下一步</button>
				<button type="button" title="取消" class="btn2" onClick="javascript:forgetPWD.Close();"></button>
			</div>
			</form>
		</div>
		<i class="lbox-bbg png"></i>
	</div>
</div>	
<!-- 重置密码 -->
<div id="pwdDIV" style="display:none">
	<div class="lbox538">
		<i class="lbox-tbg png"></i>
		<div class="lbox-bg png">
		<form id="addVmform" method="post">
		<div class="lbox538-top"><h3>重置密码</h3><span class="btn-close2" title="关闭" onClick="javascript:pwdDIV.Close();"></span></div>
			<div class="lbox538-cons">
				<div style="margin-left: 50px"><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码&nbsp;&nbsp;&nbsp;：</font><input id="newPWD" name="groupContactsVo.contactsName" type="password" style="width: 250px;height: 22px;" /></div>
			     <br/>
			    <div style="margin-left: 50px"><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确认密码：</font>
			    <input id="againPWD" name="" type="password" style="width: 250px;height: 22px;" />
			    </div>
			     <br/>
			</div>
			<div class="lbox538-bot">
				<button id="next" style="margin-left: 390px;width: 60px;" title="下一步" onClick="nextcheck();" type="button">下一步</button>
				<button id="finish" style="margin-left: 390px;width: 60px;display: none;" title="完成" onClick="updatePWD();" type="button">完成</button>
				<button type="button" title="取消" class="btn2" onClick="javascript:pwdDIV.Close();"></button>
			</div>
			</form>
		</div>
		<i class="lbox-bbg png"></i>
	</div>
</div>
<script type="text/javascript">
var forgetPWD=new LightBox("forgetPWD");
var pwdDIV=new LightBox("pwdDIV");
var sendBox4 = new LightBox("sendBox4"); //发送明信片成功弹窗 
</script>
</body>
</html>
