<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="GBK"%>
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
          		<kpi:secure name="保存" onClick="buttonEve('saveroute')" code="${typeCode }401" resourceId="${orgId }" type="button" />
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
    parent.buttomFrame.Entrys.form1.action = "${ROOT}/addRoute.do?nodeCode=<%=request.getParameter("nodeCode")%>"+urlPara;
    parent.buttomFrame.Entrys.form1.submit();
    }
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
    parent.buttomFrame.Entrys.location.href="${ROOT}/nodeEditPage.do?nodeCode=<%=request.getParameter("nodeCode")%>";
    parent.topFrame.location.href="${ROOT}/flow/node_form.jsp?flowCode=<%=request.getParameter("flowCode")%>&flwType=NODE&nodeCode=<%=request.getParameter("nodeCode")%>";
 }
}
</script>
</body>
</html>
