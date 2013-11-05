<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>


<html>
<head>
<link rel="stylesheet" type="text/css" href="/styleSheet/grid.css">
<link rel="stylesheet" type="text/css" href="/styleSheet/layout.css">
<link rel="StyleSheet" type="text/css" href="/styleSheet/cb2.css">

<script language="javascript">
 
function ev_add()
{
   window.location.href="${ROOT}/system/common/busi_form.jsp?method=add";
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
        alert("请只选择一条记录进行修改！");
        return ;
   }
  if (count ==1) {
	 listFrame.busiForm.action = "${ROOT}/system/common/busi_form.jsp?method=update&busiID="+rowid;
	 listFrame.busiForm.submit();
  }
  else{
  	alert("请选择一条需要修改的记录！");
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
      if (window.confirm("与该授权类型相关的授权记录将会被同时删除，您确认要删除该授权类型吗？")) {
	     listFrame.busiForm.action = "${ROOT}/deleteBusi.do";
         listFrame.busiForm.submit();
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
                 <td class="coolButton" align="left" width="3"><img src="${ROOT}/images/toolbar.gif"></td>
                   <td class="coolButton" onaction="javascript:ev_add()" id="newbtn">新增<!-- (<u>A</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_update()" id="updatebtn">修改<!-- (<u>M</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_del()" id="deletebtn">删除<!-- (<u>D</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_exit()" id="exitbtn">退出</td>
                </tr>
              </table>
            </td>
           </tr>
        </table>
  </td></tr>
  <tr><td>
  <iframe scrolling="auto"   src="${ROOT}/listBusi.do"  width=100% height=100% name="listFrame"></iframe>
 
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