<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbOrderDetailCopyList" title="销售订单明细" actionUrl="tbOrderDetailController.do?datagrid"  idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="康讯订单号" field="kxOrderNo" query="true" width="60"></t:dgCol>
   <t:dgCol title="项目名称" field="projectName"  query="true"  width="250"></t:dgCol>
   <t:dgCol title="客户名称" field="client" width="60" query="true"  hidden="false"></t:dgCol>
    <t:dgCol title="最终客户" field="finalClient"  query="true"  width="60"></t:dgCol>
    <t:dgCol title="负责人" field="principal"  query="true"  width="30"></t:dgCol>
    <t:dgCol title="备注" field="remark" width="30"  hidden="false"></t:dgCol>
   <t:dgCol title="商品名称" field="name" query="true"  width="40"></t:dgCol>
   <t:dgCol title="型号"  query="true"  field="type" width="60"></t:dgCol>
   <%--<t:dgCol title="单价" field="price" width="50"></t:dgCol>--%>
   <t:dgCol title="数量" field="number" width="30"></t:dgCol>
   <t:dgCol title="采购总价" field="sum" width="50"></t:dgCol>
   <t:dgCol title="状态" field="status" width="30" query="true"></t:dgCol>
   <t:dgCol title="供应商" field="supplier" width="60" query="true"  hidden="false"></t:dgCol>
   <t:dgCol title="销售合同号" field="saleContractNo" width="60" query="true"  hidden="false"></t:dgCol>
   <t:dgCol title="采购人" field="purchaser" width="60" query="true"  hidden="false"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="70"></t:dgCol>
   <t:dgFunOpt funname="purchaseDetail(id)" title="采购清单"></t:dgFunOpt>
   <t:dgOpenOpt url="tbOrderDetailController.do?addorupdate&id={ id}" title="修改状态"  width="auto" height="auto" ></t:dgOpenOpt>
   <t:dgToolBar title="采购" icon="icon-add" url="tbPurchaseController.do?addorupdate" funname="update1"></t:dgToolBar>
   
  </t:datagrid>
  </div>
  <div region="south"  style="height:250px;overflow: hidden;" split="true" border="false">
		<div class="easyui-panel"  style="padding:1px;" title="采购清单" fit="true" border="false" id="purchasePanel">
			<%--<t:datagrid name="tbPurchaseList" title="采购订单" actionUrl="tbPurchaseController.do?datagrid" idField="id" fit="true">
   				<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   				<t:dgCol title="orderDetailId" field="tbOrderDetail_id" hidden="false"></t:dgCol>
   				<t:dgCol title="区域" field="area" width="70"></t:dgCol>
   				<t:dgCol title="采购合同号" field="purchaseContractNo" width="100"></t:dgCol>
   				<t:dgCol title="康讯订单号" field="tbOrderDetail_tbOrder_kxOrderNo" width="100"></t:dgCol>
   				<t:dgCol title="最终客户" field="tbOrderDetail_tbOrder_finalClient" width="100"></t:dgCol>
   				<t:dgCol title="项目名称" field="tbOrderDetail_tbOrder_projectName" width="100"></t:dgCol>
   				<t:dgCol title="供应商" field="supplier" width="100"></t:dgCol>
   				<t:dgCol title="商品名称" field="productName" width="100"></t:dgCol>
   				<t:dgCol title="型号" field="model" width="100"></t:dgCol>
   				<t:dgCol title="数量" field="number" width="50"></t:dgCol>
   				<t:dgCol title="采购单价" field="unitPrice" width="100"></t:dgCol>
   				<t:dgCol title="采购总价" field="totalPrice" width="100"></t:dgCol>
   				<t:dgCol title="采购人" field="purchaser" width="100"></t:dgCol>
   				<t:dgCol title="预计到货日期" field="predictArrivalDate" formatter="yyyy-MM-dd hh:mm:ss" width="100"></t:dgCol>
   				<t:dgCol title="下单日期" field="placeOrderDate" formatter="yyyy-MM-dd hh:mm:ss" width="100"></t:dgCol>
   				<t:dgCol title="发票日期" field="invoiceDate" formatter="yyyy-MM-dd hh:mm:ss" width="100"></t:dgCol>
   				<t:dgCol title="发票备注" field="invoiceRemark" width="50"></t:dgCol>
   				<t:dgCol title="付款日期" field="paymentDate" formatter="yyyy-MM-dd hh:mm:ss" width="100"></t:dgCol>
   				<t:dgCol title="查询单号" field="inquireNo" width="100"></t:dgCol>
   				<t:dgCol title="记机型服务编号" field="typeServiceNo" width="50"></t:dgCol>
   				<t:dgCol title="备注" field="remark" width="50"></t:dgCol>
   				<t:dgCol title="操作" field="opt" width="50"></t:dgCol>
   				<t:dgDelOpt title="删除" url="tbPurchaseController.do?del&id={id}" />
   
   				<t:dgToolBar title="编辑" icon="icon-edit" url="tbPurchaseController.do?addorupdate" funname="update"></t:dgToolBar>
   				<t:dgToolBar title="查看" icon="icon-search" url="tbPurchaseController.do?addorupdate" funname="detail"></t:dgToolBar>
  			</t:datagrid> --%>
  		</div>
	</div>
 </div>
 
<script type="text/javascript">

 function update1(title,url, id) {
	
	//update-begin--Author:tanghong  Date:20130429 for：#75表格选中，跳转tab,无法编辑
	var rowData = $('#'+id).datagrid('getSelected');
	//update-begin--Author:tanghong  Date:20130504 for：#17 有的时候，明细行明选择，点击编辑却提示未选中行
	if (!rowData) {
		tip('请选择采购项目');
		return;
	}
	//update-end--Author:tanghong  Date:20130504 for：#17 有的时候，明细行明选择，点击编辑却提示未选中行
	var i = rowData.id;
	url += '&id='+rowData.id;
	//alert(url);
	//update-end--Author:tanghong  Date:20130429 for：#75表格选中，跳转tab,无法编辑
	createwindow1(title,url,i);
}

function createwindow1(title, addurl,i) {
	if(typeof(windowapi) == 'undefined'){
		$.dialog({
			content: 'url:'+addurl,
			lock : true,
			title:title,
			opacity : 0.3,
			cache:false,
			
		    ok: function(){
		    	iframe = this.iframe.contentWindow;
				saveObj();
				$('#purchasePanel').panel("refresh", "tbPurchaseController.do?tbPurchase&id=" +i);
				return false;
		    },
		    cancelVal: '关闭',
		    cancel: true /*为true等价于function(){}*/
		   
		});
	}else{
		W.$.dialog({
			content: 'url:'+addurl,
			lock : true,
			parent:windowapi,
			title:title,
			opacity : 0.3,
			cache:false,
		    ok: function(){
		    	iframe = this.iframe.contentWindow;
				saveObj();
				$('#purchasePanel').panel("refresh", "tbPurchaseController.do?tbPurchase&id=" +i);
				return false;
		    },
		    cancelVal: '关闭',
		    cancel: true /*为true等价于function(){}*/
		});
	}
	
}

function purchaseDetail(id)
{
	 $('#purchasePanel').panel("refresh", "tbPurchaseController.do?tbPurchase&id=" +id);
}

</script>