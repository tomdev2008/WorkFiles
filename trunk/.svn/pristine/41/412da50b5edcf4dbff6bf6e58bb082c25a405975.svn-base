<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>数据源</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbDataSourceEntityController.do?save">
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
				<td colspan="2">
				<t:upload name="fiels" buttonText="上传文件" dialog="false" callback="openrcon"  uploader="tbCheckingInstanceController.do?importExcel" extend="*.xlsx" id="default" ></t:upload>
	     			<span class="Validform_checktip">请选择.xlsx结尾的文件</span>
	     		</td>
	     		</tr>
					
			</table>
		</t:formvalid>
 </body>