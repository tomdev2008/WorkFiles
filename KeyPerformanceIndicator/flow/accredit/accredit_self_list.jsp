<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>

<html>
<head>

<script language="javascript">
 
function ev_add()
{
   window.location.href="${ROOT}/system/common/accredit_self_form.jsp?method=add";
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
	 listFrame.accreditForm.action = "${ROOT}/system/common/accredit_self_form.jsp?method=update&accreditID="+rowid;
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
	     listFrame.accreditForm.action = "/deleteSelfAccredit.do";
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
	     listFrame.accreditForm.action = "/onSelfAccredit.do";
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
	     listFrame.accreditForm.action = "/offSelfAccredit.do";
         listFrame.accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_log()
{
	setToolBarState('10000001');
	listFrame.location.href="${ROOT}/listSelfAllAccredit.do";
}

function ev_exit()
{
	location.href="/main_page.jsp";
}

function ev_exit2()
{
	location.href="${ROOT}/system/common/accredit_self_list.jsp";
}
</script>
<title>考核授权</title>
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
                   <td class="coolButton" onaction="javascript:ev_add()" id="btn1">新增<!-- (<u>A</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_update()" id="btn2">修改<!-- (<u>M</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_del()" id="btn3">删除<!-- (<u>D</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_on()" id="btn4">启动<!-- (<u>O</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_off()" id="btn5">停止<!-- (<u>F</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_log()" id="btn6" >授权日志</td>
                   <td class="coolButton" onaction="javascript:ev_exit()" id="btn7">退出<!-- (<u>E</u>)--></td>
                   <td class="coolButton" onaction="javascript:ev_exit2()" id="btn8">返回<!-- (<u>E</u>)--></td>
                </tr>
              </table>
            </td>
           </tr>
        </table>
  </td></tr>
  <tr><td>
 <%--<iframe scrolling="auto"   src="${ROOT}/listSelfOffAccredit.do"  width=100% height=100% name="listFrame"></iframe> --%>
 <iframe scrolling="auto"   src="${ROOT}/listSelfAccreditLists.do"  width=100% height=100% name="listFrame"></iframe>
 
 </td></tr>
</table>
</BODY>
<script language="javascript">
  //创建按钮
  var cells = document.getElementById("toolBar").rows[0].cells;
for (var i = 1; i < cells.length; i++){
        createButton(cells[i]);
}

function setToolBarState(stateStr){
  //--------------------------
  var partCount=stateStr.length;
  var curt=0;
  for(curt=0;curt<partCount;curt++)
  {
    var btnOBJ = document.getElementById("btn"+(curt+1));

    if(stateStr.charAt(curt)!='0'){
      btnOBJ.setVisibled(true);
   }else{
     btnOBJ.setVisibled(false);
   }

  }
}

setToolBarState('11110110');
</script>
</html>

