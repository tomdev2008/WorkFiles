<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
//所选的合同模板
var contempIds = "";
contempIds = '${temple_id}'+"";
//所选的合同模板的状态
var constatsvalues = "";
constatsvalues = '${statsvalues}'+"";

//初始化时勾选上用户选择的合同模板文件
function initCheckFile() {
	
	var rows = $("#tbContractTemplatesDocList1").datagrid("getRows");
	for(var i = 0; i < rows.length; i++) {
		if(null != rows[i].path && "yes" == rows[i].path) {
			$("#tbContractTemplatesDocList1").datagrid("selectRow",i);
		}
	}
}

//保存合同文件的方法
function saveConTempFile() {
	if(null == constatsvalues || "2" == constatsvalues || "4" == constatsvalues || "6" == constatsvalues) {
		$.dialog.tips("该模板已审核通过，不可修改",3);
		return false;
	}
	var ids = "";
	var rows = $("#tbContractTemplatesDocList1").datagrid("getSelections");
	if(0 >= rows.length) {
		$.dialog.tips("请选择一个合同文件",3);
		return false;
	}
	for(var i=0;i<rows.length;i++){
		ids += rows[i].id+",";
	}
	ids = ids.substring(0,ids.length-1);
	$.ajax({
    	url:'tbContractTemplatesDocController.do?saveConTempFile' , // 可以获取数据的接口
    	dataType:"json",
    	data:{'ids':ids,'contempIds':contempIds},
    	success:function(data) {
    		$.dialog.tips(data,3);
    	}
    });
}
</script>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbContractTemplatesDocList1" title="合同模板文件管理" pagination="false" actionUrl="tbContractTemplatesDocController.do?queryTempFiledatagrid&temple_id=${temple_id}&statsvalues=${statsvalues}" idField="id" fit="true" checkbox="true" onLoadSuccess="initCheckFile();">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="templatesdocId" field="templatesdocId" hidden="false"></t:dgCol>
   <t:dgCol title="文件名称" field="docname" ></t:dgCol>
   <t:dgCol title="路径" field="path" hidden="false"></t:dgCol>
   <t:dgCol title="创建时间" field="createtime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="是否设置变量" field="bvariable" replace="无变量_0,有变量_1"></t:dgCol>
<%--    <t:dgCol title="操作" field="opt" width="100"></t:dgCol> --%>
<%--    <t:dgDelOpt title="删除" url="tbContractTemplatesDocController.do?del&id={id}" /> --%>
<%--    <t:dgToolBar title="录入" icon="icon-add" url="tbContractTemplatesDocController.do?addorupdate" funname="add"></t:dgToolBar> --%>
<%--    <t:dgToolBar title="编辑" icon="icon-edit" url="tbContractTemplatesDocController.do?addorupdate" funname="update"></t:dgToolBar> --%>
   <t:dgToolBar title="保存" icon="icon-add" operationCode="" funname="saveConTempFile();" ></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>