<%-- 整理 zyf 2008-1-8 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" 
import="com.shengdai.kpi.system.org.vo.Org,com.shengdai.kpi.flow.valueobject.*,java.util.*,com.shengdai.kpi.system.SpringHelper,com.shengdai.kpi.flow.valueobject.FlwFlow,com.shengdai.kpi.flow.service.*" pageEncoding="GBK"%>
<%@ page import="com.shengdai.kpi.flow.valueobject.FlowTemplet"%>

<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<jsp:include flush="true" page="/flow/include/flow_btn_disabled.jsp"></jsp:include>
<html>
<head>
<script src="${ROOT}/web/flow/js/menu4.js" type=text/javascript></script>
<script src="${ROOT}/web/flow/js/poslib.js" type=text/javascript></script>
<script src="${ROOT}/web/flow/js/scrollbutton.js" type=text/javascript></script>
<title>流程</title>
</head>
<script language="javascript">
//创建菜单的子菜单
Menu.prototype.cssFile = "${ROOT}/web/flow/css/officexp/officexp.css";
var eMenu = new Menu();
var definedMenu = new Menu();
definedMenu.add( menu1 = new MenuItem( "自定义环节", function () { node_add();}, 
	"${ROOT}/web/flow/img/options.small.png" ) );
<%
	IFlowService flowService = (IFlowService)SpringHelper.getBean("flowService");
	FlwFlow flwFlow = flowService.getFlow(request.getParameter("flowCode"));
	String agid = (String)request.getAttribute("orgId");
	String agId="";
	Org ag=flwFlow.getOrg();
	
	if(ag!=null)
		agId=ag.getId();
	Set set = flwFlow.getTempletSet();
	for(Iterator iterator = set.iterator();iterator.hasNext();){
		FlowTemplet templet = (FlowTemplet)iterator.next();
		if(templet.getTempletId()==null) continue;
		String path = "";
		//模板的url统一通过templateRedirector.do转发
		path = request.getContextPath() + "/templateRedirector.do?id="+templet.getTempletId();
%>
eMenu.add( menu1 = new MenuItem( "<%=templet.getTypeName()%>", function () { var url="<%=path%>";window.open(url, "_blank", "resizable=yes,width=800,height=600,top=0,left=0,status=no'");}, 
	"${ROOT}/web/flow/img/options.small.png" ) );
<%
	}
	//TODO 以后可能会加预定义环节
	//List definedFlwNodeList = flowService.listDefinedFlowNode(request.getParameter("flowCode"));
	List definedFlwNodeList = new ArrayList();
	for(int i=0;i<definedFlwNodeList.size();i++){
	FlwNode flwNode = (FlwNode)definedFlwNodeList.get(i);
%>
definedMenu.add( menu1 = new MenuItem( "<%=flwNode.getNodeName()%>", function () { copyDefinedFlowNode('<%=flwNode.getNodeCode()%>');}, 
	"${ROOT}/web/flow/img/options.small.png" ) );
<%
	}
%>
<%
//添加模板
//add by dkm
List nodeTemplateList=flowService.listNodeTemplates(flwFlow.getCommBusi().getId());

FlwNode flwNodeTemplate=null;
for (int nt=0;nt<nodeTemplateList.size();nt++){
	flwNodeTemplate=(FlwNode)nodeTemplateList.get(nt);
%>
	definedMenu.add( menu1 = new MenuItem( "[模板]-<%=flwNodeTemplate.getNodeName()%>", function () { copyDefinedFlowNode('<%=flwNodeTemplate.getNodeCode()%>');},
	"${ROOT}/web/flow/img/options.small.png" ) );
<%	
}
%>


eMenu.add( new MenuSeparator() );
definedMenu.add(new MenuSeparator());

function ev_add(){
	showContextMenu();
}

function viewDefinedFlowNode(){
	showContextMenuForDeinedFlow();
}

function copyDefinedFlowNode(nodeCode){
	if(confirm("您确认要根据模板环节中创建环节？")){
		window.location.href = "${ROOT}/copyDefinedFlowNode.do?nodeCode="+nodeCode+"&flwCode=<%=request.getParameter("flowCode")%>&autoRoute=autoRoute"+urlPara;
		///alert(curForm1.action);
		//curForm1.submit();
	}
}

function showContextMenuForDeinedFlow(){
	var el = window.event.srcElement;
	var left = window.event.screenX;
  	var top = window.event.screenY;
  	definedMenu.invalidate();
  	definedMenu.show(left,top);
}

function showContextMenu(){
	var el = window.event.srcElement;
  	var left = window.event.screenX;
  	var top = window.event.screenY;
  	eMenu.invalidate();
<%
	if(set.size()>0){
%>
  	eMenu.show(left,top);
<%
	}
%>
}
function flow_save(){
	//disableButton("this");
	if(parent.buttomFrame.Entrys.checkJs()){
		parent.buttomFrame.Entrys.flowSave();
	}
}

function enableButtons(){
	enableButton("this");
}

function node_add(){
	parent.topFrame.location.href = "${ROOT}/flow/node_form_add_top.jsp?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
	parent.buttomFrame.Entrys.location.href = "${ROOT}/nodeAddPage.do?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
}

function ev_exit(){
	parent.location.href = "${ROOT}/flow/flow.jsp?agId=<%=agId%>";
}

function node_order(){
	parent.topFrame.location.href = "${ROOT}/flow/node_order_form.jsp?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
	parent.buttomFrame.Entrys.location.href = "${ROOT}/listNode.do?flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
}

function view_monitor(){
	parent.location.href = "${ROOT}/flow/monitor/monitor_edit_form.jsp?isFlowIn=isFlowIn&flowCode=<%=request.getParameter("flowCode") %>"+urlPara;
}
</script>
	<body>
	<form name="curForm1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          		<kpi:secure name="保存" onClick="flow_save()" code="${typeCode }202" resourceId="${orgId }" type="button" />
          		
          		<kpi:secure name="新增环节" onClick="viewDefinedFlowNode()" code="${typeCode }204" resourceId="${orgId }" type="button"  />
          		<kpi:secure name="环节排序" onClick="node_order()" code="${typeCode }205" resourceId="${orgId }" type="button"  />
          		<!-- 
          		<input type="button" class="button2" value="保存" onclick="flow_save()" />
	          	<input type="button" class="button4" value="模板设置" onclick="ev_add()" />
	          	<input type="button" class="button4" value="新增环节" onclick="viewDefinedFlowNode()" />
	          	<input type="button" class="button4" value="环节排序" onclick="node_order()" />
	          	 -->
          	</div></td>
          </tr>
    </table>
    </form>
	</body>
</html>
