<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>数据源</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  
<script type="text/javascript">
//上传完关闭窗口
  function openrcon() {
	  frameElement.api.opener.tip('上传完毕');
	  frameElement.api.opener.reloadTable();
	  frameElement.api.close();
	 }
</script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table">
			<input id="id" name="id" type="hidden" value="${tbDataSourceEntityPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							数据源名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="sourcename" name="sourcename" 
							   value="${tbDataSourceEntityPage.sourcename}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							分类:
						</label>
					</td>
					<td class="value">
					<select id="typeId" name="typeId" >
					       <c:forEach items="${typeList}" var="temp">
					        <option value="${temp.id }">
					         ${temp.sourcetypename}
					        </option>
					       </c:forEach>
				      	</select>
						
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							描述:
						</label>
					</td>
					<td class="value">
						<textarea style="width:60%;" id="description" name="description"  datatype="*" ignore="ignore">${tbDataSourceEntityPage.description}</textarea>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
				<td align="right">
						<label class="Validform_label">
							上传文件:
						</label>
					</td>
				<td class="value">
				<div class="form" id="filediv"></div>
				 <t:upload name="fiels"  view="true" auto="false" buttonText="上传文件" callback="openrcon" dialog="false" uploader="tbDataSourceEntityController.do?uploadDataRecord" extend="*.xlsx" id="files" formData="sourcename,typeId,description">
				</t:upload>
	     			<span class="Validform_checktip">请选择.xlsx结尾的文件</span>
	     		</td>
	     		</tr>
					
			</table>
		</t:formvalid>
 </body>