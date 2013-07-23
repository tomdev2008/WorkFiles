<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbCheckingInList" title="考勤表" actionUrl="tbCheckingInController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="主键id" field="empId" ></t:dgCol>
   <t:dgCol title="状态" field="stauts" ></t:dgCol>
   <t:dgCol title="原因" field="reason" ></t:dgCol>
   <t:dgCol title="时间" field="time" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbCheckingInController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbCheckingInController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbCheckingInController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbCheckingInController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>