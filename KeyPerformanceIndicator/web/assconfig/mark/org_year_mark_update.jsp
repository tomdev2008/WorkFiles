<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<%@ page import="java.util.*" %>
<% String batch=request.getParameter("batch");
	String batchId = request.getParameter("batchId");
	String id=request.getParameter("id");
	String orgId=request.getParameter("orgId"); 
	String orgName=request.getParameter("orgName");%>
<html>
<head>
	<title>年度考核分数配置－修改部门分数</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/GDCCS.css" rel="stylesheet" type="text/css" />	

	<script src="${ROOT}/web/system/dlg/msgDialog.js"></script>
     <script src="${ROOT}/js/dialog.js"></script>
	<script language="javascript" type="text/JavaScript">
		var batchId = "";
		
		function refreshFatherWin(){
		 	window.opener.refresh() = window.opener.refresh();
		 	window.close();
		}
		function setOrgId(){
			var o = document.getElementById("orgId");
			ss = o.value;
			o.value = ss.substring(ss.lastIndexOf("!@!")+3);
		}
		
		function  ev_save(){
			if(CheckForm(form1)){
				//batchId = document.getElementById("batchId").value;
				//batch = document.getElementById("batch").value;
				document.form1.action="${ROOT}/updateAssessMark.do";
				document.form1.submit();	
			}
		}

		function stringTrim(obj){
			obj.value = obj.value.trim();
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="">
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">

 </div>
</div>
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
      	<tr>	
      		<td width="100%" class="LN_tableBoxtitle2"><div align="center">批次（周期）<%=batch %></div></td>
         </tr>
      </table>
      
<div align="left"><font color="red">红色*号为必填项</font></div>
    <table  width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">

       <tr>
        <td class="t" width="100"><font color="red">*</font>部门</td>
        <td width="*" colspan="3">
        	
	        <textarea name="orgName" check="notBlank" showName="部门" required="true" value="${assessMark.orgName}" readonly="readonly" rows="3" cols="50" >${assessMark.orgName}</textarea>
	    </td>
      </tr>
      <tr>
        <td class="t" width="100"><font color="red">*</font>分数</td>
        <td width="*" colspan="3">
        <textarea name="mark" rows="3" cols="50" class="area" value="${assessMark.mark }" required="true" showName="分数" check="notBlank;isFloat();" onblur="stringTrim(this);" onpropertychange="if(value.length>10) value=value.substr(0,10)">${assessMark.mark }</textarea>&nbsp;</td>
      </tr>
            <tr>
        <td class="t" width="100">备注</td>
        <td width="*" colspan="3">
        <textarea name="remark" rows="3" cols="50" class="area" value="${assessMark.remark }" check="isString('#',500);" onpropertychange="if(value.length>500) value=value.substr(0,500)">${assessMark.remark }</textarea>&nbsp;</td>
      </tr>
    </table>
    <br />
      	<input type="button" href="#" onclick="window.close()" class="button" value="关闭"/>&nbsp;&nbsp;&nbsp;
  		<input type="button" href="#" onclick="ev_save()" class="button" value="保存"/>
		<input type="hidden" name="orgId" id="orgId" value="${assessMark.orgId }"/>
		<input type="hidden" name="id" id="id" value="${assessMark.id }"/>
		<input type="hidden" name="batchId" value="<%=batchId %>" id="batchId"/>
	</form>
	</body>
</html>
