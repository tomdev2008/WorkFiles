<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbContractTemplatesDocCheckList1" title="合同模板文件管理" pagination="false" actionUrl="tbContractTemplatesDocController.do?queryTempFileByTemId&temple_id=${temple_id}" idField="id" fit="true" >
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="templatesdocId" field="templatesdocId" hidden="false"></t:dgCol>
   <t:dgCol title="文件名称" field="docname" ></t:dgCol>
   <t:dgCol title="路径" field="path" hidden="false"></t:dgCol>
   <t:dgCol title="创建时间" field="createtime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="是否设置变量" field="bvariable" replace="无变量_0,有变量_1" ></t:dgCol>

   <%-- <t:dgToolBar title="保存" icon="icon-add" operationCode="" funname="saveConTempFile();" ></t:dgToolBar>--%>
  </t:datagrid>
  </div>
 </div>