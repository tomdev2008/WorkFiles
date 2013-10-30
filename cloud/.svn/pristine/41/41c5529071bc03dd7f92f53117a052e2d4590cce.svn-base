<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbContractDocVariableList" title="合同文件变量" actionUrl="tbContractDocVariableController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="docvariable" field="docvariable" ></t:dgCol>
   <t:dgCol title="docId" field="docId" ></t:dgCol>
   <t:dgCol title="变量名称" field="variablename" ></t:dgCol>
   <t:dgCol title="内容" field="content" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbContractDocVariableController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbContractDocVariableController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbContractDocVariableController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbContractDocVariableController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>