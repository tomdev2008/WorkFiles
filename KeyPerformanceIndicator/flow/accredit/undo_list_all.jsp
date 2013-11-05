<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.Map"/>
<jsp:directive.page import="java.util.ArrayList"/>
<%@ include file="/web/pub/flow.inc" %>
<% 
	Map map=(Map)request.getAttribute("map");//待办列表
	String tag=request.getParameter("tag");
%>
<html>
  <head>  

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
 
</head>
<script type="text/javascript">
function ev_turn()
{
	var wx=document.getElementsByName("way");
	var ways="";
	for(var i=0;i<wx.length;i++)
	{
		if(wx[i].checked)
		{
			ways=wx[i].value;
		}
	}
	
	if(ways=="")
	{
		alert("请选择处理方式，转办或回收！");return;
	}
	if(ways=="turn")
	{
		var al=check(0,"转办");
		if(al!="")
		{
			alert(al);return;
		}
		form1.action="${ROOT}/updateUndoInAccredit.do?uid=<%=loginedUser.getId()%>";
	}
	else if(ways=="back")
	{
		var al=check(2,"回收");
		if(al!="")
		{
			alert(al);return;
		}
		form1.action="${ROOT}/updateUndoBack.do?uid=<%=loginedUser.getId()%>";
	}
	form1.submit();
}
function check(flg,aler)
{
	var id=document.getElementsByName("selectedRow");
	var count=0;
	var str="";//用来记录哪个有
	for(var i=0;i<id.length;i++)
	{
		if(id[i].checked)
		{
			count++;
			var x=id[i].id.split(",");
			if(x[0]!=flg)
				str+=x[1]+",";
		}
	}
	if(count==0)
		return "您没有选择记录！";
	else if(str=="")
		return str;
	else
		return "第"+str+"条不能"+aler;
}
<%if(tag!=null&&tag.equals("1")){%>
alert("转移成功！");
<%}%>
</script>
 <body>
<br>
<div align="center" class="title">待办列表</div>
<form id="form1" name="form1" method="post" action="" >
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="10%" height=23 align="center" class=header >选择
    <input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'selectedRow');">
    </td>
    <td width="36%" height=23  align="center"  class=header>任务描述</td>
    <td width="18%" height=23  align="center"  class=header>业务类型</td>
    <td width="10%" height=23  align="center"  class=header>处理人</td>
     <td width="10%" height=23  align="center"  class=header>授权人</td>
    <td width="20%" height=23  align="center"  class=header>创建时间</td>
  </tr>
 <%
 	if(map!=null)
 	{
 		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		int j=0;
 		List selfList=(List)map.get("self-self");
 		List otherList=(List)map.get("other-self");
 		List soList=(List)map.get("self-other");
 		List list=new ArrayList();
 		list.add(selfList);list.add(otherList);list.add(soList);
 		String color="";
 		for(int k=0;k<list.size();k++)
 		{
 			if(k==0) color="#0066FF"; else if(k==1) color="#CC6600"; else color="#CCCCCC";
 			List l=(List)list.get(k);
	 		for(int i=0;i<l.size();i++)
	 		{
	 			WorklistItem wi=(WorklistItem)l.get(i);
	 			j++;
 %> 
  <tr onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
    <td align="center">
      <%=j%>&nbsp;<input type="checkbox" name="selectedRow" id="<%=k+","+j%>" value="<%=wi.getId()%>">
      </td>
    <td><font color="<%=color %>"><%=wi.getBo().getBOName()%></font>&nbsp;</td>
    <td align="center"><%=wi.getBusiType()%></td>
    <td align="center"><%= wi.getHandlerName()%></td>
    <td align="center"><%= wi.getSrcHandlerName()%></td>
    <td align="center"><%=df.format(wi.getGenDate()) %>
  </tr>
 <%
 		}
 		}
 	}  	
 
  %>  

  

</table>&nbsp;
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr><td align="left">
		<FONT color="#0033FF">注：</FONT>
		<font color="#0066FF">■</font>
		<FONT color="#0066FF">色字体代表自己的待办</FONT>
		<font color="#CC6600">■</font>
		<FONT color="#CC6600">色字体代表别人授权的待办,</FONT>
		<font color="#CCCCCC"> ■</font>
		<FONT color="#CCCCCC">色字体代表授权给别人的待办</FONT>
		</td></tr>
	</table>
&nbsp;
<div><input name="way" value="turn" type="radio">转办待办，将自己的待办转给别人处理&nbsp;请选择转办对象：
<input name="personName" type="text" readonly="readonly" class="editline" onclick="showAddr('personName','personId','20;1')">
<input name="personId" type="hidden">
</div>
<div><input name="way" value="back" type="radio">回收待办，将授权给别人的待办收回</div>
<br>
<div align="center"><input type="button" class="button" value="转移" onclick="javascript:ev_turn();">
  &nbsp;<input type="button" class="button" onclick="javascript:window.close();" value="关闭"></div>
<br>
  </form>
  </body>
</html>
