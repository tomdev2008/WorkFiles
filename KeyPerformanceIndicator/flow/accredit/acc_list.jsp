<%-- 整理 zyf 2008-1-14 --%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Accredit"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/flow.inc" %>

<html>
  <head>  
    <title>考核授权</title>
<style type="text/css">
.selectedMenuStytle {
	border-top-style: groove;
	border-right-style: groove;
	border-bottom-style: groove;
	border-left-style: groove;
	color: #0099FF;
}
</style>

<script language="javascript">

function changeAccreditType(){
	var url = "${ROOT}/listAccredits.do?accreditType="+form1.accreditType.value;
	window.location.href = url;
}
function ev_add(){
	view_form("${ROOT}/viewAccredit.do?");
}
function ev_del() {
	var number = 0;
	for (var i=0;i<form1.elements.length;i++){
		var e = form1.elements[i];						
		if(e.name == "accreditId"){
			if(e.checked)
				number = number + 1;
		}							
	}
	if(number == 0){
		alert("请选择要删除的记录");
		return false;
	}
	if(confirm("确定删除所选的记录吗？")){
		document.form1.action="${ROOT}/delAccredit.do?accreditType="+form1.accreditType.value;
		document.form1.submit();
	}	
}
function listAccreditUndo(accreditId){
	var url = "${ROOT}/listAccreditUndo.do?accreditId="+accreditId;
	window.location = url;
}
window.onload=function (){
	setPHeight();
}	
 </script>
</head>
<html:base target="_self"/>
<body onmousewheel='setScrollzheight();'>
    <form name="form1" method="post" style="margin-top: 0px">
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>考核授权</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<a onclick="ev_add();return false;" href="#">新增</a>
						<c:if test="${accreditType=='1' }">
						 | <a onclick="ev_del();return false;" href="#" >删除</a>
						</c:if>
						<!-- <a onclick="ev_log();return false;" href="#" >授权日志</a> -->
					</td>
				</tr>
  			</tbody>
  		</table>    	
  		<table class="listquery" cellpadding="0" cellspacing="1">
	      <tr>
	        <td width="12%" class="t">授权类型</td>
	        <td>
	          <select id="accreditType" name="accreditType" onchange="changeAccreditType()" >
				<option value="<%=Accredit.ACCREDIT_TYPE_FROM_ME %>">我的授权</option>
				<option value="<%=Accredit.ACCREDIT_TYPE_FROM_OTHER %>">别人给我的授权</option>
			  </select>
			  <script>
			  	var accreditType = document.getElementById("accreditType");
			  	for(var i =0;i<accreditType.options.length;i++){
			  		if(accreditType.options[i].value==${accreditType}){
			  			accreditType.options[i].selected = true;
			  			break;
			  		}
			  	}
			  </script>
	         </td>
	       </tr>
	    </table>	<br />			
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="15%">业务类型</td>
				<td class="list-title" width="10%">授权人</td>
				<td class="list-title" width="10%" >被授权人</td>
				<td class="list-title" width="10%" >状 态</td>
				<td class="list-title" width="15%" >开始时间</td>
				<td class="list-title" width="15%" >结束时间</td>				
			</tr>
		<logic:iterate id="a" name="accreditList" indexId="idx">
			<tr class="list-color${idx%2==0?'2':'1'}" >
<%--			<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>--%>
				<td class="list-text1" align="center">
					&nbsp;<input type="checkbox" name="accreditId" value="${a.id }"/>
				</td>
				<td class="list-text1">
					<c:if test="${accreditType=='1' }">
					<a href="javascript: view_form('${ROOT}/viewAccredit.do?accreditId=${a.id }');">
						${a.busiName }
					</a>
					</c:if>
					<c:if test="${accreditType!='1' }">
					${a.busiName }
					</c:if>
				</td>
				<td class="list-text1">${a.grantorName}</td>
				<td class="list-text1">
				<c:if test="${accreditType=='1' }">
				<a href="javascript:listAccreditUndo('${a.id }');">
				${a.acceptorName}
				</a>
				</c:if>
				<c:if test="${accreditType!='1' }">
				${a.acceptorName}
				</c:if>
				</td>
				<td class="list-text1">
					${a.availability }
				</td>
				<td class="list-text1"><bean:write name="a" property="startDate" format="yyyy-MM-dd HH:mm"/></td>
				<td class="list-text1"><bean:write name="a" property="endDate" format="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</logic:iterate>
		</table>
		<kpi:page-bar formId="form1" />
	</form>
</body>
</html>


