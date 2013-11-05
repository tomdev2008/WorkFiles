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
   window.location.href="${ROOT}/system/common/busi_list.jsp";
   
}

function ev_save()
{
	var alertMsg = "";
	if(formFrame.busiForm.id.value==null || formFrame.busiForm.id.value=="")
	{
		alertMsg+="业务类型ID不能为空\n";
	}
	if(formFrame.busiForm.busiName.value==null || formFrame.busiForm.busiName.value=="")
	{
		alertMsg+="业务类型名称不能为空\n";
	}
	
	if(formFrame.busiForm.remark.value.length>2000)
	{
		alertMsg+="备注长度不能大于2000字";
	}
	
	if(alertMsg!=null && alertMsg!="")
	{
		alert(alertMsg);
		return;
	}

	var method="<%=request.getParameter("method")%>";

	if (method=="update")
	{
		formFrame.busiForm.action="${ROOT}/updateBusi.do?busiID=<%=request.getParameter("busiID")%>";
	}
	if (method=="add")
	{
		formFrame.busiForm.action="${ROOT}/createBusi.do";
	}
   	formFrame.busiForm.submit();
}

function ev_synchronize(){
	return formFrame.synchronize();
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
                   <td class="coolButton" onaction="javascript:ev_save()" id="savebtn">保存</td>
                   <td class="coolButton" onaction="javascript:ev_synchronize()" id="synchronizebtn">同步</td>
                   <td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">返回</td>
                </tr>
              </table>
            </td>
           </tr>
        </table>
  </td></tr>
  <tr><td>
   <iframe scrolling="auto"   src="${ROOT}/viewBusi.do?method=<%=request.getParameter("method")%>&busiID=<%=request.getParameter("busiID")%>"
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