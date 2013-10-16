<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbPurchaseList" actionUrl="tbPurchaseController.do?datagrid&orderDetailId=${id}" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   		<t:dgCol title="orderDetailId" field="tbOrderDetail_id" hidden="false"></t:dgCol>
   		<t:dgCol title="区域" field="area" width="70"></t:dgCol>
   		<t:dgCol title="采购合同号" field="tbPurchaseContract_contractNo" width="100"></t:dgCol>
   		<t:dgCol title="供应商" field="supplier" width="100"></t:dgCol>
   		<t:dgCol title="商品名称" field="productName" width="100"></t:dgCol>
   		<t:dgCol title="型号" field="model" width="100"></t:dgCol>
   		<t:dgCol title="数量" field="number" width="50"></t:dgCol>
   		<t:dgCol title="采购单价" field="unitPrice" width="100"></t:dgCol>
   		<t:dgCol title="采购总价" field="totalPrice" width="100"></t:dgCol>
   		<t:dgCol title="预计到货日期" field="predictArrivalDate" formatter="yyyy-MM-dd " width="100"></t:dgCol>
   		<t:dgCol title="下单日期" field="placeOrderDate" formatter="yyyy-MM-dd " width="100"></t:dgCol>
   		<t:dgCol title="发票日期" field="invoiceDate" formatter="yyyy-MM-dd " width="100"  ></t:dgCol>
   		<t:dgCol title="发票备注" field="invoiceRemark" width="50"  hidden="false"></t:dgCol>
   		<t:dgCol title="付款日期" field="paymentDate" formatter="yyyy-MM-dd" width="100"></t:dgCol>
   		<t:dgCol title="查询单号" field="inquireNo" width="100"  hidden="false"></t:dgCol>
   		<t:dgCol title="机型服务编号" field="typeServiceNo" width="50" hidden="false"></t:dgCol>
   		<t:dgCol title="采购人" field="purchaser" width="100" hidden="false"></t:dgCol>
   		<t:dgCol title="备注" field="remark" width="50"></t:dgCol>
   		<t:dgCol title="操作" field="opt" width="50"></t:dgCol>
   		<t:dgDelOpt title="删除" url="tbPurchaseController.do?del&id={id}" />
   		<t:dgToolBar title="编辑" icon="icon-edit" url="tbPurchaseController.do?addorupdate" funname="update"></t:dgToolBar>
   		<t:dgToolBar title="查看" icon="icon-search" url="tbPurchaseController.do?addorupdate" funname="detail"></t:dgToolBar>
  	</t:datagrid>
  </div>
 </div>