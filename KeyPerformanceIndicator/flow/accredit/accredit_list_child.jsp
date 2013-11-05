<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Accredit"/>
<jsp:directive.page import="com.shengdai.kpi.system.service.IUserService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.common.service.IBusiService"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Accredit"/>
<jsp:directive.page import="com.shengdai.kpi.common.valueobject.Busi"/>
<%@page import="com.shengdai.kpi.flow.valueobject.Accredit;"%>
<%@ include file="/web/pub/flow.inc" %>
<%List accreditList=(List)request.getAttribute("accreditList"); 
IUserService ius=(IUserService)SpringHelper.getBean("userService");
User user=ius.findUserById(loginedUser.getId());
String grantorStr=(String)request.getAttribute("grantorStr");
String acid=(String)request.getAttribute("acid");
%>
<html>
  <head>  
    <title>授权管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
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
 </script>
 
<script language="javascript">
 
function ev_add()
{
   view_form("${ROOT}/viewAccredit.do?method=add");
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
	 view_form("${ROOT}/viewAccredit.do?method=update&accreditID="+rowid);
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
      	if (window.confirm("您确认要删除记录？")) 
      	{
      	 	accreditForm.target="_self";
	     	accreditForm.action = "${ROOT}/deleteAccredit.do";
        	accreditForm.submit();
      	}
    }else {
       	alert("您还没选择记录!");
    }
}
function ev_log()
{
	var url="${ROOT}/listAccreditHistory.do?uid=<%=loginedUser.getId()%>";
	window.open(url,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
}
function ev_on()
{
   	var count=0;
   	var selected=new Array();
   	var str="";
   	var trs="";
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      	if (selectedRow[i].checked){
         	count = count +1;
         	selected[i]=selectedRow[i].value;
         	var s=ev_checkStart(selectedRow[i].value,'<%=Accredit.ISON%>');
         	if(s!="")
         	{
         		str+=s;
         	}
         	var g=chechxg(selectedRow[i].value)
         	if(g!="")
         	{
         		trs+=g;
         	}
         }
    }
    if (count >0)  {
    
	    if(str!="")
	    {
	    	str="第"+str+"条已经启动，无需重复启动！";
	    	
	    }
	    if(trs!="")
	    {
	    	trs="第"+trs+"条已经失效，不能启动！";
	    }
	    str=str+trs;
	    if(str!="")
	    {
	    	alert(str);return;
	    }
      if (window.confirm("您确认要启动该授权？")) {
      	 accreditForm.target="_self";
	     accreditForm.action = "${ROOT}/onAccredit.do";
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
    var str="";
    for (i=0;i<selectedRow.length;i++){
      	if (selectedRow[i].checked){
         	count = count +1;
         	selected[i]=selectedRow[i].value;
         	var s=ev_checkStart(selectedRow[i].value,'<%=Accredit.ISOFF%>');
         	if(s!="")
         	{
         		str+=s;
         	}
       	}
    }
    if (count >0)  {
    
    if(str!="")
    {
    	alert("第"+str+"条已经停止，无需重复停止");
    	return;
    }
    
      	if (window.confirm("您确认要停止该授权？")) {
			accreditForm.target="_self";
		    accreditForm.action = "${ROOT}/offAccredit.do";
	        accreditForm.submit();
      	}
    }else {
       alert("您还没选择记录!");
    }
}
function ev_checkStart(id,flg)
{
	var f=document.getElementsByName(id);
	var dd="";
	for(var i=0;i<f.length;i++)
	{
		if(f[i].value.split(",")[1]==flg)
		{
			dd+=f[i].value.split(",")[0]+",";
		}
		
	}
	return dd;
}
function chechxg(id)
{
	var x=document.getElementsByName(id+"xg");
	var dd="";
	for(var i=0;i<x.length;i++)
	{
		var t=x[i].value.split(",");
		if(t[0]==0)
		{
			dd+=t[1]+",";
		}
	}
	return dd;
}
function ev_allundo()
{
	var lj="${ROOT}/listAllWorkLists.do?uid=<%=loginedUser.getId()%>";
	window.open(lj,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
}
</script>
 
</head>
 <body>
 <table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/images/cmd.jpg" height="30"><table width="100%">
   <tr>
       <td align=left width=3 ><img src="${ROOT}/images/cmd01.gif" ></td>
          <td id=search onaction="" width="500"> 
			 <input type="button" class="button" value="新增" onclick="javascript:ev_add();">
			 <input type="button" class="button" value="编辑" onclick="javascript:ev_update();">
			 <input type="button" class="button" value="删除" onclick="javascript:ev_del();">
			 <input type="button" class="button" value="启动" onclick="javascript:ev_on();">
			 <input type="button" class="button" value="停止" onclick="javascript:ev_off();">
			 <input type="button" class="button" value="授权日志" onclick="javascript:ev_log();">
			 <input type="button" class="button" value="所有待办" onclick="javascript:ev_allundo();">
		  </td>
   </tr>
</table></td></tr> 
 </table>
 <div align="center" class="title">授权总表浏览</div>
  <form   name="accreditForm" method="post" action="" >
  <input name="st" type="hidden" value="0">
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="8%" nowrap align="center" class=header >选择
     <input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'selectedRow');">
    </td>
  	<page:tabTitle title="业务类型" column="busi"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>

    <td width="11%" nowrap class=header align="center">授权人</td>
    <td width="11%" nowrap class=header align="center">被授权人</td>
    <td width="5%" nowrap class=header align="center">是否启动</td>
    <td width="8%" nowrap class=header align="center">状 态</td>
    <page:tabTitle title="开始时间" column="startDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>
    <page:tabTitle title="结束时间" column="endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="center"/>
 
  </tr>
<%if(accreditList!=null)
 { 
	 IBusiService ibs=(IBusiService)SpringHelper.getBean("busiService");
	 Date d=new Date();
	 SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 for(int i=0;i<accreditList.size();i++)
	 {
		 Accredit acc=(Accredit)accreditList.get(i);
		 String busiName="";
		 if(acc.getBusi().equals("*"))
		 	busiName="所有业务类型";
		 else
		 {
		 	Busi bu=ibs.findBusiById(acc.getBusi());
		 	busiName=bu.getBusiName();
		 }
		
 %>
	<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td align="center">
		<%=i+1 %>&nbsp;<input type="checkbox" name="selectedRow"  value="<%=acc.getId() %>">
		<input type="hidden" name="<%=acc.getId() %>" value="<%=(i+1)+","+acc.getFlgStart() %>">
	</td>
	<td align="left"><a href="javascript: view_form('${ROOT}/viewAccredit.do?method=update&accreditID=<%=acc.getId() %>');">
			<%=busiName %>
		</a>
	</td>
	<td><%=acc.getGrantorName() %></td>
	<td><%=acc.getAcceptorName() %></td>
	<td>
		<%if(acc.getFlgStart().intValue()==1) out.print("是"); else out.print("否"); %>
	</td>
	<td>
		<%int xg=0;//0表示无效，1表示有效
		if(acc.getEndDate().before(d)) 
				out.print("无效"); 
			else
				{out.print("有效");xg=1;}
				String bsg=xg+","+(i+1);
				out.print("<input name=\""+acc.getId()+"xg\" type=\"hidden\" value=\""+bsg+"\">");
		%>
	</td>
	<td><%=df.format(acc.getStartDate()) %></td>
	<td><%=df.format(acc.getEndDate()) %></td>
	</tr>
<%}} %>
</table><br>
<page:root inputclass="editline" />
<input type="hidden" name="gl">
  </form>
<script type="text/javascript">
<%if(grantorStr!=null && !grantorStr.trim().equals("")){%>
 document.accreditForm.gl.value="<%=grantorStr%>";
 var ur="${ROOT}/system/common/delete_accredit_undo.jsp";
 window.open(ur,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
 <%}%>
</script>
<%if(acid!=null && !acid.trim().equals("")) {%>
<script type="text/javascript">
var obj=new Object();
obj.id="<%=acid%>";
var aciu="${ROOT}/system/common/accredit_start_undo_assist.jsp";
window.open(aciu,'','left=300, top=280, width=400, height=200, resizable=1,scrollbars=1');
</script>
<%} %>
  </body>
</html>
