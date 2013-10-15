<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合同模板文件变量</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbContractTemplatesDocVariableController.do?save">
			<input id="id" name="id" type="hidden" value="${tbContractTemplatesDocVariablePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							templatesDocVariableId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="templatesDocVariableId" name="templatesDocVariableId" 
							   value="${tbContractTemplatesDocVariablePage.templatesDocVariableId}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							templatesdocId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="templatesdocId" name="templatesdocId" ignore="ignore"
							   value="${tbContractTemplatesDocVariablePage.templatesdocId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							变量名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="variablename" name="variablename" ignore="ignore"
							   value="${tbContractTemplatesDocVariablePage.variablename}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							描述:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="description" name="description" ignore="ignore"
							   value="${tbContractTemplatesDocVariablePage.description}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>