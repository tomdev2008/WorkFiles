<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>销售合同</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  
  <script type="text/javascript">
  //初始化下标
	function resetTrNum(tableId) {
		$tbody = $("#"+tableId+"");
		$tbody.find('>tr').each(function(i){
			$(':input, select', this).each(function(){
				var $this = $(this), name = $this.attr('name'), val = $this.val();
				if(name!=null){
					if (name.indexOf("#index#") >= 0){
						$this.attr("name",name.replace('#index#',i));
					}else{
						var s = name.indexOf("[");
						var e = name.indexOf("]");
						var new_name = name.substring(s+1,e);
						$this.attr("name",name.replace(new_name,i));
					}
				}
			});
		});
	}
  
	
	
	function check(){
		var contractNo = $("#contractNo").val();
		$.ajax({
	    	url:'tbContractController.do?getContractByContractNo' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{'contractNo':contractNo},
	    	success:function(data) {
				if(data!=null){
					$("#contractNo").css("color","red");
				}else{
					$("#contractNo").css("color","black");
				}
	    	}
	    });
	}
 </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="tbContractController.do?save">
			<input id="id" name="id" type="hidden" value="${tbContractPage.id }">
			<table cellpadding="0" cellspacing="1" class="formtable">
			<tr>
			<td align="right"><label class="Validform_label" >合同编号:</label></td>
			<td class="value">
			<c:if test="${tbContractPage.contractNo!=null }">
			<input onblur="check()" nullmsg="请填写合同编号" errormsg="contrac格式不对" class="inputxt" id="contractNo" name="contractNo" datatype="*"
									   value="${tbContractPage.contractNo}" readonly="readonly">
								<span class="Validform_checktip"></span>
			</c:if>
			<c:if test="${tbContractPage.contractNo==null }">
				<input onblur="check()" nullmsg="请填写合同编号" errormsg="contrac格式不对" class="inputxt" id="contractNo" name="contractNo" datatype="*"
									   value="${tbContractPage.contractNo}">
								<span class="Validform_checktip"></span>
			</c:if>
			</td>
			<td align="right"><label class="Validform_label">合同金额:</label></td>
			<td class="value">
				<input nullmsg="请填写合同金额" errormsg="contrac格式不对" class="inputxt" id="contractPrice" name="contractPrice" datatype="*"
									   value="${tbContractPage.contractPrice}">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">开票日期:</label></td>
			<td class="value">
				<input nullmsg="请填写billing" errormsg="billing格式不对" class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="billingDate" name="billingDate" ignore="ignore"
									     value="<fmt:formatDate value='${tbContractPage.billingDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">到货款回款日期:</label></td>
			<td class="value">
				<input nullmsg="请填写daohuoP" errormsg="daohuoP格式不对" class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="daohuoPaymentDate" name="daohuoPaymentDate" ignore="ignore"
									     value="<fmt:formatDate value='${tbContractPage.daohuoPaymentDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">初验款回款日期:</label></td>
			<td class="value">
				<input nullmsg="请填写chuyanP" errormsg="chuyanP格式不对" class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="chuyanPaymentDate" name="chuyanPaymentDate" ignore="ignore"
									     value="<fmt:formatDate value='${tbContractPage.chuyanPaymentDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">终验款回款日期:</label></td>
			<td class="value">
				<input nullmsg="请填写zhongya" errormsg="zhongya格式不对" class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="zhongyanPaymentDate" name="zhongyanPaymentDate" ignore="ignore"
									     value="<fmt:formatDate value='${tbContractPage.zhongyanPaymentDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">合同归档日期:</label></td>
			<td class="value">
				<input nullmsg="请填写contrac" errormsg="contrac格式不对" class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="contractFilingDate" name="contractFilingDate" ignore="ignore"
									     value="<fmt:formatDate value='${tbContractPage.contractFilingDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			</td>
			<td align="right"><label class="Validform_label">合同签订日期:</label></td>
			<td class="value">
				<input nullmsg="请填写contrac" errormsg="contrac格式不对" class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="contractSigningDate" name="contractSigningDate" ignore="ignore"
									     value="<fmt:formatDate value='${tbContractPage.contractSigningDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label">备注:</label></td>
			<td class="value" colspan="3">
				<textarea style="width:90%;" nullmsg="请填写remark" errormsg="remark格式不对" id="remark" name="remark" ignore="ignore">${tbContractPage.remark}</textarea>
				<!--  <input nullmsg="请填写contrac" errormsg="contrac格式不对" class="inputxt" id="remark" name="remark" ignore="ignore"
									   value="${tbContractPage.remark}">-->
								<span class="Validform_checktip"></span>
			</td>
			
			</tr>
			</table>
			<div style="width: auto;height: 200px;">
				<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
				<div style="width:690px;height:1px;"></div>
				<t:tabs id="tt" iframe="false" tabPosition="top" fit="false">
				 <t:tab href="tbContractController.do?tbOrderList&id=${tbContractPage.id}" icon="icon-search" title="销售订单" id="tbOrder"></t:tab>
				</t:tabs>
			</div>
			</t:formvalid>
			<!-- 添加 产品明细 模版 -->
		<table style="display:none">
		<tbody id="add_tbOrder_table_template">
			<tr >
			 <td align="center"><input style="width:20px;" type="checkbox" name="ck"/></td>
				  <td align="left"><input name="tbOrderList[#index#].kxOrderNo" maxlength="16" onblur="getOrder(this)" type="text" style="width:120px;"></td>
				  <td align="left"><input name="tbOrderList[#index#].projectName" id="dd" maxlength="16" type="text" style="width:120px;"></td>
				  
				  <td align="left"><input name="tbOrderList[#index#].client" maxlength="16" type="text" style="width:120px;"></td>
				  <td align="left"><input name="tbOrderList[#index#].finalClient" maxlength="16" type="text" style="width:120px;"></td>
				  <td align="left"><input name="tbOrderList[#index#].payment" maxlength="33" type="text" style="width:120px;"></td>
				  <td align="left"><input name="tbOrderList[#index#].principal" maxlength="16" type="text" style="width:120px;"></td>
				  <td align="left"><input name="tbOrderList[#index#].totalPrice" maxlength="16" type="text" style="width:120px;"></td>
				  <td align="left"><input name="tbOrderList[#index#].remark" maxlength="85" type="text" style="width:120px;"></td>
			</tr>
		 </tbody>
		</table>
 </body>