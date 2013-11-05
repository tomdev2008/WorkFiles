<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工调入申请列表</title>
	<script type="text/javascript">
	<!--
		
		var ids = "";
		
		function setID(cb,id){
			if(cb.checked == true){
				ids = ids + id + "@";
			}
		}
		
		function ev_doMoveInto(reqID){
			var cbs = document.getElementsByName("id");
			if(cbs != undefined || cbs.length > 0){
				for (var i = 0; i < cbs.length; i++) {
					if (cbs[i].checked == true) {
						cbs[i].checked=false;
					}
				}
			}
			if(confirm("确定要调入选择的员工吗？")){
				var effectDate = window.showModalDialog("${ROOT}/tip.do?reqID="+reqID+"&operateType=1",
										"","dialogHeight:450px;dialogWidth:750px;status:no; help:no; scroll:no");
				if(effectDate == undefined){
					alert("请选择调入生效期");
					return;
				}
				form.action = "${ROOT}/doMoveInto.do?id="+reqID+"&effectDate="+effectDate;
				pageShield();
				form.submit();
			}
		}
		
		/*
		*调入员工
		*/
		function ev_moveIn(){
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("请至少选择一个员工！");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
				}
			}
			
			if (!hadChecked) {
				alert("请至少选择一个员工！");
				return;
			}
			if(confirm("确定要调入选择的员工吗？")){
				var effectDate = window.showModalDialog("${ROOT}/tip.do",
										"","dialogHeight:450px;dialogWidth:750px;status:no; help:no; scroll:no");
				if(effectDate == undefined){
					alert("请选择调入生效期");
					return;
				}						
				form.action = "${ROOT}/doMoveInto.do?&orgId=${orgID}"+"&effectDate="+effectDate;
				pageShield();
				form.submit();
			}
			
			
			
		}
		
		
		
		/**
		*跳转到调动申请页面
		*/
		function ev_moveRequisition(){
			var url = "${ROOT}/web/system/org/user_move_req_from.jsp";
			openWindow(url,750,450);
		}
		
		/**
		*查看调动信息
		*/
		function show_detail(id){
			var url = "${ROOT}/findMoveRequisition.do?requisitionID="+id;
			openWindow(url,750,450);
		}
		
		/**
		*调入申请列表
		*/
		function ev_listMoveInto(){
			var url = "${ROOT}/listMoveRequisition.do?type=0";
			window.location.href = url;
		}
		
		/**
		*调出申请列表
		*/
		function ev_listMoveOut(){
			var url = "${ROOT}/listMoveRequisition.do";
			window.location.href = url;
		}
		
		/**
		*取消调动
		*/
		function ev_cancelMove(){
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("请至少选择一个员工！");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
				}
			}
			
			if (!hadChecked) {
				alert("请至少选择一个员工！");
				return;
			}
			var url = "${ROOT}/cancelMoveRequisition.do";
			var form = document.getElementById("form");
			form.action = url
			form.submit();
		}
		
		
		
	//-->
	</script>
 </head>
 
<body onmousewheel="setScrollzheight()" class="main-body">
<form name="form" method="post" id="form">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>${title }</h2></td></tr>
   <tr>
      <td class="list-caozuo">
      
      <c:if test="${empty type }">
      	
      	<a id="hlinkDelete" href="javascript:ev_moveRequisition();">发送调出申请</a>|
      	<a id="hlinkDelete" href="javascript:ev_cancelMove();">取消调出申请</a>|
      	<a id="hlinkDelete" href="javascript:ev_listMoveInto();">调入申请列表</a>
      </c:if>
      
      <c:if test="${type=='0' }">
      	<a id="hlinkDelete" href="javascript:ev_moveIn();">调入</a>|
      	<a id="hlinkDelete" href="javascript:ev_listMoveOut();">调出申请列表</a>
      </c:if>
      
  	  </td>
	</tr>
</table>

<table class="list-box" cellspacing="0" rules="all" border="0px">
	<tr>
	 <td width="40" class="list-title" >
           <input id="selectAll" type="checkbox"  onclick="javascript:checkAll(this.id,'id');"/>
     </td>
     <td align="center" width="15%" class="list-title">登陆名</td>
     <td align="center" width="15%" class="list-title">姓名</td>
     <td align="center" width="20%" class="list-title">申请人</td>
     <td align="center" width="25%" class="list-title">申请调动时间</td>
     <td align="center" width="*%" class="list-title">操作</td>
	</tr>
	<c:forEach var="requisition" items="${requisitionList}" varStatus="idx" >
		<tr class="list-color${idx.index%2==0?'1':'2' }">
			<td ><input id="id" name="id" onclick="setID(this,'${requisition.user.id }')" type="checkbox" value='${requisition.id }'/></td>
			<td>${requisition.user.logonId }</td>
			<td>${requisition.user.name }</td>
			<td>${requisition.proposer.name }</td>
			<td>
				<fmt:formatDate value="${requisition.applyDate }">
		  			<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
		  		</fmt:formatDate>
			</td>
			<td>
				<a href="javascript:show_detail('${requisition.id }');">查看</a>|
				
				<c:if test="${empty type }"><a id="hlinkDelete" href="${ROOT}/cancelMoveRequisition.do?id=${requisition.id  }">取消申请</a></c:if>
      			<c:if test="${type=='0' }"><a id="hlinkDelete" href="#" onclick="ev_doMoveInto('${requisition.id  }')">调入</a></c:if>
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
<kpi:UIResponse />