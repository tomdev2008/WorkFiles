<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<body style="overflow-y: hidden" scroll="no">
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <table >
  <tr bgcolor="#E6E6E6">
				  <td align="center" bgcolor="#EEEEEE">康讯订单号</td>
				  <td align="center" bgcolor="#EEEEEE" width="15">区域</td>
				  <td align="center" bgcolor="#EEEEEE">商品名称</td>
				  <td align="center" bgcolor="#EEEEEE">型号</td>
				  <td align="center" bgcolor="#EEEEEE">数量</td>
				  <td align="center" bgcolor="#EEEEEE">采购人</td>
				  <td align="center" bgcolor="#EEEEEE">预计到货日期</td>
				  <td align="center" bgcolor="#EEEEEE">下单日期</td>
				  <td align="center" bgcolor="#EEEEEE">发票日期</td>
				  <td align="center" bgcolor="#EEEEEE">查询单号</td>
				  <td align="center" bgcolor="#EEEEEE">机型服务编号</td>
	</tr>
	<c:if test="${fn:length(smallPurchaseList)  > 0 }">
		<c:forEach items="${smallPurchaseList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="left">${poVal.tbOrderDetail.tbOrder.kxOrderNo}</td>
				   <td align="left">${poVal.area }</td>
				   <td align="left">${poVal.productName }</td>
				   <td align="left">${poVal.model }</td>
				   <td align="left">${poVal.number }</td>
				   <td align="left">${poVal.purchaser }</td>
				   <td align="left">${poVal.predictArrivalDate }</td>
				   <td align="left">${poVal.placeOrderDate }</td>
				   <td align="left">${poVal.invoiceDate }</td>
				 <td align="left">${poVal.inquireNo }"</td>
				   <td align="left">${poVal.typeServiceNo }</td>
   			</tr>
		</c:forEach>
	</c:if>	
  </table>
  </div>
 </div>
 </body>
 