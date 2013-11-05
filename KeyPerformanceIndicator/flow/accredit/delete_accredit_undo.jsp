<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.TurningItem"/>
<%@ include file="/web/pub/flow.inc" %>
<% 
	List list=(List)request.getAttribute("list");
%>
<html>
  <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
</head>
<script type="text/javascript">
<%if(list!=null&&list.size()==0){%>
alert("没有要转移的待办！");
window.close();
<%}%>
function ev_turn()
{
	if(!gettheselect())
	{alert("您没有选择待办,！");return;}
	document.form1.action="${ROOT}/updateTurnWorklist.do";
	document.form1.submit();
}
function gettheselect()
{
	var flg=false;;
	var x=document.getElementsByName("selectedRow");
	for(i=0;i<x.length;i++)
	{
		if(x[i].checked)
		{
			flg=true;
			break;
		}
	}
	return flg;
}
</script>
<html:base target="_self"/>
 <body>
 
<div align="center" class="title">需要回收的待办列表</div>
<form id="form1" name="form1" method="post" action="" >
<input type="hidden" name="ids">

<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="8%" height=23 align="center" class=header >选择
    <input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'selectedRow');">
    </td>
    <td width="18%" height=23  align="center"  class=header>业务类型</td>
    <td width="9%" height=23  align="center"  class=header>原处理人</td>
    <td width="9%" height=23  align="center"  class=header>现处理人</td>
    <td width="40%" height=23  align="center"  class=header>任务描述</td>
    <td width="16%" height=23  align="center"  class=header>创建时间</td>
  </tr>
 <%
 	if(list!=null)
 	{
 		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		for(int i=0;i<list.size();i++)
 		{
 			Object[] obj=(Object[])list.get(i);
			WorklistItem wi=(WorklistItem)obj[0];
			TurningItem ti=(TurningItem)obj[1];
 			
 %> 
  <tr onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
    <td align="center">
      <%=i+1%>&nbsp;<input type="checkbox" name="selectedRow" value="<%=wi.getId()+","+ti.getTurningId()%>">
      </td>
    <td align="center"><%=wi.getBusiType()%></td>
    <td align="center"><%=wi.getSrcHandlerName() %></td>
    <td align="center"><%=wi.getHandlerName() %></td>
    <td><%=wi.getWorklistItemTitle()%>&nbsp;</td>
    <td align="center"><%=df.format(wi.getGenDate()) %>
  </tr>
 <%
 		}
 	}  	
 
  %>  

</table>
<br>
<div align="center"><input type="button" class="button" value="确定" onclick="javascript:ev_turn();">&nbsp;
<input type="button" class="button" value="取消" onclick="javascript:window.close();">
</div>
<br>
</form>
  <script type="text/javascript">
  var ids=window.opener.window.document.accreditForm.gl.value;
<%if(request.getParameter("tag")==null){%>
if(ids!="")
{
	document.form1.ids.value=ids;
	document.form1.action="${ROOT}/listUndoByAccredit.do?tag=1";
	document.form1.submit();
}
<%}%>
  </script>
  </body>
</html>
