<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
 <jsp:directive.page import="java.lang.Runtime"/>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统运行内存情况监控</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<%  Runtime runtime = Runtime.getRuntime();
	System.out.println("进入请求..."+request.getRequestURL());  
%>
</head>

<body class="LN_body">
<form name="form1" method="post" action="" id="form1" target="templateRemoveWin">	
<div class="LN_popupsBox">
<div class="LN_Append">
</div>
<div class="LN_formBox">
<div>sessionId=<%=session.getId()%>;requestedSessionId=<%=request.getRequestedSessionId()%>;
requestIp=<%=request.getRemoteHost()+":"+request.getRemotePort()%></div>
<table width="60%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
    <tr>
    <td class="LN_boxtitlebg">JVM内存运行情况</td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
    <tr>
     <td width="20%" class="LN_tableBoxtitle2">名称</td>
     <td width="15%" class="LN_tableBoxtitle2">实际大小(B)</td>
     <td width="15%" class="LN_tableBoxtitle2">转换大小(MB)</td>
     <td width="40%" class="LN_tableBoxtitle2">描述</td>
     </tr>
    <tr>
    	<td class="LN_tableBoxText">空闲内存量</td>
    	<td class="LN_tableBoxText"><%=runtime.freeMemory()%></td>
    	<td class="LN_tableBoxText"><%=runtime.freeMemory()/1024/1024 %></td>
    	<td class="LN_tableBoxText">Java虚拟机中的空闲内存量(从系统中挖到的内存却没有使用的大小)</td>
    </tr>
    <tr>
    	<td class="LN_tableBoxText">最大内存量</td>
    	<td class="LN_tableBoxText"><%=runtime.maxMemory()%></td>
    	<td class="LN_tableBoxText"><%=runtime.maxMemory()/1024/1024 %></td>
    	<td class="LN_tableBoxText">Java虚拟机使用的最大内存量(java虚拟机[进程]能够从操作系统那里挖到的最大的内存)</td>
    </tr>
    <tr>
        <td class="LN_tableBoxText">内存总量</td>
    	<td class="LN_tableBoxText"><%=runtime.totalMemory()%></td>
    	<td class="LN_tableBoxText"><%=runtime.totalMemory()/1024/1024 %></td>
    	<td class="LN_tableBoxText">Java虚拟机中的内存总量(java虚拟机现在已经从操作系统那里挖过来的内存大小)</td>
    </tr>
   </table>
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>