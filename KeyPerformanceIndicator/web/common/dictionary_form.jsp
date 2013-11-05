<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@ include file="../pub/head.inc"%>
		<title>字典${dictionary==null?'新增':'修改'}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script>
<c:set var="dictionaryItemsLength" value="${fn:length(dictionary.items)}" />
var itemCount = ${empty dictionary.items?0:dictionaryItemsLength};
function addRow() {
	var itemList = document.getElementById("itemList");
	//var itemListRowCount = itemList.rows.length;
	var newRow = itemList.insertRow(-1);
	newRow.id = "dictionaryItem" + itemCount;
	var newCell = newRow.insertCell();
	newCell.innerHTML = "<input type=\"text\" name=\"priority" + itemCount + "\" value=\""+(getMaxDictionaryItemPriority()+1)+"\" size=\"5\" check=\"isInt('')\" required=\"nullable\" showName=\"字典项序号\" />";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input type=\"text\" name=\"value" + itemCount + "\" value=\"\" check=\"notBlank();isString('#', 50)\" required=\"true\" showName=\"字典项代码值\" />";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input type=\"text\" name=\"name" + itemCount + "\" value=\"\" check=\"notBlank();isString('#', 50)\" required=\"true\" showName=\"字典项代码名称\" />";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<select name=\"flgDefault" + itemCount + "\">"
              	+ "<option value=\"0\">&nbsp;&nbsp;&nbsp;否&nbsp;</option>"
                + "<option value=\"1\">&nbsp;&nbsp;&nbsp;是&nbsp;</option>"
              + "</select>";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input type=\"text\" name=\"remark" + itemCount + "\" value=\"\" check=\"isString(0,50);\"  required=\"nullable\" showName=\"字典备注\" />";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input type=\"button\" value=\"删除\" class=\"button2\" onclick=\"deleteRow('" + newRow.id + "');\" />";
	itemCount++;
	document.getElementById("form1").itemCount.value = itemCount;
	
}
function deleteRow(rowId) {
	var clickObj = document.getElementById(rowId);
	var itemList = document.getElementById("itemList");
	itemList.deleteRow(clickObj.rowIndex - 1);
	itemCount--;
	document.getElementById("form1").itemCount.value = itemCount;
}

/**
 * 保存字典
 * @param formId 表单id
 * @param closeFlag 窗口是否返回标识，0：保存（不退出）；1：保存并关闭（退出）
 */
function submitForm(formId) {
	var fm = document.getElementById(formId);
	if (fm.onsubmit()) {
		fm.submit();
		return false;
	}
}

/**
 * 获取当前页面字典项最大序号
 * 可用作字典项新增时，默认序号
 */
function getMaxDictionaryItemPriority() {
	var maxPriority = 0;
	var fm = document.getElementById("form1");
	for (var i = 0; i < fm.length; i++) {
		var input = fm[i];
		if (input.name != null && input.name != undefined 
		    && input.name.search(/^priority.+$/) != -1 && input.value != undefined
		    && input.value != "") {
			try {
				var thePriority = parseInt(input.value, 10);
				if (thePriority > maxPriority) {
					maxPriority = thePriority;
				}
			} catch (e){}
		}
	}
	return maxPriority;
}

window.onload = function() {
	setPHeight();
}
</script>
	</head>
	<body onmousewheel="setScrollzheight()" class="LN_body">
	<table cellspacing="0" cellpadding="0" border="0" class="list-top">
	        	<tbody>
	        		<tr>
	        			<td>
	        				<h2>字典${dictionary==null?'新增':'修改'}</h2>
	        			</td>
	        		</tr>
	        		<tr>  
						<td class="list-caozuo">
							<a onclick="submitForm('form1');return false;" href="#">保存</a>|
							<a href="${header.referer}">退出</a>
						</td>
					</tr>
	  			</tbody>
	  		</table>    
	<form id="form1" name="form1" method="post" action="${ROOT}/saveDictionary.do" onsubmit="return CheckForm(this)">
      <div class="infortop">红星（<font color="red">*</font>）是必填</div>
      <table class="formtext" border="0" cellpadding="0" cellspacing="1" style="width:98%">
        <tr>
          <td class="t"><font color="red">*</font>字典编码：</td>
          <td><input name="code" type="text" id="code" value="${dictionary.code}" check="notBlank;isString('#', 50)" required="true" showName="字典编码" /></td>
          <td class="t"><font color="red">*</font>字典名称：</td>
          <td><input name="name" type="text" id="name" value="${dictionary.name}" check="notBlank;isString('#', 50)" required="true" showName="字典编码" /></td>
        </tr>
        <tr>
          <td class="t">序号：</td>
          <td colspan="3">
          <input name="priority" type="text" id="priority" size="3" value="${dictionary.priority}" check="isInt('')" required="nullable" showName="字典序号" />
          </td>
        </tr>
        <tr>
          <td class="t">备注：</td>
          <td colspan="3">
            <textarea name="remark" id="remark" cols="45" rows="5" check="isString(0,500);"  required="nullable" showName="字典备注">${dictionary.remark}</textarea></td>
        </tr>
        <tr>
          <td colspan="4"><input type="button" value="添加字典" class="button4" onclick="addRow();setPHeight();"  /> </td>
        </tr>
        
        <tr>
          <td colspan="4"><table class="list-box" cellspacing="0" cellpadding="0" border="0">
            <tr>
              <td class="list-title" style="width:10%" nowrap>序号</td>
              <td class="list-title" style="width:20%">代码值</td>
              <td class="list-title" style="width:20%">代码名称</td>
              <td class="list-title" style="width:1%" nowrap>默认选择</td>
              <td class="list-title" style="width:30%">备注</td>
              <td class="list-title" style="width:10%">操作</td>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${dictionary.items}" varStatus="idx">
            <tr id="dictionaryItem${idx.index}">
              <td><input type="text" name="priority${idx.index}" value="${o.priority}" size="5" check="isInt('')" required="nullable" showName="字典项序号" /></td>
              <td><input type="text" name="value${idx.index}" value="${o.value}" check="notBlank();isString('#', 50)" required="true" showName="字典项代码值" /></td>
              <td><input type="text" name="name${idx.index}" value="${o.name}" check="notBlank();isString('#', 50)" required="true" showName="字典项代码名称" /></td>
              <td>
              <select name="flgDefault${idx.index}">
              	<option value="0" ${o.flgDefault==0?'selected':''}>&nbsp;&nbsp;&nbsp;否&nbsp;</option>
                <option value="1" ${o.flgDefault==1?'selected':''}>&nbsp;&nbsp;&nbsp;是&nbsp;</option>
              </select>
              </td>
              <td><input type="text" name="remark${idx.index}" value="${o.remark}" /></td>
              <td><input type="button" value="删除" class="button2" onclick="deleteRow('dictionaryItem${idx.index}');" /></td>
            </tr>
            </c:forEach>
            </tbody>
          </table></td>
        </tr>
        <tr>
          <td colspan="4"><input type="button" value="添加字典" class="button4" onclick="addRow();setPHeight();"  /> </td>
        </tr>
      </table>
      <input type="hidden" name="did" value="${dictionary.id}" />
      <input type="hidden" name="itemCount" value="${empty dictionary.items?0:dictionaryItemsLength}" />
      <input type="hidden" name="returnUrl" value="${returnUrl}" />
	</form>
	</body>
</html>
