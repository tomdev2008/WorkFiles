<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*"%>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.RecFlow"/>
<jsp:directive.page import="com.shengdai.kpi.flow.util.FlowUtils"/>
<jsp:directive.page import="com.shengdai.kpi.flow.busi.BusinessObject"/>
<jsp:directive.page import="com.shengdai.kpi.flow.FlowFactory"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.RecNode"/>
<%@ include file="/web/pub/flow.inc"%>
<%@ include file="/flow/secure.inc" %>
<%
List recFlows = (List)request.getAttribute("recFlows");
FlowFactory flowFactory = (FlowFactory)SpringHelper.getBean("flowFactory");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<html><html:base target="_self"/> 
<head>
<title>已发起流程实例对象</title>
</head>

<script type="text/javascript">
window.name = "flowSingleDeleteWin";
function FF_Delete(){	
	var ids = getAllChecked("id");
	if(ids==""){
		alert("请选择要删除的流程实例业务对象");
	} else {
		if(confirm("确定删除所选对象吗？")){
			document.form1.action = "${ROOT}/deleteInBatch.do";
			document.form1.submit();
		}
	}
}
function FF_Back(){
		location.href="${ROOT}/listWorklistForRecBatch.do?monitorId=${recBatch.monitor.id}&id=${recBatch.id}"+urlPara;
}
</script>

<body >
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
           <input id='btnDelete' type="button" class="button2" value="删 除" onclick="FF_Delete();" />
          <input id='btnBack' type="button" class="button2" value="返 回" onclick="FF_Back();" />
          </div></td>
        </tr>
        <tr>
          <td height="560" valign="top" class="address-text-bg"><div class="address-depict">
 
 <div align="center" class="title">已发起流程实例对象列表</div>
<form method="post" id="form1" name="form1" action="" target="flowSingleDeleteWin">
		<input type="hidden" name="batchId" value="${recBatch.id}"/>
		<input type="hidden" name="monitorId" value="${recBatch.monitor.id}"/>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="95%" >   
    <tr>
  	 	<td class="title-header" width="10%"  nowrap align="center">
	  	<input id='chkCtl' type="checkbox" onclick="javascript:checkAll(this.id, 'id');">选择</td>
  	 	<td class="title-header" align="center" width="40%">流程实例业务对象</td>
  	 	<td class="title-header" align="center" width="20%">创建时间</td>
  	 	<td class="title-header" align="center" width="30%">所在环节(到达时间)</td>
  	</tr>
  	<%
  	  		for(int i=0; i<recFlows.size(); i++){ 
  	  		RecFlow recFlow = (RecFlow)recFlows.get(i);
  	  		BusinessObject bo = (BusinessObject) flowFactory.getObject(FlowUtils.forName(recFlow.getBoClass()), recFlow.getBoId());
  	  		//查找最后面的环节实例
  	  		List list = new ArrayList(recFlow.getRecNodeSet());
  	  		Collections.sort(list, new Comparator(){
  	  	public int compare(Object o1, Object o2){
  	  		return ((RecNode)o1).getFlwNode().compareTo(((RecNode)o2).getFlwNode());}
  	  	public boolean equals(Object obj){return true;}
  	  		});
  	  		RecNode recNode = (RecNode)list.get(list.size()-1);
  	%>
  	<tr>
  	 	<td align="center">
  	 	<input type="checkbox" name="id" value="<%=recFlow.getId()%>"><%=i+1%></td>
  	 	<td align="center" ><%=bo.getBOName()%></td>
  	 	<td align="center" ><%=sdf.format(recFlow.getCreateDate())%></td>
  	 	<td align="center" ><%=recNode.getToNodeName()+"("+sdf.format(recNode.getCreateDate())+")"%></td>
  	</tr>
  	<%} %>
</table>
</form>                 
          
          </div></td>
        </tr>
      </table>

</body>
</html>
