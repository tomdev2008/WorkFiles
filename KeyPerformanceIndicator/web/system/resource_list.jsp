<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.shengdai.kpi.system.security.vo.Resource" %>
<%@ page import="com.shengdai.kpi.util.StringUtils" %>
<%@ page import="com.shengdai.kpi.system.security.Security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head >
<%
	Resource parentResource = (Resource)request.getAttribute("parentResource");
	List resourceList = (ArrayList)request.getAttribute("resourceList");
 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script>
		function ev_new() {
			openWin("${ROOT}/editResource.do?parentResourceId=${parentResource.id }",{showCenter:true,width:750,height:450});
		}
		function ev_edit2(id) {
			openWin("${ROOT}/editResource.do?resourceId="+id,{showCenter:true,width:750,height:450});
		}
		function ev_edit() {
			var number = 0;
			var checkVal ;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked){
						number = number + 1;
						checkVal = e.value;	
					}
				}							
			}
			if(number == 0){
				alert("请选择要修改的记录");
				return false;
			}else if(number>1){
				alert("请只选择一条要修改的记录");
				return false;
			}
			ev_edit2(checkVal);
		}
		function ev_del(id) {
			var number = 0;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked)
						number = number + 1;
				}							
			}
			if(number == 0){
				alert("请选择要删除的记录");
				return false;
			}
			if(confirm("确定删除所选的记录吗？")){
				document.form1.action="${ROOT}/delResource.do";
				document.form1.submit();
			}	
		}
		function swapResource(currId,swapId,parentId){
			var url = "${ROOT}/swapResource.do?currId="+currId+"&swapId="+swapId+"&parentId="+parentId;
			window.location = url;
		}
	</script>
</head>
<body onmousewheel='setScrollzheight();' class="LN_body">
    <form name="form1" method="post" action="" onsubmit="" id="form1" style="margin-top: 0px">
    	<input type="hidden" name="parentResourceId" id="parentResourceId" value="${parentResource.id }"/>
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>菜单管理</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<a onclick="ev_new()" href="javascript:;">新增</a> |
						<a onclick="ev_edit()" href="javascript:;">修改</a> |
						<a onclick="ev_del()" href="#" >删除</a>
					</td>
				</tr>
  			</tbody>
  		</table>    				
        <div align="left">
        	[<font color="#CC3300">${parentResource.fullName }</font>]下的菜单列表。
        </div>    
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<th class="list-title" nowrap width="12%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></th>
				<th class="list-title" width="15%">名称</th>
				<th class="list-title" width="10%">编号</th>
				<th class="list-title" width="10%">类别</th>
				<th class="list-title" width="20%">安全业务</th>
				<th class="list-title" width="10%">权限</th>
				<th class="list-title" width="15%">URL</th>
				<th class="list-title" width="*">排序</th>
			</tr>
  <%
     	List children =new ArrayList(resourceList);
     	for(int i=0; i<resourceList.size(); i++ ){
     		Resource res = (Resource)children.get(i);
   %>
  <tr class="list-color<%=i%2==0?"1":"2" %>">
    <td class="list-text1" ><input type="checkbox" value="<%=res.getId()%>" name="selectedrow" class="checkboxInput"/></td>
    <td class="list-text1" ><a onclick="" href="javascript:ev_edit2('<%=res.getId() %>');"><%=res.getName() %></a></td> 
    <td class="list-text1" ><%=res.getCode()%></td> 
    <td class="list-text1" ><%=com.shengdai.kpi.common.dictionary.DictionaryLib.getItemName(Resource.RESOURCE_TYPE, ""+res.getType())%></td> 
    <td class="list-text1" ><%=com.shengdai.kpi.common.dictionary.DictionaryLib.getItemName(Security.BUSI_TYPE, ""+res.getSecureType())%>&nbsp;</td> 
    <td class="list-text1" ><%=com.shengdai.kpi.common.dictionary.DictionaryLib.getItemName(Security.AUTH_TYPE, ""+res.getAuthType())%></td> 
    <td class="list-text1" ><%=StringUtils.isEmpty(res.getUrl())?"&nbsp;":res.getUrl()%></td> 
    <td class="list-text1" >
    	 <table cellpadding="0" cellspacing="0" border="0"> 
            <tr> 
            	<%-- 向上的箭头，如果不是第一行 --%>
              <td> <%  if (i > 0) { 
              					Resource previous = (Resource)children.get(i-1);
              			%> 
                   <a href="javaScript:swapResource('<%=res.getId()%>','<%=previous.getId()%>','<%=parentResource.getId()%>');"
                   ><img src="${ROOT}/img/arrow_up.gif" width="13" height="9" border="0" vspace="2" hspace="2"></a> 
                     <%  } else { %> 
                    <img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"> 
                     <%  } %> 
              </td> 
              <%-- 向下的箭头，如果不是最后一行 --%>
              <td> <%  if (i<(children.size()-1)) { 
              					Resource next = (Resource)children.get(i+1);
              			%> 
                     <a href="javaScript:swapResource('<%=res.getId()%>','<%=next.getId()%>','<%=parentResource.getId()%>');"
                    ><img src="${ROOT}/img/arrow_down.gif" width="13" height="9" border="0" vspace="2" hspace="2"></a> 
                    <%  } else { %> 
                    <img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"> 
                     <%  } %> 
              </td> 
             </tr> 
          </table>
    </td> 
  </tr> 
  <%
  	}
  %>
</table>
  <kpi:page-bar formId="form1" />
	</form>
</body>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>
</html>
