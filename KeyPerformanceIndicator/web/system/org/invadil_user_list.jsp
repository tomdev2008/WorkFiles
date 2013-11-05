<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
    <title>失效用户列表</title>
    <script src="${ROOT}/web/system/dlg/msgDialog.js"></script>
    <script src="${ROOT}/js/dialog.js"></script>
	<script type="text/javascript">
	<!--
		var dg;
		function ev_resumeUser(){
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
				alert("请至少选择一个员工！");
				return;
			}
			
			if(confirm("确定要恢复选择的员工吗？")){
			    click_oktitle : '【系统提示信息】';
			
			    title = '<span class=MenuWhite>'+"恢复意见"+'</span>';
			    dg=new dialog("optioin");
			    dg.init();
			    dg.set('src', 6);	// smile
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
			form.action = "${ROOT}/resumeUser.do";
			form.submit();
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
		
		/**
		*查询
		*/
		function ev_doQuery(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/queryUser.do?flgActive=0";
			form.submit();
			
		}
		
		function ev_back(){
			window.location.href = "${ROOT}/web/system/org/user_frame.jsp";
		}
		
	//-->
	</script>
 </head>
 
<body onmousewheel="setScrollzheight()" class="LN_body">

<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>冻结员工管理</h2></td></tr>
   <tr>
     <td class="list-caozuo">
		<a id="hlinkDelete" href="javascript:ev_resumeUser();">恢复</a>|
		<a id="hlinkDelete" href="javascript:ev_openForm('open');">查询</a>|
		<!-- <a id="hlinkDelete" href="javascript:window.location.href='${ROOT }/web/system/org/invadil_user_reportform.jsp';">冻结情况报表</a> -->
		<a id="hlinkDelete" href="javascript:ev_back();">返回员工列表</a>
	</td>
	</tr>
</table>

<form name="form" method="post" id="form">
 
 <div id="queryform" style="display:none;">
    <table class="listquery" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td  width="30%"  class="t">登录帐号</td>
        <td ><input name="logonId" type="text"  size="30" value="${logonId }"/></td>
      </tr>
      
      <tr>
        <td width="30%" class="t">员工编号</td>
        <td ><input name="mss" type="text"  size="30" value="${mss }"/></td>
      </tr>
      
      <tr>
        <td  width="30%" class="t">姓名</td>
        <td ><input name="name" type="text"  size="30" value="${name }"/></td>
      </tr>
      </table>
 <div align="center">     
          <input name="btnQuery" type="submit" value="查询" class="button2" onclick="ev_doQuery()"/>
          <input name="btnQuery" type="button"  value="关闭" class="button2" onclick="ev_openForm('close')"/>
		
 </div>
 </div>
 
	  <table class="list-box" cellspacing="0" rules="all" border="0px">
		<tr>
		 <td  width="40" class="list-title" >
            <input id="selectAll" type="checkbox"  onclick="javascript:checkAll(this.id,'id');"/>
         </td>
         <td align="center" width="6%" class="list-title">序号</td>
          <td align="center" width="10%" class="list-title">登陆名</td>
          <td align="center" width="10%" class="list-title">姓名</td>
          <td align="center" width="*%" class="list-title">部门</td>
          <td align="center" width="15%" class="list-title">冻结时间</td>
          <td align="center" width="12%" class="list-title">冻结操作人</td>
          <td align="center" width="8%" class="list-title">操作</td>
		</tr>
		<c:forEach var="invadilUser" items="${userList}" varStatus="idx" >
		<tr class="list-color${idx.index%2==0?'1':'2' }">
			  <td class="list-text1"  align="left">

			  	<input id="id" name="id" onclick="" type="checkbox" value='${invadilUser.id }'/>

			  </td>
			  <td class="list-text1" align="left">${idx.count }</td>
			  <td class="list-text1" align="left">${invadilUser.logonId }</td>
			  <td class="list-text1" align="left">${invadilUser.name }</td>
			  <td class="list-text1" align="left">${invadilUser.org.fullName }</td>
			  <td class="list-text1"  align="left">
			  	<fmt:formatDate value="${invadilUser.effectOUTDATE }">
		  			<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
		  		</fmt:formatDate>
			  </td>
			  <td class="list-text1" align="left">${invadilUser.modifierName }</td>
			  <td class="list-text1" align="left">
			  	<a href="javascript:_show_msg_ok('冻结意见','${invadilUser.remark }','readonly','false');">查看冻结意见</a><%--|
			  	<a href="${ROOT}/resumeUser.do?id=${invadilUser.id }">恢复</a>
			  --%></td>
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
	window.onload=function (){setPHeight3();}
//-->
</script>