<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>岗位表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbPostController.do?save">
			<input id="id" name="id" type="hidden" value="${tbPostPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							部门id:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="deptId" name="deptId" ignore="ignore"
							   value="${tbPostPage.deptId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							岗位名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="postName" name="postName" ignore="ignore"
							   value="${tbPostPage.postName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							岗位职责:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="postDuty" name="postDuty" ignore="ignore"
							   value="${tbPostPage.postDuty}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>