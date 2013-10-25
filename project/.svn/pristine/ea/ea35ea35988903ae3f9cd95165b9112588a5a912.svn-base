<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>订单</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:dategrid name="tbOrderTrackingList"  title="订单跟踪信息"  idField="id" fit="true" sortName="time" sortOrder="desc"  actionUrl="tbOrderTrackingController.do?datagrid&orderId.id=${windowMap.orderId }">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="订单id" field="orderId_orderNumber" width="12" hidden="false"></t:dgCol>
   <t:dgCol title="跟踪信息" field="information" ></t:dgCol>
   <t:dgCol title="开始时间" field="time" formatter="yyyy-MM-dd hh:mm:ss" width="15"></t:dgCol>
   <t:dgCol title="结束时间" field="ftime" formatter="yyyy-MM-dd hh:mm:ss" width="14"></t:dgCol>
  </t:dategrid>
  </div>
 </div>
 </body>
 </html>