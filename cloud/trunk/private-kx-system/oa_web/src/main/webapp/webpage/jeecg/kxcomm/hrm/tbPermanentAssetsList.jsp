<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbPermanentAssetsList" title="固定资产" actionUrl="tbPermanentAssetsController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="固定资产类别" field="category" ></t:dgCol>
   <t:dgCol title="固定资产名称" field="name" ></t:dgCol>
   <t:dgCol title="规格型号" field="model" ></t:dgCol>
   <t:dgCol title="配置" field="configuration" ></t:dgCol>
   <t:dgCol title="数量" field="num" ></t:dgCol>
   <t:dgCol title="单位" field="unit" ></t:dgCol>
   <t:dgCol title="购置日期" field="buydate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="购置金额" field="buymoney" ></t:dgCol>
   <t:dgCol title="所在地点" field="place" ></t:dgCol>
   <t:dgCol title="盘存时间" field="inventorydate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="领用人" field="users" ></t:dgCol>
   <t:dgCol title="领用时间" field="usedate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="备注" field="remark" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbPermanentAssetsController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbPermanentAssetsController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbPermanentAssetsController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbPermanentAssetsController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>