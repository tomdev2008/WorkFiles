<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbContractReceiveMoneyList" title="合同回款" actionUrl="tbContractReceiveMoneyController.do?datagrid" idField="id" fit="true"  onClick="ContractReceiveMoneyDetail"  queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
    <t:dgCol title="合同序列" field="tbContract_id"  hidden="false"></t:dgCol>
   <t:dgCol title="合同编号" field="tbContract_contractNo"  query="true"></t:dgCol>
   <t:dgCol title="合同金额" field="tbContract_contractPrice"  ></t:dgCol>
     <t:dgCol title="回款分类" field="moneyType"    query="true"></t:dgCol>
   <t:dgCol title="回款金额" field="receiveMoney"    query="true"></t:dgCol>
   <t:dgCol title="未回款金额" field="notReceiveMoney"    query="true"></t:dgCol>
   <t:dgCol title="回款备注" field="remark"    query="true"></t:dgCol>
   <t:dgCol title="回款日期" field="receivedate"  formatter="yyyy-MM-dd"    query="true"  ></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd" hidden="false"></t:dgCol>
   <t:dgCol title="创建人" field="createUser"  hidden="false"></t:dgCol>
   <t:dgToolBar title="录入" icon="icon-add" url="tbContractReceiveMoneyController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbContractReceiveMoneyController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbContractReceiveMoneyController.do?addorupdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove"  funname="delone"></t:dgToolBar>
  </t:datagrid>
  </div>
  
  
  <div region="south"  style="height:200px;overflow: hidden;" split="true" border="false">
	<div class="easyui-panel" title="产品信息" style="padding:1px;" fit="true" border="false" id="ContractReceiveMoneypanel">
		
  	</div>
  </div>
 </div>
 
 <script type="text/javascript">
 function ContractReceiveMoneyDetail(rowIndex, rowData)
 {
	 $('#ContractReceiveMoneypanel').panel("refresh", "tbContractController.do?contractDetail&id="+rowData.tbContract_id);
 }
 
   function delone(title,url, id) {
	var rowData = $('#'+id).datagrid('getSelected');
	if (!rowData) {
		tip('请选择要删除');
		return;
	}
	delObj('tbContractReceiveMoneyController.do?del&id='+ rowData.id,'tbContractReceiveMoneyList');
}
   </script>