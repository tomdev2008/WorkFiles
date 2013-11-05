<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%> 
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonFolder"/>
<html>
<html:base target="_self"/>

<%
	String parentId = ParamUtils.getDefaultStringValue(request,"parentId","");
	String showType = ParamUtils.getDefaultStringValue(request,"showType","");
%>




<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title> 新增目录
	</title>

	<script type="text/javascript" src="${ROOT}/web/system/dlg/select.js"></script>

	<script type="text/javascript">
	<!--
	var callFlag = "false";
	function callback(){
	callFlag = Trim(this.request.responseText);
	}
	function storeCaret (textEl) 
	{
		if (textEl.createTextRange)
		textEl.caretPos = document.selection.createRange().duplicate();
	} 

		function ev_save(){

		 // alert(dialogArguments.window.document.frames("ftree"));
		  if(CheckForm(form)){
			   var url = "${ROOT}/createPersonFolder2.do?remark="+encodeURI(form.remark.value)+"&name="+encodeURI(form.name.value)+"&parentId="+form.parentId.value+"&id="+form.id.value;
	//alert(url);
    			LoadAjaxContentSyn(url,callback); 
    //alert(callFlag);
    			window.returnValue =callFlag;
    			window.close();
			}	
		}
	
		/**
		*返回列表
		*/
		function ev_back(){
		     window.returnValue ="";
		     window.close();
		}
		
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="main-body" style="background-color:#eff0f4">
<form method="post" name="form">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td align="left">&nbsp; <h5>新建目录</h5></td></tr>
  
</table>
    <table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td align="right" class="t" width = "18%"><font color="red">*</font>名称</td>
        <td width="*" colspan="3" style="background-color:#F7F9FC" >
        <input name="id" type="hidden" value="${folder.id }"/>
        <input name="parentId" type="hidden" value="${parentId}"/>
        <input name="name" type="text" class="editline" value="${folder.name}"  check="lengthNotMoreThan(100);notBlank()" size="36" required="true" />
        </td>
      </tr>
	  <tr>
        <td class="t" align="right" width = "18%">备注</td>
        <td width="*" colspan="3" style="background-color:#F7F9FC">
        <textarea cols="30" rows="4" class="textarea1"  name="remark" ONSELECT="storeCaret(this);" onCLICK="storeCaret(this);" onKEYUP="storeCaret(this);"   check="isString('#',500)" required="nullable" required="true">${folder.remark}</textarea>
        </td>
      </tr>
    </table>
    <br>
    <table border="0" cellpadding="0" cellspacing="0" >
     <tr>
     <td align="center">
      <div>
		   <input name="Submit1" type="button" id="Submit1" class="dialog-button2" value="保 存" onClick="ev_save();"/>
		   <input name="Submit2" type="button" id="Submit2" class="dialog-button2" value="关 闭" onClick="ev_back();"/>
	  </div>
	   </td>
     </tr>
    </table>
</form>
</body>
</html>
<kpi:UIResponse />
