<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbEmployeeContractsList" title="员工合同表" actionUrl="tbEmployeeContractsController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="员工id" field="empId" ></t:dgCol>
   <t:dgCol title="合同生效日期" field="contractEffectiveDate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="合同终止日期" field="contractEndDate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="合同签订日期" field="contractDate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="状态" field="status" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbEmployeeContractsController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbEmployeeContractsController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbEmployeeContractsController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbEmployeeContractsController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>