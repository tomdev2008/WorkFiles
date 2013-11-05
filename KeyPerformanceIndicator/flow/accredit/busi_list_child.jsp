<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.common.valueobject.Busi,
                 java.util.List" %>
<%@ include file="/web/pub/flow.inc" %>
<% 
	List busiList=(List)request.getAttribute("busiList");	
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
</head>
 <body class=list_body>
  <form   name="busiForm" method="post" action="" target="_parent">
  <input name="st" type="hidden" value="0">
<table width="100%" border="1"   cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
  <tr>
    <td width="10%" height=23 nowrap class=header onClick="ev_select();"><span class="style32">选择</span><!--(<u>S</u>)--></td>
    <td width="20%" height=23 nowrap class=header> <span class="style32">业务类型名称</span> </td>
    <td width="70%" height=23 nowrap class=header><span class="style32"> 备注</span></td>
   
  </tr>
  
 <%
 	if(busiList!=null)
 	{
 		for(int i=0;i<busiList.size();i++)
 		{
 			Busi busi=(Busi)busiList.get(i);
 				
 			
 %> 
  <tr onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' >
    <td>
      <div align="center">
         <input type="checkbox" name="selectedRow" id="<%=busi.getId()%>" value="<%=busi.getId()%>">
         <input type="hidden" name="name" value="<%=busi.getBusiName()%>">
      </div></td>
    <td align="center"><a href="${ROOT}/system/common/busi_form.jsp?method=update&busiID=<%=busi.getId()%>" target="_parent"><%=busi.getBusiName()%></a></td>
    <td><%=busi.getRemark()==null?" ":busi.getRemark()%>&nbsp;</td>
    
  </tr>
 <%
 		}
 	}  	
 
  %>
  
</table>
  </form>
  </body>
</html>

