<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合同文件</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbContractDocController.do?save">
			<input id="id" name="id" type="hidden" value="${tbContractDocPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							docId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="docId" name="docId" 
							   value="${tbContractDocPage.docId}" datatype="*">
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
							   value="${tbContractDocPage.templatesdocId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							创建时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="createtime" name="createtime" ignore="ignore"
							   value="<fmt:formatDate value='${tbContractDocPage.createtime}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							exportpath:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="exportpath" name="exportpath" ignore="ignore"
							   value="${tbContractDocPage.exportpath}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							filename:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="filename" name="filename" ignore="ignore"
							   value="${tbContractDocPage.filename}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>