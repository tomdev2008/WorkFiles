<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonFolder"/>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonData"/>
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
			form.action = "${ROOT}/savePersonData.do";
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
		      		var url = "${ROOT}/listFolderData.do?id=<%=parentId%>";
		      		parent.document.getElementById("fbody").src=url;
		      <%
		       }
		       else
		       {
		       %>
		             var url = "${ROOT}/listFolderData.do";
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
<input name="parentId" type="hidden" id="parentId" value="${param.parentId}"/>
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>数据信息</h2></td></tr>
  <Tr><td class="list-caozuo">
  	<a id="hlinkAddNew" href="javascript:ev_save();">保存</a>|
  	<a id="hlinkAddNew" href="javascript:ev_back();">返回</a>
  </td></Tr>
</table>
    <table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td align="right" class="t" width = "30%"><font color="red">*</font>名称</td>
        <td width="*" colspan="3">

        
        <input name="id" type="hidden" value="${data.id }"/>
        <input type="hidden" name="dataInfo" value="${dataInfo}"  />
        <input name="dataName" type="text"  class="editline" readonly="readonly" value="${data.name }" check="notBlank()" required="true" />&nbsp;
		<a href="#" onclick="getAddressList('0;10;20','1','1','dataName','dataInfo');" class="choose">选择</a> 
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