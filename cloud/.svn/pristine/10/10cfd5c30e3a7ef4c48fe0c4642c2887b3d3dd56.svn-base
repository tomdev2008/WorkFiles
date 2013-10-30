<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbContractTemplatesDocVariableList" title="合同模板文件变量" actionUrl="tbContractTemplatesDocVariableController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="templatesDocVariableId" field="templatesDocVariableId" ></t:dgCol>
   <t:dgCol title="templatesdocId" field="templatesdocId" ></t:dgCol>
   <t:dgCol title="变量名称" field="variablename" ></t:dgCol>
   <t:dgCol title="描述" field="description" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbContractTemplatesDocVariableController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbContractTemplatesDocVariableController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbContractTemplatesDocVariableController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbContractTemplatesDocVariableController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>