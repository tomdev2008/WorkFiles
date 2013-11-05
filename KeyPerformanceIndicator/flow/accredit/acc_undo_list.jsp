<%@ page contentType="text/html; charset=utf-8" language="java" %>
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
function callbackAccreditUndo() {
	var number = 0;
	for (var i=0;i<form1.elements.length;i++){
		var e = form1.elements[i];						
		if(e.name == "worklistItemId"){
			if(e.checked)
				number = number + 1;
		}							
	}
	if(number == 0){
		alert("请选择要回收的记录");
		return false;
	}
	if(confirm("确定回收所选的记录吗？")){
		document.form1.action="${ROOT}/callbackAccreditUndo.do?accreditId="+form1.accreditId.value;
		document.form1.submit();
	}	
}
function listAccredits(){
	var url = "${ROOT}/listAccredits.do?";
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
    	<input type="hidden" name="accreditId" value="${accreditId }"/>
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>考核授权</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<a onclick="callbackAccreditUndo();return false;" href="#">回收</a> | 
						<a onclick="listAccredits();return false;" href="#" >返回</a>
					</td>
				</tr>
  			</tbody>
  		</table>    				
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="15%">业务类型</td>
				<td class="list-title" width="10%" >被授权人</td>
				<td class="list-title" width="52%" >任务描述</td>
				<td class="list-title" width="15%" >创建时间</td>
			</tr>
		<logic:iterate id="w" name="undoList">
			<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
				<td align="center">
					&nbsp;<input type="checkbox" name="worklistItemId" value="${w.id }"/>
				</td>
				<td align="left">
					${w.busiTypeZH }
				</td>
				<td align="left">${w.srcHandlerName}</td>
				<td align="left">
					${w.worklistItemTitle }
				</td>
				<td align="left"><bean:write name="w" property="genDate" format="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</logic:iterate>
		</table>
		<kpi:page-bar formId="form1" />
	</form>
</body>
</html>


