<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="/web/pub/head.inc"%>
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.Org;"/>
<%
	//部门列表
	List orgList = (List)request.getAttribute("orgList");
%>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
    <title>部门列表</title>
    <script src="${ROOT}/web/system/dlg/msgDialog.js"></script>
     <script src="${ROOT}/js/dialog.js"></script>
	<script type="text/javascript">
	<!--
		var effectDate
		var dg;
		/**
		*新增部门
		*/
		function ev_add(parent_id){
			var url = "${ROOT}/createOrg.do?parentId="+parent_id;
			//openFullScreenWin(url);
			window.location.href = url;
		}
		
		/**
		*编辑部门信息
		*/
		function ev_edit(id){
			var url = "${ROOT}/editOrg.do?id="+id;
			//openFullScreenWin(url);
			pageShowForm(url);
		}
		
		/**
		*删除部门信息
		*/
		function ev_delete(){
			
			var ids="";
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("请至少选择一个部门!");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
				}
			}
			
			if (!hadChecked) {
				alert("请至少选择一个部门！");
				return;
			}
			
				//effectDate = window.showModalDialog("${ROOT}/tip.do?operateType=10",window,"dialogHeight:450px;dialogWidth:750px;status:no; help:no; scroll:no");
				//if(effectDate == undefined){
				//	alert("请选择冻结生效时间");
				//	return;
				//}
			ev_showDg();
		}
		function ev_showDg(){
				click_oktitle : '【系统提示信息】';
			
			    title = '<span class=MenuWhite>'+"冻结意见"+'</span>';
			    dg=new dialog("optioin");
			    dg.init();
			    dg.set('src', 6);	// smile
			    dg.set('title', "冻结意见");	
				dg.set('msgid', document.getElementById("remark").value);
				dg.paras = "remark";
				
				document.getElementById("dialogBox").style.left = '100';
				document.getElementById("dialogBox").style.top = '100';	
			    dg.event(document.getElementById("remark").value, 'ev_submit()', '1', '');
		}
		
		function ev_submit(){
			if(dg.msg==''||dg.msg.trim().length<=0){
				alert("冻结意见必须填写");
				return;
			}
			document.getElementById("remark").value = dg.msg;
			//form1.action = "${ROOT}/delOrg.do?parent_id=${parent_id}&effectDate="+effectDate;
			form1.action = "${ROOT}/delOrg.do?parent_id=${parent_id}";
			form1.submit();
		}
		
		function ev_showHistory(orgID){
			window.showModalDialog("${ROOT}/listHistory.do?id="+orgID,
									"dialogHeight:150px;dialogWidth:350px");
		}
		
		/**
		*移动组织
		*/
		function ev_moveOrg(){
			var ids="";
			var cbs = document.getElementsByName("id");
			if (cbs == undefined || cbs.length == 0) {
				alert("请至少选择一个组织!");
				return;
			}
			var hadChecked = false;
			for (var i = 0; i < cbs.length; i++) {
				if (cbs[i].checked == true) {
					hadChecked = true;
				}
			}
			
			if (!hadChecked) {
				alert("请至少选择一个组织！");
				return;
			}
			
			if(confirm("确定要移动选定的部门吗?")){
				
				getAddressList('0','1','0','orgText','orgInfo');
				var orgInfo = document.getElementById("orgInfo").value;
				
				
				var moveToOrgID = String(orgInfo).split("!@!")[2];
				
				if(moveToOrgID == undefined){
					alert("请选择调入组织");
					return;
				}
				
				effectDate = window.showModalDialog("${ROOT}/tip.do?operateType=11","","dialogHeight:450px;dialogWidth:750px;status:no; help:no; scroll:no");
				if(effectDate == undefined){
					alert("请选择调动生效时间");
					return;
				}
				var form = document.getElementById("form1");
				form1.action = "${ROOT}/moveOrg.do?orgID=${parent_id}&effectDate="+effectDate+"&moveToOrgID="+moveToOrgID;
				form1.submit();
			}
			
		}
		
		
		/**
		*跳转到冻结组织列表
		*/
		function ev_invadilOrg(){
			window.parent.location.href="${ROOT}/listInvadilOrg.do";
		}
		//批量设置上级领导
		function ev_setLeader(){
			if (SelectUtil.checkedCount("id")>0) {
				getAddressList('20','1','0','preManagerName','preManagerText');
				var value = $_EV("preManagerText")
				if(value!=""){
					form1.action = "${ROOT}/setLeaderByOrgs.do";
					form1.submit();
				}
			}else{
				alert("请至少选择一个组织！");
				return;
			}
		}
		var mzCount = 0;
		function ev_showSet(){
			mzCount++;
			var aLink = $_E("hlinkLeaderSet");
			if(aLink){
				if(aLink.style.display=='none' && mzCount==5){
					aLink.style.display='';
					mzCount = 0;
				}
			}
		}
	//-->
	</script>
 </head>
 
<body onmousewheel="setScrollzheight()" class="LN_body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>组织管理</h2></td></tr>
  <tr>
	<td class="list-caozuo"><%--
	    <a id="hlinkDelete" href="javascript:alert('根据条件查询响应结果!');">查询</a>--%>
	    <a id="hlinkAddNew" href="javascript:ev_add('${parent_id}');">新增</a>|
	    <a id="hlinkDelete" href="javascript:ev_delete();">冻结</a>|
	    <a id="hlinkDelete" href="javascript:ev_invadilOrg();">冻结组织管理</a>|
	    <a id="hlinkDelete" href="javascript:ev_moveOrg();">移动组织</a>|
	    <a id="hlinkLeaderSet" style="display:none;" href="javascript:ev_setLeader();">批量设置上级领导</a>
	</td>
   </tr>
 </table>
 
<div id='queryform' style='display:none;'>
    <table width="100%" border="0" cellpadding="4" cellspacing="1" class="listquery">
      <tr>
        <td height="30" align="center" class="t">组织名称</td>
        <td ><input name="txtGroupName" type="text" id="txtGroupName" size="30"/>
          <input name="btnQuery" type="submit" id="btnQuery" value="查询" class="button2" onclick="return queryGroup()"/>
          <input name="btnQuery" type="button" id="btnClose" value="关闭" class="button2" onclick="showQueryForm('close')"/>
        </td>
      </tr>
    </table>
</div>

<div align="left">
       [<font color="#CC3300">${parent.fullName }</font>]下的组织列表。
</div> 

<form method="post" name="form1" id="form1">
<input name="preManagerName" type="hidden" value="" />
<input name="preManagerText" type="hidden" value="" />
<input name="parent_id" type="hidden" value="${parent_id}" />
<table class="list-box" cellspacing="0" rules="all" border="0">
	<tr align="left">
		<td width="60" class="list-title" >
			<input id="selectAll"  type="checkbox"  onclick="javascript:checkAll(this.id,'id');" 
			class="checkboxInput" />序号
        </td>
        <th align="center" width="*" class="list-title" onclick="ev_showSet();">组织名称</th>
        <th align="center" width="20%" class="list-title"></th>
        <%--
        <th align="center" width="15%" class="list-title">序号</th>
	--%></tr>
<c:forEach var="o" items="${orgList}" varStatus="idx">
	<tr class="list-color${idx.index%2==0?'1':'2' }">
		<td  class="list-text1" >
			<input name="id" onclick="" type="checkbox" value="${o.id }" class="checkboxInput"/>${idx.count }</td>
		<td  class="list-text1" align="left"><a href="javascript:ev_edit('${o.id}');">${o.name}</a></td>
		<td  class="list-text1"  align="left"><a href="javascript:ev_showHistory('${o.id }');">查看历史版本</a></td>
	</tr>
</c:forEach>
</table>
<kpi:page-bar formId="form1" />	
<input type="hidden" name="remark" id="remark"/>
</form>
<input type="hidden" name="orgInfo" id="orgInfo"/>
<input type="hidden" name="orgText" id="orgText"/>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>
<kpi:UIResponse />