<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:dategrid name="tbAgentsList" title="货代公司" actionUrl="tbAgentsController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="代理商" field="name" ></t:dgCol>
   <t:dgToolBar title="录入" icon="icon-add" url="tbAgentsController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbAgentsController.do?addorupdate" funname="update"></t:dgToolBar>
  </t:dategrid>
  </div>
 </div>