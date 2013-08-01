<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>考情数据导入</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
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
			<label class="Validform_label">开始时间：</label>
			<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="startTime" name="startTime" ignore="ignore" type="date" pattern="yyyy-MM-dd"/>
			<span class="Validform_checktip">请选择开始时间</span>
	    </div>
	    <div class="form">
	       <label class="Validform_label">结束时间：</label>
			<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="endTime" name="endTime" ignore="ignore" type="date" pattern="yyyy-MM-dd"/>
			<span class="Validform_checktip">请选择结束时间</span>
	    </div>
	    <div class="form" id="filediv">
	    </div>
	    <div class="form">
	     	<t:upload name="fiels" buttonText="上传文件" dialog="false" callback="openrcon"  uploader="tbCheckingInstanceController.do?importExcel" extend="*.xls" id="default" formData="startTime,endTime"></t:upload>
	    </div>
	   </fieldset>
	  </t:formvalid>
 </body>
</html>

 
 