<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@ include file="/web/pub/head.inc"%>
		<title>字典列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script>
/**
 * 打开一个字典查看页面
 * @param id 字典编号
 */
function ev_openForm(id) {
	var winHeight = 300;
	var winWidth = 750;
	window.open('${ROOT}/viewDictionary.do?did=' + id, '', 'menubar=no,toolbar=no,location=no,status=no,resizable=no,height='+winHeight+', width='+winWidth+',top='+(screen.height-winHeight)/2+',left='+(screen.width-winWidth)/2+',scrollbars=yes');
}

/**
 * 批量删除字典
 */
function ev_del() {
	var cbs = document.getElementsByName("did");
	if (cbs == undefined || cbs.length == 0) {
		alert("没有数据需要删除！");
		return false;
	}
	var hadChecked = false;
	for (var i = 0; i < cbs.length; i++) {
		if (cbs[i].checked == true) {
			hadChecked = true;
			break;
		}
	}
	if (!hadChecked) {
		alert("请至少选择一个字典来进行删除操作！");
		return false;
	}
	if (confirm("确定删除选定的字典？")) {
		var fm = document.getElementById("form1");
		fm.action = "${ROOT}/batchDeleteDictionary.do";
		fm.submit();
	}
}

/**
 * 批量修改序号
 */
function orderDic() {
	if (isOrderBeenChanged == 0) {
		alert("表格中的所有字典的序号都没有被修改过，不需要提交保存");
		return false;
	}
	var fm = document.getElementById("form1");
	fm.action = "${ROOT}/changeDictionaryOrder.do";
	if (CheckForm(fm)) {
		fm.submit();
	}
}
var isOrderBeenChanged = 0;  //序号修改标识，0：无修改；非0：已修改
/**
 * 标识序号已经修改过，可以提交
 */
function changeOrder() {
	isOrderBeenChanged = 1;
}

window.onload = function() {
	setPHeight();
}
</script>

	</head>
	<body onmousewheel="setScrollzheight()" class="LN_body">
		<form name="form1" method="post"  id="form1" style="margin-top: 0px" onsubmit="return CheckForm(this)">
			<table cellspacing="0" cellpadding="0" border="0" class="list-top">
	        	<tbody>
	        		<tr>
	        			<td>
	        				<h2>字典浏览</h2>
	        			</td>
	        		</tr>
	        		<tr>  
						<td class="list-caozuo">
							<a href="${ROOT}/viewDictionary.do">新增</a>|
							<a href="#" onclick="ev_del();return false;">删除</a>|
							<a href="#" onclick="orderDic();return false;" title="修改下面表单中的序号，然后点击这里进行保存">修改序号</a>
						</td>
					</tr>
	  			</tbody>
	  		</table>    
			<table class="list-box" cellspacing="0" border="0">
				<tr>
					<td nowrap class="list-title" width="8%">
						全选<input type="checkbox" id="checkAllHandler" class="checkboxInput"  onclick="SelectAllCheckboxes(this,'did');" />
					</td>
					<td  class="list-title" width="5%" nowrap>序号</td>
					<td  class="list-title" width="20%">字典编码</td>
					<td  class="list-title" width="20%">字典名称</td>
					<td class="list-title">备注</td>
				</tr>
				<c:forEach var="o" items="${list}" varStatus="idx">
				<tr class="list-color${idx.index%2==0?'1':'2'}">
					<td class="list-text1"><input type="checkbox" name="did" class="checkboxInput" value="${o.id}"/></td>
					<td class="list-text1">
					    <input type="hidden" name="dictionaryId${o.id}" value="${o.id}" />
					    <input type="text" name="priority${o.id}" value="${o.priority}" size="3" title="修改后，点击“修改序号”保存修改结果。可批量修改。" onchange="changeOrder();" check="isInt('')" required="nullable" showName="字典序号" />
					</td>
					<td class="list-text1"><a href="${ROOT}/viewDictionary.do?did=${o.id}" title="点击进行修改">${o.code}</a></td>
					<td class="list-text1"><a href="${ROOT}/viewDictionary.do?did=${o.id}" title="点击进行修改">${o.name}</a></td>
					<td class="list-text1" style="word-break:break-all">${fn:replace(o.remark, " ", "&nbsp;")}&nbsp;</td>
				  </tr>
				</c:forEach>
			</table>
		  			
		</form>
<form method="get" id="fmPage">
		<kpi:page-bar formId="fmPage" />
</form>
	</body>
</html>
