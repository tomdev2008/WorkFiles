<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.container.CPUInfoScanner"/>
<jsp:directive.page import="com.shengdai.kpi.util.StringUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.PerformanceFilter"/>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<%
	if(!StringUtils.isEmpty(request.getParameter("IDLE"))){
		CPUInfoScanner.CPU_SCAN_POLICY_IDLE = request.getParameter("IDLE");
	}
	if(!StringUtils.isEmpty(request.getParameter("BUSY"))){
		CPUInfoScanner.CPU_SCAN_POLICY_BUSY = request.getParameter("BUSY");
	}
	if(!StringUtils.isEmpty(request.getParameter("EMERGENCY"))){
		CPUInfoScanner.CPU_SCAN_POLICY_EMERGENCY = request.getParameter("EMERGENCY");
	}
	if(!StringUtils.isEmpty(request.getParameter("EMERGENCY_LINE"))){
		PerformanceFilter.EMERGENCY_LINE = ParamUtils.getIntParameter(request, "EMERGENCY_LINE", 80);
	}
	if(!StringUtils.isEmpty(request.getParameter("FLG_LIMIT"))){
		PerformanceFilter.FLG_LIMIT = (request.getParameter("FLG_LIMIT").equals("1"));
	}
	System.out.println(request.getRequestURL());
 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>性能监控</title>
		<script language="javascript">

		</script>
	</head>
	
	<body>
		<form action="" method="post" >
			<table align="left">
				<tr>
					<td colspan="2" align="left">请分别设定以下6个WebServer：<br/>
					<a href="http://10.16.5.84:9081/${ROOT}/web/system/monitor/performance.jsp">server1</a><br/>
					<a href="http://10.16.5.84:9082/${ROOT}/web/system/monitor/performance.jsp">server2</a><br/>
					<a href="http://10.16.5.84:9083/${ROOT}/web/system/monitor/performance.jsp">server3</a><br/>
					<a href="http://10.16.5.86:9081/${ROOT}/web/system/monitor/performance.jsp">server4</a><br/>
					<a href="http://10.16.5.86:9082/${ROOT}/web/system/monitor/performance.jsp">server5</a><br/>
					<a href="http://10.16.5.86:9083/${ROOT}/web/system/monitor/performance.jsp">server6</a><br/><br/>
					</td>
				</tr>
				<tr>
					<td align="left">IDLE采样命令</td>
					<td align="left"><input type="text" name="IDLE" size="30" value="<%=CPUInfoScanner.CPU_SCAN_POLICY_IDLE%>" /></td>
				</tr>
				<tr>
					<td align="left">BUSY采样命令</td>
					<td align="left"><input type="text" name="BUSY" size="30" value="<%=CPUInfoScanner.CPU_SCAN_POLICY_BUSY%>" /></td>
				</tr>
				<tr>
					<td align="left">EMERGENCY采样命令</td>
					<td align="left"><input type="text" name="EMERGENCY" size="30" value="<%=CPUInfoScanner.CPU_SCAN_POLICY_EMERGENCY%>" /></td>
				</tr>
				<tr>
					<td align="left">EMERGENCY警戒线水平</td>
					<td align="left"><input type="text" name="EMERGENCY_LINE" size="10" value="<%=PerformanceFilter.EMERGENCY_LINE%>" />
					%CPU使用率</td>
				</tr>
				<tr>
					<td align="left">CPU峰值访问限制</td>
					<td align="left"><input type="radio" name="FLG_LIMIT" value="1" <%=PerformanceFilter.FLG_LIMIT?"checked":""%> />是
					<input type="radio" name="FLG_LIMIT" value="0" <%=PerformanceFilter.FLG_LIMIT?"":"checked"%> />否</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="更新" /></td>
				</tr>
			</table><br/>
			
		</form>
	</body>
</html>