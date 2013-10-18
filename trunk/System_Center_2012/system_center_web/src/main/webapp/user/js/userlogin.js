//用户登陆的方法
function userLogin() {
	var username = $("#username").val();
	var userpwd = $("#userpassword").val();
	var yanzheng = $("#userVerificationCode").val();
//	var reg=/^1(3[0-2]|5[56]|8[56])\d{8}$/;  //联通号码正则表达式
//	if(!reg.test(username)) {
//		$("#xsnr").html("请输入正确的联通手机号码!");
//		sendBox4.Show();
//		return false;
//	} else
	if(null == userpwd || "" == userpwd) {
		$("#xsnr").html("密码不能为空！");
		sendBox4.Show();
		return false;
	} else if(null == yanzheng || "" == yanzheng) {
		$("#xsnr").html("验证码不能为空！");
		sendBox4.Show();
		return false;
	}
	jQuery.post(ctxPath+"/userLogin!tenantsLogin.action",{
		'model.loginName':username,
		'model.password':userpwd,
		'verificationCode':yanzheng
	},
	function(data) {
		if(null!=data && ""!=data){
			if(data.msg=="ok"){
				window.location.href = ctx+"timeout.jsp";
			}else if(data.msg=="error"){
				$("#xsnr").html("输入的账号或密码为空,登陆失败!");
				sendBox4.Show();
			}else if(data.msg=="verificationCodeError"){
				$("#xsnr").html("输入的验证码错误,登陆失败!");
				sendBox4.Show();
			}else{
				$("#xsnr").html("登陆失败!");
				sendBox4.Show();
			}
		}
},'json');
}

//审核提交功能
function chekcForm(){
	if($("#pass").attr("checked")=="checked"){
	}else if($("#unpass").attr("checked")=="checked"){
	}else{
		$.messager.alert("您还没有选择审核结果!");
		return;
	}
}

//注销方法
function userZhuXiao() {
	$.post(ctxPath+"/user/user/user!loginOut.action", function(data) {
		alert("注销成功");
		window.location.href = ctx+"weclome.jsp";
	});
}

/**
 * 登陆界面的相应功能
* wirterMan：chenliang
* time:2013-04-12
* */

//刷新验证码方法
function chgUrl(url) {   
    var timestamp = (new Date()).valueOf();   
        urlurl = url.substring(0, 17);   
       if ((url.indexOf("?") >= 0)) {   
           urlurl = url + "&t=" + timestamp;   
       } else {   
           urlurl = url + "?t=" + timestamp;   
       }   
       return urlurl;   
}

//重新获得验证码的方法
function changeVerificationCode() {
	 var imgSrc = $("#verificationCode");   
     var src = imgSrc.attr("src");   
     imgSrc.attr("src", chgUrl(src));   
}