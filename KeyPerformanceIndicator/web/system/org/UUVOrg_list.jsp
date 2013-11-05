<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="/web/pub/head.inc"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>UUV组织同步列表</title>
	<script type="text/javascript">
	<!--
		
		function ev_sync(syncInfo,parentID,actionType){
			var effectDate 
			var title;
			if(actionType=='ADD'){//新增
				title = "调入起始考核期";
				effectDate = window.showModalDialog("${ROOT}/web/system/org/calendar.jsp?title="+title,
									"dialogHeight:50px;dialogWidth:150px");
			}
			
			if(actionType=='MOD'){//更新
				title = "更新起始考核期";
				effectDate = window.showModalDialog("${ROOT}/web/system/org/calendar.jsp?title="+title,
									"dialogHeight:50px;dialogWidth:150px");
			}
			
			if(actionType=='DEL'){//删除
				title = "调出终止考核期";
				effectDate = window.showModalDialog("${ROOT}/web/system/org/calendar.jsp?title="+title,
									"dialogHeight:50px;dialogWidth:150px");
			}
			
			
			if(effectDate == undefined){
				alert("请选择"+title);
				return;
			}
			
			if(confirm("确定要同步选择的数据吗？")){
				form.action = "${ROOT}/syncOrg.do?syncInfo="+syncInfo+"&parentID="+parentID+
								"&effectDate="+effectDate;
				form.submit();
			}
		}
	
	
		//批量同步数据
		function ev_batchSync(){
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("没有数据需要同步！");
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
				alert("请至少选择一条数据进行同步！");
				return;
			}
			if(confirm("确定要同步选择的数据吗？")){
				var form = document.getElementById("form");
				form.action = "${ROOT}/syncOrg.do";
				pageShield();
				form.submit();
			}
		}
	//-->
	</script>
 </head>
 
<body onmousewheel="setScrollzheight()" class="main-body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>UUV组织同步列表</h2></td></tr><%--
  <tr>
	<td class="list-caozuo">
		<a href="javascript:ev_batchSync();">批量同步</a>
	</td>
   </tr>
 --%></table>
 

<form method="post" name="form" id="form">
<div align="left">
       [<font color="#CC3300">${org.fullName }</font>]下的组织同步列表。
</div> 
<input type="hidden" name="parentID" value="${org.id }" />
<table class="list-box" cellspacing="0" rules="all" border="0">
	<tr align="left">
		<td width="40" class="list-title" >
			<%--<input id="selectAll"  type="checkbox"  onclick="javascript:checkAll(this.id,'id');" 
			class="checkboxInput" />
			
        --%>序号</td>
        <th align="center" width="20%" class="list-title">组织名称</th>
        <th align="center" width="*" class="list-title">上级组织</th>
        <th align="center" width="25%" class="list-title">同步时间</th>
        <th align="center" width="15%" class="list-title">操作</th>
   </tr>
<c:forEach var="uuvOrg" items="${uuvOrgList }" varStatus="idx">
	<tr class="list-text${idx.index%2==0?'1':'2' }">
		<td >
			<%--<input id="id" name="syncInfo" onclick="" type="checkbox" value='${uuvOrg.syncInfo }'/>
		--%>${idx.count }</td>
		<td >
			${uuvOrg.name }	
		</td>
		<td >
			${uuvOrg.parentName }	
		</td>
		<td align="center">
			<fmt:formatDate value="${uuvOrg.modifyDate }">
		  	<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
		  </fmt:formatDate>
		</td>
		<td align="center">
			<c:if test="${uuvOrg.actionType=='ADD' }">
				<a href="javascript:ev_sync('${uuvOrg.syncInfo }','${org.id }','ADD');">新增</a>
			</c:if>
			<c:if test="${uuvOrg.actionType=='MOD' }">
				<a href="javascript:ev_sync('${uuvOrg.syncInfo }','${org.id }','MOD');">更新</a>
			</c:if>
			<c:if test="${uuvOrg.actionType=='DEL' }">
				<a href="javascript:ev_sync('${uuvOrg.syncInfo }','${org.id }','DEL');">删除</a>
			</c:if>
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
	window.onload=function(){setPHeight();}
//-->
</script>
<kpi:UIResponse/>