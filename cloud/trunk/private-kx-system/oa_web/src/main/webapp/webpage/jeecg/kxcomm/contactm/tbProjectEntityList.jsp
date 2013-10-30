<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbProjectEntityList" title="项目" actionUrl="tbProjectEntityController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="主键ID" field="projectId" ></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="描述" field="description" ></t:dgCol>
   <t:dgCol title="项目名称" field="projectName" ></t:dgCol>
   <t:dgCol title="用户ID" field="userId" ></t:dgCol>
   <t:dgCol title="客户ID" field="customer" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbProjectEntityController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbProjectEntityController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbProjectEntityController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbProjectEntityController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>