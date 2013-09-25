<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbConfigModelsList" title="机型配置" actionUrl="tbConfigModelsController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="ID" field="configId" ></t:dgCol>
   <t:dgCol title="折扣后现场价" field="afterDiscountNowPrice" ></t:dgCol>
   <t:dgCol title="折扣后价格" field="afterDiscountPrice" ></t:dgCol>
   <t:dgCol title="目录合价" field="catalogTotalPrice" ></t:dgCol>
   <t:dgCol title="创建时间" field="createTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="名称" field="name" ></t:dgCol>
   <t:dgCol title="状态" field="status" ></t:dgCol>
   <t:dgCol title="总价" field="totalPrice" ></t:dgCol>
   <t:dgCol title="类型" field="type" ></t:dgCol>
   <t:dgCol title="创建者ID" field="creatorId" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbConfigModelsController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbConfigModelsController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbConfigModelsController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbConfigModelsController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>