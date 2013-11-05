<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.util.StringUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.message.UIRespose"/><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	UIRespose.addMessage(request.getParameter("name1"));
	UIRespose.addMessage(request.getParameter("name2"));
	UIRespose.addMessage(request.getParameter("name3"));
	UIRespose.addMessage(request.getParameter("name4"));
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@include file="/web/pub/head.inc" %>
		<title>tip演示页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="${ROOT}/js/tip.js"></script>
		<script language="javascript" type="text/javascript" src="${ROOT}/js/dialog.js"></script>
		<script>
		function sm(){
			showPop(0, "正在向服务器提交数据，请稍候……");//只显示提交状态条
			setTimeout( function() {document.form1.submit();}, 5000);
		}
		function test(msg){
			alert(msg);
		}
		function showTip(){
			document.form1.submit();
		}
		</script>
	</head>
	<body>
	<div align="left">
		<a href="javascript:sm();" >提交的时候锁定屏幕，显示系统正在提交</a><br/><br/>
	</div>
	<div align="left">
	<form name="form1" method="post" action="">
		填写提交时候页面反馈的信息：<br/>
		<input type="text" id="name1" name="name1" size="40" value="提示信息1" /><br/>
		<input type="text" id="name2" name="name2" size="40" value="提示信息2" /><br/>
		<input type="text" id="name3" name="name3" size="40" value="提示信息3" /><br/>
		<input type="text" id="name4" name="name4" size="40" value="提示信息4" /><br/>
		<a href="javascript:showTip();" >提交的时候页面反馈信息</a><br/><br/>
	</form>
	
	<form name="form2" method="post" action="">
		<input type="text" id="name2" name="name2" size="40" />
		<input type="button" value="提交" onclick="tipWriteOpinion('name2',{'onOk':'test','onOkParas':'test'});"/>
	</form>
	</div>
	<div align="left" >
	<a href="javascript:_confirm_msg_show('_confirm_msg_show','');">_confirm_msg_show</a><br/>
	<a href="javascript:_error_msg_show('_error_msg_show','','succ');">_error_msg_show</a><br/>
	</div>

	<div align="left" >
	以下显示内容交互，可以在弹出页面中输入和移动，提交后焦点也消失了<br/>
	<textarea id="msg" cols="65" rows="8" readonly >这里是交互的内容</textarea>
	<a href="javascript:_edit_msg_show('title','msg');">_edit_msg_show</a><br/>
	</div>
	</body>
</html>
<%
	String tip = request.getParameter("name1");
	if(!StringUtils.isEmpty(tip)){
		out.println("<script type=\"text/javascript\" >showPop(1, '系统消息', '"+tip+"');</script>");
	}
 %>
