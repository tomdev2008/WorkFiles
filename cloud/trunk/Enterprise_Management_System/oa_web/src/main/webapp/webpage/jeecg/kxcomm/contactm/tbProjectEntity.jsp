<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>项目</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  //判断是新增还是修改
  function checkAddOrUpdate()
  {
	  var endid = '${tbProjectEntityPage.id}';
		if(null != endid && "" != endid) {
			var cus = '${tbProjectEntityPage.customer.id}';
			$("#customer").val(cus);
		}
  }
  </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbProjectEntityController.do?save">
			<input id="id" name="id" type="hidden" value="${tbProjectEntityPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
			<tr>
					<td align="right">
						<label class="Validform_label">
							项目名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="projectName" name="projectName" datatype="s1-20"
							   value="${tbProjectEntityPage.projectName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
					<tr>
					<td align="right">
						<label class="Validform_label">
							客户名称:
						</label>
					</td>
					<td class="value">
						<select id="customer"  name="customer.id" >
					       <c:forEach items="${tbCustomerList}" var="customer">
					        <option value="${customer.id}" >
					         ${customer.companyName}
					        </option>
					       </c:forEach>
				      	</select>
				      	<span class="Validform_checktip">请选择文件类型</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							描述:
						</label>
					</td>
					<td class="value">
					<textarea style="width:60%;" id="description" name="description"  datatype="s0-50">${tbProjectEntityPage.description}</textarea>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>
   <script type="text/javascript">
 checkAddOrUpdate();
 </script>