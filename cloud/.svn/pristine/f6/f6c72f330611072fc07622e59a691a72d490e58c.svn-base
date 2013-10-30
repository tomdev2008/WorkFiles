<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>报价表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbQuotationsController.do?save" >
			<input id="id" name="id" type="hidden" value="${tbQuotationsPage.id }">
			<table style="width: 400px;" cellpadding="0" cellspacing="1" class="formtable">
				
			
				<tr>
					<td align="right">
						<label class="Validform_label">
							报价表名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="title" name="title" datatype="*"
							   value="${tbQuotationsPage.title}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				
			</table>
		</t:formvalid>
 </body>
 
 
 