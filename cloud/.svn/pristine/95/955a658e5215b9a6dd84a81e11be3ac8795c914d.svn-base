//用户登陆的方法
function register() {
	var account = $("#account").val();
	var password = $("#password").val();
	var surePassword = $("#surePassword").val();
	var username = $("#username").val();
	var email = $("#email").val();
	var flat = true;
	if(null == account || "" == account) {
		$("#vacAcc").show();
		flat = false;
	}
	if(null == password || "" == password) {
		$("#vacPwd").show();
		flat = false;
	}
	if (null == surePassword || "" == surePassword || surePassword != password){
		$("#vacSurePwd").show();
		flat = false;
	}
	if (null == username || "" == username){
		$("#vacUserName").show();
		flat = false;
	}
	if (null == email || "" == email){
		$("#vacEmail").show();
		flat = false;
	}
	
	if(!flat){
		return false;
	}
	jQuery.post(ctxPath+"/userLogin!tenantsRegister.action",{
		'model.account':account,
		'model.password':password,
		'model.username':username,
		'model.email':email
	},
	function(data) {
		if(null!=data && ""!=data){
			if(data.msg=="ok"){
				window.location.href = ctx+"home.jsp";
			}else{
				alert("注册失败");
				//$("#xsnr").html("登陆失败!");
				//sendBox4.Show();
			}
		}
},'json');
}

/**
 * 验证
 * @param obj
 */
function vacText(obj){
	var vv = $(obj).val();
	if(null == vv || "" == vv){
		$(obj).parent().next().show();
	}else{
		$(obj).parent().next().hide();
	}
}

function vacSurePwd(obj){
	var pwd = $("#password").val();
	var vv = $(obj).val();
	if(null == vv || "" == vv || pwd != vv){
		$(obj).parent().next().show();
	}else{
		$(obj).parent().next().hide();
	}
}

/**
 * 康讯协议
 */
function showKXAgree(){
	$.msgbox({
		closeImg: 'common/images/wrong.png',
		height:250,
		width:300,
		content:ctx+'/kxAgreement.jsp',
		type :'iframe',
	    title: 'KXcomm Agreement'
	});	

}