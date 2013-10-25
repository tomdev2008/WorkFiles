$(document).ready(function(){
	//控制table列表背景色
	$(".tbl-list tr").mouseover(function(){
		$(this).addClass("over");
	});
	$(".tbl-list tr").mouseout(function(){
		$(this).removeClass("over");
	});
	
	//控制弹窗联系人的背景色
	$(".lbox-r li").mouseover(function(){
		$(this).addClass("li_over");
	});
	$(".lbox-r li").mouseout(function(){
		$(this).removeClass("li_over");
	});
	
	//控制弹窗联系人的背景色
	$(".user-box dt,.user-box dd,.user-selected li").mouseover(function(){
		$(this).addClass("over");
	});
	$(".user-box dt,.user-box dd,.user-selected li").mouseout(function(){
		$(this).removeClass("over");
	});
	
	//折叠展开切换效果
	$(".user-box dt").click(function(){
		$(this).parent().toggleClass("show-dd");
	});
});