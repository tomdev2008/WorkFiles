<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="projectTrackingList" title="项目跟踪列表" actionUrl="tbPurchaseController.do?projectTrackingDatagrid" idField="id" fit="true"  onClick="projectTrackingDetail"  queryMode="group"  sortOrder="desc"  sortName="placeOrderDate">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
    <t:dgCol title="责任人" field="tbOrderDetail_tbOrder_principal"   query="true"></t:dgCol>
    <t:dgCol title="区域"  field="area"  query="true"></t:dgCol>
    <t:dgCol title="康讯订单号"  field="tbOrderDetail_tbOrder_kxOrderNo"  query="true"></t:dgCol>
    <t:dgCol title="最终客户"  field="tbOrderDetail_tbOrder_finalClient"  query="true"></t:dgCol>
    <t:dgCol title="项目名称"  field="tbOrderDetail_tbOrder_projectName"  query="true" ></t:dgCol>
    <t:dgCol title="供应商"  field="supplier"  ></t:dgCol>
    <t:dgCol title="商品名称"  field="productName"  ></t:dgCol>
    <t:dgCol title="型号"  field="model"  ></t:dgCol>
    <t:dgCol title="数量"  field="number"  ></t:dgCol>
    <t:dgCol title="下单日期"  field="placeOrderDate" formatter="yyyy-MM-dd " width="100"  query="true"></t:dgCol>
    <t:dgCol title="预计到货日期"  field="predictArrivalDate" formatter="yyyy-MM-dd " width="100"></t:dgCol>
 	<t:dgCol title="合同签订日期"  field="tbOrderDetail_tbOrder_tbContract_contractSigningDate" formatter="yyyy-MM-dd "></t:dgCol>
 	<t:dgCol title="合同号"  field="tbOrderDetail_tbOrder_tbContract_contractNo"  query="true"></t:dgCol>
 	<t:dgCol title="销售单价"  field="tbOrderDetail_price"  query="true"></t:dgCol>
 	<t:dgCol title="项目总金额"  field="tbOrderDetail_tbOrder_tbContract_contractPrice" ></t:dgCol>
 	<t:dgCol title="开票日期"  field="tbOrderDetail_tbOrder_tbContract_billingDate" formatter="yyyy-MM-dd "></t:dgCol>
 	<t:dgCol title="合同归档日期"  field="tbOrderDetail_tbOrder_tbContract_contractFilingDate" formatter="yyyy-MM-dd "></t:dgCol>
 	
 	 <t:dgToolBar title="查看" icon="icon-search" url="tbPurchaseController.do?projectTrackingDetail"  funname="projectTrackingDetail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
 <script type="text/javascript">
 function projectTrackingDetail(rowIndex, rowData)
 {
	 var rowData = $('#projectTrackingList').datagrid('getSelected');
		if (!rowData) {
			tip('请选择要修改');
			return;
		}
	openwindow('项目跟踪详情','tbPurchaseController.do?projectTrackingDetail&id='+rowData.id,'projectTrackingList');
 }
 
   </script>