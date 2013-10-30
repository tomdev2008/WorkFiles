<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
 
  	<div id="myTabs" class="easyui-tabs" style="width:1800;height:700px;">
		<div title="临时合同" data-options="closable:false,cache:false">
			<t:datagrid name="tbContractTemporaryList"  actionUrl="tbContractTemporaryController.do?datagrid" idField="id" fit="true">
	   			<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	   			<t:dgCol title="临时合同编号" field="contractNo" ></t:dgCol>
	   			<t:dgCol title="合同总价" field="contractTotalPrice" ></t:dgCol>
	  		 	<t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
	   			<t:dgCol title="文件名称" field="fileName" ></t:dgCol>
	   			<t:dgCol title="状态" field="status" ></t:dgCol>
	   			<t:dgCol title="标题" field="title" ></t:dgCol>
	   			<t:dgCol title="创建人" field="creatorId" ></t:dgCol>
	   			<t:dgCol title="操作" field="opt" width="100"></t:dgCol>
	   			<t:dgDelOpt title="删除" url="tbContractTemporaryController.do?del&id={id}" />
	   			<t:dgToolBar title="录入" icon="icon-add" url="tbContractTemporaryController.do?addorupdate" funname="add"></t:dgToolBar>
	   			<t:dgToolBar title="编辑" icon="icon-edit" url="tbContractTemporaryController.do?addorupdate" funname="update"></t:dgToolBar>
	   			<t:dgToolBar title="查看" icon="icon-search" url="tbContractTemporaryController.do?addorupdate" funname="detail"></t:dgToolBar>
	  		</t:datagrid>
		</div>
		<div title="正式合同">
			<t:datagrid name="tbContractList"  actionUrl="tbContractController.do?datagrid" idField="id" fit="true">
   				<t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   				<t:dgCol title="合同编号" field="contractNo" ></t:dgCol>
   				<t:dgCol title="合同总价" field="contractTotalPrice" ></t:dgCol>
   				<t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   				<t:dgCol title="状态" field="status" ></t:dgCol>
   				<t:dgCol title="标题" field="title" ></t:dgCol>
   				<t:dgCol title="创建人" field="creatorId" ></t:dgCol>
   				<t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   				<t:dgDelOpt title="删除" url="tbContractController.do?del&id={id}" />
   				<t:dgToolBar title="录入" icon="icon-add" url="tbContractController.do?addorupdate" funname="add"></t:dgToolBar>
   				<t:dgToolBar title="编辑" icon="icon-edit" url="tbContractController.do?addorupdate" funname="update"></t:dgToolBar>
   				<t:dgToolBar title="查看" icon="icon-search" url="tbContractController.do?addorupdate" funname="detail"></t:dgToolBar>
  			</t:datagrid>
		</div>
	</div>
 	
  </div>
 </div>