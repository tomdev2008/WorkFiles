<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
    <title>失效组织列表</title>
    <script src="${ROOT}/web/system/dlg/msgDialog.js"></script>
    <script src="${ROOT}/js/dialog.js"></script>
	<script type="text/javascript">
	<!--
		var ShowMsgo=new ShowMsg();
		ShowMsgo.msgobjname="ShowMsgo";
		ShowMsgo.ok_callback=function(value){};
		
		function ev_resumeOrg(){
			var ids="";
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("请至少选择一个员工!");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
					ids = ids+cbs[i].value+ "@";
				}
			}
			
			if (!hadChecked) {
				alert("请至少选择一个组织！");
				return;
			}
			
			if(confirm("确定要恢复选择的组织吗？")){
				 click_oktitle : '【系统提示信息】';
			
			    title = '<span class=MenuWhite>'+"恢复意见"+'</span>';
			    dg=new dialog("optioin");
			    dg.init();
			    dg.set('src', 6);
			    dg.set('title', "恢复意见");	
				dg.set('msgid', document.getElementById("remark").value);
				dg.set('readonly', "");
				dg.paras = "remark";
				
			    dg.event(document.getElementById("remark").value, 'ev_submit()', '', '');   
			}
			
		}
		
		function ev_submit(){
			if(dg.msg==''||dg.msg.trim().length<=0){
				alert("恢复意见必须填写");
				return;
			}
			document.getElementById("remark").value = dg.msg;
			form.action = "${ROOT}/resumeOrg.do";
			form.submit();
		}
		
		function ev_back(){
			window.location.href = "${ROOT}/web/system/org/org_frame.jsp";
		}
	//-->
	</script>
 </head>
 
<body onmousewheel="setScrollzheight()" class="LN_body">

<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>失效组织管理</h2></td></tr>
   <tr>
     <td class="list-caozuo">
		<a id="hlinkDelete" href="javascript:ev_resumeOrg();">恢复</a>|
		<a id="hlinkDelete" href="javascript:window.location.href='${ROOT }/web/system/org/invadil_org_reportform.jsp';">冻结情况报表</a>|
		<a id="hlinkDelete" href="javascript:ev_back();">返回组织列表</a>
	</td>
	</tr>
</table>

<form name="form" method="post" id="form">
	  <table class="list-box" cellspacing="0" rules="all" border="0px">
		<tr>
		 <td width="40" class="list-title" >
            <input id="selectAll" type="checkbox"  onclick="javascript:checkAll(this.id,'id');"/>
         </td>
          <td align="center" width="6%" class="list-title">序号</td>
          <td align="center" width="10%" class="list-title">组织名称</td>
          <td align="center" width="*" class="list-title">上级组织</td>
          <td align="center" width="15%" class="list-title">冻结时间</td>
          <td align="center" width="12%" class="list-title">冻结操作人</td>
          <td align="center" width="8%" class="list-title">操作</td>
		</tr>
		<c:forEach var="invadilOrg" items="${orgList}" varStatus="idx" >
		<tr class="list-color${idx.index%2==0?'1':'2' }">
			  <td class="list-text1">
			  	<input id="id" name="id" onclick="" type="checkbox" value='${invadilOrg.id }'/>
			  </td>
			  <td class="list-text1" align="left">${idx.count }</td>
			  <td class="list-text1" align="left">${invadilOrg.name }</td>
			  <td class="list-text1" align="left">${invadilOrg.org.fullName }</td>
			  <td class="list-text1" align="left">
			  	<fmt:formatDate value="${invadilOrg.lastModifyDate }">
		  			<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
		  		</fmt:formatDate>
			  </td>
			  <td class="list-text1" align="left">${invadilOrg.lastModifierName }</td>
			  <td class="list-text1" align="left">
			  	<a href="javascript:_show_msg_ok('冻结意见','${invadilOrg.remark }','readonly','false');">查看冻结意见</a>
			  </td>
		  </tr>
        </c:forEach>
	</table>
<kpi:page-bar formId="form" />
<input type="hidden" name="remark" id="remark"/>
</form>
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>