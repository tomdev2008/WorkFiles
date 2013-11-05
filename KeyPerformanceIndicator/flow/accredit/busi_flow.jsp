<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwFlow"/>
<jsp:directive.page import="com.shengdai.kpi.system.common.ParamUtils"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwNode"/>
<jsp:directive.page import="java.util.Collections"/>
<%@ include file="/web/pub/flow.inc"%>
<html><html:base target="_self"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>应用流程选择</title>
<link href="../css/kpi_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">

function ev_ok(){
	document.fomr1.action="${ROOT}/changeBusiParamOfFlow.do";
	document.fomr1.submit();
}

function ev_node(){
	var index = document.all.nodeIndex.value;
	var nodes = document.getElementsByTagName("input");
	for(var i=0; i<nodes.length; i++){
		if(nodes[i].name == "node_"+index){
			nodes[i].checked=true;
		}		
	}
}

function ev_allNode(){
	var nodes = document.getElementsByTagName("input");
	for(var i=0; i<nodes.length; i++){
		if(nodes[i].name.indexOf("node_")>=0){
			nodes[i].checked=true;
		}		
	}
}

function ev_allFlow(){
	var flows = document.all.fids;
	for(var i=0; i<flows.length; i++){
		flows[i].checked=true;		
	}
}

var ids = window.opener.window.getAllChecked("paraid");//主页面上传进来的待同步的参数的id

</script>

<body><br>
<div align="center"><font size="+1">同步流程选择</font></div><br>
<form name="fomr1" method="post" >
<input type="hidden" name="busiCode" value="<%=request.getParameter("busiCode")%>" >
<input type="hidden" name="flgTempletSyc" value="<%=ParamUtils.getParameter(request, "flgTempletSyc", "0")%>" >
<script>document.write("<input type='hidden' name='paraids' value='"+ids+"' /> ");</script>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 选择<input type="text" class=editline name="nodeIndex" size=10 >环节进行同步。
 <input type="button" class="button" value="选择" onclick="ev_node();"/>&nbsp;&nbsp;
 <input type="button" class="button2" value="选择全部环节" onclick="ev_allNode();" />&nbsp;&nbsp;
 <input type="button" class="button2" value="选择全部流程" onclick="ev_allFlow();" />
 

<table id=tabPro height=23 cellSpacing=1 borderColorDark=#f4f5ff 
	align="center" cellPadding=1 borderColorLight=#b5caff border=1 width="90%" >
<%
	List list = (List)request.getAttribute("list");
	
	for(int i=0; list!=null && i<list.size(); i++){
		FlwFlow flow = (FlwFlow)list.get(i);
		if(flow.getAssessGroup()==null) continue;
		//if(flow.getTempletSet().size()==0) continue;//未绑定模板的先剔除
 %>
	<tr>
		<td width="10%" nowrap height="22" align="center" >
		<input type="checkbox" name="fids" value="<%=flow.getId()%>"> </td>
		<td width="40%" nowrap height="22" align="left" >
		<%=flow.getFlowName()%></td>
		<td width="50%" nowrap height="22" align="left" >
		<%=flow.getAssessGroup().getFullName()%></td>	
	</tr>
	<tr>
		<td colspan="3" nowrap height="22" align="left" >
		<table border="0" width="100%">
			
	<%	List nodes = new ArrayList(flow.getNodeSet());
		Collections.sort(nodes);
		int j=1;
		for(; j<nodes.size(); j++){
			FlwNode node = (FlwNode)nodes.get(j);
			if(j%4==1)	out.println("<tr>");
			out.println("<td width=25% >");
	%>
			<input type="checkbox" name="node_<%=node.getNodeName()%>" value="<%=node.getNodeCode()%>" />		
	<%		out.println(node.getNodeName());
			out.println("</td>");
			if((j+1)%4==1)	out.println("</tr>");
		}
		for(; j%4!=1; j++)	out.println("<td width=25% >&nbsp;</td>");
		%>			
	 	</table>
		</td>		
	</tr>
<%
	}
 %>	
</table>
</form><br>
<div align="center"><input type="button" class="button" onClick="javascript:ev_ok();" value="确定">&nbsp; &nbsp; 
<input type="button" class="button" value="取消" onClick="javascript:window.close();"> </div>
</body>
</html>
