<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbCheckingInList" title="考勤表" actionUrl="tbCheckingInController.do?datagrid&empId_id=${empId_id}&happenday_begin=${happenday_begin}&happenday_end=${happenday_end}" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="主键id" field="empId_id" hidden="false"></t:dgCol>
   <t:dgCol title="时间" field="time" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="员工名称" field="empId_empName" ></t:dgCol>
   <t:dgCol title="状态" field="stauts" replace="正常_0,未签到_1,未签退_2,旷工_3,迟到_4,早退_5,加班_6,外出_7,因公外出_8,公出_9,病假_10,事假_11,探亲假_12,出差_13,五一/国庆_14,年休假_15,丧假_16,婚假_17,产假_18"></t:dgCol>
   <t:dgCol title="原因" field="reason" ></t:dgCol>
<%--    <t:dgCol title="操作" field="opt" width="100"></t:dgCol> --%>
<%--    <t:dgDelOpt title="删除" url="tbCheckingInController.do?del&id={id}" /> --%>
<%--    <t:dgToolBar title="录入" icon="icon-add" url="tbCheckingInController.do?addorupdate" funname="add"></t:dgToolBar> --%>
<%--    <t:dgToolBar title="编辑" icon="icon-edit" url="tbCheckingInController.do?addorupdate" funname="update"></t:dgToolBar> --%>
<%--    <t:dgToolBar title="查看" icon="icon-search" url="tbCheckingInController.do?addorupdate" funname="detail"></t:dgToolBar> --%>
  </t:datagrid>
  </div>
 </div>