<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbOrderDetailList" actionUrl="tbOrderController.do?orderDetailList&orderId=${id}" idField="id" fit="true"  onClick="smallPurchase">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   		<t:dgCol title="产品名称" field="name" width="70"></t:dgCol>
   		<t:dgCol title="型号" field="type" width="100"></t:dgCol>
   		<t:dgCol title="单价" field="price" width="100"></t:dgCol>
   		<t:dgCol title="数量" field="number" width="100"></t:dgCol>
   		<t:dgCol title="金额" field="totalprice" width="100"></t:dgCol>
   		<t:dgCol title="状态" field="status" width="50"></t:dgCol>
  	</t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 function smallPurchase(rowIndex, rowData)
 {
	openwindow('采购情况','tbPurchaseController.do?smallPurchase&id='+rowData.id,'tbOrderDetailList',900,300);
 }
 </script>
 