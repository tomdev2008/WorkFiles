<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%!String functionNo = null;

	%>
<%@ include file="/web/pub/flow.inc"%>
<SCRIPT src="${ROOT}/common/common.js" type=text/javascript></SCRIPT>
<html>
	<head>
		<title>流程批次监控列表</title>
	</head>

	<script language="javascript">

function ev_in(){alert("2");
	parent.location.href="monitor.jsp";
}

function ev_view(id){
	location.href="monitor_form.jsp?mid="+id;
}

function ev_del(){
	var number = 0;
		for (var i=0;i<form1.elements.length;i++)
		{
			var e = form1.elements[i];						
			if(e.name == "id")				
			{			
				if(e.checked)
					number = number + 1;
			}							
		}
		if(number == 0)
		{
			alert("请选择要删除的监控");
			return false;
		}

	if(confirm("确定删除所选的监控吗？")){
		document.form1.action="${ROOT}/deleteMonitor.do?pid=";
		document.form1.method="post";
		document.form1.submit();
	}	
}

function startMonitor(id){
parent.location.href = "${ROOT}/flow/monitor/monitor_top.jsp?id="+id;
}
</script>

	<body class="list_body">

		<FORM method="post" name="form1" action="">
			<table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
				<tr>
					<td class="title-header" align="left" width="7%" height="28">
						<span class="style32">选择</span>
					</td>
					<page:tabTitle title="监控名称" column="monitorName" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="30%" align="left" />
					<page:tabTitle title="流程" column="flow.flowName" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="25%" align="left" />
					<page:tabTitle title="频度" column="frequency" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="15%" align="left" />
					<page:tabTitle title="状态" column="monitorName" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="15%" align="left" />
				</tr>
				<logic:iterate id="monitor" name="monitorList">
					<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
						<td align="center" height="20">
							<input type="checkbox" name="checkname" value="<bean:write name="monitor" property="id"/>">
						</td>
						<td align="left">
							<A href="javascript:startMonitor('<bean:write name="monitor" property="id"/>')"><bean:write name="monitor" property="monitorName" /></A>
						</td>
						<td align="center">
						<logic:notEmpty name="monitor" property="flow">
						<bean:write name="monitor" property="flow.flowName"/>
						</logic:notEmpty>
						<logic:empty name="monitor" property="flow">
						&nbsp;
						</logic:empty>
						</td>
						<td align="center">
						<logic:equal name="monitor" property="frequency" value="0">年度</logic:equal>
						<logic:equal name="monitor"  property="frequency"  value="10">季度</logic:equal>
							<logic:equal name="monitor" property="frequency" value="30">月度</logic:equal>
						</td>
						<td align="center">
							<bean:write name="monitor" property="monitorName"/>
						</td>
					</tr>
				</logic:iterate>
			</table>
<page:root inputclass="editline"/>
		</FORM>
	</body>
</html>
