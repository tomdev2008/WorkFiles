<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<html>
<head>
<title>
Flw_MainTop
</title>
</head>
<body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          		<input type="button" class="button4" value="保存顺序" onclick="buttonEve('saveorder')" />
          		<input type="button" class="button2" value="退出" onclick="buttonEve('exitnode')" />
          	</div></td>
          </tr>
  		</table>
<script>
function buttonEve(partment)
{
if(partment=='saveorder'){
parent.buttomFrame.Entrys.setSort();
parent.buttomFrame.Entrys.form1.action="${ROOT}/sortNode.do?"+urlPara;
parent.buttomFrame.Entrys.form1.submit();
}
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
    parent.buttomFrame.Entrys.form1.action = "${ROOT}/addRoute.do?nodeCode=<%=request.getParameter("nodeCode")%>";
    parent.buttomFrame.Entrys.form1.submit();
}
if (partment =='delnode')
{
    parent.buttomFrame.Entrys.buttonEve("del");
}
if (partment =='delroute')
{
    parent.buttomFrame.Entrys.buttonEve("del");
}
if (partment == 'newnode')
{
 
     flowCode = document.temp.flowCode.value;
     //alert("flowCode="+flowCode);
  
  	 var mapFormArray = parent.buttomFrame.Entrys.FlwAF_Flow;
	 //alert("mapFormArray="+mapFormArray);
	 var mapForm
	 if (mapFormArray != null){
    	mapForm = mapFormArray[0]
	 }
	 //alert("mapForm="+mapForm);
	 
     //if (flowCode ==""){
     //   flowCode = mapForm.getElemennt("flowCode");
        //alert("flowCodes="+flowCodes);
     //}
     
     even = mapForm.all("even");
     //alert("even="+even);

 
    if (  flowCode != "" && flowCode != "null" && even!="new") {
      parent.buttomFrame.Entrys.location.href="/initNode.do?flowCode="+flowCode;
      parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode="+flowCode+"&flwType=NODE";
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
    parent.buttomFrame.Entrys.location.href="/initRoute.do?flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&nodeCode="+nodeCode;
    parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&nodeCode="+nodeCode+"&flwType=ROUTE";
   }
}

 if(partment=='exit')
 {
   parent.window.location.href="/FlowUI/Flw/FlowUI_Flw_List.jsp?typeCode=LCDY";
 }

if(partment=='exitflow')
 {
    parent.buttomFrame.Entrys.location.href="/showFlow.do?flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F";
    parent.topFrame.location.href="/FlowUI/Flw/FlowUI_Flw_MainTop.jsp?typeCode=LCDY&flowCode=9F103A10FB6AE9F84A2DEFA3CA878E2F&flwType=FLOW";
 }
if(partment=='exitnode')
 {
    parent.buttomFrame.Entrys.location.href="${ROOT}/flowEditPage.do?flowCode=<%=request.getParameter("flowCode")%>"+urlPara;
   parent.topFrame.location.href="${ROOT}/flow/flow_form.jsp?flowCode=<%=request.getParameter("flowCode")%>"+urlPara;
 }
}
</script>
</body>
</html>
