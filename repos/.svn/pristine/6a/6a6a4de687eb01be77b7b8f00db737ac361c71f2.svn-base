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

<script type="text/javascript" src="<%=realPath%>common/js/common.js"></script>
<script type="text/javascript" src="<%= realPath%>userManager/controller/userManager_controller.js"></script>
<script type="text/javascript" src="<%= realPath%>sendTemplateCard.js"></script>
</head>
<body>
	<div class="wrap">
		<!-- Header begin -->
		<jsp:include page="top.jsp" />
		<!-- Header end -->
		<div class="menu">
			<ul>
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
					<div class="block-titbar"><h3><s:property value="#lists.name"/></h3></div>
					<ul class="block-imglist">
						<s:iterator id="card" value="#lists.templateCard.result">
							<li>
								<a href="javascript:void(0);" onClick="javascript:sendTemplate(<s:property value="#card.id" />);" target="_self"><img src='${imgHttp}<s:property value="#card.smallPic" />'></a>
								<span class="img-name">
									<cite><a href="javascript:void(0)" onClick="javascript:sendTemplate(<s:property value="#card.id" />);" target="_self"><s:property value="#card.cardTitle"></s:property></a></cite>
									<i class="ico1 png" title="收藏"></i><i class="ico2 png" title="发送" onClick="javascript:sendTemplate(<s:property value="#card.id" />);"></i>
								</span>
							</li>
						</s:iterator>
					</ul>
					<div class="in-page" id="all">
	                   <s:url id="url_home" value="pageTemplateCard!pageTemplate.action">
	                     <s:param name="pageNo" value="1"></s:param>
	                   </s:url>
	                   <s:url id="url_pre" value="pageTemplateCard!pageTemplate.action">
	                     <s:param name="pageNo" value="#lists.templateCard.pageNo-1>=1?#lists.templateCard.pageNo-1:1"></s:param>
	                   </s:url>
	                   <s:url id="url_next" value="pageTemplateCard!pageTemplate.action">
	                     <s:param name="pageNo" value="#lists.templateCard.pageNo+1<=#lists.templateCard.maxPage?#lists.templateCard.pageNo+1:#lists.templateCard.maxPage"></s:param>
	                   </s:url> 
	                    <s:url id="url_last" value="pageTemplateCard!pageTemplate.action">
	                     <s:param name="pageNo" value="#lists.templateCard.maxPage"></s:param>
	                   </s:url> 
	                   <s:a href="%{url_home}">首页</s:a>
	                    <s:a href="%{url_pre}">上一页</s:a>
	                  <s:a href="%{url_next}">下一页</s:a>
	                   <s:a href="%{url_last}">末页</s:a>
                  </div>
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
