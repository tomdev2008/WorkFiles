<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    });
</script>
<div style="padding: 3px; height: 1px;width:auto;" class="datagrid-toolbar">
	 
</div>
<div style="width: auto;height: 135px;overflow-y:auto;overflow-x:scroll;">
<table border="0" cellpadding="2" cellspacing="0" id="tbPurchaseCopy_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE">序号</td>
				  <td align="center" bgcolor="#EEEEEE">区域</td>
				  <td></td>
				  <td align="center" bgcolor="#EEEEEE">供应商</td>
				  <td align="center" bgcolor="#EEEEEE">商品名称</td>
				  <td align="center" bgcolor="#EEEEEE">型号</td>
				  <td align="center" bgcolor="#EEEEEE">数量</td>
				  <td align="center" bgcolor="#EEEEEE">采购单价</td>
				  <td align="center" bgcolor="#EEEEEE">采购总价</td>
				  <td align="center" bgcolor="#EEEEEE">采购人</td>
				  <td align="center" bgcolor="#EEEEEE">预计到货日期</td>
				  <td align="center" bgcolor="#EEEEEE">下单日期</td>
				  <td align="center" bgcolor="#EEEEEE">发票日期</td>
				  <td align="center" bgcolor="#EEEEEE">发票备注</td>
				  <td align="center" bgcolor="#EEEEEE">付款日期</td>
				  <td align="center" bgcolor="#EEEEEE">查询单号</td>
				  <td align="center" bgcolor="#EEEEEE">机型服务编号</td>
				  <td align="center" bgcolor="#EEEEEE">备注</td>
	</tr>
	<tbody id="add_tbPurchaseCopy_table">	
	<c:if test="${fn:length(tbPurchaseList)  <= 0 }">
			<!--<tr>
				  
				  <td align="left"><input name="tbPurchaseCopyList[0].area" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].purchaseContractNo" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].supplier" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].productName" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].model" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].number" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].unitPrice" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].totalPrice" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].purchaser" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].predictArrivalDate" maxlength="" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].placeOrderDate" maxlength="" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].invoiceDate" maxlength="" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].invoiceRemark" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].paymentDate" maxlength="" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].inquireNo" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].typeServiceNo" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbPurchaseCopyList[0].remark" maxlength="33" type="text" style="width:120px;" ></td> 
   			</tr>-->
	</c:if>
	<c:if test="${fn:length(tbPurchaseList)  > 0 }">
		<c:forEach items="${tbPurchaseList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].area" maxlength="16" value="${poVal.area }" type="text" style="width:120px;"></td>
				   <td><input name="tbPurchaseList[${stuts.index }].id" value="${poVal.id }" type="hidden"/></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].supplier" maxlength="16" value="${poVal.supplier }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].productName" maxlength="16" value="${poVal.productName }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].model" maxlength="16" value="${poVal.model }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].number" maxlength="16" value="${poVal.number }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].unitPrice" maxlength="16" value="${poVal.unitPrice }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].totalPrice" maxlength="16" value="${poVal.totalPrice }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].purchaser" maxlength="85" value="${poVal.purchaser }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].predictArrivalDate" maxlength="" value="${poVal.predictArrivalDate }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].placeOrderDate" maxlength="" value="${poVal.placeOrderDate }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].invoiceDate" maxlength="" value="${poVal.invoiceDate }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].invoiceRemark" maxlength="16" value="${poVal.invoiceRemark }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].paymentDate" maxlength="" value="${poVal.paymentDate }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].inquireNo" maxlength="16" value="${poVal.inquireNo }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].typeServiceNo" maxlength="16" value="${poVal.typeServiceNo }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbPurchaseList[${stuts.index }].remark" maxlength="33" value="${poVal.remark }" type="text" style="width:120px;"></td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>