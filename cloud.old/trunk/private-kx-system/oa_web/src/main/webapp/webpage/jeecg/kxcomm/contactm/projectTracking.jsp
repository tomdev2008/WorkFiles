<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>项目跟踪详情</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table"  >
			<input id="id" name="id" type="hidden" value="${tbPurchasePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							责任人:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.principal}						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							区域:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.area}	
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							康讯订单号:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.kxOrderNo}						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							最终客户:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.finalClient}	
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							项目名称:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.projectName}						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							供应商:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.supplier}	
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							商品名称:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.productName}						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							型号:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.model}	
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							数量:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.number}						
					</td>
					
					<td align="right">
						<label class="Validform_label" >
							下单日期:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.placeOrderDate}	
					</td>
				</tr>
						<tr>
					<td align="right">
						<label class="Validform_label">
							预计到货日期:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.predictArrivalDate}						
					</td>
					
					<td align="right">
						<label class="Validform_label" >
							合同签订日期:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.tbContract.contractSigningDate}	
					</td>
				</tr>
					<tr>
					<td align="right">
						<label class="Validform_label" >
							合同号:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.tbContract.contractNo}	
					</td>
					<td align="right">
						<label class="Validform_label" >
							项目总金额:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.tbContract.contractPrice}	
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							销售单价:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.price}						
					</td>
					<td align="right">
						<label class="Validform_label">
							采购单价:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.unitPrice}						
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							销售总价:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.totalprice}						
					</td>
					<td align="right">
						<label class="Validform_label">
							采购总价:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.purchaseprice}						
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							开票日期:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.tbContract.billingDate}						
					</td>
					
					<td align="right">
						<label class="Validform_label" >
							合同归档日期:
						</label>
					</td>
					<td class="value">
						${tbPurchasePage.tbOrderDetail.tbOrder.tbContract.contractFilingDate}	
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>