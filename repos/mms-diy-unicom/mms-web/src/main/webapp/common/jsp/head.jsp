<%@page import="com.unicom.mms.entity.TbUsers"%>
<%@page import="cn.com.mmsweb.action.util.SessionUtils"%>
<%@page import="cn.com.common.AppConfig"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix ="s" uri ="/struts-tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ce" uri="/WEB-INF/ce-tag.tld" %>
<head>
<%
	String realPath = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"; 
	String ctx = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	String path = request.getContextPath();
	AppConfig appConfig = AppConfig.getInstance();
	String imgHttp = appConfig.getString("imgHttp");
	String serverImgPic = appConfig.getString("serverImgPic");
	String serverdiyImgPic = appConfig.getString("serverdiyImgPic");
	session.setAttribute("realPath",realPath);
	session.setAttribute("ctx",ctx);
	session.setAttribute("ctxPath", path);
	session.setAttribute("imgHttp", imgHttp);
	session.setAttribute("serverImgPic", serverImgPic);
	session.setAttribute("serverdiyImgPic", serverdiyImgPic);
	if(null!=session.getAttribute(SessionUtils.USER_NAME) && !"".equals(session.getAttribute(SessionUtils.USER_NAME))){
		String loginUserName = session.getAttribute(SessionUtils.USER_NAME).toString();
		session.setAttribute("loginUserName", loginUserName);
		if(null!=session.getAttribute(SessionUtils.USER)){
			TbUsers users = (TbUsers)session.getAttribute(SessionUtils.USER);
			Long usersId = users.getId();
			session.setAttribute("usersId", usersId);
		}
	}
%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<%= realPath%>common/js/jQs.js"></script>
	<script type="text/javascript" src="<%= realPath%>common/js/jstools_mini.js"></script>
	<script type="text/javascript" src="<%= realPath%>common/js/light-box.js"></script>
	<script type="text/javascript" src="<%= realPath%>common/js/common.js"></script>
<!-- 图片处理 -->
	<script src="<%= realPath%>common/js/pictureJs/jquery-1.8.3.js"></script>
	<script type="text/javascript"  src="<%= realPath%>common/js/pictureJs/jquery.min.js"></script>
	<script type="text/javascript"  src="<%= realPath%>common/js/pictureJs/jquery.mousewheel.min.js"></script>
	<script src="<%= realPath%>common/js/pictureJs/jquery-ui-1.9.2.custom.js"></script>
    <link rel="stylesheet" href="<%= realPath%>common/css/pictureCss/jquery-ui-1.9.2.custom.css" />
   	<link rel=stylesheet type=text/css href="<%= realPath%>common/css/pictureCss/comm20101256f6.css">
	<link rel=stylesheet type=text/css href="<%= realPath%>common/css/pictureCss/postcard1202a5.css">
	<link href="<%= realPath%>common/css/main.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		var ctx = '${realPath}';
		var ctxPath ='${ctxPath}';
		var imgHttp = '${imgHttp}';
		var loginUserName = '${loginUserName}';
		var usersId = '${usersId}';
		var serverImgPic = '${serverImgPic}';
		var serverdiyImgPic = '${serverdiyImgPic}';
	</script>
</head>