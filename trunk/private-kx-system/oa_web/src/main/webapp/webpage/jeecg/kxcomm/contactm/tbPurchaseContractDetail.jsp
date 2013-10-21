<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>


<div style="width: auto;height: auto;overflow-y:scroll;">
<table border="0" cellpadding="2" cellspacing="0" id="tbPurchase_table">
	<tr bgcolor="#E6E6E6">
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">区域</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">采购合同号</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">康讯订单号</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">供应商</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">商品名称</td>
				  <td align="left" bgcolor="#EEEEEE"     style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">型号</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">数量</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">采购单价</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">采购总价</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">采购人</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">预计到货日期</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">下单日期</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">发票日期</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">发票备注</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">付款日期</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">查询单号</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">机型服务编号</td>
				  <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">备注</td>
	</tr>
	<tbody id="add_tbPurchase_table">	
	
	<c:if test="${fn:length(tbPurchaseList)  > 0 }">
		<c:forEach items="${tbPurchaseList}" var="poVal" varStatus="stuts">
			<tr>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.area }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbPurchaseContract.contractNo }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbOrderDetail.tbOrder.kxOrderNo }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.supplier }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.productName }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.model }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.number }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.unitPrice }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.totalPrice }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.purchaser }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.predictArrivalDate }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.placeOrderDate }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.invoiceDate }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.invoiceRemark }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.paymentDate }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.inquireNo }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.typeServiceNo }</label></td>
				  <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.remark }</label></td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>