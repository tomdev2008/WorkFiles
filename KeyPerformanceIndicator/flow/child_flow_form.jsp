<%@ page contentType="text/html; charset=utf-8" language="java" import="com.shengdai.kpi.assess.valueobject.*,java.util.*,com.shengdai.kpi.common.SpringHelper,com.shengdai.kpi.flow.valueobject.FlwFlow,com.shengdai.kpi.flow.service.IFlowService" errorPage="" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlowTemplet"/>
<%@ include file="../common/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>流程</title>
</head>

<link rel="stylesheet" type="text/css" href="${ROOT}/styleSheet/cb2.css">
<link rel="stylesheet" type="text/css" href="${ROOT}/styleSheet/layout.css">
<script type="text/javascript" src="${ROOT}/common/cb2.js"></script>      <!--生成按钮-->

<script language="javascript">
//创建菜单的子菜单
Menu.prototype.cssFile = "${ROOT}/common/popmenu/skins/officexp/officexp.css";
var eMenu = new Menu();
<%
IFlowService flowService = (IFlowService)SpringHelper.getBean("flowService");
FlwFlow flwFlow = flowService.getFlow(request.getParameter("flowCode"));
Set set = flwFlow.getTempletSet();
for(Iterator iterator = set.iterator();iterator.hasNext();){
FlowTemplet templet = (FlowTemplet)iterator.next();
String path = "";
if(Templet.class.getName().equals(templet.getTypeClass())){//这里必须逐个判断模板的具体类型，具体的页面
	path = request.getContextPath() + "/assess/templet_wrapper_form.jsp?method=edit&templetId=" + templet.getTempletId();
}
%>
eMenu.add( menu1 = new MenuItem( "<%=templet.getTypeName()%>", function () { parent.location.href="<%=path%>";}, 
	"${ROOT}/common/popmenu/images/options.small.png" ) );
<%
}
%>

eMenu.add( new MenuSeparator() );

function ev_add(){
	showContextMenu();
}


function showContextMenu()
{
  var el = window.event.srcElement;
  var left = window.event.screenX;
  var top = window.event.screenY;
  eMenu.invalidate();
  eMenu.show(left,top);

}


function flow_save(){
if(CheckForm(parent.buttomFrame.Entrys.form1)){
if(parent.buttomFrame.Entrys.checkJs()){
parent.buttomFrame.Entrys.form1.action="${ROOT}/editFlow.do?sCode="+parent.buttomFrame.tree.document.all.sCode.value;
parent.buttomFrame.Entrys.form1.submit();
}
}
}

function node_add(){
//if(CheckForm(parent.buttomFrame.Entrys.form1)){
//if(parent.buttomFrame.Entrys.checkJs()){
    parent.buttomFrame.Entrys.addFlowNode('<%=request.getParameter("flowCode")%>');
    return;
   // }
   // }
}

function ev_exit(){
parent.location.href = "${ROOT}/flow/flow_list.jsp";
}

function node_order(){
parent.topFrame.location.href = "${ROOT}/flow/node_order_form.jsp?flowCode=<%=request.getParameter("flowCode") %>";
parent.buttomFrame.Entrys.location.href = "${ROOT}/listNode.do?flowCode=<%=request.getParameter("flowCode") %>";
}

function node_delete(){
if (confirm("您确认要删除记录？")) {
    parent.buttomFrame.Entrys.form1.action = "${ROOT}/deleteNode.do?parentFlowCode=<%=request.getParameter("parentFlowCode")%>&flowCode=<%=request.getParameter("flowCode")%>&nodeCode=<%=request.getParameter("nodeCode")%>";
    parent.buttomFrame.Entrys.form1.submit();
    }else{
    return;
    }
}
</script>

<body leftmargin="0" topmargin="0" marginwidth="0" class="command_body">
<table width="100%" height="100%"   cellpadding=0 border=0>
  <tr>
  	<td width="100%" height="5%" valign="top">
    <table cellpadding=0 cellspacing=0 width="100%" border="0" bgcolor="#eceae6" class="toolBar1">
      <tr>
		<td>
		<table id="toolBar" border="0">
	      <tr>
		    <td class="coolButton" align="left" width="3"><img src="${ROOT}/web/flow/img/toolbar.gif"></td>
			<td class="coolButton" onaction="javascript:node_add()" id="newbtn">保存子环节</td>
			<td class="coolButton" onaction="javascript:node_order()" id="newbtn">子环节排序</td>
			<td class="coolButton" onclick="node_delete()">删除环节</td>
			<td class="coolButton" onaction="javascript:ev_exit()" id="deletebtn">退出</td>                   
		  </tr>
		</table>
		</td>
	   </tr>
	</table>    
    </td></tr>
  <tr>
  	<td><!--<iframe scrolling="auto"   src="${ROOT}/flowEditPage.do?flowCode=<%=request.getParameter("flowCode") %>"
 width=100% height=100% name="mapFrame"></iframe>
	
 	--></td></tr>
</table>

</body>

<SCRIPT language=javascript>
  //创建按钮
  var cells = document.getElementById("toolBar").rows[0].cells;
  for (var i = 1; i < cells.length; i++){
     createButton(cells[i]);
  }

</SCRIPT>
</html>
