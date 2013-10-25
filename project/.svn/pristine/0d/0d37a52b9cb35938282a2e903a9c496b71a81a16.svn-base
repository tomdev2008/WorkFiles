<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
 
<t:dategrid name="tbOrdersList" title="订单" actionUrl="tbOrdersController.do?datagrid" idField="id" fit="true" >
  <t:dgCol title="编号" field="id" hidden="false" sortable="false"></t:dgCol>
  <t:dgCol title="订单号" field="orderNumber"  sortable="false"  query="true" ></t:dgCol>
 <t:dgCol title="备注" field="remark"  sortable="false"  query="true"  width="150"></t:dgCol>
  <t:dgCol title="代理商" field="agentsName"  sortable="false"  query="true" ></t:dgCol>
  <t:dgCol title="渠道" field="channelName"   sortable="false"  query="true"></t:dgCol>
  <t:dgCol title="目的国" field="countryName"  sortable="false"  query="true" ></t:dgCol>
  <t:dgCol title="状态" field="status" replace="转运_1,异常_2,签收_3"  sortable="true"  query="true" ></t:dgCol>
  <t:dgCol title="重要" field="important" replace="重要_1,其次_2,一般_3"  sortable="true"  query="true" ></t:dgCol>
  <t:dgCol title="创单时间" field="createTime" formatter="yyyy-MM-dd hh:mm:ss" sortable="true"  query="true" ></t:dgCol>
   <t:dgCol title="用户账号" field="userName"  sortable="false"  query="true" ></t:dgCol>
  <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
  <t:dgDelOpt title="删除" url="tbOrdersController.do?del&id={id}" />
  <%--  <t:dgDelOpt title="跟踪" url="tbOrderTrackingController.do?tbOrderTracking" /> --%>
   <t:dgOpenOpt url="tbOrderTrackingController.do?tbOrderTrackingWindow&id={id}" title="跟踪" width="1000px" height="350px"></t:dgOpenOpt>
</t:dategrid>
 
<div id="tbOrdersListtb"  style="padding: 3px; height: 25px">
 <div style="float:left;">
  <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="add('录入订单','tbOrdersController.do?addorupdate','tbOrdersList')">录入订单</a>
  <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="update('编辑订单','tbOrdersController.do?addorupdate','id')">编辑订单</a>
 </div>
 <div align="right">
        条件:<input type="text" name="orderNumber" id="orderNumber" style="width: 80px"/>
   <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="tbOrdersListsearch()">查询</a>
 </div>
</div>