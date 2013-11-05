<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="/web/pub/head.inc"%>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonQuery"/>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<%
	//报表定制列表
	List queryList = (List)request.getAttribute("queryList");
	//String parentId = ParamUtils.getDefaultStringValue(request,"parentId","");
%>



<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>报表定制列表</title>
	<script type="text/javascript">
	<!--
	   
		/**
		*新增报表定制
		*/
		function ev_add(){
			var url = "${ROOT}/createPersonQuery.do";
			//openFullScreenWin(url);
			window.location.href = url;
		}
		
		/**
		*编辑报表定制信息
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
			var url = "${ROOT}/editPersonQuery.do?id="+id;
			document.form1.action=url;
			document.form1.submit();
			//openFullScreenWin(url);
			//pageShowForm(url);
		}
		/**
		*删除报表定制信息
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
				document.form1.action="${ROOT}/delPersonQuery.do";
				document.form1.submit();
			}	
		}
		
		
		
		function swapFolder(currId,swapId)
		{
		   //alert("oo");
			var url = "${ROOT}/swapPersonQuery.do?currId="+currId+"&swapId="+swapId;
			window.location = url;
		}
		
		
	//-->
	</script>
 </head>
 
 
 
 
 
 
<body onmousewheel="setScrollzheight()" class="main-body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>报表定制</h2></td></tr>
  <tr>
	<td class="list-caozuo">
	    <a id="hlinkAddNew" href="javascript:ev_add();">新增</a>|
	    <a id="hlinkDelete" href="javascript:ev_edit();">修改</a>|
	    <a id="hlinkDelete" href="javascript:ev_delete();">删除</a>
	    
	</td>
   </tr>
 </table>

<br>


<form method="post" name="form1" id="form1">

<table class="list-box" cellspacing="0" rules="all" border="0">
	<tr align="left">
		<th width="25" class="list-title">
			<input id="selectAll"  type="checkbox"  onclick="javascript:checkAll(this.id,'id');" 
			class="checkboxInput" />
        </th>
        <th class="list-title" align="center" style="text-align:center" width="8%" >序号</th>
        <th class="list-title" align="left" width="*">&nbsp;定制报表名称</th>
        <th class="list-title" align="center" style="text-align:center" width="10%" >创建用户</th>
        <th class="list-title" align="center" style="text-align:center" width="12%" >创建时间</th>
        <th class="list-title" align="center" style="text-align:center" width="12%" >最后修改用户</th>
        <th class="list-title" align="center" style="text-align:center" width="12%" >最后修改时间</th>
        <th class="list-title" align="center" style="text-align:center" width="6%" >排序</th>
	</tr>
<%
	PersonQuery query = null;
	if(queryList!=null&&queryList.size()>0)
	{
	   int index =0;
	   for(int i=0;i<queryList.size();i++){
		query = (PersonQuery)queryList.get(i);
		//表格行的样式定义
		String trClass = i%2==0?"list-color1":"list-color2";
		index++;
%>
	<tr class="<%=trClass%>">
		<td class="list-text1">
		<input name="id" onclick="" type="checkbox" value="<%=query.getId() %>" class="checkboxInput"/></td>
		<td class="list-text2" align="center"><%=index%>&nbsp;</td>
		<td class="list-text1" align="left"><a href="javascript:ev_edit2('<%=query.getId() %>');"><%=query.getQueryName() %></a></td>
		<td class="list-text1" align="center"><%=query.getCreatorName() %></td>
		<td class="list-text1" align="center"><%=query.getShowCreateDate() %></td>
		<td class="list-text1" align="center"><%=query.getLastModifierName() %></td>
		<td class="list-text1" align="center"><%=query.getShowlastModDate() %></td>
		<td class="list-text1">
		  <table cellpadding="0" cellspacing="0" border="0"> 
            <tr> 
            	<%-- 向上的箭头，如果不是第一行 --%>
              <td> <%  if (i > 0) { 
              					PersonQuery previous = (PersonQuery)queryList.get(i-1);
              			%> 
                   <a href="javaScript:swapFolder('<%=query.getId()%>','<%=previous.getId()%>');"
                   ><img src="${ROOT}/img/arrow_up.gif" width="13" height="9" border="0" vspace="2" hspace="2"></a> 
                     <%  } else { %> 
                    <img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"> 
                     <%  } %> 
              </td> 
              <%-- 向下的箭头，如果不是最后一行 --%>
              <td> <%  if (i<(queryList.size()-1)) { 
              					PersonQuery next = (PersonQuery)queryList.get(i+1);
              			%> 
                     <a href="javaScript:swapFolder('<%=query.getId()%>','<%=next.getId()%>');"
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