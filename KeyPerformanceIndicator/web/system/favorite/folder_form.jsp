<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonFolder"/>
<html>
<%@ include file="/web/pub/head.inc"%> 
<%
	String parentId = ParamUtils.getDefaultStringValue(request,"parentId","");
%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>部门信息</title>
	<script type="text/javascript" src="${ROOT}/web/system/dlg/select.js"></script>

	<script type="text/javascript">
	<!--
	function storeCaret (textEl) 
	{
		if (textEl.createTextRange)
		textEl.caretPos = document.selection.createRange().duplicate();
	} 

		function ev_save(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/savePersonFolder.do";
			if(CheckForm(form)){
				pageShield();
				form.submit();
			}	
		}
	
		/**
		*返回列表
		*/
		function ev_back(){
		
		      parent.document.getElementById("divList").style.width="79%";
	          parent.document.getElementById("divForm").style.width="0";
		    <%
		       if(parentId!=null&&parentId.trim().length()>0)
		       {
		       %>
		      		var url = "${ROOT}/listPersonFolder.do?id=<%=parentId%>";
		      		parent.document.getElementById("fbody").src=url;
		      <%
		       }
		       else
		       {
		       %>
		             var url = "${ROOT}/listPersonFolder.do";
		      		parent.document.getElementById("fbody").src=url;
		       <%
		       }
		    %>
             parent.document.getElementById("fform").src="about:blank";
		  //   pageShowList('${ROOT}/listPersonFolder.do?id='+targetTypeID);
		//	pageBack2List();
		}
		
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="main-body" >
<form method="post" name="form" id="form">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>目录信息</h2></td></tr>
  <Tr><td class="list-caozuo">
  	<a id="hlinkAddNew" href="javascript:ev_save();">保存</a>|
  	<a id="hlinkAddNew" href="javascript:ev_back();">返回</a>
  </td></Tr>
</table>
    <table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td align="right" class="t" width = "30%"><font color="red">*</font>名称</td>
        <td width="*" colspan="3">
        <input name="id" type="hidden" value="${folder.id }"/>
        <input name="parentId" type="hidden" value="${param.parentId}"/>
        <input name="name" type="text" class="editline" value="${folder.name }"  check="lengthNotMoreThan(100);notBlank()" required="true" />
        </td>
      </tr>
	  <tr>
        <td class="t" align="right" width = "30%">备注</td>
        <td width="*" colspan="3">
        <textarea cols="60" rows="4" class="textarea1"  name="remark" ONSELECT="storeCaret(this);" onCLICK="storeCaret(this);" onKEYUP="storeCaret(this);"  check="isString('#',500)" required="nullable"    required="true">${folder.remark}</textarea>
        </td>
      </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight();}
//-->
</script>
<kpi:UIResponse />