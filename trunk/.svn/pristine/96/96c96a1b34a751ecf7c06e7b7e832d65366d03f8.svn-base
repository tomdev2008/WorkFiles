<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbCityList" title="区域\地市管理" actionUrl="tbCityController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="名称" field="name" ></t:dgCol>
   <t:dgCol title="所属区域" field="parentId_name" ></t:dgCol>
   <t:dgCol title="地势类型" field="cityType" replace="区域_1,地市_2"></t:dgCol>
   
   <t:dgToolBar title="录入" icon="icon-add" url="tbCityController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbCityController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbCityController.do?addorupdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove" url="tbCityController.do?del" funname="delone"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
  function delone(title,url, id) {
 	var rowData = $('#'+id).datagrid('getSelected');
 	if (!rowData) {
 		tip('请选择删除项目');
 		return;
 	}
 	
 	url += '&id='+rowData.id;
 	delObj(url,id);
 	
 }
 </script>