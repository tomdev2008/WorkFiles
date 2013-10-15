<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合同模板文件</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbContractTemplatesDocController.do?save">
			<input id="id" name="id" type="hidden" value="${tbContractTemplatesDocPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							文件名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="docname" name="docname" ignore="ignore"
							   value="${tbContractTemplatesDocPage.docname}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							文件类型:
						</label>
					</td>
					<td class="value">
						<select id="parentOrgen"  name="parentOrgen" >
					       <c:forEach items="${docTyleList}" var="docType">
					        <option value="${docType.id }" >
					         ${docType.typename}
					        </option>
					       </c:forEach>
				      	</select>
				      	<span class="Validform_checktip">请选择文件类型</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							是否设置变量:
						</label>
					</td>
					<td class="value">
						<select id="bvariable"  name="bvariable"  datatype="*">
					        <option value="0">否</option>
					        <option value="1">是</option>
				      	</select>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>