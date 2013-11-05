<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.flow.valueobject.Accredit,
				com.shengdai.kpi.flow.valueobject.Busi,
				com.shengdai.kpi.util.DateUtils,
				java.util.Date,
                java.util.List" %>
<%@ include file="/web/pub/flow.inc" %>

<html>
  <head>  
    <title>考核授权</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.selectedMenuStytle {
	border-top-style: groove;
	border-right-style: groove;
	border-bottom-style: groove;
	border-left-style: groove;
	color: #0099FF;
}
</style>

<script language="javascript">
 function self_off(){
 	location.href="/listSelfOffAccredit.do";
 }
 function self_on(){
 	location.href="/listSelfOnAccredit.do";
 }
 function self_receive(){
 	location.href="/listSelfReceiveAccredit.do";
 }
</script>
 <script language="javaScript">
    var n = 0;
 	function ev_select()
 	{
 		var checkboxes=document.getElementsByName("selectedRow");
 		for(i=0;i<checkboxes.length;i++)
 		{
 			if(n%2==0)
 			{
 			    checkboxes[i].checked=true;
 			}else
 			{
 			    checkboxes[i].checked=false;
 			}
 		}
 		n++;
 	}
 	
 	function ev_add()
{
   view_form("${ROOT}/system/common/accredit_self_form.jsp?method=add");
}

function ev_update()
{
    var rowid = null;
    var count =0;
    var selectedRow = document.getElementsByName("selectedRow");
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
	 view_form("${ROOT}/system/common/accredit_self_form.jsp?method=update&accreditID="+rowid);
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
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要删除记录？")) {
      	 accreditForm.target="_self";
	     accreditForm.action = "/deleteSelfAccredit.do";
         accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_on()
{
   var count=0;
   var selected=new Array();
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要启动该授权？")) {
      	 accreditForm.target="_self";
	     accreditForm.action = "/onSelfAccredit.do";
         accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_off()
{
   var count=0;
   var selected=new Array();
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要停止该授权？")) {
      	 accreditForm.target="_self";
	     accreditForm.action = "/offSelfAccredit.do";
         accreditForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_log()
{
	location.href="${ROOT}/listSelfAllAccredit.do";
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
</head>
 <body>
 <table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/images/cmd.jpg" height="30"><table width="100%">
   <tr>
       <td align=left width=3 ><img src="${ROOT}/images/cmd01.gif" ></td>
           <td id=search onaction="" width="500"> 
			 <input id="btn1" type="button" class="button" value="新增" onclick="javascript:ev_add();">
			 <input id="btn2" type="button" class="button" value="编辑" onclick="javascript:ev_update();">
			 <input id="btn3" type="button" class="button" value="删除" onclick="javascript:ev_del();">
			 <input id="btn4" type="button" class="button" value="启动" onclick="javascript:ev_on();">
			 <input id="btn5" type="button" class="button" value="停止" onclick="javascript:ev_off();">
			 <input id="btn6" type="button" class="button" value="授权日志" onclick="javascript:ev_log();">
			 <input id="btn7" type="button" class="button" value="返回" onclick="javascript:ev_exit2();">
		  </td>
   </tr>
</table></td></tr> 
 </table>
 <br>


  <form   name="accreditForm" method="post" action="">
  <input name="st" type="hidden" value="0">
  
<logic:notEqual name="viewTop" value="false">
  <table align="center" border="0">
  	<tr>
  	 <td align="left" width="80"><a href="javascript:self_off()"><span class="selectedMenuStytle" >未启动授权</span></a></td>
  	 <td align="left" width="80"><a href="javascript:self_on()">已启动授权</a></td>
  	 <td align="left" width="80"><a href="javascript:self_receive()">接收到授权</a></td>
  	</tr>
  </table>
 </logic:notEqual>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="8%" nowrap align="center" class=header onClick="ev_select();">选择</td>

	<page:tabTitle title="业务类型" column="busi"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>

    <td width="11%" nowrap class=header align="center">授权人</td>
    <td width="11%" nowrap class=header align="center">被授权人</td>
    <td width="5%" nowrap class=header align="center">是否启动</td>
    <td width="8%" nowrap class=header align="center">状 态</td>
    
    <page:tabTitle title="开始时间" column="startDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>
    
    <page:tabTitle title="结束时间" column="endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>

  </tr>
 <logic:notEmpty name="accreditList">
 <logic:iterate id="accredit" name="accreditList" type="com.shengdai.kpi.flow.valueobject.Accredit" scope="request" indexId="index" >
<logic:notEmpty name="accredit">	
	<bean:define   id="busi"   name="accredit"   property="busi"   type="com.shengdai.kpi.common.valueobject.Busi"/>   
	
	<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td><div align="center">
		<input type="checkbox" name="selectedRow" id="<bean:write name="accredit" property="id"/>" value="<bean:write name="accredit" property="id"/>">
	</div></td>
	<td><a href="javascript: view_form('${ROOT}/system/common/accredit_self_form.jsp?method=update&accreditID=<bean:write name="accredit" property="id" />');">
			<bean:write name="busi" property="busiName" />
		</a>
	</td>
	
	<td><bean:write name="accredit" property="grantorName" /></td>
	<td><bean:write name="accredit" property="acceptorName" /></td>
	<td>
		<logic:equal name="accredit" property="flgStart" value="1">是</logic:equal>
		<logic:notEqual name="accredit" property="flgStart" value="1">否</logic:notEqual>
	</td>
	<td>
		<logic:lessEqual name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			<logic:greaterEqual name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
				有效
			</logic:greaterEqual>
		</logic:lessEqual>
		<logic:greaterThan name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:greaterThan>
		<logic:lessThan name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:lessThan>
	</td>
	<td><bean:write name="accredit" property="startDate" format="yyyy-MM-dd HH:mm"/></td>
	<td><bean:write name="accredit" property="endDate" format="yyyy-MM-dd HH:mm"/></td>
	<%--td><bean:write name="accredit" property="remark"/></td--%>
	</tr>
</logic:notEmpty>	
</logic:iterate>
</logic:notEmpty>
 
</table><br>
<table width="95%" border="0"><tr><td align="right">
<page:root inputclass="editline" /></td></tr></table>
  </form>
  </body>
</html>
