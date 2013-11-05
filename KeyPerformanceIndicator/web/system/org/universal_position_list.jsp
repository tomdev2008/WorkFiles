<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
    <title>专业线条</title>
	<script type="text/javascript">
	<!--
		/**
		*新增
		*/
		function ev_add(parentId){
			var url = "${ROOT}/createUniformType.do?type=${type}&parentId="+parentId;
			//openWindow(url,750,450);
			pageShowForm(url);
		}
				
		/**
		*编辑信息
		*/
		function ev_edit(id){
			var url = "${ROOT}/editUniformType.do?id="+id;
			//openWindow(url,750,450);
			pageShowForm(url);
		}
		
		/**
		*删除信息
		*/
		function ev_delete(){
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("没有数据需要删除！");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
					break;
				}
			}
			if (!hadChecked) {
				alert("请至少选择一个通用岗位来进行删除操作！");
				return;
			}
			if(confirm("确定要删除选定的通用岗位吗?")){
				var form = document.getElementById("form");
				form.action = "${ROOT}/delUniformType.do?parent_id=${id}&type=${type}";
				form.submit();
			}
		}
		
		/**
		*打开查询表单
		*/
		function ev_openForm(param){
			var queryForm = document.getElementById("queryform");
			if(param == "close")
				queryForm.style.display = "";
			if(queryForm.style.display == "")
				queryForm.style.display = "none";
			else
				queryForm.style.display = "";
		}
		
		
		function ev_query(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/serarchUniformType.do";
			form.submit();
		}
		
	//-->
	</script>
 </head>

<body  onmousewheel="setScrollzheight()" class="LN_body">
<form name="form" method="post">
<input type="hidden" name="type" value="${type }" />
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
      <td><h2>通用岗位管理</h2></td>
    </tr>
	<tr>
		<td class="list-caozuo">
		    <a href="javascript:ev_add('${id }');">新增</a>|
		    <a href="javascript:ev_delete();">删除</a>|
		    <a id="hlinkDelete" href="javascript:ev_openForm('open');">查询</a>
		</td>
	</tr>
</table>

<div id="queryform" style="display:none">
    <table class="listquery" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td  height="30" align="center" class="t">通用岗位名称</td>
        <td >
          <input name="name" type="text"  size="30" value="${name }"/>
          <input name="btnQuery" type="button" value="查询" class="button2" onclick="ev_query()"/>
          <input name="btnQuery" type="button"  value="关闭" class="button2" onclick="ev_openForm('close')"/>
        </td>
      </tr>
    </table>
</div>

	  <table class="list-box" cellspacing="0" rules="all"  border="0" >
		<tr align="left">
		  <td width="40" class="list-title">
            <input id="selectAll"  type="checkbox"  onclick="SelectAllCheckboxes(this,'id');"
			class="checkboxInput" />
          </td>
          <td align="center" width="*" class="list-title">通用岗位名称</td>
          <td align="center" width="15%" class="list-title">序号</td>
		</tr>
		<c:forEach var="line" items="${uniformTypeList}" varStatus="idx" >
		<tr class="list-color${idx.index%2==0?'1':'2' }">
		  <td class="list-text1" align="left">
		  <input name="id" onClick="" type="checkbox" value="${line.id }" class="checkboxInput" /></td>
		  <td class="list-text1">
		  <a href="javascript:ev_edit('${line.id }');">${line.name }</a>
		  </td>
		  <td class="list-text1">
		  	${idx.count }
		  	<%--<input type="text" maxlenght="2" value="${line.priority }" size="2" class="input-textline"/>&nbsp;
			  	<c:choose>
		  		<c:when test="${idx.index!=0 }">
		  			 <a href="#" onclick="alert('上移');">
		               <img src="${ROOT}/img/arrow_up.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
		          	</a>
		  		</c:when>
		  		<c:otherwise>
		  			<img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
		  		</c:otherwise>
		  	</c:choose>
		    <c:choose>
		  		<c:when test="${idx.index<size-1}">
		  			 <a href="#" onclick="alert('上移');">
		               <img src="${ROOT}/img/arrow_down.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
		          	</a>
		  		</c:when>
		  		<c:otherwise>
		  			<img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
		  		</c:otherwise>
		  	</c:choose>
		  --%></td>
		</tr>
		</c:forEach>
	</table>
  <kpi:page-bar formId="form" />	
</form>
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>