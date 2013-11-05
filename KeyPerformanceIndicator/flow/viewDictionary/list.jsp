<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html:html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
<script>
function ev_new(){
	openWin("${ROOT}/showViewDictionary.do?",{showCenter:true,width:750,height:450});
}
function ev_del(id) {
	var number = 0;
	for (var i=0;i<form1.elements.length;i++){
		var e = form1.elements[i];						
		if(e.name == "id"){
			if(e.checked)
				number = number + 1;
		}							
	}
	if(number == 0){
		alert("请选择要删除的记录");
		return false;
	}
	if(confirm("确定删除所选的记录吗？")){
		document.form1.action="${ROOT}/delViewDictionary.do";
		document.form1.submit();
	}	
}
function changeBusi(){
	var url = "${ROOT}/listViewDictionary.do?busi="+form1.busi.value;
	//alert(url);
	window.location.href = url;
}
function ev_edit2(id) {
	openWin("${ROOT}/showViewDictionary.do?id="+id,{showCenter:true,width:750,height:450});
}
function ev_edit() {
	var number = 0;
	var checkVal ;
	for (var i=0;i<form1.elements.length;i++){
		var e = form1.elements[i];						
		if(e.name == "id"){
			if(e.checked){
				number = number + 1;
				checkVal = e.value;	
			}
		}							
	}
	if(number == 0){
		alert("请选择要修改的记录");
		return false;
	}else if(number>1){
		alert("请只选择一条要修改的记录");
		return false;
	}
	ev_edit2(checkVal);
}
			
</script>
</head>
<body onmousewheel='setScrollzheight();' class="LN_body">
    <form name="form1" method="post" style="margin-top: 0px">
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>视图管理</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<a href="javascript:ev_new();">新增</a> |
<%--						<!--a href="javascript:ev_edit();">修改</a--> |--%>
						<a onclick="ev_del();return false;" href="#">删除</a>
					</td>
				</tr>
  			</tbody>
  		</table>  
	    <table class="listquery" cellpadding="0" cellspacing="1">
	      <tr>
	        <td width="12%" class="t">业务类型</td>
	        <td>
	          <html:select name="viewDictionary" property="busi" onchange="changeBusi()">
				<html:option value="">所有</html:option>
			    <html:optionsCollection name="busiList" label="busiName" value="id" />
			  </html:select>
	         </td>
	       </tr>
	    </table>				
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="16%">名称</td>
				<td class="list-title" width="10%">业务类型</td>
				<td class="list-title" width="10%">处理方式</td>
				<td class="list-title" width="18%">待办URL</td>
<%--				<td class="list-title" width="18%">查阅URL</td>--%>
<%--				<td class="list-title" width="14%">已办URL</td>--%>
				<td class="list-title" width="6%">序号</td>
			</tr>
		<c:forEach var="vd" items="${viewDictionaryList}" varStatus="idx">
			<tr class="list-color${idx.index%2==0?'1':'2'}">
				<td class="list-text1" >
				<input type="checkbox" value="${vd.id}" name="id" class="checkboxInput"/>${idx.count}</td>
				<td class="list-text1" ><a title="${vd.remark }" onclick="" href="javascript:ev_edit2('${vd.id }');">${vd.name }</a></td>
				<td class="list-text1" >${vd.busi }</td>
				<td class="list-text1" >${vd.ways }</td>
				<td class="list-text1" >${vd.viewUrl }</td>
<%--				<td class="list-text1" >${vd.spreadUrl }</td>--%>
<%--				<td class="list-text1" >${vd.doneUrl }</td>--%>
				<td class="list-text1" >${vd.priority }</td>
			</tr>
		</c:forEach>			
		</table>
		<kpi:page-bar formId="form1" />
	</form>
	
</body>
<script>
window.onload=function (){
	setPHeight3();
}	
</script>
</html:html>
