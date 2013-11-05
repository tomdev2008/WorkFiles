<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="java.util.List" %>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.utils.sms.DBMessage"/>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<title>短消息管理</title>
</head>
<%
   
%>
<script language="javascript">

function ev_add(){
	var url = "${ROOT}/viewMessage.do";
	var value = window.showModalDialog(url,"","dialogHeight:450px;dialogWidth:720px;status=off");
	if("refresh"==value){
		window.location.href="${ROOT}/listMessages.do";
	}
}

function ev_del(){
	var ids = getAllChecked("id");
	if(ids==""){
		alert("请选择你要删除的短消息");
	} else {
		if(confirm("确定要删除所选中的短消息!")){
           form1.action = "${ROOT}/deleteMessages.do?";
           form1.submit();	
		} else {
           return;
        }
	}	
}

function view(id){
	var url = "${ROOT}/viewMessage.do?id="+id;
	var value = window.showModalDialog(url,"","dialogHeight:450px;dialogWidth:720px;status=off");
	if("refresh"==value){
		window.location.href="${ROOT}/listMessages.do";
	}
}

</script>

<body  >
<form name="queryForm" method="post" >
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/images/cmd.jpg" height="30"><table width="100%">
   <tr> 
     <td align=left width=3 ><img src="${ROOT}/images/cmd01.gif" ></td>
     <td id=search onaction="" width="500"> 
	 <input type="button" class="button" value="新增" onclick="javascript:ev_add();" id=add >
	 <input type="button" class="button" value="删除" onclick="javascript:ev_del();" id=delete >
	 <%--<input type="button" class="button" value="查询" onclick="javascript:ev_query_open();">
     --%></td>
     </tr></table></td></tr>     
     <tr id="queryid" style="display: none">     
	  	<td colspan="2" width="100%" height="3%">	  	
	  	<font color="red" size="2" face="arial,sans-serif">*</font>
	  	发送人&nbsp;<input id="query_name" name="userName" size="10" />&nbsp;
	  	&nbsp;<input type="button" class="button" value="查找" onclick="javascript:ev_query()"/>
	  	&nbsp;<input type="button" class="button" value="关闭" onclick="javascript:ev_query_close()"/>
	  	</td>
	  </tr>
     </table></form>
<div align="center" class="title">短消息浏览</div>

<FORM method="post" id="form1" name="form1" action="">

<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
    <tr>
	  <td class="header" width="10%"  nowrap align="center">
	  <input id='chkCtl' type="checkbox" onclick="javascript:checkAll(this.id, 'id');">选择</td>
	  <td class="header" width="40%" nowrap align="center">内容</td>
	  <td class="header" width="20%" nowrap align="center">发送人</td>
	  <td class="header" width="15%" nowrap align="center">创建时间</td>
	  <td class="header" width="15%" nowrap align="center">发送时间</td>  
	</tr>
	<%
		List list = (List)request.getAttribute("list");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(int i=0; i<list.size(); i++){
			DBMessage message = (DBMessage)list.get(i);
	%>
  	<tr > 
	    <td align="center">
	    <input type="checkbox" name="id" value="<%=message.getId()%>" /></td>
	    <td align="left">
	    <a href="javascript:view('<%=message.getId()%>');">
	    <%=message.getMessageBody()%></a></td> 
	    <td align="center"><%=message.getSenderName()==null?"系统消息":message.getSenderName()%></td> 
	    <td align="center"><%=sdf.format(message.getGenDate())%></td> 
	    <td align="center"><%=message.getSendDt()==null?"":sdf.format(message.getSendDt())%></td> 
    </tr> 
  	<%	} %>
</table><br>
<table width="95%" border="0"><tr><td align="right">
<page:root inputclass="editline" formId="form1" /></td></tr></table>
</FORM>
</body>
</html>