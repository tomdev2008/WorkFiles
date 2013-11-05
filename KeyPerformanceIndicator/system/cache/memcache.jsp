<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="com.shengdai.kpi.common.memcached.Monitor"/>
<jsp:directive.page import="java.util.List"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<%
	String dateMark = request.getParameter("dateMark");
	if(dateMark==null){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			dateMark = dateFormat.format(new Date(System.currentTimeMillis()));
		} catch (Exception e) {
		}
	}
	Monitor mm = Monitor.getInstance(null); 
	List<Map> dateInfos = mm.getTrace(dateMark);
 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>memcache监控</title>
		<script language="javascript">

		</script>
	</head>
	
	<body>
		<form action="" method="post" >
			<div align="right">
				<select>
					<option>2008年6月20日</option>
				</select>
			</div>
			<table align="left" width="100%">
				<tr>
					<td align="center">时间</td>
					<td align="center">缓存对象数量</td>
					<td align="center">缓存对象容量</td>
				</tr>
			<%for(Map info : dateInfos){ %>
				<tr>
					<td align="center"><%=info.get("timeMark")%></td>
					<td align="center"><%=info.get("curr_items")%>个</td>
					<td align="center"><%=info.get("bytes")%>字节</td>
				</tr>
			<%} %>
			</table><br/>
			
		</form>
	</body>
</html>