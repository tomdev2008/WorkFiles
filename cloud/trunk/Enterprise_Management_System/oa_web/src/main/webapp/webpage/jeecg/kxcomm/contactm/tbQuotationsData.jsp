<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>报价总表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbQuotationsDataController.do?save">
			<input id="id" name="id" type="hidden" value="${tbQuotationsDataPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							name:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" ignore="ignore"
							   value="${tbQuotationsDataPage.name}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							ordered:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="ordered" name="ordered" ignore="ignore"
							   value="${tbQuotationsDataPage.ordered}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							projectName:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="projectName" name="projectName" ignore="ignore"
							   value="${tbQuotationsDataPage.projectName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							quantity:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="quantity" name="quantity" ignore="ignore"
							   value="${tbQuotationsDataPage.quantity}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							toUsed:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="toUsed" name="toUsed" ignore="ignore"
							   value="${tbQuotationsDataPage.toUsed}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							quotationsId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="quotationsId" name="quotationsId" ignore="ignore"
							   value="${tbQuotationsDataPage.quotationsId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							configModelsId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="configModelsId" name="configModelsId" ignore="ignore"
							   value="${tbQuotationsDataPage.configModelsId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>