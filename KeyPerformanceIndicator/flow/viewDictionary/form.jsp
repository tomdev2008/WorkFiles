<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
<title>视图管理</title>
<script language="javascript" type="text/JavaScript">
<!--
function ev_save(flag){
	if(!CheckForm(form1))
		return;
	var handleTypeway = document.getElementsByName("handleTypeway");
	var ways = form1.ways;
	ways.value = "";
	var count = 0;
	for(var i=0;i<handleTypeway.length;i++){//组装处理方式的字串
		if(handleTypeway[i].checked){
			if(count == 0){
				ways.value = handleTypeway[i].value;
				count++;
			}else{
				ways.value += "," + handleTypeway[i].value;
			}
		}
	}
	if(ways.value == ""){
		alert("请选择处理方式!");
		return ;
	}
	form1.action = "${ROOT}/saveViewDictionary.do?flag="+flag;
	form1.submit();
}
function initFunction(){
	var ways = form1.ways.value;
	if(ways!=null&&ways!=""){
		var way = ways.split(",");
		var handleTypeway = document.getElementsByName("handleTypeway");
		for(var i=0;i<handleTypeway.length;i++){
			for(var j=0;j<way.length;j++){
				if(handleTypeway[i].value==way[j]){
					handleTypeway[i].checked = true;
					break;	
				}
			}
		}
	}
}
window.onload = function (){
	initFunction();
}
//-->
</script>
</head>
<body class="LN_body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>
  	<c:if test="${viewDictionary.id==null }">新增视图</c:if>
  	<c:if test="${viewDictionary.id!=null }">修改视图</c:if>
  </h2></td></tr>
  <tr><td class="list-caozuo">红星（<font color="red">*</font>）是必填</td></tr>
</table>
	<form id="form1" name="form1" method="post" action="">
	  <input type="hidden" name="id" value="${viewDictionary.id }"/>
	  <input type="hidden" name="ways" value="${viewDictionary.ways }"/>
      <table class="formtext" border="0" cellpadding="0" cellspacing="1" style="width:98%">
        <tr>
          <td class="t" width="20%"><font color="red">*</font>名称：</td>
          <td colspan="3" width="80%"><input name="name" value="${viewDictionary.name }" style="width:500px;" maxlength="50" showName="名称" check="notBlank;isString('#',100)" class="listinput" required="true"/></td>
          
        </tr>
        <tr>
          <td class="t"><font color="red">*</font>业务类型：</td>
          <td>
			<html:select name="viewDictionary" property="busi">
			  <html:optionsCollection name="busiList" label="busiName" value="id" />
			</html:select>
          </td>
          <td class="t"><font color="red">*</font>排序号：</td>
          <td><input name="priority" value="${viewDictionary.priority }" showName="排序号" check="notBlank" class="listinput" required="true"/></td>
        </tr>
		<tr>
		  <td class="t"><font color="red">*</font>处理方式：</td>
          <td colspan="3">
            <logic:iterate id="way" name="handleTypewayList">
              <input type="checkbox" name="handleTypeway" value="${way.id }"/>${way.handleWayName }
            </logic:iterate>
          </td>
        </tr>
         <tr>
          <td class="t">待办URL</td>
          <td colspan="3">
          	<textarea name="viewUrl" cols="70" rows="2" showName="待办URL" check="isString('#',250)"  required="nullable">${viewDictionary.viewUrl }</textarea>
          </td>
        </tr>
        <tr>
          <td class="t">查阅URL</td>
          <td colspan="3">
          	<textarea name="spreadUrl" cols="70" rows="2" showName="查阅URL" check="isString('#',250)"  required="nullable">${viewDictionary.spreadUrl }</textarea>
          </td>
        </tr>
        <tr>
          <td class="t">已办URL</td>
          <td colspan="3">
          	<textarea name="doneUrl" cols="70" rows="2" showName="已办URL" check="isString('#',250)"  required="nullable">${viewDictionary.doneUrl }</textarea>
          </td>
        </tr>
        <tr>
          <td class="t">表单初始化URL</td>
          <td colspan="3">
          	<textarea name="previewUrl" cols="70" rows="2" showName="表单初始化URL" check="isString('#',250)"  required="nullable">${viewDictionary.previewUrl }</textarea>
          </td>
        </tr>
        <tr>
          <td class="t">说明</td>
          <td colspan="3">
	        <textarea name="remark" cols="70" rows="2">${viewDictionary.remark }</textarea>
        </tr>
	 </table>
	 <div class="buttonbox">
	  	<input type="button" value="保 存" class="button2" onclick="ev_save(0)"/>
	  	<input type="button" value="保存后关闭" class="button4" onclick="ev_save(1)"/>
     </div>
	</form>
</body>
</html>
