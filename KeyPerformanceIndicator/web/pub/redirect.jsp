<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>执行结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body style="text-align=left;">
<%
    /*
    本页面专用于操作完成后的页面跳转。调用方法是：
    用request.setAttribute()设置一个String[][2]类型的“redirect”对象，
    其中每行包含一系列<url> -- <链接文字>的跳转点。
    另外通过request.setAttribute()设置一个“redirectWait”值，表示等待用户操作的秒数，
    当等待时间结束后，自动跳转到第一条链接；
    这个秒数也可以作为页面参数“wait”传递进来。
    另外，可以传递一个消息(message)，作为对用户的通知或提示。
    示例：
    request.setAttribute("redirect",new String[][]{
        {"index.jsp","返回首页"},
        {"member.jsp","返回会员进站画面"},
        {"javascript:location.back()","前一页面"},
        {"javascript:location.replace('another.jsp')","跳到another.jsp，并且不能返回本页"}
    });
    pageContext.include("redirect.jsp?wait=5&message=这是提示信息...",true);
    */

    if(pageContext.findAttribute("redirect") == null) {
        //浏览器直接访问本页面，生成一段示范链接用于演示本页面功能：
        request.setAttribute("redirect",new String[][]{
            {"javascript:location=location.href","重新进入本页面"},
            {"javascript:location.replace('index.jsp')","返回首页"},
            {"javascript:location.back()","前一页面"},
        });
        request.setAttribute("wait","5");
        request.setAttribute("message","这是提示信息...");
        pageContext.include("redirect.jsp",true);
        return;
    }
%>

<c:if test="${!empty message}">
<div>${message}</div>
</c:if>
<br><br>
<p style="color:goldenrod;font-size:9pt">您现在可以选择以下操作：
<c:if test="${wait>=0}">
<br/>（如果不选，
<span id="timer" style="color:red">${wait}</span>
秒钟后将进入第一个链接。
您可以按 <font color="red">～</font> 键停止倒计时，
或者按“<font color="red">空格</font>”键直接转入第一个链接。）
</c:if>
<ul>
<c:forEach var="url" items="${redirect}" varStatus="status">
    <p><li> <a name="link${status.count}" href="${url[0]}" style="color:#3366CC;font-size:9pt"> ${url[1]}</a>
</c:forEach>
</ul>

<script>
	var timeout, interval;
<c:if test="${wait>=0}">
    timeout = setTimeout("link1.click()",1000*${!empty wait ? wait : 9999});
    interval = setInterval("if(timer.innerText>0)timer.innerText--",1000);
</c:if>
    document.body.attachEvent("onkeypress",new Function(
        "if(event.keyCode==96 || event.keyCode==192) { clearTimeout(interval);clearTimeout(timeout); }"+
        "else if(event.keyCode==32) { link1.click(); }"
        //+"else alert(window.event.keyCode);"
    ));
</script>
</body>
</html>