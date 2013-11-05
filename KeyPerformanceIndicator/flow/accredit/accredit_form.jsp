<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/styleSheet/grid.css">
<link rel="stylesheet" type="text/css" href="/styleSheet/layout.css">
<LINK rel="stylesheet" type="text/css" href="/styleSheet/css.css">
<LINK rel="stylesheet" type="text/css" href="/styleSheet/cb2.css">


<script>
function ev_exit()
{
   window.location.href="${ROOT}/system/common/accredit_list.jsp";
   
}

function ev_save()
{
	var startDate = formFrame.accreditForm.startDate.value;
	var endDate = formFrame.accreditForm.endDate.value;
	<%
		java.text.SimpleDateFormat bartDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		java.util.Date date = new java.util.Date(); 
	
		String curdate = bartDateFormat.format(date); 
	%>
	var currentDate = ""+"<%=curdate%>";
	var alertMsg = "";
	if(formFrame.accreditForm.grantorName.value==null || formFrame.accreditForm.grantorName.value=="")
	{
		alertMsg+="授权人不能为空，请选择授权人！\n";
	}
	if(formFrame.accreditForm.acceptorName.value==null || formFrame.accreditForm.acceptorName.value=="")
	{
		alertMsg+="被授权人不能为空，请选择被授权人！\n";
	}
	 
	if(startDate==null || startDate=="")
	{
		alertMsg+="开始时间不能为空，请输入开始时间！\n";
	}
	if(endDate==null || endDate=="")
	{
		alertMsg+="结束时间不能为空，请输入结束时间！\n";
	}
	if(startDate>=endDate ||  currentDate>=endDate)
	{
		alertMsg+="结束时间必须比当前时间和开始时间晚，请重新选择时间。\n";
	}
	if(formFrame.accreditForm.remark.value.length>500){
		alertMsg+="备注长度不能大于500字！";
	}
	
	if(alertMsg!=null && alertMsg!="")
	{
		alert(alertMsg);
		return;
	}

	var method="<%=request.getParameter("method")%>";

	if (method=="update")
	{
		formFrame.accreditForm.action="/updateAccredit.do?";
	}
	if (method=="add")
	{
		formFrame.accreditForm.action="/createAccredit.do?";
	}
   	formFrame.accreditForm.submit();
}

/*function ev_save2()
{
	if(formFrame.accreditForm.grantorName.value==null || formFrame.accreditForm.grantorName.value=="")
	{
		alert("授权人不能为空，请选择授权人！");
		return;
	}
	if(formFrame.accreditForm.acceptorName.value==null || formFrame.accreditForm.acceptorName.value=="")
	{
		alert("被授权人不能为空，请选择被授权人！");
		return;
	}
	var startDate = formFrame.accreditForm.startDate.value;
	var endDate = formFrame.accreditForm.endDate.value;
	var currentDate = new Date();
	if(startDate==null || startDate=="")
	{
		alert("开始时间不能为空，请输入开始时间！");
		return;
	}
	if(endDate==null || endDate=="")
	{
		alert("结束时间不能为空，请输入结束时间！");
		return;
	}
	if(startDate>=endDate ||  currentDate>=endDate)
	{
		alert("结束时间必须比当前时间和开始时间晚，请重新选择时间。");
		return;
	}
	

	var method="<%=request.getParameter("method")%>";

	if (method=="update")
	{
		formFrame.accreditForm.action="/updateAccredit.do?";
	}
	if (method=="add")
	{
		formFrame.accreditForm.action="/createAccredit.do?";
	}
   	formFrame.accreditForm.submit();
}
*/
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" style="overflow:hidden" class="command_body">
<table width="100%" height="100%"   cellpadding=0 border=0>
  <tr><td width="100%" height="5%" valign="top">
  <table cellpadding=0 cellspacing=0 width="100%" border="0" bgcolor="#eceae6" class="toolBar1">
          <tr>
            <td>
              <table id="toolBar" border="0">
                <tr title="(快捷键使用)按Shift键加上面的字母">
                 <td class="coolButton" align="left" width="3"><img src="/images/toolbar.gif"></td>
                   <td class="coolButton" onaction="javascript:ev_save()" id="savebtn">保存<!-- (<u>S</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">返回<!-- (<u>R</u>)--></td>
                </tr>
              </table>
            </td>
           </tr>
        </table>
  </td></tr>
  <tr><td>
   <iframe scrolling="auto"   src="/viewAccredit.do?method=<%=request.getParameter("method")%>&accreditID=<%=request.getParameter("accreditID")%>"
 width=100% height=100% name="formFrame"></iframe>
 </td></tr>
</table>
</BODY>
<script language="javascript">
  //创建按钮
  var cells = document.getElementById("toolBar").rows[0].cells;
  for (var i = 1; i < cells.length; i++){
     createButton(cells[i]);
  }

</script>
</html>