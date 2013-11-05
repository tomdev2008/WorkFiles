<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<title>添加功能点</title>

<script type="text/JavaScript" language="javascript">
function ev_save(flag){
	var resourceId = '${resource.id }';
	if(!CheckForm(form1))
		return;
	if(resourceId==""){
		form1.action = "${ROOT}/createFunctionKey.do?flag="+flag;
		form1.submit();
	}else{
		form1.action = "${ROOT}/updateFunctionKey.do?flag="+flag;
		form1.submit();
	}	
}
</script>
</head>
<body class="LN_body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>添加功能点</h2></td></tr>
  <tr><td class="list-caozuo">红星（<font color="red">*</font>）是必填</td></tr>
</table>
	<form id="form1" name="form1" method="post" action="">
	  <input type="hidden" name="logLevelId" value="1"/>
	  <input type="hidden" name="parentResourceId" value="${parentResourceId }"/>
	  <input type="hidden" name="id" value="${resource.id }"/>
      <table class="formtext" border="0" cellpadding="0" cellspacing="1">
        <tr >
          <td class="t" width="30%"><font color="red">*</font>功能编号：</td>
          <td  ><input name="code" value="${resource.code }" showName="功能编号" check="notBlank;isString('#',15)" class="listinput" required="true" maxlength="15"/></td>
        </tr>
        <tr>
          <td class="t"><font color="red">*</font>功能名称：</td>
          <td><input name="name" value="${resource.name }" showName="功能名称" check="notBlank" class="listinput" required="true" maxlength="100"/></td>
        </tr>
        <%--
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
        --%>
        <tr>
          <td class="t">URL：</td>
          <td><textarea name="url" cols="35" rows="2" showName="URL" check="isString('#',250)"  required="nullable">${resource.url }</textarea></td>
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