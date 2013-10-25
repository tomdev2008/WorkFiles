<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>DIY明信片</title>
	
	<link rel="stylesheet"  href="http://211.91.224.232:81/static_assets/mobile/css/themes/default/jquery.mobile-1.3.1.css">
	<link rel="stylesheet"  href="http://211.91.224.232:81/static_assets/mobile/_assets/css/style.css">
	<link rel="shortcut icon" href="../favicon.ico">
	
	<script src="http://211.91.224.232:81/static_assets/mobile/js/jquery-1.9.1.min.js"></script>
	<script src="http://211.91.224.232:81/static_assets/mobile/js/jquery.mobile-1.3.1.min.js"></script>
	<script src="http://211.91.224.232:81/static_assets/mobile/js/kinetic-v4.5.4.min.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="../base.js"></script>
	
	<script type="text/javascript">
    	var mdn = <%=request.getParameter("mdn")%>;
    </script>
</head>
<body>
	<link rel="stylesheet"  href="http://211.91.224.232:81/static_assets/mobile/css/themes/default/jquery.mobile-1.3.1.css">
	<link rel="stylesheet"  href="http://211.91.224.232:81/static_assets/mobile/_assets/css/style.css">
	<link rel="shortcut icon" href="../favicon.ico">
<div data-role="page" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" id="one">
	<div data-role="header" >
	<a href="../" data-icon="back" target="_self">返回</a>
    <h1>DIY明信片</h1>
<!--     <a href="#two" onclick="" data-icon="check">开始制作</a> -->
	</div>
	<div data-role="content">
		<label for="file">选择照片:</label>
		<input type="file" name="file" id="file" value="">
	</div>
	<ul data-role="listview" data-inset="true" id="list">
	</ul>
	<button data-theme="b" id="morebut" onclick="moreList();">更多</button>
	<script type="text/javascript">
	var currentPage = 0;
	var pageSize = 5;
	var userId = 1;
	//查询点击图片
	var nowpicobj = null;		// 当前模板图片的对象
	function queryTempPicById(whichone){
		var ids = whichone;
		$.post(ctx+"a/mms/userphoto!queryUserPhotoById.action",{"id":ids},function(data){
			var modelEnty = data.model;
			nowpicobj = modelEnty;
			if(modelEnty!=null){
				$("#userphotomig").attr("src",rsUrl+"/"+modelEnty.photo_url);
			}
		},"json");
	} 
	
	function moreList(){
		$.post(ctx+"a/mms/userphoto!page.action",{"currentPage":currentPage,"pageSize":pageSize,"mdn":mdn},function(data){
			var list = data.pageList.rows;
			if(list!=null && list.length>0){
				for ( var i = 0; i < list.length; i++) {
					var m = list[i];
					$("#list").append("<li class='ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c' data-corners='false' data-shadow='false' data-iconshadow='true' data-wrapperels='div' data-icon='arrow-r' data-iconpos='right' data-theme='c'><div class='ui-btn-inner ui-li'><div class='ui-btn-text'><a href='#two' id='"+m.id+"' class='ui-link-inherit' onclick='queryTempPicById(this.id);'><img class='ui-li-thumb'  src='"+rsUrl+m.photo_url+"'><h2 class='ui-li-heading'>"+m.photo_name+"</h2><p class='ui-li-desc'></p></a></div><span class='ui-icon ui-icon-arrow-r ui-icon-shadow'> </span></div></li>");
				}
// 				$("#list").listview("refresh");
				currentPage = (currentPage+6);
			}
		},"json");
	}
	
	$(document).ready(function() {
		$("#draggable").draggable();
		moreList();
	});
</script>
</div><!-- /page -->

<div data-role="page" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" id="two">
<div data-role="header" >
	<a href="#one" data-icon="back" >返回</a>
    <h1>DIY明信片</h1>
    <a href="javascript:void();" onclick="" data-icon="check">制作完成</a>
	</div>
<div data-role="content">
	<div id="xkdiv" style=" width: 100%;height: 70%;">
	    <div id="draggable" class="ui-widget-content" style=" width: 100%;height: 100%;">
		  <img id="userphotomig" src="" style=" width: 100%;height: 100%;"/>
		</div>
	</div>
</div>
<div data-role="footer">
    <div data-role="navbar">
    <ul>
    	<li><a href="#three" onclick="queryXKbyPage();">相框</a></li>
        <li><a href="#four" onclick="querySPbyPage();">饰品</a></li>
        <li><a href="#five" onclick="queryYPbyPage();">邮票</a></li>
        <li><a href="#six" onclick="queryYCbyPage();">邮戳</a></li>
        <li><a href="#seven" onclick="queryDTbyPage();">底图</a></li>
    </ul>
	</div>
</div>
</div>

<!-- three相框 -->
<div data-role="page" id="three" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" >
	<div data-role="header">
	<a href="#two" data-icon="back" >返回</a>
	    <h1>相框</h1>
	</div>
	<ul data-role="listview" data-inset="true" id="xklist">
	</ul>
	<button data-theme="b" id="xkmorebut" onclick="queryXKbyPage();">更多</button>
	<script type="text/javascript">
	var currentPage = 0;
	var pageSize = 5;
	var userId = 1;
	//获取相框的分页方法
	function queryXKbyPage() {
		$.post(ctx+"a/mms/photoframe!photoFramespage.action",{"currentPage":currentPage,"pageSize":pageSize},function(data){
			var list = data.pageList.rows;
			if(list!=null && list.length>0){
				for ( var i = 0; i < list.length; i++) {
					var m = list[i];
					$("#xklist").append("<li class='ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c' data-corners='false' data-shadow='false' data-iconshadow='true' data-wrapperels='div' data-icon='arrow-r' data-iconpos='right' data-theme='c'><div class='ui-btn-inner ui-li'><div class='ui-btn-text'><a href='#two' id='"+m.id+"' class='ui-link-inherit' onclick='queryTempPicById(this.id);'><img class='ui-li-thumb'  src='"+rsUrl+m.picUrl+"'><h2 class='ui-li-heading'>"+m.name+"</h2><p class='ui-li-desc'></p></a></div><span class='ui-icon ui-icon-arrow-r ui-icon-shadow'> </span></div></li>");
				}
// 				$("#list").listview("refresh");
				currentPage = (currentPage+6);
			}
		},"json");
	}
	</script>
</div>

<!-- four饰品 -->
<div data-role="page" id="four" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" >
	<div data-role="header">
	<a href="#two" data-icon="back" >返回</a>
	    <h1>饰品</h1>
	</div>
	<ul data-role="listview" data-inset="true" id="splist">
	</ul>
	<button data-theme="b" id="spmorebut" onclick="querySPbyPage();">更多</button>
	<script type="text/javascript">
	var currentPage = 0;
	var pageSize = 5;
	var userId = 1;
	//获取相册的分页方法
	function querySPbyPage() {
		$.post(ctx+"a/mms/decoration!decorationspage.action",{"currentPage":currentPage,"pageSize":pageSize},function(data){
			var list = data.pageList.rows;
			if(list!=null && list.length>0){
				for ( var i = 0; i < list.length; i++) {
					var m = list[i];
					$("#splist").append("<li class='ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c' data-corners='false' data-shadow='false' data-iconshadow='true' data-wrapperels='div' data-icon='arrow-r' data-iconpos='right' data-theme='c'><div class='ui-btn-inner ui-li'><div class='ui-btn-text'><a href='#two' id='"+m.id+"' class='ui-link-inherit' onclick='queryTempPicById(this.id);'><img class='ui-li-thumb'  src='"+rsUrl+m.picUrl+"'><h2 class='ui-li-heading'>"+m.name+"</h2><p class='ui-li-desc'></p></a></div><span class='ui-icon ui-icon-arrow-r ui-icon-shadow'> </span></div></li>");
				}
// 				$("#list").listview("refresh");
				currentPage = (currentPage+6);
			}
		},"json");
	}
	</script>
</div>

<!-- five邮票 -->
<div data-role="page" id="five" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" >
	<div data-role="header">
	<a href="#two" data-icon="back" >返回</a>
	    <h1>邮票</h1>
	</div>
	<ul data-role="listview" data-inset="true" id="yplist">
	</ul>
	<button data-theme="b" id="ypmorebut" onclick="queryYPbyPage();">更多</button>
	<script type="text/javascript">
	var currentPage = 0;
	var pageSize = 5;
	var userId = 1;
	//获取相册的分页方法
	function queryYPbyPage() {
		$.post(ctx+"a/mms/stamp!stampspage.action",{"currentPage":currentPage,"pageSize":pageSize},function(data){
			var list = data.pageList.rows;
			if(list!=null && list.length>0){
				for ( var i = 0; i < list.length; i++) {
					var m = list[i];
					$("#yplist").append("<li class='ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c' data-corners='false' data-shadow='false' data-iconshadow='true' data-wrapperels='div' data-icon='arrow-r' data-iconpos='right' data-theme='c'><div class='ui-btn-inner ui-li'><div class='ui-btn-text'><a href='#two' id='"+m.id+"' class='ui-link-inherit' onclick='queryTempPicById(this.id);'><img class='ui-li-thumb'  src='"+rsUrl+m.picUrl+"'><h2 class='ui-li-heading'>"+m.name+"</h2><p class='ui-li-desc'></p></a></div><span class='ui-icon ui-icon-arrow-r ui-icon-shadow'> </span></div></li>");
				}
// 				$("#list").listview("refresh");
				currentPage = (currentPage+6);
			}
		},"json");
	}
	</script>
</div>

<!-- six邮戳 -->
<div data-role="page" id="six" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" >
	<div data-role="header">
	<a href="#two" data-icon="back" >返回</a>
	    <h1>邮戳</h1>
	</div>
	<ul data-role="listview" data-inset="true" id="yclist">
	</ul>
	<button data-theme="b" id="ycmorebut" onclick="queryYCbyPage();">更多</button>
	<script type="text/javascript">
	var currentPage = 0;
	var pageSize = 5;
	var userId = 1;
	//获取相册的分页方法
	function queryYCbyPage() {
		$.post(ctx+"a/mms/postmark!postMarkspage.action",{"currentPage":currentPage,"pageSize":pageSize},function(data){
			var list = data.pageList.rows;
			if(list!=null && list.length>0){
				for ( var i = 0; i < list.length; i++) {
					var m = list[i];
					$("#yclist").append("<li class='ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c' data-corners='false' data-shadow='false' data-iconshadow='true' data-wrapperels='div' data-icon='arrow-r' data-iconpos='right' data-theme='c'><div class='ui-btn-inner ui-li'><div class='ui-btn-text'><a href='#two' id='"+m.id+"' class='ui-link-inherit' onclick='queryTempPicById(this.id);'><img class='ui-li-thumb'  src='"+rsUrl+m.picUrl+"'><h2 class='ui-li-heading'>"+m.name+"</h2><p class='ui-li-desc'></p></a></div><span class='ui-icon ui-icon-arrow-r ui-icon-shadow'> </span></div></li>");
				}
// 				$("#list").listview("refresh");
				currentPage = (currentPage+6);
			}
		},"json");
	}
	</script>
</div>

<!-- seven底图 -->
<div data-role="page" id="seven" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" >
	<div data-role="header">
	<a href="#two" data-icon="back" >返回</a>
	    <h1>底图</h1>
	</div>
	<ul data-role="listview" data-inset="true" id="dtlist">
	</ul>
	<button data-theme="b" id="dtmorebut" onclick="queryDTbyPage();">更多</button>
	<script type="text/javascript">
	var currentPage = 0;
	var pageSize = 5;
	var userId = 1;
	//获取相册的分页方法
	function queryDTbyPage() {
		$.post(ctx+"a/mms/bgpic!bgpicspage.action",{"currentPage":currentPage,"pageSize":pageSize},function(data){
			var list = data.pageList.rows;
			if(list!=null && list.length>0){
				for ( var i = 0; i < list.length; i++) {
					var m = list[i];
					$("#dtlist").append("<li class='ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-btn-up-c' data-corners='false' data-shadow='false' data-iconshadow='true' data-wrapperels='div' data-icon='arrow-r' data-iconpos='right' data-theme='c'><div class='ui-btn-inner ui-li'><div class='ui-btn-text'><a href='#two' id='"+m.id+"' class='ui-link-inherit' onclick='queryTempPicById(this.id);'><img class='ui-li-thumb'  src='"+rsUrl+m.picUrl+"'><h2 class='ui-li-heading'>"+m.name+"</h2><p class='ui-li-desc'></p></a></div><span class='ui-icon ui-icon-arrow-r ui-icon-shadow'> </span></div></li>");
				}
// 				$("#list").listview("refresh");
				currentPage = (currentPage+6);
			}
		},"json");
	}
	</script>
</div>

<!-- eight制作完成填写号码发送 -->
<div data-role="page" id="eight" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" >
<div data-role="header">
    <a href="#two" data-icon="back">返回</a>
    <h1>DIY明信片</h1>
     <a href="#four" data-icon="check">发送</a>
</div>
<div data-role="content">
		<label for="tel">对方号码:</label>
<input type="tel" name="tel" id="tel" value="">
	<p>预览:</p><br/>
	<img src="http://211.91.224.232/resources/systemData/templateCardPath/1371736907741128.jpg"  class="main-image"/>
	</div><!-- /content -->
</div>

<!-- night发送成功 -->
<div data-role="page" data-close-btn="right" id="night" data-header-theme="b"  data-footer-theme="b" data-content-theme="c" >
		<div data-role="header">
			<h1>发送结果</h1>
		</div>

		<div data-role="content">
			<h1>恭喜您发送成功</h1>
			<p>18600002222将会收到您给他/她发送的彩信.</p>
			<a href="../"  data-role="button" data-theme="b" target="_self">关闭</a>       
		</div>
	</div>

</body>
</html>
