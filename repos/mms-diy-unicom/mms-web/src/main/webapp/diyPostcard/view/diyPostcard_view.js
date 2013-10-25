//关闭窗口1，开启窗口2
function closOneOpenTwo() {
	sendBox1.Close();
	sendBox3.Show();
}

//预览方法
function myylfun() {
	jQuery.post(ctxPath+"/diycard/diycard/diycard!isLoginUser.action",
	function(data) {
		if(null!=data && ""!=data){
			if(data.msg != "no"){ //用户已登录
				$("#zuomieye").hide();
				hebingpirctruefun();
			} else {
				$("#titleContant").html("请先登录！");
				sendBox5.Show();
			}
		}
	});
}

//发送方法
function myfsfun() {
	jQuery.post(ctxPath+"/diycard/diycard/diycard!isLoginUser.action",
	function(data) {
		if(null!=data && ""!=data){
			if(data.msg != "no"){ //用户已登录
				$("#zuomieye").show();
				hebingpirctruefun();
			} else {
				$("#titleContant").html("请先登录！");
				sendBox5.Show();
			}
		}
	});
}