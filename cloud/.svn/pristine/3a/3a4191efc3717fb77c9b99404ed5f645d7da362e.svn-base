<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbQuotationsDataList" title="报价总表" actionUrl="tbQuotationsDataController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="name" field="name" ></t:dgCol>
   <t:dgCol title="ordered" field="ordered" ></t:dgCol>
   <t:dgCol title="projectName" field="projectName" ></t:dgCol>
   <t:dgCol title="quantity" field="quantity" ></t:dgCol>
   <t:dgCol title="toUsed" field="toUsed" ></t:dgCol>
   <t:dgCol title="quotationsId" field="quotationsId" ></t:dgCol>
   <t:dgCol title="configModelsId" field="configModelsId" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbQuotationsDataController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbQuotationsDataController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbQuotationsDataController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbQuotationsDataController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>