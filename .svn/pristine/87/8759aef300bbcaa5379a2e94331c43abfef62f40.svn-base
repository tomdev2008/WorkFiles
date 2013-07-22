<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>固定资产表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbPermanentAssetsController.do?save">
			<input id="id" name="id" type="hidden" value="${tbPermanentAssetsPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							员工id:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="employeeId" name="employeeId" ignore="ignore"
							   value="${tbPermanentAssetsPage.employeeId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							资产编号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="number" name="number" ignore="ignore"
							   value="${tbPermanentAssetsPage.number}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							员工姓名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" ignore="ignore"
							   value="${tbPermanentAssetsPage.name}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							资产类型:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="accType" name="accType" ignore="ignore"
							   value="${tbPermanentAssetsPage.accType}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态
            1：使用中
            2：损坏
            3：库存:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="state" name="state" ignore="ignore"
							   value="${tbPermanentAssetsPage.state}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							购入时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="buyTime" name="buyTime" ignore="ignore"
							   value="<fmt:formatDate value='${tbPermanentAssetsPage.buyTime}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							资产价值:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="price" name="price" ignore="ignore"
							   value="${tbPermanentAssetsPage.price}" datatype="d">
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
						<input class="inputxt" id="remark" name="remark" ignore="ignore"
							   value="${tbPermanentAssetsPage.remark}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>