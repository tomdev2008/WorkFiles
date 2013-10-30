<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>合同回款</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbContractReceiveMoneyController.do?save">
			<input id="id" name="id" type="hidden" value="${tbContractReceiveMoneyPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							合同编号:
						</label>
					</td>
					<td class="value">
						<select id="tbContract.id"  name="tbContract.id"   datatype="*">
					       <c:forEach items="${contractList}" var="temp">
					        <option value="${temp.id }" <c:if test="${temp.id==tbContractReceiveMoneyPage.tbContract.id}">selected="selected"</c:if>>
					         ${temp.contractNo}
					        </option>
					       </c:forEach>
				      	</select>
						
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							回款金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="receiveMoney" name="receiveMoney" ignore="ignore"
							   value="${tbContractReceiveMoneyPage.receiveMoney}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							回款日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="receivedate" name="receivedate" ignore="ignore"
							   value="<fmt:formatDate value='${tbContractReceiveMoneyPage.receivedate}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							未回款金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="notReceiveMoney" name="notReceiveMoney" ignore="ignore"
							   value="${tbContractReceiveMoneyPage.notReceiveMoney}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							回款备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="remark" name="remark" ignore="ignore"
							   value="${tbContractReceiveMoneyPage.remark}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							回款分类:
						</label>
					</td>
					<td class="value">
					<t:dictSelect field="moneyType" typeGroupCode="montype"  title="回款类型"  hasLabel="N" defaultVal="${tbContractReceiveMoneyPage.moneyType}"></t:dictSelect>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>