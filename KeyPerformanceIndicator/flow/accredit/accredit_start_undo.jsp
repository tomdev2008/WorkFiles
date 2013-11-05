<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.target.valueobject.Unit,				
				java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.assess.service.ITemTargetService"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Accredit"/>
<%@ include file="/web/pub/flow.inc" %>
<% //所有待办
	List list=(List)request.getAttribute("list");
	String tag=request.getParameter("tag");
	String person="";
 	String personName="";
%>
<html>
	<head>  
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
	</head>
<script type="text/javascript">
	window.moveTo(100,80);
	window.resizeTo(800,600);
	function ev_turn()
	{
	 	if(document.form1.personId.value=="")
	 	{
	 		alert("请选择需要转办的对象！");
	 		return;
	 	}
	 	if(getselect()==0)
	 	{
	 		alert("您没有选择要转移的记录！");return;
	 	}
	 	form1.action="${ROOT}/updateUndoByAccStart.do";
	 	form1.submit();
	}
	
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
 
<div align="center" class="title">需要转移的待办列表</div>
<form id="form1" name="form1" method="post" action="" >
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="8%" height=23 align="center" class=header >选择
    <input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'selectedRow');">
    </td>
    <td width="18%" height=23  align="center"  class=header>业务类型</td>
    <td width="10%" height=23  align="center"  class=header>原处理人</td>
    <td width="10%" height=23  align="center"  class=header>现处理人</td>
    <td width="40%" height=23  align="center"  class=header>任务描述</td>
    <td width="24%" height=23  align="center"  class=header>创建时间</td>
  </tr>
 <%
 	if(list!=null)
 	{
 		
 		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		for(int i=0;i<list.size();i++)
 		{
 			Object[] obj=(Object[])list.get(i);
 			WorklistItem wi=(WorklistItem)obj[0];
 			Accredit acc=(Accredit)obj[1];
 			String t=wi.getId()+","+acc.getId();
 			if(i==0)
 			{
 				person="20,"+acc.getAcceptorName()+","+acc.getAcceptor();
 				personName=acc.getAcceptorName();
 			}
 			
 %> 
  <tr onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
    <td align="center">
      <%=i+1%>&nbsp;<input type="checkbox" name="selectedRow" id="<%=wi.getId()%>" value="<%=t%>">
      </td>
    <td align="center"><%=wi.getBusiType()%></td>
    <td align="center"><%=wi.getSrcHandlerName()%></td>
    <td align="center"><%=wi.getHandlerName()%></td>
    <td><%=wi.getBo().getBOName()%>&nbsp;</td>
    <td align="center"><%=df.format(wi.getGenDate()) %>
  </tr>
 <%
	}
}  	
 
  %>  
</table>

&nbsp;<div align="left">&nbsp;请选择要转给的对象:
<input type="text" class="editline" name="personName" value="<%=personName %>" readonly="readonly">
<input type="hidden" name="personId" value="<%=person%>">
<input type="button" class="button" value="选择" onclick="showAddr('personName','personId','20;1')"></div>
 <div align="center"><br>
<input type="button" class="button" value="确定" onclick="javascript:ev_turn();">&nbsp;
<input type="button" class="button" value="取消" onclick="javascript:window.close();">
</div>
<br>
  </form>
  </body>
</html>
