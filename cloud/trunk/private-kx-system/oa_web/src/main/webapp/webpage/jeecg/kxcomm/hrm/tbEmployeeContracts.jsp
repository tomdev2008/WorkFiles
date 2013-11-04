<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>员工合同表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <script type="text/javascript">
//获得点击的行的数据
	function wantSelectRowData() {
		var ids = "";
		var rows = $("#tbEmplooyList").datagrid("getSelections");
		if(0 >= rows.length) {
			alert("请选择一个员工");
			return false;
		}
		for(var i=0;i<rows.length;i++){
			ids += rows[i].id+",";
		}
		ids = ids.substring(0,ids.length-1);
		$("#empId").val(ids);
	}
//判断是新增还是修改
	function checkAddOrUpdate() {
 		var endid = '${tbEmployeeContractsPage.id}';
 		if(null != endid && "" != endid) {
 			var empconstatus = '${tbEmployeeContractsPage.status}';
 			$("#status").val(empconstatus);
			var rowsd = $("#tbEmplooyList").datagrid("getRows");
			var deids = '${tbEmployeeContractsPage.empId.id}'+"";
			for(var i = 0; i < rowsd.length; i++) {
				if(rowsd[i].id == deids+"") {
					$("#tbEmplooyList").datagrid("selectRow",i);
				}
			}
 		}
 	} 
 </script>
 <body style="overflow-y: hidden" scroll="no">
 <div id="theemploeTabel" style="width: 600px;height: 200px;">
	 <t:datagrid name="tbEmplooyList"  actionUrl="tbEmployeeContractsController.do?empdatagrid" idField="id" fit="true" pagination="false" onLoadSuccess="checkAddOrUpdate();">
	   <t:dgCol title="ID" field="id" hidden="false"></t:dgCol>
	   <t:dgCol title="员工号" field="jobNo"></t:dgCol>
	   <t:dgCol title="员工名称" field="empName" hidden="true"></t:dgCol>
	   <t:dgCol title="岗位" field="postId_postName" ></t:dgCol>
	   <t:dgCol title="所属部门" field="postId_deptId_departname" ></t:dgCol>
	   <t:dgCol title="所属机构" field="orgenId_permName" ></t:dgCol>
	  </t:datagrid>
 </div>
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbEmployeeContractsController.do?save" beforeSubmit="wantSelectRowData();">
			<input id="id" name="id" type="hidden" value="${tbEmployeeContractsPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr style="display: none;">
					<td align="right">
						<label class="Validform_label">
							员工id:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empId" name="empId.id" ignore="ignore" value='${tbCheckingInstancePage.empId.id}'>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							合同生效日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="contractEffectiveDate" name="contractEffectiveDate" 
							   value="<fmt:formatDate value='${tbEmployeeContractsPage.contractEffectiveDate}' type="date" pattern="yyyy-MM-dd"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							合同终止日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="contractEndDate" name="contractEndDate" 
							   value="<fmt:formatDate value='${tbEmployeeContractsPage.contractEndDate}' type="date" pattern="yyyy-MM-dd"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							合同签订日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="contractDate" name="contractDate" 
							   value="<fmt:formatDate value='${tbEmployeeContractsPage.contractDate}' type="date" pattern="yyyy-MM-dd"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
						<select id="status"  name="status"  datatype="*" onchange="changeInfoByType();">
					        <option value="1">过期</option>
					        <option value="2">终止</option>
					        <option value="3">正常</option>
				      	</select>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>
 <script type="text/javascript">
 $(document).ready(function(){ 
	$('#tbEmplooyList').datagrid({
		singleSelect:true
	});
});
 </script>