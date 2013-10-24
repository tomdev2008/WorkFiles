<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;" id="docDiv">
  <t:datagrid name="tbContractTemplatesDocList" sortName="createtime" sortOrder="desc" title="合同模板文件管理" actionUrl="tbContractTemplatesDocController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false" sortable="false"></t:dgCol>
   <t:dgCol title="文件名称" field="docname" ></t:dgCol>
    <t:dgCol title="文件类型" field="docType_typename" ></t:dgCol>
   <t:dgCol title="路径" field="path" hidden="false"></t:dgCol>
   <t:dgCol title="创建时间" field="createtime"  formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="是否设置变量" field="bvariable" replace="否_0,是_1"></t:dgCol>
   <t:dgToolBar title="录入" icon="icon-add" url="tbContractTemplatesDocController.do?addorupdate" funname="openuploadwin"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbContractTemplatesDocController.do?addorupdate" funname="uploadFile"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbContractTemplatesDocController.do?addorupdate" funname="detail"></t:dgToolBar>
 	<t:dgToolBar title="删除" icon="icon-remove" url="tbContractTemplatesDocController.do?del" funname="delone"></t:dgToolBar>
 	<t:dgToolBar funname="editone" title="设置变量" icon="icon-edit"></t:dgToolBar>
 	<t:dgToolBar  icon="icon-print"  funname="downloadFlie" title="下载附件"></t:dgToolBar>
  	<t:dgToolBar icon="icon-search" title="预览" url="tbContractTemplatesDocController.do?openViewFile"  funname="reviewNow"></t:dgToolBar > 
  </t:datagrid>
  </div>
 </div>
 
  <script type="text/javascript">
  //在线预览
  function reviewNow(title,url,id)
  {
	  var rowData = $('#tbContractTemplatesDocList').datagrid('getSelected');
		if (!rowData) {
			tip('请选择一个文件');
			return;
		}
	openwindow(title,'tbContractTemplatesDocController.do?openViewFile&path='+rowData.path,'tbContractTemplatesDocList',width="1080px",height="700px");	
  }
//编辑
  function uploadFile(title,url,id)
  {
 	 var rowData = $('#'+id).datagrid('getSelected');
 	 openuploadwin(title,'tbContractTemplatesDocController.do?addorupdate&id='+rowData.id,'tbContractTemplatesDocList');
  }
  //下载
function downloadFlie(title,url, id){
	var rowData = $('#'+id).datagrid('getSelected');
	if (!rowData) {
		tip('请选择一个文件');
		return;
	}
	var url1 ='${basePath}'+'upload/'+rowData.path;
	window.open(url1, "_blank");
}
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
		//弹出页面
		//openwindow(title,'tbOrderController.do?del&id='+rowData.id);

		//直接操作
		$.ajax({
	    	url:'tbContractTemplatesDocController.do?del' , // 可以获取数据的接口
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

//设置变量
function editone(title,url, id) {
	var rowData = $('#'+id).datagrid('getSelected');
	if (!rowData) {
		tip('请选择需要设置变量的文件');
		return;
	}
	if(rowData.bvariable==0)
		{
		tip('该文件不需设置变量');
		return;
		}
	var i = rowData.id;
	url += '&id='+rowData.id;
	openwindow(title,'tbContractTemplatesDocVariableController.do?addorupdate&id='+rowData.id,'tbContractTemplatesDocList',width="auto",height="auto"); 
}
</script>