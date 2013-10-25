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
<style>
body{text-align:center;width:100%;}  
#wrap{ 
 text-align:left;  
 width:560px;  
 margin:0 auto;  
 border:1px solid #333;  
 background-color:#ccc;
 } 
</style>
<script type="text/javascript" src="<%= realPath%>common/js/common.js"></script>
<script type="text/javascript" src="<%= realPath%>userManager/controller/userManager_controller.js"></script>
<script type="text/javascript" src="<%= realPath%>sendTemplateCard.js"></script>
<script type="text/javascript">
function addShouCangq(cardId)
{
	  $.post(ctxPath+'/myShouCang!addShouCang.action',{//
			'cardId':cardId
		},
		function(data) {
		//	var data = eval('(' + data + ')');
			if(null!=data && ""!=data){
				if(data.msg=="error"){
		//			$("#titleContant").html("请先登录！");
		//			sendBox5.Show();
					window.location.href = ctx+"timeout.jsp";
				}
			    else if(data.msg=="ok"){
					alert("收藏成功！");
				}else if(data.msg=="no")
					{
					alert("收藏失败");
					}
			}
	});
}

</script>
</head>

<body align="center">
	<div class="wrap" >
		<!-- Header begin -->
		<jsp:include page="top.jsp" />
		<!-- Header end -->
		<div class="menu">
			<ul>
<%-- 			<%=path%> --%>
				<li class="on"><a href="<%=path%>/weclome.jsp">模版明信片</a></li>
				<li><a href="diyPostcard/diyPostcard.jsp">DIY明信片</a></li>
				<li><a href="gifPostcard/gifPostcard.jsp">动态明信片</a></li>
			</ul>
			<i></i>
		</div>
		
		<!-- 登陆 begin -->
		<jsp:include page="login.jsp" />
		<!-- 登陆 end -->
		
		<div class="mainbox">
			<div class="m-left">
				<!--节日祝福-->
				<div class="block1">
					<s:iterator id="lists" value="templateCardList">
<%-- 					<%=path%> --%>
					<div class="block-titbar"><h3 style="color: white;size: 16px;font-weight: bold;"><s:property value="#lists.name"/></h3><a style="color: white;" href="<%=path%>/pageTemplateCard!pageTemplate.action?templateCardType=<s:property value="#lists.id"/>">&gt;&gt;更多</a></div>
					<ul class="block-imglist">
						<s:iterator id="card" value="#lists.templateCard.result">
							<li>
								<a href="javascript:void(0)" onClick="javascript:sendTemplate(<s:property value="#card.id" />);" target="_self"><img src='${imgHttp}<s:property value="#card.smallPic" />'></a>
								<span class="img-name"><!-- <a href="javascript:void(0)" onClick="javascript:sendTemplate(<s:property value="#card.id" />);" target="_self"></a> -->
									<cite><s:property value="#card.cardTitle"></s:property></cite>
									<i class="ico1 png" title="收藏" onclick="addShouCangq(<s:property value="#card.id" />);"></i><i class="ico2 png" title="发送" onClick="javascript:sendTemplate(<s:property value="#card.id" />);"></i>
								</span>
							</li>
						</s:iterator>
					</ul>
					</s:iterator>
				</div>
			</div>
			
			<!-- 最新推荐，最热推荐 begin -->
			<jsp:include page="billboard.jsp" />
			<!-- 最新推荐，最热推荐 end -->
			
		</div>
	</div>
	
	<!-- FOOT begin-->
	<jsp:include page="foot.jsp" />
	<!-- FOOT end-->
	
	<!-- 发送模板明信片弹出框 begin -->
	<jsp:include page="sendBox.jsp" />
	<!-- 发送模板明信片弹出框 end -->
	
</body>
</html>
