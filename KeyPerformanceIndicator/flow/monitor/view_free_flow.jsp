<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*" errorPage=""%>
<%@ include file="/web/pub/flow.inc"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>自由流监控</title>
	</head>
	<script type="text/javascript">
	function editFreeNode(nodeCode){
		var url = "${ROOT}/freeeNodeEditPage.do?nodeCode="+nodeCode;
		var value = window.open(url,'',"left=180,top=150,width=700,height=480;status=off");
	}
	//退出自由流
	function deleteFreeFlow(){
		var url = "${ROOT}/deleteFreeFlow.do?flowCode=<%=request.getParameter("flowCode")%>&boId=<%=request.getParameter("boId")%>&monitorId=<%=request.getParameter("monitorId")%>&batchId=<%=request.getParameter("batchId")%>";
		window.location=url;
	}
	</script>
	<%	Set nodeSet = (Set) request.getAttribute("nodeSet");
		Map nodeMap = (Map) request.getAttribute("nodeMap");
	%>
	<body>
	<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
	<tr> 
		<td align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" /></td>
		<td width="500"> 			 
		<logic:empty name="recFlow" property="completedate">
			<input type="button" class="button1" value="退出自由流" onclick="deleteFreeFlow();" width="108"/>
		</logic:empty>
		<input type="button" class="button" value="退出" onclick="history.back();" />
		</td>
		<td align="right"> 
		<input type="button" class="button" value="关闭" onclick="if(confirm('确定退出？')) window.close();" />
		</td>
	</tr></table></td></tr></table>
	<div class="title" ><%=request.getAttribute("name")%>处理信息</div>
	<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      			bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
      	<tr>
      		<td width="10%" align="center" class="title-header">序号</td>
      		<td width="40%" align="center" class="title-header">处理环节</td>
      		<td width="50%" align="center" class="title-header">处理人</td>
      	</tr>
      	<%
      	int j=0;
      	for (Iterator iterator = nodeSet.iterator(); iterator.hasNext();j++) {
			FlwNode flwNode = (FlwNode) iterator.next();
            if(flwNode.getFlgRoot()==1) continue;
		%>
		<tr>
			<td align="center"><%=j%></td>
			<td align="left"><a href="javascript:editFreeNode('<%=flwNode.getNodeCode()%>')"><%=flwNode.getNodeName()%></a></td>
		<%	List list = (List) nodeMap.get(flwNode.getNodeCode());
			if(list==null){
				out.print("<td>&nbsp;</td>");
				continue;
			}
		%>
			<td align="left">
		<%	for (int i = 0; i < list.size(); i++) {
				WorklistItem worklistItem = (WorklistItem) list.get(i);
				int status = worklistItem.getStatus();
				if (status == WorklistItem.STATUS_DONE) {
					out.print("<font color='green'>"+worklistItem.getHandlerName()+"</font>");
				}
				if (status == WorklistItem.STATUS_UNDO) {
					out.print("<font color='#FF9933'>"+worklistItem.getHandlerName()+"</font>");
				}
				if (status == WorklistItem.STATUS_OVERTIME_DONE) {
					out.print("<font color=''>"+worklistItem.getHandlerName()+"</font>");
				}
				if (status == WorklistItem.STATUS_OVERTIME_UNDO) {
					out.print("<font color='#FF0000'>"+worklistItem.getHandlerName()+"</font>");
				}
				if(i!=list.size()-1) out.print(",");
			}
		%>&nbsp;</td>
		</tr>
		<%}%>		
		</table><br>
		<div >&nbsp;&nbsp;&nbsp;&nbsp;
		处理人名称颜色为<font style="color: green">绿色</font>表示已经处理，
		<font style="color: #FF9900">黄色</font>表示未处理，
		<font style="color: #FF0000">红色</font>表示超时未处理，
		<font style="color: #666666">黑色</font>表示超时已处理</div>
	</body>
</html>
