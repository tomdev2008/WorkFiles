<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div style="height: auto;overflow-y:auto;">
<table border="0" cellpadding="2" cellspacing="0" id="tbOrderDetail_table"  width="100%">
	<tr bgcolor="#E6E6E6">
				 <td align="left" bgcolor="#EEEEEE"   style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">康讯订单号</td>
				 <td align="left" bgcolor="#EEEEEE"    style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">项目名称</td>
				 <td align="left" bgcolor="#EEEEEE" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">客户名称</td>
				 <td align="left" bgcolor="#EEEEEE" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">最终客户</td>
				 <td align="left" bgcolor="#EEEEEE"  style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">负责人</td>
				 <td align="left" bgcolor="#EEEEEE"  style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">付款方式</td>
				  <td align="left" bgcolor="#EEEEEE"  style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">名称</td>
				  <td align="left" bgcolor="#EEEEEE"   style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">型号</td>
				  <td align="left" bgcolor="#EEEEEE"  style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">单价</td>
				  <td align="left" bgcolor="#EEEEEE"  style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">数量</td>
				  <td align="left" bgcolor="#EEEEEE"   style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">销售金额</td>
				  <td align="left" bgcolor="#EEEEEE"  style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">采购状态</td>
				  <td align="left" bgcolor="#EEEEEE"  style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;">采购金额</td>
	</tr>
	<tbody id="add_tbOrderDetail_table">	
	
	<c:if test="${fn:length(tbOrderDetailList)  > 0 }">
		<c:forEach items="${tbOrderDetailList}" var="poVal" varStatus="stuts">
			<tr>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbOrder.kxOrderNo }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbOrder.projectName }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbOrder.client }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbOrder.finalClient }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbOrder.principal }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.tbOrder.payment }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.name }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.type }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.price }</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.number}</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.totalprice }</label></td>
				    <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.status}</label></td>
				   <td align="left" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label >${poVal.purchaseprice }</label></td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>