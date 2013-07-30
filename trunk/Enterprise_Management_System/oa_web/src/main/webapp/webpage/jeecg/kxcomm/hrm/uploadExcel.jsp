<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>考情数据导入</title>
  <t:base type="jquery,easyui,tools"></t:base>
  <SCRIPT type="text/javascript">
	 function openrcon() {
	  	tip('上传完毕');
	 }
	</SCRIPT>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <div style="margin:10px 0;"></div>  
	<t:formvalid formid="formobj" layout="div" dialog="true">
	   <input name="iconId" type="hidden" value="${icon.iconId}">
	   <fieldset class="step">
	    <div class="form">
	      <label class="Validform_label">时间：</label>
    	 	<select id="year"  name="year"  datatype="*">
		       <c:forEach items="${yearlist}" var="year">
		        <option value="${year}">
		         ${year}年
		        </option>
		       </c:forEach>
	      	</select>
	      	<select id="month"  name="month"  datatype="*">
		       <c:forEach items="${monthlist}" var="month">
		        <option value="${month}">
		         ${month}月
		        </option>
		       </c:forEach>
	      	</select>
			<span class="Validform_checktip">请选择年/月</span>
	    </div>
	    <div class="form" id="filediv">
	    </div>
	    <div class="form">
	     	<t:upload name="fiels" buttonText="上传文件" dialog="false" callback="openrcon"  uploader="tbCheckingInstanceController.do?importExcel" extend="*.xls" id="default" formData="year,month"></t:upload>
	    </div>
	   </fieldset>
	  </t:formvalid>
 </body>
</html>

 
 