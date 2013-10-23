<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbProjectEntityList" title="项目" actionUrl="tbProjectEntityController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
    <t:dgCol title="项目名称" field="projectName" ></t:dgCol>
    <t:dgCol title="客户名称" field="customer_companyName" ></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="描述" field="description" ></t:dgCol>
   <t:dgToolBar title="录入" icon="icon-add" url="tbProjectEntityController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbProjectEntityController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbProjectEntityController.do?addorupdate" funname="detail"></t:dgToolBar>
 <t:dgToolBar title="删除" icon="icon-remove" url="tbProjectEntityController.do?del" funname="delone"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
   <script type="text/javascript">
//删除
  function delone(title,url, id) {
  	var rowData = $('#'+id).datagrid('getSelected');
  	if (!rowData) {
  		tip('请选择要删除');
  		return;
  	}
  	$.dialog.confirm('确定删除吗', function(){
  		var i = rowData.id;
  		url += '&id='+rowData.id;
  		//直接操作
  		$.ajax({
  	    	url:'tbProjectEntityController.do?del' , // 可以获取数据的接口
  	    	dataType:"json",
  	    	data:{'id':rowData.id},
  	    	success:function(data) {
  				$.dialog.tips(data.msg,2);
  				reloadTable();
  	    	}
  	    });
  	}, function(){
  	});
  }
  </script>