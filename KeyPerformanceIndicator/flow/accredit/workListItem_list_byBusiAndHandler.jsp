<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.target.valueobject.Unit,				
				java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.assess.service.ITemTargetService"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ include file="/web/pub/flow.inc" %>
<% //部分待办
	List list=(List)request.getAttribute("list");//待办列表
	String sqr=(String)request.getAttribute("sqr");//授权人名字
	String acceptor=request.getParameter("acceptor");
	String grantor=request.getParameter("grantor");
	String busiType=request.getParameter("busiType");
	String accreditId=request.getParameter("accreditId");
	String tag=request.getParameter("tag");
%>
<html>
  <head>  

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
 
</head>
<script type="text/javascript">
function ev_turn()
{
	if(getselect()==0)
	{
		alert("您没有选择要转移的记录！");return;
	}
	form1.action="${ROOT}/createUndoTurn.do?accreditId=<%=accreditId%>&grantor=<%=grantor%>&acceptor=<%=acceptor%>&busiType=<%=busiType%>";
	form1.submit();
}
<%if(tag!=null&&tag.equals("1")){%>
alert("转移成功！");
<%}%>
function getselect()
{
	var x=document.getElementsByName("selectedRow");
	var count=0;
	for(var i=0;i<x.length;i++)
	{
		if(x[i].checked)
		{
			count=1;break;
		}
	}
	return count;
}
</script>
 <body>
<br>
<div align="center" class="title">需要转移的待办列表</div>
<form id="form1" name="form1" method="post" action="" >
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="10%" height=23 align="center" class=header >选择
    <input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'selectedRow');">
    </td>
    <td width="20%" height=23  align="center"  class=header>业务类型</td>
    <td width="10%" height=23  align="center"  class=header>授权对象</td>
    <td width="40%" height=23  align="center"  class=header>任务描述</td>
    <td width="20%" height=23  align="center"  class=header>创建时间</td>
  </tr>
 <%
 	if(list!=null)
 	{
 		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		for(int i=0;i<list.size();i++)
 		{
 			WorklistItem wi=(WorklistItem)list.get(i);
 			
 %> 
  <tr onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
    <td align="center">
      <%=i+1%>&nbsp;<input type="checkbox" name="selectedRow" id="<%=wi.getId()%>" value="<%=wi.getId()%>">
      </td>
    <td align="center"><%=wi.getBusiType()%></td>
    <td align="center"><%=sqr %></td>
    <td><%=wi.getBo().getBOName()%>&nbsp;</td>
    <td align="center"><%=df.format(wi.getGenDate()) %>
  </tr>
 <%
 		}
 	}  	
 
  %>  

  

</table>
<br>
<div align="center"><input type="button" class="button" value="转移" onclick="javascript:ev_turn();">
  &nbsp;<input type="button" class="button" onclick="javascript:window.close();" value="关闭"></div>
<br>
  </form>
  </body>
</html>
