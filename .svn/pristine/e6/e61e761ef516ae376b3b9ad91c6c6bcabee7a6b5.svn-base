<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>部门表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbDepartController.do?save">
			<input id="id" name="id" type="hidden" value="${tbDepartPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							部门名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="permName" name="permName" ignore="ignore"
							   value="${tbDepartPage.permName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							职责:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="duty" name="duty" ignore="ignore"
							   value="${tbDepartPage.duty}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							上级部门:
						</label>
					</td>
					<td class="value">
							<select id="deptId.id"  name="deptId.id"  datatype="*">
					       <c:forEach items="${departList}" var="depart">
					        <option value="${depart.id }"  <%-- <c:if test="${depart.id==tbOrdersPage.channelId.id}">selected="selected"</c:if> --%>>
					         ${depart.permName}
					        </option>
					       </c:forEach>
				      	</select>
						<%-- <input class="inputxt" id="channel" name="channel" 
							   value="${tbOrdersPage.channel}" datatype="*"> --%>
						<span class="Validform_checktip">请选择部门</span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>