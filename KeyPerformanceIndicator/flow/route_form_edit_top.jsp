<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<jsp:include flush="true" page="/flow/include/flow_btn_disabled.jsp"></jsp:include>
<html>
<head>
</head>
<body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          		<kpi:secure name="保存" onClick="buttonEve('saveroute')" code="${typeCode }402" resourceId="${orgId }" type="button"  />
          		<kpi:secure name="删除" onClick="buttonEve('delroute')" code="${typeCode }403" resourceId="${orgId }" type="button"  />
          	</div></td>
          </tr>
  		</table>
<script>


function buttonEve(partment)
{
 if(partment=='save')
 {
    parent.buttomFrame.Entrys.submit_me();
 }
if (partment =='savenode')
{
    parent.buttomFrame.Entrys.buttonEve("save");
}
if (partment =='saveroute')
{
if(CheckForm(parent.buttomFrame.Entrys.form1)){
//if(parent.buttomFrame.Entrys.form1.menuName.value==""){
//alert("请输入提交按钮名称！！");
//parent.buttomFrame.Entrys.form1.menuName.focus();
//return;
//}
    parent.buttomFrame.Entrys.form1.action = "${ROOT}/editRoute.do?routeCode=<%=request.getParameter("routeCode")%>"+urlPara;
    parent.buttomFrame.Entrys.form1.submit();
    }
}
if (partment =='delnode')
{
    parent.buttomFrame.Entrys.buttonEve("del");
}
if (partment =='delroute')
{
    if (confirm("您确认要删除记录？")) {
    parent.buttomFrame.Entrys.form1.action = "${ROOT}/deleteRoute.do?routeCode=<%=request.getParameter("routeCode")%>&flowCode=<%=request.getParameter("flowCode") %>&nodeCode=<%=request.getParameter("nodeCode") %>"+urlPara;
    parent.buttomFrame.Entrys.form1.submit();
    }else{
    return;
    }
}
if (partment == 'newnode')
{ 
     flowCode = document.temp.flowCode.value;  
  	 var mapFormArray = parent.buttomFrame.Entrys.FlwAF_Flow;
	 var mapForm
	 if (mapFormArray != null){
    	mapForm = mapFormArray[0]
	 }
     even = mapForm.all("even");
    if (  flowCode != "" && flowCode != "null" && even!="new") {
      parent.buttomFrame.Entrys.location.href="/initNode.do?flowCode="+flowCode+urlPara;
      parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode="+flowCode+"&flwType=NODE"+urlPara;
   }
   else{
   		alert("请先添加流程信息！");
   }
}

if (partment == 'newroute')
{
    var nodeCode = document.temp.nodeCode.value;
    if (nodeCode =="")
        nodeCode = parent.buttomFrame.Entrys.form1.nodeCode.value;
   if (  nodeCode != "" && nodeCode != "null") {
    parent.buttomFrame.Entrys.location.href="/initRoute.do?flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&nodeCode="+nodeCode+urlPara;
    parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&nodeCode="+nodeCode+"&flwType=ROUTE"+urlPara;
   }
}

 if(partment=='exit')
 {
   parent.window.location.href="/FlowUI/Flw/FlowUI_Flw_List.jsp?typeCode=LCDY"+urlPara;
 }

if(partment=='exitflow')
 {
    parent.buttomFrame.Entrys.location.href="/showFlow.do?flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F"+urlPara;
    parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&flwType=FLOW"+urlPara;
 }
}
</script>
</body>
</html>
