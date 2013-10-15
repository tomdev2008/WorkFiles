<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合同文件变量</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbContractDocVariableController.do?save">
			<input id="id" name="id" type="hidden" value="${tbContractDocVariablePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							docvariable:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="docvariable" name="docvariable" 
							   value="${tbContractDocVariablePage.docvariable}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							docId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="docId" name="docId" ignore="ignore"
							   value="${tbContractDocVariablePage.docId}">
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
							   value="${tbContractDocVariablePage.variablename}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							内容:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="content" name="content" ignore="ignore"
							   value="${tbContractDocVariablePage.content}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>