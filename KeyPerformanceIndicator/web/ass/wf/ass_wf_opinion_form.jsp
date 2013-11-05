<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>意见说明</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var index = "${param.index}";
	var isUndo = "${param.isUndo}";
	function ev_submit(){
		if(isUndo && isUndo=='true'){
			var form = $_E('form1');
			if(CheckForm(form)){
				var arg = window.dialogArguments;
				var returnV = $_E("remark").value;
				arg.document.getElementById("remark"+index).value = returnV;
				arg.document.getElementById("remarkA"+index).title = returnV;
				if(returnV.trim().length>1500){
					returnV = returnV.substr(0,1500)+"...";
				}else if(returnV.trim().length==0){
					returnV = "添加说明";
				}
				arg.document.getElementById("remarkA"+index).innerHTML = returnV;
			}else{
				return false;
			}
			window.returnValue = "ok";
		}
		window.close();
	}
	

</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/saveAssessmentGdcnByGrade.do">	
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<c:if test="${param.isUndo=='true'}">
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">意见说明</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <textarea name="remark" id="remark" cols="40" rows="20"
        check="isString('#',500)" required='nullable' showName='意见说明' style="width:430px; font-size:12px;"></textarea>
    </td>
  </tr>
</table>
</div>
</div></form>
<script type="text/javascript">
	window.onload = function(){
		try{
			if(index){
				var arg = window.dialogArguments;
				$_E("remark").value = arg.document.getElementById("remark"+index).value;
			}
		}catch(e){}
	}
</script>
</body>
</html>


