<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbPermanentAssetsList" title="固定资产表" actionUrl="tbPermanentAssetsController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="员工id" field="employeeId" ></t:dgCol>
   <t:dgCol title="资产编号" field="number" ></t:dgCol>
   <t:dgCol title="员工姓名" field="name" ></t:dgCol>
   <t:dgCol title="资产类型" field="accType" ></t:dgCol>
   <t:dgCol title="状态
            1：使用中
            2：损坏
            3：库存" field="state" ></t:dgCol>
   <t:dgCol title="购入时间" field="buyTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="资产价值" field="price" ></t:dgCol>
   <t:dgCol title="备注" field="remark" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbPermanentAssetsController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbPermanentAssetsController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbPermanentAssetsController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbPermanentAssetsController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>