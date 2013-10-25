<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/jsp/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>沃爱彩信</title>
<meta name="keywords" content="沃爱彩信" />
<meta name="description" content="沃爱彩信" />
<style>
body{text-align:center;width:100%;} 
#wrap{ 
text-align:left; 
width:560px; 
margin:0 auto; 
border:1px solid #333; 
background-color:#ccc; 
</style>
<script type="text/javascript" src="controller/gifPostcard_controller.js"></script>
</head>

<body>
	<div class="wrap">

	<!-- Header begin -->
	<jsp:include page="../top.jsp" />
	<!-- Header end -->
	
	<div class="menu">
		<ul>
			<li><a href="<%=path%>/weclome.jsp">模版明信片</a></li>
			<li><a href="<%=path%>/diyPostcard/diyPostcard.jsp">DIY明信片</a></li>
			<li class="on"><a href="<%=path%>/gifPostcard/gifPostcard.jsp">动态明信片</a></li>
		</ul>
		<i></i>
	</div>
	
	<!-- 登陆 begin -->
	<jsp:include page="../login.jsp" />
	<!-- 登陆 end -->
			
	<div class="mainbox">
		<div class="left780">
			<div class="diy-top diy-top2">
				<span>收件人：</span>
				<input name="" type="text" />
				<button type="button" title="添加"></button>
			</div>
			<div class="diy-tips">可填写多个收件人，每个人收到的是单独发送的明信片。</div>
			<div class="dt-box">
				<div class="left152">
					<div class="dt-btn-top"></div>
					<div class="dt-limg-list">
						<ul>
							<li><img src="<%= realPath%>common/images/144x90.jpg"></li>
							<li class="on"><img src="<%= realPath%>common/images/144x90.jpg"></li>
							<li><img src="<%= realPath%>common/images/144x90.jpg"></li>
							<li><img src="<%= realPath%>common/images/144x90.jpg"></li>
						</ul>
					</div>
					<div class="dt-btn-bot"></div>
				</div>
				<div class="left590">
					<div class="show-imgs">
						<span class="imgs-bg" style="left:0; top:0;"><img src="<%= realPath%>common/images/588x470.jpg"></span>
						<span class="imgs-mobile png"></span>
						<span class="imgs-pic"><img src="<%= realPath%>common/images/195x280.jpg"></span>
					</div>
					<div class="diy-btns">
						<button type="button" title="发送" class="diy-fs"></button>
						<button type="button" title="预览" class="diy-yl"></button>
						<a href="javascript:;" class="diy-bf on">播放</a>
						<a href="javascript:;" class="diy-zt">暂停</a>
						<a href="javascript:;" class="diy-tz">停止</a>
						<em>2/2</em>
					</div>
					<div class="diy-time-show"><input type="checkbox" name="chetime" />定时发送<em>(选择定时发送的时间)</em></div>
					<div class="diy-time" style="display:none;">
						<span class="show-time-titbar"><input type="checkbox" name="chetime" />定时发送<em>(选择定时发送的时间)</em></span>
						<span class="show-time-cons">
							<select name="" style="width:60px;">
								<option>2012</option>
							</select>
							<em>年</em>
							<select name="">
								<option>01</option>
							</select>
							<em>月</em>
							<select name="">
								<option>01</option>
							</select>
							<em>日</em>
							<select name="">
								<option>01</option>
							</select>
							<em>时</em>
							<select name="">
								<option>01</option>
							</select>
							<em>分</em>
						</span>
						<p>彩信将在 今天下午5:00 投递到对方手机</p>
					</div>
				</div>
			</div>
			
		</div>
		<div class="right175">
			<div class="right175-top"></div>
			<ul class="rimg-list">
				<li class="on"><img src="<%= realPath%>common/images/136x104.jpg"></li>
				<li><img src="<%= realPath%>common/images/136x104.jpg"></li>
				<li><img src="<%= realPath%>common/images/136x104.jpg"></li>
				<li><img src="<%= realPath%>common/images/136x104.jpg"></li>
				<li><img src="<%= realPath%>common/images/136x104.jpg"></li>
			</ul>
			<div class="diy-page">
				<a href="#" class="dp1"></a><i>1/1</i><a href="#" class="dp2"></a>
			</div>
		</div>
	</div>
</div>
<!-- FOOT begin-->
<jsp:include page="../foot.jsp" />
<!-- FOOT end-->

<!--发送明信片弹窗 lightbox-->
<div id="sendBox1" style="display:none">
	<div class="lbox608">
		<i class="lbox-tbg png"></i>
		<div class="lbox-bg png">
			<form>
			<div class="lbox-wrap">
				<span class="btn-close png" title="关闭" onClick="javascript:sendBox1.Close();"></span>
				<span class="lbox-titbar">发送彩信</span>
				<span class="lbox-cons cons1">
					<span class="show-img1">
						<span class="yp1 png"></span>
						<img src="<%= realPath%>common/images/518x278.jpg" />
					</span>
					<span class="show-text1">
						<cite>留言：</cite>
						<textarea name="ly">也许岁月将往事褪色，或许空间将彼此隔离。但值得珍惜的依然是知心的友谊。想再次对你说声：2013，新年快乐！</textarea>
					</span>
					<span class="show-tips1">还可以输入60个字</span>
				</span>
				<span class="lbox-btns">
					<button class="btns-next" title="下一步"></button>
					<button class="btns-cancel" title="取消" onClick="javascript:sendBox1.Close();" type="button"></button>
				</span>
			</div>
			</form>
		</div>
		<i class="lbox-bbg png"></i>
	</div>
</div>
<!--发送明信片弹窗 lightbox end-->

<script type="text/javascript">
	var sendBox1 = new LightBox("sendBox1"); //发送明信片弹窗
	//sendBox1.Show();//默认显示出来
</script>
</body>
</html>
