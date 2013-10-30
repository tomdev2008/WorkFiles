<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>销售发票管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  	function queryContractInfoById() {
  		var codsid = $("#contractId.id").val();
  		$.ajax({
	    	url:'tbInvoiceController.do?queryContractInfoById' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{'codsid':codsid},
	    	success:function(data) {
				if(data!=null){
				}
	    	}
	    });
  	}
  //判断是新增还是修改
    function checkAddOrUpdate() {
  	  var endid = '${tbInvoicePage.id }';
  		if(null != endid && "" != endid) {
  			var taxType = '${tbInvoicePage.taxType}';
  			var purchaseCompanyId = '${tbInvoicePage.purchaseCompanyId}';
  			var contractId = '${tbInvoicePage.contractId.id}';
  			var customerId = '${tbInvoicePage.customerId.id}';
  			$("#contractId.id").val(contractId);
  			$("#taxType").val(taxType);
  			$("#purchaseCompanyId").val(purchaseCompanyId);
  			$("#customerId.id").val(customerId);
  		}
    }
  </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbInvoiceController.do?save">
			<input id="id" name="id" type="hidden" value="${tbInvoicePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label" >
							合同:
						</label>
					</td>
					<td class="value">
						<select id="contractId.id"  name="contractId.id" datatype="*" onchange="queryContractInfoById();">
					       <c:forEach items="${contractList}" var="temp">
					        <option value="${temp.id }">
					         ${temp.contractName}
					        </option>
					       </c:forEach>
				      	</select>
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td align="right"> -->
<!-- 						<label class="Validform_label"> -->
<!-- 							发票状态：1.已接收	；2.未接收: -->
<!-- 						</label> -->
<!-- 					</td> -->
<!-- 					<td class="value"> -->
<!-- 						<input class="inputxt" id="status" name="status" ignore="ignore" -->
<%-- 							   value="${tbInvoicePage.status}"> --%>
<!-- 						<span class="Validform_checktip"></span> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td align="right">
						<label class="Validform_label">
							增值税类型:
						</label>
					</td>
					<td class="value">
						<select id="taxType"  name="taxType" datatype="*">
					        <option value="1" >增值税普通发票</option>
					        <option value="2" >增值税专用发票</option>
				      	</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							创建时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="createTime" name="createTime" ignore="ignore"
							   value="<fmt:formatDate value='${tbInvoicePage.createTime}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							公司名称：
						</label>
					</td>
					<td class="value">
						<select id="purchaseCompanyId"  name="purchaseCompanyId" datatype="*">
					        <option value="1" >北京市康讯通讯设备有限公司</option>
					        <option value="2" >北京云上云天信息技术有限公司</option>
				      	</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							客户:
						</label>
					</td>
					<td class="value">
						<select id="customerId.id"  name="customerId.id" datatype="*">
					       <c:forEach items="${customerList}" var="temps">
					        <option value="${temps.id }">
					         ${temps.companyName}
					        </option>
					       </c:forEach>
				      	</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="amount" name="amount" ignore="ignore"
							   value="${tbInvoicePage.amount}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>
 <script type="text/javascript">
 checkAddOrUpdate();
 </script>