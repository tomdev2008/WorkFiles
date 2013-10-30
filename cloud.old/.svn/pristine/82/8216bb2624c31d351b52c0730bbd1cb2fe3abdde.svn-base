<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbInvoiceList" title="销售发票管理" actionUrl="tbInvoiceController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="合同" field="contractId_contractName" ></t:dgCol>
   <t:dgCol title="公司名称" replace="北京市康讯通讯设备有限公司_1,北京云上云天信息技术有限公司_2" field="purchaseCompanyId" ></t:dgCol>
   <t:dgCol title="增值税类型" field="taxType" replace="增值税普通发票_1,增值税专用发票_2"></t:dgCol>
    <t:dgCol title="客户" field="customerId_companyName" ></t:dgCol>
   <t:dgCol title="金额" field="amount" ></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="创建者" field="creatorId_userName" ></t:dgCol>
   <t:dgCol title="发票状态" replace="已接收_1,未接收_2" field="status" ></t:dgCol>
<%--    <t:dgCol title="操作" field="opt" width="100"></t:dgCol> --%>
<%--    <t:dgDelOpt title="删除" url="tbInvoiceController.do?del&id={id}" /> --%>
   <t:dgToolBar title="录入" icon="icon-add" url="tbInvoiceController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbInvoiceController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove" url="tbInvoiceController.do?del" funname="delone"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbInvoiceController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
 <script type="text/javascript">
 function delone(title,url, id) {
 	var rowData = $('#'+id).datagrid('getSelected');
 	if (!rowData) {
 		tip('请选择删除发票');
 		return;
 	}
 	url += '&id='+rowData.id+'&status='+rowData.status;
 	delObj(url,id);	 	
 }
</script>