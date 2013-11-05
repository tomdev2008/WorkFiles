<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="/web/pub/head.inc"%>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonFolder"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonData"/>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<%
	//目录列表
	List dataList = (List)request.getAttribute("dataList");
	String parentId = ParamUtils.getDefaultStringValue(request,"parentId","");
%>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>部门列表</title>
	<script type="text/javascript">
	<!--
	    function ev_showDate(parentId)
	    {
	      parent.document.frames("ftree").document.getElementById("listType").value="folder";
	       this.location.href="${ROOT}/listPersonFolder.do?id="+parentId;
	    }
		/**
		*新增部门
		*/
		function ev_add(parentId){
		    if(parentId!=null&&parentId.length>0)
		    {
		    
			var url = "${ROOT}/createPersonData.do?parentId="+parentId;
			//openFullScreenWin(url);
			window.location.href = url;
			}
			else
			{
			  alert("请选择一个特定的目录用于添加数据！\r根目录下不能添加数据！");
			}
		}
		
		/**
		*编辑数据信息
		*/
		function ev_edit(){
		  var number = 0;
			var checkVal ;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "id"){
					if(e.checked){
						number = number + 1;
						checkVal = e.value;	
					}
				}							
			}
			if(number == 0){
				alert("请选择要修改的记录");
				return ;
			}else if(number>1){
				alert("请只选择一条要修改的记录");
				return ;
			}
			ev_edit2(checkVal);
		}
		
		function ev_edit2(id) {
			var url = "${ROOT}/editPersonData.do?showTime=first&id="+id;
			document.form1.action=url;
				document.form1.submit();
		}
		/**
		*删除部门信息
		*/
		function ev_delete(){
			var number = 0;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "id"){
					if(e.checked)
						number = number + 1;
				}							
			}
			if(number == 0){
				alert("请选择要删除的记录");
				return ;
			}
			if(confirm("确定删除所选的记录吗？")){
				document.form1.action="${ROOT}/delPersonData.do";
				document.form1.submit();
			}	
		}
		
		function ev_move(parentId)
		{
		 	var number = 0;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "id"){
					if(e.checked)
						number = number + 1;
				}							
			}
			if(number == 0){
				alert("请选择移动的目录");
				return ;
			}
		   
		 	var retvalue =  window.showModalDialog('${ROOT}/web/system/favorite/selectFolder.jsp', null, 'dialogHeight:280px;dialogWidth:220px;scroll=no;resizable=no;status=no');
		    if(retvalue!=null&&retvalue!="")
		    {
		        if(retvalue==parentId)
		        {
		          alert("请选择有效的目录");
				  return ;
		        }
		       // alert("retvalue:"+retvalue);
		        document.form1.action="${ROOT}/movePersonData.do?targetid="+retvalue;
				document.form1.submit();	
		    }
		     return ;
		}
		
		function swapFolder(currId,swapId,parentId)
		{
			var url = "${ROOT}/swapPersonData.do?currId="+currId+"&swapId="+swapId+"&parentId="+parentId;
			window.location = url;
		}
	//-->
	</script>
 </head>
 
<body onmousewheel="setScrollzheight()" class="main-body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>数据管理</h2></td></tr>
  <tr>
	<td class="list-caozuo">
	    <a id="hlinkAddNew" href="javascript:ev_showDate('${parentId}');">目录管理</a>|
	    <a id="hlinkAddNew" href="javascript:ev_add('${parentId}');">新增</a>|
	    <a id="hlinkDelete" href="javascript:ev_edit();">修改</a>|
	    <a id="hlinkDelete" href="javascript:ev_delete();">删除</a>|
	    <a id="hlinkDelete" href="javascript:ev_move('${parentId}');">转移</a>
	</td>
   </tr>
 </table>

<%
    if(parentId!=null&&parentId.trim().length()>0)
    {
%>
<div align="left">
       [<font color="#CC3300">${parent.name }</font>]下的常用数据列表。
</div> 

<%    
    }
    else
    {
    %>
<div align="left">
       [<font color="#CC3300">根目录下不能添加数据! 要添加数据请先选择一个特定的目录！</font>]
</div>       
<%
    }
%>


<form method="post" name="form1" id="form1">
<input name="parentId" type="hidden" id="parentId" value="${parentId}"/>
<table class="list-box" cellspacing="0" rules="all" border="0">
	<tr align="left">
	
		<td width="40" class="list-title" style="text-align:center">
			<input id="selectAll"  type="checkbox"  onclick="javascript:checkAll(this.id,'id');" 
			class="checkboxInput" />
        </td>
        <th align="center" width="8%" class="list-title">序号</th>
        <th align="center" width="*" class="list-title">数据名称</th>
        <th align="center" width="8%" class="list-title">排序</th>
	</tr>
<%
	PersonData personData = null;
	if(dataList!=null&&dataList.size()>0)
	{
	   int index =0;
	   for(int i=0;i<dataList.size();i++){
		personData = (PersonData)dataList.get(i);
		//表格行的样式定义
		String trClass = "list-color1"+(i%2+1);
		index++;
%>
	<tr class="<%=trClass %>">
		<td class="list-text1">
		<input name="id" onclick="" type="checkbox" value="<%=personData.getId() %>" class="checkboxInput"/></td>
		<td class="list-text2" align="center"><%=index%></td>
		<td class="list-text1" align="left"><a href="javascript:ev_edit2('<%=personData.getId() %>');"><%=personData.getName() %></a></td>
		<td class="list-text1">
		  <table cellpadding="0" cellspacing="0" border="0"> 
            <tr> 
            	<%-- 向上的箭头，如果不是第一行 --%>
              <td> <%  if (i > 0) { 
              					PersonData previous = (PersonData)dataList.get(i-1);
              			%> 
                   <a href="javaScript:swapFolder('<%=personData.getId()%>','<%=previous.getId()%>','<%=parentId%>');"
                   ><img src="${ROOT}/img/arrow_up.gif" width="13" height="9" border="0" vspace="2" hspace="2"></a> 
                     <%  } else { %> 
                    <img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"> 
                     <%  } %> 
              </td> 
              <%-- 向下的箭头，如果不是最后一行 --%>
              <td> <%  if (i<(dataList.size()-1)) { 
              					PersonData next = (PersonData)dataList.get(i+1);
              			%> 
                     <a href="javaScript:swapFolder('<%=personData.getId()%>','<%=next.getId()%>','<%=parentId%>');"
                    ><img src="${ROOT}/img/arrow_down.gif" width="13" height="9" border="0" vspace="2" hspace="2"></a> 
                    <%  } else { %> 
                    <img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"> 
                     <%  } %> 
              </td> 
             </tr> 
          </table>
		 </td>
	</tr>
<%  }
  }
%>
</table>
<kpi:page-bar formId="form1" />	
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function(){setPHeight();}
//-->
</script>
<kpi:UIResponse />