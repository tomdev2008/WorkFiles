<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:dategrid name="tbUserLevelList" title="用户级别" actionUrl="tbUserLevelController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="用户级别" field="levelname" ></t:dgCol>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbUserLevelController.do?addorupdate" funname="update"></t:dgToolBar>
  </t:dategrid>
  </div>
 </div>