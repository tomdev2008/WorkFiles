<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  
  <t:datagrid name="tbConfigModelsCheckList" title="机型配置" actionUrl="tbConfigModelsController.do?datagrid&quotation=${quotation }" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
    <t:dgCol title="配置单名称" field="name" ></t:dgCol>
    <t:dgCol title="分类" field="tbDataSource_tbDataSourceType_sourcetypename" ></t:dgCol>
   <t:dgCol title="目录合价" field="catalogTotalPrice" ></t:dgCol>
   <t:dgCol title="折扣后价格" field="afterDiscountPrice" ></t:dgCol>
   <t:dgCol title="折扣后现场价" field="afterDiscountNowPrice" ></t:dgCol>
   <t:dgCol title="合计" field="totalPrice" ></t:dgCol>
   
   
   
   <%--<t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbConfigModelsController.do?del&id={id}" /> --%>
   
   <t:dgToolBar title="查看配置单数据" icon="icon-search" url="tbConfigModelsController.do?detail" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="返回" icon="icon-back" url="tbQuotationsController.do?tbQuotations" funname="back"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">

 function detail(title,url, id){
	 var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('请选择查看项目');
			return;
		}
	url += '&id='+rowData.id;
	$('#tt').panel("refresh", url);
 }
 function back(title,url, id){
	 
	$('#tt').panel("refresh", url);
 }
</script>