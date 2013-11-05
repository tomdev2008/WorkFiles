<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<title>系统公告管理</title>
<script src="${ROOT}/js/kpiCalendar.js"></script>
<script type="text/javascript">
<!--
		function ev_add(){
			var form = document.getElementById("form");
			form.action="${ROOT}/createComment.do";
			form.submit();
		}
		
		function ev_edit(id){
			var form = $_E("form");
			form.action="${ROOT}/editComment.do?id="+id;
			form.submit();
		}
		
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
				alert("请至少选择一条公告来进行删除操作！");
				return;
			}
			if(confirm("确定要删除选定的公告吗?")){
				document.form.action = "${ROOT}/deleteComment.do";
				document.form.submit();
			}
		}
//-->
</script>
</head>
<body onmousewheel="setScrollzheight()" class="LN_body">
<form id="form" name="form" method="post" action="">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
    <td><h2>系统公告管理</h2></td>
  </tr>	
  <tr>
	<td class="list-caozuo">
		<a id="hlinkAddNew" href="javascript:ev_add();">新增</a>|
		<a id="hlinkAddNew" href="javascript:ev_delete();">删除</a>
  	</td>
  </tr>
</table>


	  <table class="list-box" cellspacing="0" rules="all"  border="0" width="95%" >
		<tr align="left">
		<td width="40" class="list-title">
			<input type="checkbox" id="selectAll" onclick="javascript:checkAll(this.id,'id');"  class="checkboxInput"/>
		</td>
          <th align="center" width="*" class="list-title">标题</th>
          <th align="center" width="15%" class="list-title">起始时间</th>
          <th align="center" width="15%" class="list-title">结束时间</th>
          <th align="center" width="10%" class="list-title">创建人</th>
          <th align="center" width="15%" class="list-title">创建时间</th>
		</tr>
		<c:forEach var="comment" items="${commnetList }" varStatus="idx">
		<tr class="list-color${idx.index%2==0?'1':'2' }">
		  <td class="list-text1" align="center"><input name="id" type="checkbox" value="${comment.id }" class="checkboxInput"/></td>
		  <td class="list-text1" align="left">
		  	<a href="javascript:ev_edit('${comment.id }');">${comment.title }</a>
		  </td>
		  <td class="list-text1" align="left">
			  <fmt:formatDate value="${comment.beginDate }">
			  	<jsp:attribute name="pattern">yyyy-MM-dd</jsp:attribute>
			  </fmt:formatDate> 
		  </td>
		  <td class="list-text1" align="left">
		  	  <fmt:formatDate value="${comment.endDate }">
			  	<jsp:attribute name="pattern">yyyy-MM-dd</jsp:attribute>
			  </fmt:formatDate> 
		 </td>
		  <td class="list-text1" align="center">${comment.creatorName }</td>
		  <td class="list-text1" align="center">
		  <fmt:formatDate value="${comment.createDate }">
		  	<jsp:attribute name="pattern">yyyy-MM-dd</jsp:attribute>
		  </fmt:formatDate>
		  
		  </td>
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