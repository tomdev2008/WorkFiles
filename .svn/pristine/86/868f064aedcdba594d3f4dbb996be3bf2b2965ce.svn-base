<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbCheckingInstanceList" title="考勤统计表" actionUrl="tbCheckingInstanceController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="主键id" field="empId" ></t:dgCol>
   <t:dgCol title="员工姓名" field="empName" ></t:dgCol>
   <t:dgCol title="orgenName" field="orgenName" ></t:dgCol>
   <t:dgCol title="empDue" field="empDue" ></t:dgCol>
   <t:dgCol title="empActual" field="empActual" ></t:dgCol>
   <t:dgCol title="neglectWork" field="neglectWork" ></t:dgCol>
   <t:dgCol title="empLate" field="empLate" ></t:dgCol>
   <t:dgCol title="leaveEarly" field="leaveEarly" ></t:dgCol>
   <t:dgCol title="overtime" field="overtime" ></t:dgCol>
   <t:dgCol title="empLeave" field="empLeave" ></t:dgCol>
   <t:dgCol title="empAway" field="empAway" ></t:dgCol>
   <t:dgCol title="weekendOvertime" field="weekendOvertime" ></t:dgCol>
   <t:dgCol title="happenday" field="happenday" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbCheckingInstanceController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbCheckingInstanceController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbCheckingInstanceController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbCheckingInstanceController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>