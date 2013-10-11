<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <div>
  <t:datagrid name="tbConfigModelDataList" title="配置单" actionUrl="tbConfigModelDataController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="ID" field="configId" ></t:dgCol>
   <t:dgCol title="catalogPrice" field="catalogPrice" ></t:dgCol>
   <t:dgCol title="discountedAfterPrice" field="discountedAfterPrice" ></t:dgCol>
   <t:dgCol title="折扣率" field="discountrate" ></t:dgCol>
   <t:dgCol title="discountedPrice" field="discountedPrice" ></t:dgCol>
   <t:dgCol title="第一年" field="firstYear" ></t:dgCol>
   <t:dgCol title="第二年" field="secondYear" ></t:dgCol>
   <t:dgCol title="第三年" field="thirdYear" ></t:dgCol>
   <t:dgCol title="数量" field="quantity" ></t:dgCol>
   <t:dgCol title="总价" field="totalPrice" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbConfigModelDataController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbConfigModelDataController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbConfigModelDataController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbConfigModelDataController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
   <div id="myTabs" class="easyui-tabs" style="width:1800;height:700px;">
		<div title="基本配置单元" data-options="closable:false,cache:false"></div>
		<div title="同系列通用单元" data-options="closable:false,cache:false"></div>
		<div title="全通用单元" data-options="closable:false,cache:false"></div>
	</div>
 </div>
  
</div> 