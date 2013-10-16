<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbContractDocList" title="合同文件" actionUrl="tbContractDocController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="docId" field="docId" ></t:dgCol>
   <t:dgCol title="templatesdocId" field="templatesdocId" ></t:dgCol>
   <t:dgCol title="创建时间" field="createtime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="exportpath" field="exportpath" ></t:dgCol>
   <t:dgCol title="filename" field="filename" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbContractDocController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbContractDocController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbContractDocController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbContractDocController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
 