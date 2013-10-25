var ind = 0;
var b = 1000;

//下拉框选择时修改音乐
function tochachecmuzic() {
	var muzicsrc = "";
	muzicsrc = $("#themuzics").val();
	$("#mymusicplaymast").attr("src","http://211.91.224.232/resources/"+muzicsrc);
}

//改变字体大小
function daxiaochange(){
	var typeface = $("#daxiao").val();
	if (20 == typeface) {
		$("#zfy").css("font-size", "20px");
	} else if (25 == typeface) {
		$("#zfy").css("font-size", "25px");
	} else if (30 == typeface) {
		$("#zfy").css("font-size", "30px");
	} else if (35 == typeface) {
		$("#zfy").css("font-size", "35px");
	}
}

// 改变字体颜色
function yansechange(){
	var color=$("#yanse").val();
	if ("black" == color) {
		$("#zfy").css("color", "black");
	} else if ("red" == color) {
		$("#zfy").css("color", "red");
	} else if ("blue" == color) {
		$("#zfy").css("color", "blue");
	} else if ("green" == color) {
		$("#zfy").css("color", "green");
	}
}
// 播放音乐
function bofangfun() {
	$("#bfa").attr("class", "diy-bf on");
	$("#zta").removeClass("on");
	$("#tza").removeClass("on");
	document.getElementById("mymusicplaymast").play();
}

//暂停音乐
function tingzhifun() {
	$("#bfa").removeClass("on");
	$("#tza").removeClass("on");
	$("#zta").attr("class", "diy-zt on");
	document.getElementById("mymusicplaymast").pause();
}

//停止音乐
function zantingfun() {
	$("#tza").attr("class", "diy-tz on");
	$("#zta").removeClass("on");
	$("#bfa").removeClass("on");
	document.getElementById("mymusicplaymast").pause();
}

//加载音乐
function queryMusicAll() {
	$.post(ctx+'diycard/diycard/diycard!queryInitPictrue.action',{
	 'pageNow':1,
	 'whatpic':7,
	 'picType':1
	},
	function(data){
	 	if(null!=data && ""!=data){
	 		var date = new Date();
	 		var sel1 = $("#themuzics");
	 		sel1.empty();
	 		for(var i = 0; i < data.frameVos.length; i++) {
	 			if(0 == i) {
	 			}
	 			var opt = $("<option>").text(data.frameVos[i].name).val(data.frameVos[i].picUrl);  
				sel1.append(opt);
	 		}
		}			
	});
}
//加载字体类型
function queryFontsType() {
	$.post(ctx+'diycard/diycard/diycard!queryInitPictrue.action',{
	 'pageNow':1,
	 'whatpic':8,
	 'picType':1
	},
	function(data){
	 	if(null!=data && ""!=data){
	 		var date = new Date();
	 		var sel1 = $("#ziti");
	 		sel1.empty();
	 		for(var i = 0; i < data.frameVos.length; i++) {
	 			var opt = $("<option>").text(data.frameVos[i].name).val(data.frameVos[i].picUrl);  
				sel1.append(opt);
	 		}
		}			
	});
}
//点击时变换A标签样式
function changeClassFun(paramid) {
	pageNow=1
	var beforid = picType;
	picType = paramid.id;
	$("#"+picType).attr("class", "on");
	$("#"+beforid).removeClass("on");
	queryPicTure(whichPic);
}
//去除某个饰品的方法
function delimges(paramsid,paramswhic) {
	$("#"+paramswhic).attr("name","godlike");
	del(paramsid);
}
//翻页方法
function chanegePage(params) {
	if(1 == params) {		//往前翻页
		if(1 != pageNow) {
			pageNow = pageNow-1;
			$("#pageNums").html(pageNow+"/"+maxPages);
		}else
			{
			alert("当前页为第一页");
			return;
			}
	} else {		//往后翻页
		if(pageNow < maxPages) {
			pageNow = pageNow+1;
			$("#pageNums").html(pageNow+"/"+maxPages);
		}else
			{
			alert("当前页为最后一页");
			return;
			}
	}
	queryPicTure($("#paramType").val());
}


//查询明信片图片
function queryPicTure(paranms) {
	var whatpic = 1;		//图片品种(相框，相片，邮票)
	if("xzpul" == paranms) {
		whatpic = 2;
	} else if("xypul" == paranms) {
		whatpic = 3;
	} else if("xycul" == paranms) {
		whatpic = 4;
	} else if("xspul" == paranms) {
		whatpic = 5;
	} else if("xdpul" == paranms) {
		whatpic = 6;
	} else {
		whatpic = 1;
	}
	$.post(ctx+'diycard/diycard/diycard!queryInitPictrue.action',{
	 'pageNow':pageNow,
	 'whatpic':whatpic,
	 'picType':picType
	},
	function(data){
	 	if(null!=data && ""!=data){
	 		var date = new Date();
	 		maxPages = data.maxPage;
	 		$("#pageNums").html(pageNow+"/"+maxPages);
	 		$("#"+paranms).empty();
	 		for(var i = 0; i < data.frameVos.length; i++) {
 				var thisli = $("<li>");
	 			var thisimg = $("<img>");
	 			thisimg.attr("src",imgHttp+data.frameVos[i].picUrl+"?"+date.toLocaleString());
	 			thisimg.attr("param",data.frameVos[i].id);
	 			if(5 == whatpic) {		//为选饰品添加点击事件
	 				thisimg.click(function(){
		 				$("#divCenter" + $(this).attr('param')).css("display", "");
						$("#divCenter" + $(this).attr('param')).css("z-index", b);
						b++;
						ind++;
						$("#divCenter" + $(this).attr('param')).find('img').attr("src",$(this).attr('src'));
						var imans = "shipin"+ind;
						$("#divCenter" + $(this).attr('param')).html(
							"<a href='javascript:void(0);' onclick=delimges('divCenter"+ $(this).attr('param')
								+ "','"+imans+"')>X</a><img id='"+imans+"' name='wolegeca' onclick='rightNowDivID("+$(this).attr('param')+");' style='position:absolute;left:0px;top:0px;width:100%;height:100%;z-Index:-1;' src='"
							+ $(this).attr('src')+ "'/><input id='impeus"+$(this).attr('param')+"' value='0' style='display: none;'/>");
						$("#divCenter" + $(this).attr('param')).resizable();
		 			});
	 			} else if(1 == whatpic) {		//为选相框添加点击事件
	 				if(i == 0) {
	 					var theurl = "";
	 					$.ajax({
		 					type : "post",
		 					url : ctx+"diycard/diycard/diycard!queryPictrueById.action?photoFramsId="+ data.frameVos[i].id,
		 					dataType : "json",
		 					success : function(obj) {
		 						theurl = imgHttp + obj.photoFrameVo.picUrl;
	 							$('#layerMask').attr("src",theurl+"?"+date.toLocaleString());
//	 							var thenowpic = document.getElementById('layerMask');
//	 							if(460 < thenowpic.height) {
//	 								$("#layerMask").css("height",460);
//	 							}
		 					},
		 					error : function() {
		 						alert("error");
		 					}
		 				});
	 				}
	 				thisimg.click(function(){
	 					var theurl = "";
	 					$.ajax({
		 					type : "post",
		 					url : ctx+"diycard/diycard/diycard!queryPictrueById.action?photoFramsId="+ $(this).attr("param"),
		 					dataType : "json",
		 					success : function(obj) {
		 						theurl = imgHttp + obj.photoFrameVo.picUrl;
	 							$('#layerMask').attr("src",theurl+"?"+date.toLocaleString());
		 					},
		 					error : function() {
		 						alert("error");
		 					}
		 				});
		 			});
	 			} else if(3 == whatpic) {		//为选邮票添加点击事件
	 				thisimg.click(function(){
	 					var imegurl = [];
	 					imegurl = $(this).attr('src').split("?");
	 					$("#layerStamp1").attr("src",imegurl[0]);
	 					$("#layerStamp1").show();
	 					$("#layerStamp1").resizable();
		 			});
	 			} else if(4 == whatpic) {		//为选邮戳添加点击事件
	 				thisimg.click(function(){
	 					var imegurl = [];
	 					imegurl = $(this).attr('src').split("?");
	 					$("#layerPostmark1").attr("src", imegurl[0] );
	 					$("#layerPostmark1").show();
	 					$("#layerPostmark1").resizable();
		 			});
	 			} else if(2 == whatpic) {		//为选照片添加点击事件
	 				thisimg.click(function() {
	 					$("#img2").attr("src", $(this).attr('src'));
	 					$("#img1").attr("src", $(this).attr('src'));
	 					var imginheight = document.getElementById("img2").height;
	 					if(460 < imginheight) {
	 						$("#img2").css("height",460);
	 						$("#img1").css("height",460);
	 					}
	 					$("#img2").show();
	 					$("#img1").show();
	 				});
	 			} else if(6 == whatpic) {
	 				thisimg.click(function() {
	 					var theurl = "";
	 					$.ajax({
		 					type : "post",
		 					url : ctx+"diycard/diycard/diycard!queryDTById.action?photoFramsId="+ $(this).attr("param"),
		 					dataType : "json",
		 					success : function(obj) {
		 						theurl = imgHttp + obj.photoFrameVo.picUrl;
	 							$('#img123').attr("src", theurl+"?"+date.toLocaleString());
	 							$("#img123").show();
		 					},
		 					error : function() {
		 						alert("error");
		 					}
		 				});
	 				});
	 			}
	 			thisli.append(thisimg);
	 			$("#"+paranms).append(thisli);
	 		}
		}			
	});
}

//获取相框图片的分类
function queryFenleiSpan() {
	$("#fenleispan").empty();
	$.post(ctx+'diycard/diycard/diycard!queryPictrueType.action',
	function(data){
	 	if(null!=data && ""!=data){
	 		var date = new Date();
	 		var ids = "";
	 		for(var i = 0; i < data.frameVos.length; i++) {
	 			ids = ids + data.frameVos[i].id;
	 			if(i < data.frameVos.length-1) {
	 				ids = ids + ","
	 			}
	 			var thisa = $("<a>");
	 			if(0 == i) {
	 				thisa.attr("class", "on");
	 				picType = data.frameVos[i].id;
	 			}
	 			thisa.attr("href","javascript:void(0);");
	 			thisa.attr("id",data.frameVos[i].id);
	 			thisa.html(data.frameVos[i].name);
	 			thisa.click(function(){
	 				changeClassFun(this);
	 			});
	 			$("#fenleispan").append(thisa);
	 		}
		}			
	});
}

//获得饰品图片分类
function querySPpictrueType() {
	$("#fenleispan").empty();
	$.post(ctx+'diycard/diycard/diycard!queryFrameType.action',
	function(data){
	 	if(null!=data && ""!=data){
	 		var date = new Date();
	 		var ids = "";
	 		for(var i = 0; i < data.frameVos.length; i++) {
	 			ids = ids + data.frameVos[i].id;
	 			if(i < data.frameVos.length-1) {
	 				ids = ids + ","
	 			}
	 			var thisa = $("<a>");
	 			if(0 == i) {
	 				thisa.attr("class", "on");
	 				picType = data.frameVos[i].id;
	 			}
	 			thisa.attr("href","javascript:void(0);");
	 			thisa.attr("id",data.frameVos[i].id);
	 			thisa.html(data.frameVos[i].name);
	 			thisa.click(function(){
	 				changeClassFun(this);
	 			});
	 			$("#fenleispan").append(thisa);
	 		}
		}			
	});
}

//初始
$(document).ready(function() {
	queryPicTure("xxkul");		//获得最初图片
	querySPpictrueType();
	//queryFontsType();//加载字体类型
	//queryMusicAll();//加载背景音乐
	$("#xxk").click(function(){
		querySPpictrueType();
		pageNow=1
		queryPicTure("xxkul");
		whichPic = "xxkul";
		$("#xxk").attr("class", "on");
		$("#xzp").removeClass("on");
		$("#xyp").removeClass("on");
		$("#xyc").removeClass("on");
		$("#xsp").removeClass("on");
		$("#xdp").removeClass("on");
		$("#xxkul").css("display", "block");
		$("#xzpul").css("display", "none");
		$("#xypul").css("display", "none");
		$("#xycul").css("display", "none");
		$("#xspul").css("display", "none");
		$("#xdpul").css("display", "none");
		$("#pictype").css("display", "block");
		$("#wenjian").css("display", "none");	
		$("#paramType").val("xxkul");
	});
	$("#xzp").click(function(){
		pageNow=1
		whichPic = "xzpul";
		queryPicTure("xzpul");
		$("#xxk").removeClass();
		$("#xzp").attr("class", "on");
		$("#xyp").removeClass("on");
		$("#xyc").removeClass("on");
		$("#xsp").removeClass("on");
		$("#xdp").removeClass("on");
		$("#xxkul").css("display", "none");
		$("#xzpul").css("display", "block");
		$("#xypul").css("display", "none");
		$("#xycul").css("display", "none");
		$("#xspul").css("display", "none");
		$("#xdpul").css("display", "none");
		$("#pictype").css("display", "none");
		$("#wenjian").css("display", "block");
		$("#paramType").val("xzpul");
	});
	$("#xyp").click(function(){
		pageNow=1
		whichPic = "xypul";
		queryPicTure("xypul");
		$("#xyp").attr("class", "on");
		$("#xxk").removeClass("on");
		$("#xzp").removeClass("on");
		$("#xyc").removeClass("on");
		$("#xsp").removeClass("on");
		$("#xdp").removeClass("on");
		$("#xxkul").css("display", "none");
		$("#xzpul").css("display", "none");
		$("#xypul").css("display", "block");
		$("#xycul").css("display", "none");
		$("#xspul").css("display", "none");
		$("#xdpul").css("display", "none");
		$("#pictype").css("display", "none");
		$("#wenjian").css("display", "none");
		$("#paramType").val("xypul");
	});
	$("#xyc").click(function(){
		pageNow=1
		whichPic = "xycul";
		queryPicTure("xycul");
		$("#xyc").attr("class", "on");
		$("#xxk").removeClass("on");
		$("#xzp").removeClass("on");
		$("#xyp").removeClass("on");
		$("#xsp").removeClass("on");
		$("#xdp").removeClass("on");
		$("#xxkul").css("display", "none");
		$("#xzpul").css("display", "none");
		$("#xypul").css("display", "none");
		$("#xycul").css("display", "block");
		$("#xspul").css("display", "none");
		$("#xdpul").css("display", "none");
		$("#pictype").css("display", "none");
		$("#wenjian").css("display", "none");
		$("#paramType").val("xycul");
	});
	$("#xsp").click(function(){
		queryFenleiSpan();
		pageNow=1
		whichPic = "xspul";
		queryPicTure("xspul");
		$("#xsp").attr("class", "on");
		$("#xxk").removeClass("on");
		$("#xzp").removeClass("on");
		$("#xyp").removeClass("on");
		$("#xyc").removeClass("on");
		$("#xdp").removeClass("on");
		$("#xxkul").css("display", "none");
		$("#xzpul").css("display", "none");
		$("#xypul").css("display", "none");
		$("#xycul").css("display", "none");
		$("#xspul").css("display", "block");
		$("#xdpul").css("display", "none");
		$("#pictype").css("display", "block");
		$("#wenjian").css("display", "none");
		$("#paramType").val("xspul");
	});
	$("#xdp").click(function(){
		pageNow=1
		whichPic = "xdpul";
		queryPicTure("xdpul");
		$("#xdp").attr("class", "on");
		$("#xxk").removeClass("on");
		$("#xzp").removeClass("on");
		$("#xyp").removeClass("on");
		$("#xyc").removeClass("on");
		$("#xsp").removeClass("on");
		$("#xxkul").css("display", "none");
		$("#xzpul").css("display", "none");
		$("#xypul").css("display", "none");
		$("#xycul").css("display", "none");
		$("#xspul").css("display", "none");
		$("#xdpul").css("display", "block");
		$("#pictype").css("display", "none");
		$("#wenjian").css("display", "none");
		$("#paramType").val("xdpul");
	});
	var img = $("#img1");
	var img2 = $("#img2");

	img.draggable({
		drag : function(event, ui) {
			img2.css("top", $('#img1').position().top);
			img2.css("left", $('#img1').position().left);
		}
	});
	$('#img1').draggable();
	$('#img2').draggable();
	for ( var i = 1; i <= 200; i++) {
		$('#divCenter' + i).draggable();
	}
	/*------------hahas------------*/
	$('#layerText1').draggable();
	$("#layerText1").css("display", "");
	$("#layerText1").css("z-index", b);
	$("#layerText1").resizable();
	/*------------hahae------------*/
	var rangePohotoDoc = document.getElementById("rangePhoto");
	var rangeStampDoc = document.getElementById("rangeStamp");
	var rangePostmarkDoc = document.getElementById("rangePostmark");
	var rangeTextDoc = document.getElementById("rangeText");
	$(document).mousemove(
		function(e) {
			var rangePhotoX = rangePohotoDoc.getBoundingClientRect().left;
			var rangePhotoX1 = $('#rangePhoto').css("width").replace("px", "");
			rangePhotoX1 = parseInt(rangePhotoX)+ parseInt(rangePhotoX1);
			var rangePhotoY = rangePohotoDoc.getBoundingClientRect().top;
			var rangePhotoY1 = $('#rangePhoto').css("height").replace("px", "");
			rangePhotoY1 = parseInt(rangePhotoY)+ parseInt(rangePhotoY1);
			if (e.pageX > rangePhotoX && e.pageX < rangePhotoX1 && e.pageY > rangePhotoY && e.pageY < rangePhotoY1) {
				$('#rangePhoto').css("visibility","visible");
				$('#layerMover').css("visibility","visible");
			}
			var rangeStampX = rangeStampDoc.getBoundingClientRect().left;
			var rangeStampX1 = $('#rangeStamp').css("width").replace("px", "");
			rangeStampX1 = parseInt(rangeStampX)+ parseInt(rangeStampX1);
			var rangeStampY = rangeStampDoc.getBoundingClientRect().top;
			var rangeStampY1 = $('#rangeStamp').css("height").replace("px", "");
			rangeStampY1 = parseInt(rangeStampY)+ parseInt(rangeStampY1);
			if (e.pageX > rangeStampX && e.pageX < rangeStampX1 && e.pageY > rangeStampY && e.pageY < rangeStampY1) {
				$('#rangeStamp').css("visibility","visible");
				$('#rangePostmark').css("visibility","hidden");
			}
			var rangePostmarkX = rangePostmarkDoc.getBoundingClientRect().left;
			var rangePostmarkX1 = $('#rangePostmark').css("width").replace("px", "");
			rangePostmarkX1 = parseInt(rangePostmarkX)+ parseInt(rangePostmarkX1);
			var rangePostmarkY = rangePostmarkDoc.getBoundingClientRect().top;
			var rangePostmarkY1 = $('#rangePostmark').css("height").replace("px", "");
			rangePostmarkY1 = parseInt(rangePostmarkY)+ parseInt(rangePostmarkY1);
			if (e.pageX > rangePostmarkX && e.pageX < rangePostmarkX1 && e.pageY > rangePostmarkY && e.pageY < rangePostmarkY1) {
				$('#rangePostmark').css("visibility","visible");
				$('#rangeStamp').css("visibility", "hidden");
			}
			var rangeTextX = rangeTextDoc.getBoundingClientRect().left;
			var rangeTextX1 = $('#rangeText').css("width").replace("px", "");
			rangeTextX1 = parseInt(rangeTextX)+ parseInt(rangeTextX1);
			var rangeTextY = rangeTextDoc.getBoundingClientRect().top;
			var rangeTextY1 = $('#rangeText').css("height").replace("px", "");
			rangeTextY1 = parseInt(rangeTextY)+ parseInt(rangeTextY1);
			if (e.pageX > rangeTextX && e.pageX < rangeTextX1 && e.pageY > rangeTextY && e.pageY < rangeTextY1) {
				$('#rangeText').css("visibility", "visible");
			}
			$("#kele").val(" e.pageX:"+e.pageX+" e.pageY:"+e.pageY+" rangeTextY:"+rangeTextY+" rangeTextY1:"+rangeTextY1);
		});
	$('#rangeText').mouseout(function(e) {
		$('#rangeText').css("visibility", "hidden");
	});
	$('#layerText').mouseout(function(e) {
		$('#rangeText').css("visibility", "hidden");
	});
	$('#rangeStamp').mouseout(function(e) {
		$('#rangeStamp').css("visibility", "hidden");
	});
	$('#rangePostmark').mouseout(function(e) {
		$('#rangePostmark').css("visibility", "hidden");
	});
	$('#layerMover').mouseout(function(e) {
		$('#rangePhoto').css("visibility", "hidden");
		$('#layerMover').css("visibility", "hidden");
	});
	$('#rangePhoto').mouseout(function(e) {
		$('#rangePhoto').css("visibility", "hidden");
		$('#layerMover').css("visibility", "hidden");
	});
	$('#layerMover').bind('mousewheel', function(event, delta) {
		var i = img.height();
		var w = img.width();
		if (delta > 0) {
			i = i + 10;
			w = w + 10;
		} else {
			i = i - 10;
			w = w - 10;
		}
		img.height(i);
		img2.height(i);
		img.width(w);
		img2.width(w);
	});
	$("#time").dialog({
		autoOpen : false,
		modal : true,
		height : 240,
		width : 440,
		buttons : {
			"发送" : function() {
				alert('设设置成功!');
				$("#time").dialog("close");
			},
			"取消" : function() {
				$("#time").dialog("close");
			}
		}
	});
	$("#sendtime1").click(function() {
		$("#time").dialog("open");
	});
	
	//改变饰品大小的工具
	$( "#slider-range-min" ).slider({
	      range: "min",
	      value: 0,
	      min: 0,
	      max: 360,
	      slide: function( event, ui ) {
	    	  var spid = "shipin"+pointImge;
	    	  var docship = document.getElementById(spid);
	    	  var docship = $("#"+spid);
	    	  if(null != docship) {
//	    		  var document.getElementById("impeus" + pointImge).value;
	    		  ishus = $("#impeus" + pointImge).val();
//	    		  $("#shoujianren").val("ishus:  "+ishus+"    ui.value:  "+ui.value);
	    		  if(ui.value > ishus) {
	    			  whatsTypes = true;
	    			  Img.rotate("divCenter" + pointImge, ui.value);
	    		  } else {
	    			  whatsTypes = false;
	    			  Img2.rotate("divCenter" + pointImge, -ui.value);
	    		  }
  	        	  $("#impeus" + pointImge).val(ui.value);
	    	  } else {
	    		  $("#slider-range-min").slider("value", 0);
	    	  }
	      }
	});
});
function del(v) {
	$("#" + v).css("display", "none");
}

//替换HTTP字符
String.prototype.replaceAll  = function(s1,s2){  
	return this.replace(new RegExp(s1,"gm"),s2);   //这里的gm是固定的，g可能表示global，m可能表示multiple。
}

//提交请求合并图片方法
function hebingpirctruefun() {
	//背景图片位置、大小以及路径 layerMask
	 var bgde=document.getElementById('layerMask');
	 var bgeleft = bgde.getBoundingClientRect().left;
	 var bgetop = bgde.getBoundingClientRect().top;
	 var bgeright = bgde.getBoundingClientRect().right;
	 var bgebottom = bgde.getBoundingClientRect().bottom;
	 var bgwideth = bgeright - bgeleft;
	 var bghiehgt = bgebottom - bgetop;
	 var bgurl = document.getElementById('layerMask').src;//BACKGROUND
	 
//	 alert("相框    宽度："+bgwideth+"    高度："+bghiehgt+"    url："+bgurl);
	//照片图片位置以及路径 img2
	 var picde=document.getElementById('img2');
	 var piceleft = picde.getBoundingClientRect().left;
	 var picetop = picde.getBoundingClientRect().top;
	 var piceright = picde.getBoundingClientRect().right;
	 var picebottom = picde.getBoundingClientRect().bottom;
	 var picwideth = piceleft-bgeleft;
	 var pichiehgt = picetop-bgetop;
	 var picurl = document.getElementById('img2').src;//BACKGROUND
//	 alert("相片    宽度："+picwideth+"    高度："+pichiehgt+"    url："+picurl);
	//邮票图片位置以及路径 layerStamp1
	 var layde=document.getElementById('layerStamp1');
	 var layeleft = layde.getBoundingClientRect().left;
	 var layetop = layde.getBoundingClientRect().top;
	 var layeright = layde.getBoundingClientRect().right;
	 var layebottom = layde.getBoundingClientRect().bottom;
	 var laywideth = layeleft - bgeleft;
	 var layhiehgt = layetop - bgetop;
	 var layurl = document.getElementById('layerStamp1').src;//BACKGROUND
	 if(-1 < layurl.indexOf("diyPostcard.jsp")) {
		 layurl = "";
	 }
//	 var layurlbefore = layurl.indexOf("http");
//	 var layurlafter = layurl.indexOf("no-repeat");
//	 layurl = layurl.substring(layurlbefore,layurlafter-2);
//	 layurl = layurl.replace(/\"/g,"");
//	 layurl = layurl.replace("url(","");
//	 alert("邮票    宽度："+laywideth+"    高度："+layhiehgt+"    url："+layurl);
	//邮戳图片位置以及路径 layerPostmark1
	 var postde=document.getElementById('layerPostmark1');
	 var posteleft = postde.getBoundingClientRect().left;
	 var postetop = postde.getBoundingClientRect().top;
	 var posteright = postde.getBoundingClientRect().right;
	 var postebottom = postde.getBoundingClientRect().bottom;
	 var postwideth = posteleft - bgeleft;
	 var posthiehgt = postetop - bgetop;
	 var posturl = document.getElementById('layerPostmark1').src;//BACKGROUND
	 if(-1 < posturl.indexOf("diyPostcard.jsp")) {
		 posturl = "";
	 }
//	 var posturlbefore = posturl.indexOf("http");
//	 var posturlafter = posturl.indexOf("no-repeat");
//	 posturl = posturl.substring(posturlbefore,posturlafter-2);
//	 posturl = posturl.replace(/\"/g,"");
//	 posturl = posturl.replace("url(","");
//	 alert("邮戳    宽度："+postwideth+"    高度："+posthiehgt+"    url："+posturl);
	 var fonttest = document.getElementById('layerText');
	 var fontwideth = fonttest.getBoundingClientRect().left - bgeleft;
	 var fonthiehgt = fonttest.getBoundingClientRect().top - bgetop+10;
	 //正文内容
	 var fontcontcat = $("#layerText1").val();
	 var zhengwen=document.getElementById('layerText1');
	 var zhengwenleft = zhengwen.getBoundingClientRect().left;
	 var zhengwentop = zhengwen.getBoundingClientRect().top;
	 var zhengwenright = zhengwen.getBoundingClientRect().right;
	 var zhengwenbottom = zhengwen.getBoundingClientRect().bottom;
	 var zhengwenwideth = zhengwenleft - bgeleft;
	 var zhengwenhiehgt = zhengwentop - bgetop;
	 //底图
	 var ditu = document.getElementById('img123');
	 var url0 = [];
	 url0 = ditu.src.split("?");
	 if(-1 < ditu.src.indexOf("diyPostcard.jsp") || -1 < url0[0].indexOf("diyPostcard")) {
		 url0[0] = "";
	 }
	 //饰品
	 var someshipins = "";
	 var spnumb = [];
	 spnumb = $("img[name='wolegeca']");
	 var url1 = [];
	 url1 = bgurl.split("?");
	 var url7 = [];
	 url7 = picurl.split("?");
	 if(-1 < picurl.indexOf("diyPostcard.jsp") || -1 < picurl.indexOf("diyPostcard")) {
		 url7[0] = "";
	 }
	 if(0 > picwideth || 0 > pichiehgt) {
		 picwideth = 0;
		 pichiehgt = 0;
	 }
	 picwideth = parseInt(picwideth);
	 pichiehgt = parseInt(pichiehgt);
	 var endjson = "{'underImage':{'path':'"+url0[0]+"','xPos':0,'yPos':0,'width':"+ditu.width+",'height':"+ditu.height+"}," +
		"'userPhoto':[{'path':'"+url7[0]+"','xPos':"+picwideth+",'yPos':"+pichiehgt+",'width':"+picde.width+",'height':"+picde.height+"}]," +
		"'photoFrame':{'path':'"+url1[0]+"','xPos':0,'yPos':0,'width':"+bgde.width+",'height':"+bgde.height+"}";
	 endjson = endjson+",'images':["
	 if(1 <= spnumb.length) {
		 for(var i = 1; i <= spnumb.length; i++) {
			 var shipin = document.getElementById(spnumb[i-1].id);
			 var shipinwideth = shipin.getBoundingClientRect().left - bgeleft;
			 var shipinhiehgt = shipin.getBoundingClientRect().top - bgetop;
			 var shipinurl = document.getElementById(spnumb[i-1].id).src;
			 someshipins = someshipins+shipinwideth+","+shipinhiehgt+","+shipinurl+"+";
			 var parenstid = document.getElementById(spnumb[i-1].id).parentNode.id;
			 initsnumber = parenstid.replaceAll("divCenter","");
			 var dushu = $("#impeus"+initsnumber).val();
			 var url2 = [];
			 url2 = shipinurl.split("?");
			 shipinwideth = parseInt(shipinwideth);
			 shipinhiehgt = parseInt(shipinhiehgt);
			 endjson = endjson+"{'path':'"+url2[0]+"','xPos':"+shipinwideth+",'yPos':"+shipinhiehgt+",'width':"+shipin.width+",'height':"+shipin.height+",'rotate':"+dushu+"},";
		 }
		 endjson = endjson.substring(0,endjson.length-1);
		 endjson = endjson+",";
	 }/* else if(1 == spnumb.length) {
		 var shipin = spnumb[0];
		 if(null != shipin) {
			 var shipinwideth = shipin.getBoundingClientRect().left - bgeleft;
			 var shipinhiehgt = shipin.getBoundingClientRect().top - bgetop;
			 var shipinurl = document.getElementById('shipin').src;
			 alert("#impeus"+pointImge);
			 var dushu = $("#impeus"+pointImge).val();
			 var url2 = [];
			 url2 = shipinurl.split("?");
			 shipinwideth = parseInt(shipinwideth);
			 shipinhiehgt = parseInt(shipinhiehgt);
			 someshipins = someshipins+shipinwideth+","+shipinhiehgt+","+shipinurl;
			 endjson = endjson+"{'path':'"+url2[0]+"','xPos':"+shipinwideth+",'yPos':"+shipinhiehgt+",'width':"+shipin.width+",'height':"+shipin.height+",'rotate':"+dushu+"},";
		 }
	 }*/
	 var url3 = [];
	 url3 = layurl.split("?");
	 if(0 > laywideth || 0 > layhiehgt) {
		 laywideth = 0;
		 layhiehgt = 0;
	 } 
	 if(0 > postwideth || 0 > posthiehgt) {
		 posthiehgt = 0;
		 postwideth = 0;
	 }
	 if(-1 < url3[0].indexOf("diyPostcard.jsp") || -1 < url3[0].indexOf("diyPostcard")) {
		 url3[0] = "";
	 }
	 endjson = endjson+"{'path':'"+url3[0]+"','xPos':"+laywideth+",'yPos':"+layhiehgt+",'width':"+layde.width+",'height':"+layde.height+",'rotate':0.0},";
	 var url4 = [];
	 url4 = posturl.split("?");
	 if(-1 < url4[0].indexOf("diyPostcard.jsp") || -1 < url4[0].indexOf("diyPostcard")) {
		 url4[0] = "";
	 }
	 endjson = endjson+"{'path':'"+url4[0]+"','xPos':"+postwideth+",'yPos':"+posthiehgt+",'width':"+postde.width+",'height':"+postde.height+",'rotate':0.0}]";
	 zhengwenwideth = parseInt(zhengwenwideth);
	 zhengwenhiehgt = parseInt(zhengwenhiehgt);
	 endjson = endjson+",'text':{'text':'"+$("#layerText").val()+"','xPos':"+zhengwenwideth+",'yPos':"+zhengwenhiehgt+",'width':"+zhengwen.style.width.replace("px","")+",'height':"+zhengwen.style.height.replace("px","")+",'fontSize':"+$("#daxiao").val()+"," +
	 		"'fontsTTF':'"+$("#ziti").val()+"','fontsColor':'"+$("#yanse").val()+"'}}";
	 endjson = endjson.replaceAll(imgHttp,"");
	 var date=new Date();
	 var imgPic = serverdiyImgPic+"?json="+endjson;
	 $('#newpic').attr("src",imgPic);
	 $('#sendBox1').css("z-Index",9999);
	 sendBox1.Show();//默认显示出来
//	 if (navigator.userAgent.indexOf('webkit') >= 0){//判断浏览器是否属于 火狐
//		 alert("火狐");
//		 sendBox1.Box.style.top = "30%";
//	 } else {
//		 sendBox1.Box.style.top = "30%";
//	 }
	 var ua = navigator.userAgent;
	    ua = ua.toLowerCase();
	    var match = /(webkit)[ \/]([\w.]+)/.exec(ua) ||
	    /(opera)(?:.*version)?[ \/]([\w.]+)/.exec(ua) ||
	    /(msie) ([\w.]+)/.exec(ua) ||
	    !/compatible/.test(ua) && /(mozilla)(?:.*? rv:([\w.]+))?/.exec(ua) || [];
	//match[2]判断版本号
	    switch(match[1]){
	    	case "webkit":     //safari or chrome
	    		sendBox1.Box.style.top = "10%";
	        break;
	    		default:    
	    	break;
	    }
}

//========================
//   更换背景音乐 mid 格式
//=========================
function changeMid(o){
	var soundControlObject = document.getElementById("soundControl");
	soundControlObject.stop();		
	$('#midTitle').html(o.title);
	//soundControlObject.src = "mid/"+o.name;
	document.getElementById("midPlayerDiv").innerHTML = "<embed id=\'soundControl\' src=\'mid/"+o.name+"\' mastersound  loop=\'false\' autostart=\'true\'/>";
	document.getElementById("soundControl").play();
}

function loadContract()
{
	loadGroupContract();
	$('#addLink').css("z-Index",9988);
	addLink.Show();
}

//加载联系人
function loadGroupContract(){
	var groupContract = $("#groupContract");
	groupContract.html("");//清除select中的 option
	jQuery.post(ctxPath+"/findGroups!findGroups.action",
	function(data) {
		if(null!=data && ""!=data){
			for(var i = 0;i < data.groupList.length; i++) {
				var opt = $("<dt>").text(data.groupList[i].name).val(data.groupList[i].id);
				opt.mouseover(function(){
					$(this).addClass("over");
				});
				opt.mouseout(function(){
					$(this).removeClass("over");
				});
				opt.click(function(){
					$(this).parent().toggleClass("show-dd");
				});
//				var xxd = $("<div>").css("border-bottom","1px dashed gray");
				groupContract.append(opt);
//				groupContract.append(xxd);
				var contractsList = data.groupList[i].contactslist;
				for(var j = 0 ; j<contractsList.length; j++ ){
					var dd = $("<dd>").text(contractsList[j].name).val(contractsList[j].id);
					var id=dd.val();
					dd.mouseover(function(){
						$(this).addClass("over");
					});
					dd.mouseout(function(){
						$(this).removeClass("over");
					});
					dd.click(function(){
						wantContactsForCheck(this);
					});
					var xx = $("<div>").css("border-bottom","1px dashed gray");
					groupContract.append(dd);
					groupContract.append(xx);
				}
			}
		}
	},'json');
}
//获取点击选择的联系人
//params联系人的value
function wantContactsForCheck(params) {
	//联系人名字,用于显示
	var contactsed = $("#shoujianren").val();//已经选择的联系人
	//联系人id,用于传到后台
	var addressee = $("#addressee").val(); //已经选择的联系人id
	
	var flat = true;
	var cids="";  //id
	var ccontent=""; //联系人
	if(addressee!=null){
		var ids = addressee.split(";");
		var cont = contactsed.split(";");
		for(var i=0; i<ids.length; i++){
			if(($(params).val())*1==ids[i]*1){ 
				flat = false;
			}else{
				cids += ids[i] +";";
				ccontent += cont[i]+";";
			}
		}
	}
	if(flat){
		var thenewcontact = params.innerHTML + ";";
		contactsed = contactsed + thenewcontact;
		$("#shoujianren").val(contactsed);
		
		var addresseeId = $(params).val() + ";";
		addressee = addressee + addresseeId;
		$("#addressee").val(addressee);
	}else{ //如果该联系人已经被选中，则删除该联系人
		$("#shoujianren").val(ccontent.substring(0,ccontent.length-1));
		$("#addressee").val(cids.substring(0,cids.length-1));
	}
}

//填写留言
function cleaNeiRong() {
	$("#layerText").val("");
}

//将留言显示到界面里
function addNeiRong() {
	$("#zfy").html(""+$("#layerText").val());
}

//选择时间的时候调用
function theendtimescontext() {
	var nianValues = $("select[name='nianer']").val()+"年";
	var yueValues = $("select[name='yueer']").val()+"月";
	var riValues = $("select[name='rier']").val()+"日";
	var shiValues = $("select[name='shier']").val()+"点";
	var fenValues = $("select[name='fener']").val()+"分";
	var endscs = "彩信将在 "+nianValues+yueValues+riValues+shiValues+fenValues+" 投递到对方手机";
	$("#endneirongscc").html(endscs);
}

//根据选择的月份修改日的下拉框的数据
function changeDayByMonth() {
	var selectValues = $("select[name='yueer']").val()+"";
	if("2" == selectValues) {	//如果选择的是2月份
		$("select[name='rier']").empty();
		for(var i = 1; i <= 28; i++) {
			//为Select追加一个Option(下拉项)
			$("select[name='rier']").append("<option value='"+i+"'>"+i+"</option>");   
		}
	} else if("1" == selectValues || "3" == selectValues || "5" == selectValues || "7" == selectValues || "8" == selectValues || "10" == selectValues || "12" == selectValues) {
		$("select[name='rier']").empty();
		for(var i = 1; i <= 31; i++) {
			//为Select追加一个Option(下拉项)
			$("select[name='rier']").append("<option value='"+i+"'>"+i+"</option>");   
		}
	} else {
		$("select[name='rier']").empty();
		for(var i = 1; i <= 30; i++) {
			//为Select追加一个Option(下拉项)
			$("select[name='rier']").append("<option value='"+i+"'>"+i+"</option>");   
		}
	}
	theendtimescontext();
}

//文件上传，保存

function uploadFileFun(){
	var fileupload = $("#fileupload").val();
		var fileName = $('input[name="fileupload"]').val();
		if(fileName=="" || null==fileName){
			alert('提示', "请选择需要上传的文件。", 'info');
			return;
		}
		var index = fileName.lastIndexOf(".");
		fileName = fileName.substring(index+1,fileName.length);
		if('jpg'!=fileName){
            alert('提示', "您选择的文件类型不对，jpg文件。", 'info');
			return;
		}
}
