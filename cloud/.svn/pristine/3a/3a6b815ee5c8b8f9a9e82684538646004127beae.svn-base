<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbContractTemplatesEntityCheckList" title="合同模板" actionUrl="tbContractTemplatesEntityController.do?datagrid" idField="id" fit="true" onClick="checkDetail">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="名称" field="name" ></t:dgCol>
   <t:dgCol title="状态" field="status" replace="审核中_0,未审核_1,销售区域经理审核通过(采购主管)_2,销售区域经理审核未通过(采购主管)_3,法律人员审核通过_4,法律人员审核未通过_5,副经理审核通过_6,副经理审核未通过_7,经理审核通过_8,经理审核未通过_9"></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgToolBar title="审核" icon="icon-save" url="" funname="check"></t:dgToolBar>
  </t:datagrid>
  </div>
  
  <div region="south" style="height:300px;overflow: hidden;" split="true" border="false">
	<div class="easyui-panel" title="" style="padding:1px;" fit="true" border="false" id="contractTemplatesCheckDetail"></div>
  </div>
 </div>
 
<script type="text/javascript">
 function checkDetail(rowIndex, rowData) {
	 $('#contractTemplatesCheckDetail').panel("refresh", "tbContractTemplatesEntityController.do?checkInfo&temple_id="+rowData.id+"&statsvalues=" +rowData.status);
 }
 
 function check(title,url, id) {
	 	var rowData = $('#'+id).datagrid('getSelected');
	 	if (!rowData) {
	 		tip('请选择审核项目');
	 		return;
	 	}
 }
</script>