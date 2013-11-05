<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>

<html>
<head>
<script type="text/javascript" src="${ROOT}/component/calendar/Calendar.js"></script>
<script language="javascript">
 
function ev_add()
{
   window.location.href="${ROOT}/system/common/accredit_form.jsp?method=add";
}

function ev_update()
{
    var rowid = null;
    var count =0;
    var selectedRow = listFrame.document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
        count = count +1;
        rowid = selectedRow[i].value;
      }
    }
   if (count >1)  {
        alert("请只选择一条记录进行编辑！");
        return ;
   }
  if (count ==1) {
  	 listFrame.accreditForm.target="_parent";
	 listFrame.accreditForm.action = "${ROOT}/system/common/accredit_form.jsp?method=update&accreditID="+rowid;
	 listFrame.accreditForm.submit();
  }
  else{
  	alert("请选择一条需要编辑的记录！");
    return ;
  }
}

function ev_del()
{
   var count=0;
   var selected=new Array();
    var selectedRow = listFrame.document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要删除记录？")) {
      	 listFrame.accreditForm.target="_parent";
	     listFrame.accreditForm.action = "/deleteAccredit.do";
         listFrame.accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_on()
{
   var count=0;
   var selected=new Array();
    var selectedRow = listFrame.document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要启动该授权？")) {
      	 listFrame.accreditForm.target="_parent";
	     listFrame.accreditForm.action = "${ROOT}/onAccredit.do";
         listFrame.accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_off()
{
   var count=0;
   var selected=new Array();
    var selectedRow = listFrame.document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要停止该授权？")) {
      	 listFrame.accreditForm.target="_parent";
	     listFrame.accreditForm.action = "${ROOT}/offAccredit.do";
         listFrame.accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_exit()
{
	location.href="/main_page.jsp";
}
</script>
<title>指标单位</title>
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
                   <td class="coolButton" onaction="javascript:ev_add()" id="newbtn">新增<!-- (<u>A</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_update()" id="updatebtn">编辑<!-- (<u>M</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_del()" id="deletebtn">删除<!-- (<u>D</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_on()" id="onbtn">启动<!-- (<u>O</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_off()" id="offbtn">停止<!-- (<u>F</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">退出<!-- (<u>E</u>)--></td>
                </tr>
              </table>
            </td>
           </tr>
        </table>
  </td></tr>
  <tr><td>
  <iframe scrolling="auto"   src="${ROOT}/listAccredit.do"  width=100% height=100% name="listFrame"></iframe>
 
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