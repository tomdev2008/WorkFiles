<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>采购订单</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 <script type="text/javascript">
 	function sum(){
 		var num = $("#number").val();
 		var price = $("#unitPrice").val();
 		var sum =price*num;
 		$("#totalPrice").val(sum);
 	}
 </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbPurchaseController.do?save">
			<input id="id" name="id" type="hidden" value="${tbPurchasePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							区域:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="area" name="area" datatype="*"
							   value="${tbPurchasePage.area}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<!--<tr>
					<td align="right">
						<label class="Validform_label">
							采购合同号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="purchaseContractNo" name="purchaseContractNo" ignore="ignore"
							   value="${tbPurchasePage.tbPurchaseContract.contractNo}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>  -->
				<tr>
					<td align="right">
						<label class="Validform_label">
							供应商:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="supplier" name="supplier" datatype="*"
							   value="${tbPurchasePage.supplier}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							商品名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="productName" name="productName" datatype="*"
							   value="${tbPurchasePage.productName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							型号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="model" name="model" datatype="*"
							   value="${tbPurchasePage.model}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							数量:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="number" name="number" ignore="ignore"
							   value="${tbPurchasePage.number}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							采购单价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="unitPrice" name="unitPrice" ignore="ignore"
							   value="${tbPurchasePage.unitPrice}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							采购总价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="totalPrice" name="totalPrice" onfocus="sum()" ignore="ignore"
							   value="${tbPurchasePage.totalPrice}" readonly="readonly">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							采购人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="purchaser" name="purchaser" ignore="ignore"
							     value="${purchaser}" readonly="readonly">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							预计到货日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="predictArrivalDate" name="predictArrivalDate" ignore="ignore"
							     value="<fmt:formatDate value='${tbPurchasePage.predictArrivalDate}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							下单日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="placeOrderDate" name="placeOrderDate" ignore="ignore"
							     value="<fmt:formatDate value='${tbPurchasePage.placeOrderDate}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							发票日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="invoiceDate" name="invoiceDate" ignore="ignore"
							     value="<fmt:formatDate value='${tbPurchasePage.invoiceDate}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							发票备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="invoiceRemark" name="invoiceRemark" ignore="ignore"
							   value="${tbPurchasePage.invoiceRemark}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							付款日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="paymentDate" name="paymentDate" ignore="ignore"
							     value="<fmt:formatDate value='${tbPurchasePage.paymentDate}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							查询单号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="inquireNo" name="inquireNo" ignore="ignore"
							   value="${tbPurchasePage.inquireNo}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							机型服务编号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="typeServiceNo" name="typeServiceNo" ignore="ignore"
							   value="${tbPurchasePage.typeServiceNo}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						<textarea style="width:90%;" nullmsg="请填写remark" errormsg="remark格式不对" id="remark" name="remark" ignore="ignore">${tbPurchasePage.remark}</textarea>
						<!-- <input class="inputxt" id="remark" name="remark" ignore="ignore"
							   value="${tbPurchasePage.remark}"> -->
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					
					<td class="value" colspan="2">
						<input class="inputxt" id="orderDetailId" type="hidden" name="orderDetailId" ignore="ignore"
							   value="${id}">
						
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>