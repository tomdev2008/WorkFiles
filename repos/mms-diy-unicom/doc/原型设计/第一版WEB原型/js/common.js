$(document).ready(function(){
	//控制导航子菜单显隐
	$(".block-imglist li").mouseover(function(){
		$(this).addClass("li_over");
	});
	$(".block-imglist li").mouseout(function(){
		$(this).removeClass("li_over");
	});
	
	$(".lbox-r li").mouseover(function(){
		$(this).addClass("li_over");
	});
	$(".lbox-r li").mouseout(function(){
		$(this).removeClass("li_over");
	});
});