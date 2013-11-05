<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<title>菜单管理</title>
<script language="javascript" type="text/JavaScript">
<!--
function ev_save(flag){
	var resourceId = '${resource.id }';
	if(!CheckForm(form1))
		return;
	if(resourceId==""){
		form1.action = "${ROOT}/createResource.do?flag="+flag;
		form1.submit();
	}else{
		form1.action = "${ROOT}/updateResource.do?flag="+flag;
		form1.submit();
	}	
}
function ev_del(id){
	form1.action = "${ROOT}/deleteFunctionKey.do?resourceId=${resource.id}&id="+id+"&parentResourceId=${parentResourceId}";
	form1.submit();
}

function ev_open(id){
	openWin("${ROOT}/editFunctionKey.do?parentResourceId=${parentResourceId }&resourceId="+id,{showCenter:true,width:550,height:400});
}
var count = 0;

function ev_deleteRow(rowIndex){
	var childList = document.getElementById("childList");
	childList.deleteRow(rowIndex);
	count--;
	document.getElementById("form1").count.value = count;
}


function ev_addRow(){
	var childList = document.getElementById("childList");
	var newRow = childList.insertRow(-1);
	newRow.id = "child_"+count;
	var newCell = newRow.insertCell();
	newCell.innerHTML = "<input name=\"code" +count+ "\" value=\"\" showName=\"功能编号\" check=\"notBlank\" class=\"listinput\" required=\"true\"/>";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input name=\"name" +count+ "\" value=\"\" showName=\"功能名称\" check=\"notBlank\" class=\"listinput\" required=\"true\"/>";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input name=\"url" +count+ "\" value=\"\" size=\"40\"/>";
	newCell = newRow.insertCell();
	newCell.innerHTML = "<input type=\"button\" value=\"删除\" class=\"button2\" onclick=\"ev_deleteRow(" +count+ ");\" />";
	count++;
	document.getElementById("form1").count.value = count;
}

function ev_add() {
	openWin("${ROOT}/editFunctionKey.do?parentResourceId=${resource.id}",{showCenter:true,width:550,height:400});
}
//-->
</script>
</head>
<body class="LN_body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>${titleName}</h2></td></tr>
  <tr><td class="list-caozuo">红星（<font color="red">*</font>）是必填</td></tr>
</table>
	<form id="form1" name="form1" method="post" action="">
	  <input type="hidden" name="logLevelId" value="1"/>
	  <input type="hidden" name="parentResourceId" value="${parentResourceId }"/>
	  <input type="hidden" name="id" value="${resource.id }"/>
      <table class="formtext" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td class="t" width="30%"><font color="red">*</font>功能编号：</td>
          <td width="70%"><input name="code" value="${resource.code }" showName="功能编号" check="notBlank;isString('#',15)" class="listinput" required="true" maxlength="15"/></td>
        </tr>
        <tr>
          <td class="t"><font color="red">*</font>功能名称：</td>
          <td><input name="name" value="${resource.name }" showName="功能名称" check="notBlank" class="listinput" required="true" maxlength="100"/></td>
        </tr>
        <tr>
          <td class="t"><font color="red">*</font>安全业务类别：</td>
          <td>
          	<html:select name="resource" property="secureType">
          		<html:optionsCollection name="secureTypeList" value="value" label="key"/>
          	</html:select>
          </td>
        </tr>
        <tr>
          <td class="t"><font color="red">*</font>权限类别：</td>
          <td>
          	<html:select name="resource" property="authType">
          		<html:optionsCollection name="authTypeList" label="key" value="value"/>
          	</html:select>
          </td>
        </tr>
        <!--<tr>
          <td class="t"><font color="red">*</font>资源类别：</td>
          <td>
          	<html:select name="resource" property="type">
          		<html:optionsCollection name="resourceTypeList" label="key" value="value"/>
          	</html:select>
          </td>
        </tr>-->
        <tr>
          <td class="t">URL：</td>
          <td><textarea name="url" cols="50" rows="2" showName="URL" check="isString('#',250)"  required="nullable">${resource.url }</textarea></td>
        </tr>
       <!-- 
        <tr >
        	<td colspan=2><input type="button" value="添加可控制"  class="button4" onclick="ev_addRow();"  /></td>
      	</tr>
      	
      	<tr><td colspan=2>
      		<table class="list-box" cellspacing="0" cellpadding="0" border="0">
      			 <tr>
	              <td class="list-title" style="width:10%" nowrap>功能编号</td>
	              <td class="list-title" style="width:30%">功能名称</td>
	              <td class="list-title" style="width:50%">URL</td>
	              <td class="list-title" style="width:10%">操作</td>
            	</tr>
            	<tbody id="childList">
            		<c:forEach var="child" items="${resource.childResourceSet }" varStatus="idx">
            		 <tr id="chile_${idx.index }">
            		 	<td>
            		 		<input name="code${idx.index }" value="${child.code }" showName="功能编号" check="notBlank" class="listinput" required="true"/>
            		 	</td>
            		 	<td>
            		 		<input name="name${idx.index }" value="${child.name }" showName="功能名称" check="notBlank" class="listinput" required="true"/>
            		 	</td>
            		 	<td>
            		 		<input name="url${idx.index }" value="${child.url }" size="40"/>
            		 	</td>
            		 	<td>
            		 		<input type="button" value="删除" class="button2" onclick="ev_deleteRow(${idx.index });" />
            		 	</td>
            		 </tr>
            		</c:forEach>
            	</tbody>
      		</table>
      	</td></tr>
	-->
	
		<tr>
			<td colspan="2" ><input type="button" value="添加功能点" onclick="ev_add()" class="button4"/></td> 
		</tr>
		<tr><td colspan=2>
      		<table class="list-box" cellspacing="0" cellpadding="0" border="0">
      			 <tr>
	              <td class="list-title" style="width:15%" nowrap="nowrap">功能编号</td>
	              <td class="list-title" style="width:25%">功能名称</td>
	              <td class="list-title" style="width:40%">URL</td>
	              <td class="list-title" style="width:20%">操作</td>
            	</tr>
            	<tbody id="childList">
            		<c:forEach var="child" items="${functionKeyList }" varStatus="idx">
            		 <tr id="chile_${idx.index }">
            		 	<td>
            		 		${child.code }
            		 	</td>
            		 	<td>
            		 		${child.name }
            		 	</td>
            		 	<td>
            		 		${child.url }
            		 	</td>
            		 	<td>
            		 		<input type="button" value="编辑" class="button2" onclick="ev_open('${child.id}');" />
            		 		<input type="button" value="删除" class="button2" onclick="ev_del('${child.id}');" />
            		 	</td>
            		 </tr>
            		</c:forEach>
            	</tbody>
      		</table>
      		</td>
      	</tr>
	 </table>
	 <div class="buttonbox">
	  	<%--<input type="hidden" name="count" value="${empty resource.childResourceSet ?0:(fn:length(resource.childResourceSet ))}" />
    	--%><input type="button" value="保 存" class="button2" onclick="ev_save(0)"/>
    	<input type="button" value="保存后关闭" class="button4" onclick="ev_save(1)"/>
      </div>
	</form>
</body>
</html:html>
<kpi:UIResponse />