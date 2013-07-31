<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
		<t:datagrid name="tbCheckingInstanceList" actionUrl="tbCheckingInstanceController.do?datagrid" idField="id" fit="true" queryMode="group">
	   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	   <t:dgCol title="主键id" field="empId_id" hidden="false"></t:dgCol>
	   <t:dgCol title="时间间隔" field="empName" hidden="false"></t:dgCol>
	   <t:dgCol title="时间" field="happenday" formatter="yyyy-MM-dd" query="true" queryMode="group" hidden="false"></t:dgCol>
	   <t:dgCol title="员工姓名" field="empId_empName" query="true" ></t:dgCol>
	   <t:dgCol title="机构名称" field="empId_orgenId_permName" ></t:dgCol>
	   <t:dgCol title="应到" field="empDue" ></t:dgCol>
	   <t:dgCol title="实到" field="empActual" ></t:dgCol>
	   <t:dgCol title="旷工" field="neglectWork" ></t:dgCol>
	   <t:dgCol title="迟到" field="empLate" ></t:dgCol>
	   <t:dgCol title="早退" field="leaveEarly" ></t:dgCol>
	   <t:dgCol title="加班" field="overtime" ></t:dgCol>
	   <t:dgCol title="请假" field="empLeave" ></t:dgCol>
	   <t:dgCol title="公出" field="empAway" ></t:dgCol>
	   <t:dgCol title="周末-加班" field="weekendOvertime" ></t:dgCol>
	   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
	   <t:dgDelOpt title="删除" url="tbCheckingInstanceController.do?del&id={id}&empId_id={empId_id}&empName={empName}&happenday={happenday}"/>
	   <t:dgFunOpt funname="operationDetail(empId_id)" title="详情"></t:dgFunOpt>
	   <t:dgToolBar title="录入" icon="icon-add" url="tbCheckingInstanceController.do?addorupdate" funname="add"></t:dgToolBar>
	   <t:dgToolBar title="编辑" icon="icon-edit" url="tbCheckingInstanceController.do?addorupdate" funname="update"></t:dgToolBar>
	   <t:dgToolBar title="查看" icon="icon-search" url="tbCheckingInstanceController.do?addorupdate" funname="detail"></t:dgToolBar>
	    <t:dgToolBar title="导入" icon="icon-add" url="tbCheckingInstanceController.do?goImporExcel" funname="openuploadwin"></t:dgToolBar>
	  </t:datagrid>
  </div>
  <div region="east" style="width:500px; overflow: hidden;" split="true" border="false">
	  <div class="easyui-panel" title="员工考勤详情" style="padding:1px;" fit="true" border="false" id="operationDetailpanel"></div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("input[name='happenday_begin']").attr("class","easyui-datebox");
		$("input[name='happenday_end']").attr("class","easyui-datebox");
	});
	//展现出考勤明细
	function operationDetail(functionId) {
		var st = $("input[name='happenday_begin']").val();
		var et = $("input[name='happenday_end']").val();
		$('#operationDetailpanel').panel("refresh", "tbCheckingInstanceController.do?queryInfo&empId_id="+functionId+"&happenday_begin="+st+"&happenday_end="+et);
	}
</script>