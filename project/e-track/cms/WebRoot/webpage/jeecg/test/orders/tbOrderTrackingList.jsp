<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:dategrid name="tbOrderTrackingList" title="订单跟踪信息"  idField="id" fit="true"  actionUrl="tbOrderTrackingController.do?datagrid&orderId=ff8080813ef098e0013ef09b719a0004">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="订单id" field="orderId" ></t:dgCol>
   <t:dgCol title="跟踪信息" field="information" ></t:dgCol>
   <t:dgCol title="开始时间" field="time" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="结束时间" field="ftime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
  </t:dategrid>
  </div>
 </div>
