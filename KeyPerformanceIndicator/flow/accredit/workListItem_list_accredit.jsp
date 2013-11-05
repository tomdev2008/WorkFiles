<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.target.valueobject.Unit,				
				java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.assess.service.ITemTargetService"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ include file="../common/head.inc" %>
<% //所有待办
	List list=(List)request.getAttribute("list");
%>
<html>
  <head>  

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
 
</head>
<script type="text/javascript">
 
</script>
 <body>
 
<div align="center" class="title">需要转移的待办列表</div>
<form id="form1" name="form1" method="post" action="" >
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="10%" height=23 align="center" class=header >选择
    <input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'selectedRow');">
    </td>
    <td width="20%" height=23  align="center"  class=header>业务类型</td>
    <td width="10%" height=23  align="center"  class=header>原处理人</td>
    <td width="10%" height=23  align="center"  class=header>现处理人</td>
    <td width="40%" height=23  align="center"  class=header>任务描述</td>
    <td width="20%" height=23  align="center"  class=header>创建时间</td>
  </tr>
 <%
 	if(list!=null)
 	{
 		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm");
 		for(int i=0;i<list.size();i++)
 		{
 			WorklistItem wi=(WorklistItem)list.get(i);
 			
 %> 
  <tr onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
    <td align="center">
      <%=i+1 %>&nbsp;<input type="checkbox" name="selectedRow" id="<%=wi.getId()%>" value="<%=wi.getId()%>">
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
 <div align="center"> <input type="button" class="button" value="确定">&nbsp;<input type="button" class="button" value="取消">
</div>

  </form>
  </body>
</html>
