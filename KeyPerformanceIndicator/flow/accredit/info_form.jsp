<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<script>
function ev_exit()
{
   window.location.href="${ROOT}/system/common/info_list.jsp";
   
}

function ev_save()
{
	var alertMsg = "";
	if(formFrame.infoForm.title.value==null || formFrame.infoForm.title.value=="")
	{
		alertMsg+="请先填写标题！\n";
	}else if(formFrame.infoForm.title.value.length>100){
		alertMsg+="标题长度不能大于100字！\n";
	}

	if(formFrame.infoForm.objName.value==null || formFrame.infoForm.objName.value=="")
	{
		alertMsg+="请先填写公告对象！\n";
	}
	
	if(formFrame.infoForm.contents.value==null || formFrame.infoForm.contents.value=="")
	{
		alertMsg+="请先填写公告内容！\n";
	}else if(formFrame.infoForm.contents.value.length>2000){
		alertMsg+="公告内容长度不能大于2000字！\n";
	}
	
	var beginDate = formFrame.infoForm.beginDate.value;
	var endDate = formFrame.infoForm.endDate.value;
	<%
		java.text.SimpleDateFormat bartDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		java.util.Date date = new java.util.Date(); 
	
		String curdate = bartDateFormat.format(date); 
	%>
	var currentDate = ""+"<%=curdate%>";
	
	if(beginDate==null || beginDate=="")
	{
		alertMsg+="请输入起始时间！\n";
	}
	if(endDate==null || endDate=="")
	{
		alertMsg+="请输入截止时间！\n";
	}
	if(beginDate>=endDate || currentDate>=endDate)
	{
		alertMsg+="截止时间必须比当前时间和起始时间晚，请重新选择时间。"
	}
	if(alertMsg!=null && alertMsg!="")
	{
		alert(alertMsg);
		return;
	}

	var method="<%=request.getParameter("method")%>";

	if (method=="update")
	{
		formFrame.infoForm.action="/updateInfo.do";
	}
	if (method=="add")
	{
		formFrame.infoForm.action="/createInfo.do";
	}
   	formFrame.infoForm.submit();
}

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
                 <td class="coolButton" align="left" width="3"><img src="${ROOT}/images/toolbar.gif"></td>
                   <td class="coolButton" onaction="javascript:ev_save()" id="savebtn">保存<!-- (<u>S</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">返回<!-- (<u>R</u>)--></td>
                </tr>
              </table>
            </td>
           </tr>
        </table>
  </td></tr>
  <tr><td>
   <iframe scrolling="auto"   src="/editInfo.do?method=<%=request.getParameter("method")%>&infoID=<%=request.getParameter("infoID")%>"
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