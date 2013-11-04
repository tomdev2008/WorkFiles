<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <div class="easyui-panel" style="padding:1px;" fit="true"  border="false" id="quotationsCheck">
  <t:datagrid  name="tbQuotationsCheckList" title="报价表" actionUrl="tbQuotationsController.do?datagrid&quotationStatus=1" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="路径" field="downUrl" hidden="false"></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" hidden="false"></t:dgCol>
   <t:dgCol title="报价表名称" field="quotationName" width="100"></t:dgCol>
   <t:dgCol title="目录合价（元）" field="catalogTotalPrice" width="100"></t:dgCol>
   <t:dgCol title="折扣后价格（元）" field="afterPrice" width="100"></t:dgCol>
   <t:dgCol title="折扣后现场价" field="nowPrice" width="100"></t:dgCol>
   <t:dgCol title="合计" field="totalPrice" width="100"></t:dgCol>
   <t:dgCol title="状态" replace="未审核_1" field="status" width="100"></t:dgCol>
   
   <t:dgToolBar title="审核" icon="icon-save" url="" funname="check"></t:dgToolBar>
   
   <t:dgToolBar title="查看配置" icon="icon-search" url="tbQuotationsController.do?checkDetail" funname="checkDetail"></t:dgToolBar>
   
   <%-- <t:dgToolBar title="下载" icon="icon-print" url="tbQuotationsController.do?download" funname="down"></t:dgToolBar>--%>
  </t:datagrid>
  </div>
  </div>
  
 </div>
 <script type="text/javascript">

function check(title,url,id) {
	 
	 var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('请选择审核项目');
			return;
		}
 }
 
 /*function down(title,url,id) {
	 
	 var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('请选择下载项目');
			return;
		}
	
	$.ajax({
	    url:url , // 可以获取数据的接口
	    dataType:"json",
	    data:{'id':rowData.id},
	    success:function(data) {
	    	window.location.href=data;
	    }
	 });
	 	
 }*/
 
 function checkDetail(title,url, id){
	 
	 var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('请选择查看项目');
			return;
		}
	url += '&id='+rowData.id;
	$('#quotationsCheck').panel("refresh", url);
 }
 
 </script>