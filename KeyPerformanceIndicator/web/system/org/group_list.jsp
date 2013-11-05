<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>群组管理</title>
	<script type="text/javascript">
	<!--
		/**
		*新增
		*/
		function ev_add(orgId){
			var url = "${ROOT}/createGroup.do?orgId="+orgId;
			pageShowForm(url);
		}
		
		/**
		*编辑信息
		*/
		function ev_edit(id){
			var url = "${ROOT}/editGroup.do?id="+id;
			pageShowForm(url);
		}
		
		/**
		*删除信息
		*/
		function ev_delete(orgId){
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
				alert("请至少选择一个群组来进行删除操作！");
				return;
			}
			if(confirm("确定要删除选定的群组吗?")){
				var form = document.getElementById("form");
				form.action = "${ROOT}/delGroup.do?orgId="+orgId;
				form.submit();
			}
		}
	//-->
	</script>
 </head>

<body onLoad="setPHeight()" onmousewheel="setScrollzheight()" class="main-body">
<form name="form" method="post">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
      <td><h2>群组管理</h2></td>
    </tr>
	<tr>
		<td class="list-caozuo">
		    <a href="javascript:ev_add('${org.id }');" disabled="disabled">新增</a>|
		    <a href="javascript:ev_delete('${org.id }');">删除</a>
		</td>
	</tr>
</table>

<div align="left">
       [<font color="#CC3300">${org.fullName }</font>]下的群组列表。
</div> 


	  <table class="list-box" cellspacing="0" rules="all"  border="0" >
		<tr>
		  <td width="40" class="list-title">
            <input id="selectAll"  type="checkbox"  onclick="javascript:checkAll(this.id,'id');" 
			class="checkboxInput" /></td>
       
          <th align="center" width="35%" class="list-title">名称</th>
          <th align="center" width="*" class="list-title">类型</th>
          <th align="center" width="15%" class="list-title">操作</th>
		</tr>
		<c:forEach var="group" items="${groupList}" varStatus="idx" >
		<tr class="list-color${idx.index%2==0?'1':'2' }">
		  <td align="left" class="list-text1" >
		  		<input name="id" onClick="" type="checkbox" value="${group.id }" class="checkboxInput" /></td>
		  <td class="list-text1" >
		  		<a href="javascript:ev_edit('${group.id }');">${group.name }</a>
		  </td>
		  <td class="list-text1" >
		  		<c:choose>
		  			<c:when test="${group.groupType==1 }">
		  				考核群组
		  			</c:when>
		  			<c:when test="${group.groupType==2 }">
		  				等级群组
		  			</c:when>
		  		</c:choose>
		  </td>
		  <td class="list-text1" >
		  		<a href="${ROOT}/getDetails.do?id=${group.id  }">查看群组成员</a>
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