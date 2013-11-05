<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ include file="/web/pub/flow.inc" %>
<% 
	List list=(List)request.getAttribute("list");
%>
<html>
  <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
</head>
<html:base target="_self"/>
 <body>
 
<div align="center" class="title">授权待办历史纪录</div>
<form id="form1" name="form1" method="post" action="" >
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="6%" height=23  align="center"  class=header >序号</td>
    <td width="15%" height=23  align="center"  class=header>业务类型</td>
    <td width="10%" height=23  align="center"  class=header>原处理人</td>
    <td width="10%" height=23  align="center"  class=header>现处理人</td>
    <td width="39%" height=23  align="center"  class=header>任务描述</td>
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
  <tr <%if(i%2==0) out.print("bgcolor=\"#E8F4F4\""); %>  style.cursor='default' >
    <td align="center">
    <%=i+1 %>
      </td>
    <td align="center"><%=wi.getBusiType()%></td>
    <td align="center"><%=wi.getSrcHandlerName() %></td>
    <td align="center"><%=wi.getHandlerName() %></td>
    <td><%=wi.getBo().getBOName()%>&nbsp;</td>
    <td align="center"><%=df.format(wi.getGenDate()) %>
  </tr>
 <%
 		}
 	}  	
 
  %>  

</table>

</form>
</body>
</html>
