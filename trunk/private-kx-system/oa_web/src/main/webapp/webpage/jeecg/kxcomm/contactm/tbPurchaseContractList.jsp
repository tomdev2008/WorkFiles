<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbPurchaseContractList" fitColumns="true" title="采购合同" actionUrl="tbPurchaseContractController.do?datagrid" idField="id" fit="true" onClick="detail">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="采购合同编号" field="contractNo" ></t:dgCol>
   <t:dgCol title="采购合同总价" field="contractPrice" ></t:dgCol>
   <t:dgCol title="备注" field="remark" ></t:dgCol>
   
   <t:dgToolBar title="录入" icon="icon-add" url="tbPurchaseContractController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbPurchaseContractController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove"  funname="delone"></t:dgToolBar>
  </t:datagrid>
  </div>
  
  <div region="south"  style="height:250px;overflow: hidden;" split="true" border="false">
		<div class="easyui-panel" title="采购合同明细" style="padding:1px;" fit="true" border="false" id="detailpanel">
  		</div>
	</div>
 </div>
 <script type="text/javascript">
 function detail(rowIndex, rowData)
 {
	 $('#detailpanel').panel("refresh", "tbPurchaseContractController.do?detail&id=" +rowData.id);
 }
 
 function delone(title,url, id) {
		var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('请选择要删除');
			return;
		}
		delObj('tbPurchaseContractController.do?del&id='+ rowData.id,'tbPurchaseContractList');
	}
 /*
 $(function() {
		$('#tbPurchaseContractList').datagrid({
			onDblClickRow:function(rowIndex, rowData){
						detail(rowData.id)
			}
		});
	});*/
</script>