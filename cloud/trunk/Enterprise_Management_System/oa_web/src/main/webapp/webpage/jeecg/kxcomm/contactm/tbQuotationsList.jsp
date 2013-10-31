<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <div class="easyui-panel" style="padding:1px;" fit="true"  border="false" id="quotations">
  <t:datagrid  name="tbQuotationsList" title="报价表" actionUrl="tbQuotationsController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="路径" field="downUrl" hidden="false"></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" hidden="false"></t:dgCol>
   <t:dgCol title="报价表名称" field="quotationName" width="100"></t:dgCol>
   <t:dgCol title="目录合价（元）" field="catalogTotalPrice" width="100"></t:dgCol>
   <t:dgCol title="折扣后价格（元）" field="afterPrice" width="100"></t:dgCol>
   <t:dgCol title="折扣后现场价" field="nowPrice" width="100"></t:dgCol>
   <t:dgCol title="合计" field="totalPrice" width="100"></t:dgCol>
   <t:dgCol title="状态" replace="未审核_1" field="status" width="100"></t:dgCol>
   <%--<t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbQuotationsController.do?del&id={id}" /> --%>
   <t:dgToolBar title="制作报价表" icon="icon-add" url="tbQuotationsController.do?addorupdate" funname="add1"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbQuotationsController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看配置" icon="icon-search" url="tbQuotationsController.do?check" funname="check"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove" url="tbQuotationsController.do?del" funname="delone"></t:dgToolBar>
   <t:dgToolBar title="下载" icon="icon-print" url="tbQuotationsController.do?download" funname="down"></t:dgToolBar>
  </t:datagrid>
  </div>
  </div>
  
 </div>
 <script type="text/javascript">

 function delone(title,url, id) {
		var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('请选择删除项目');
			return;
		}
		url += '&id='+rowData.id;
	 	delObj(url,id);
}
 function down(title,url,id) {
	 
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
	 	
 }
 
 function add1(title,addurl,gname) {
		gridname=gname;
		createwindow1(title, addurl);
 }
 
 function s(){
	
	saveObj();
	return true;
 }
 function createwindow1(title, addurl) {
		if(typeof(windowapi) == 'undefined'){
			$.dialog({
				content: 'url:'+addurl,
				lock : true,
				title:title,
				opacity : 0.3,
				cache:false,
			    ok: function(){
			    	iframe = this.iframe.contentWindow;
			    	var end = s();
			    	if(end){
						var timer_alert = setTimeout(function() {	
							$('#quotations').panel("refresh", "tbConfigModelsController.do?changePageById");
						}, 2000);
			    	}
					return false;
			    },
			    cancelVal: '关闭',
			    cancel: true
			   
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
					return false;
			    },
			    cancelVal: '关闭',
			    cancel: true 
			});
		}
		
	}
 
 function check(title,url, id){
	 
	 var rowData = $('#'+id).datagrid('getSelected');
		if (!rowData) {
			tip('请选择查看项目');
			return;
		}
	url += '&id='+rowData.id;
	$('#quotations').panel("refresh", url);
 }
 
 </script>