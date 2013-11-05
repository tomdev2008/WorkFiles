<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>指标类型</title>
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/JavaScript">
<!--
function ev_save(flgClose){
	var fm = $_E('form1');
	if(CheckForm(fm)){
		fm.close_window.value = flgClose;
		fm.submit();
	}
}

function ev_back(){
	window.document.location.href = "${ROOT}/listIndicatorType.do?parentId=${parentType.id}";
}
//-->
</script>
</head>
<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/saveIndicatorType.do" id="form1">	
<input type="hidden" name="id" value="${indicatorType.id}"/>
<input type="hidden" name="parentId" value="${parentType.id}"/>
<input type="hidden" name="close_window" value="0"/>
<input type="hidden" name="resflush_parent" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${indicatorType==null?'新增':'编辑' }指标类型</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
      <tr>
        <td width="15%" class="LN_tableBoxtitle">类型代码</td>
        <td width="90%" class="LN_tableBoxText">
        <input type="text" name="code" value="${indicatorType.code }" check="notBlank;isString('#',10)" required='true' showName='类型代码'/>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">类型名称</td>
        <td width="90%" class="LN_tableBoxText">
       	<input type="text" name="name" value="${indicatorType.name}" check="notBlank;isString('#',50)" required='true' showName='类型名称'/>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">上级类型</td>
        <td width="90%" class="LN_tableBoxText">${parentType.name}
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">是否固化类型</td>
        <td width="90%" class="LN_tableBoxText">
        <c:choose>
        	<c:when test="${indicatorType.isFixed==1}">
        	<input type="radio" name="isFixed" value="1" checked/>是
        	<input type="radio" name="isFixed" value="0" />否
        	</c:when>
			<c:otherwise>
			<input type="radio" name="isFixed" value="1" />是
        	<input type="radio" name="isFixed" value="0" checked/>否
			</c:otherwise>        	
        </c:choose>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">排序号</td>
        <td width="90%" class="LN_tableBoxText">
        <input type="text" name="priority" id="priority" style="width:80px;" 
        check="notBlank;isInt()" required='true' showName='排序号' class="LN_InputBorder" value="${indicatorType==null?10:indicatorType.priority}"/>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">说明</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="description" id="description" cols="40" rows="5">${indicatorType.description}</textarea>
		</td>
      </tr>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>