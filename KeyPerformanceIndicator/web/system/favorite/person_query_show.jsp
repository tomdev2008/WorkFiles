<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="java.util.Set"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.ArrayList"/>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonQuery"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonQueryData"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<%
	String operation = ParamUtils.getDefaultStringValue(request,"operation","");
	PersonQuery personQuery = (PersonQuery)request.getAttribute("personQuery");
	String action = personQuery.getAction();
	int len = action.split("/").length;
	action = request.getContextPath()+"/"+action.split("/")[len-1];
	
	
	//System.out.println("action:"+action);
	List list =  null;
	if(personQuery.getQueryDatas()!=null)
	{
	   list = new ArrayList(personQuery.getQueryDatas());
	}
	
	
%>

	<title>
		查询条件设置
	</title>
	<%@ include file="/web/pub/head.inc"%>

    <script>
    
   function  onInit()
	{
	  
	  form1.submit();
	}
	
	</script>
</head>


<body  onmousewheel="setScrollzheight()">
    
  	  
      <form name="form1" method="post" action="<%=action%>">
      <%
          if(list!=null&&list.size()>0)
          {
             for(int i=0;i<list.size();i++)
             {
               PersonQueryData data = (PersonQueryData)list.get(i);
               %>
                  <input name="<%=data.getParaCode()%>" type="hidden" value="<%=data.getParaValue()%>"/>
               <%
             }
          }
      %>
      <input name="reportType" type="hidden" value="favorite"/>
   </form>
</body>



<script type="text/javascript">
	onInit();
	</script>
</html>
