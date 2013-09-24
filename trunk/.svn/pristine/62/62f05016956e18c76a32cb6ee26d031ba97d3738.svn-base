<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>客户</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbCustomerEntityController.do?save">
			<input id="id" name="id" type="hidden" value="${tbCustomerEntityPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr style="display: none;">
					<td align="right">
						<label class="Validform_label">
							主键ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="customerId" name="customerId" 
							   value="${tbCustomerEntityPage.customerId}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="address" name="address" ignore="ignore"
							   value="${tbCustomerEntityPage.address}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							公司名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="companyName" name="companyName" ignore="ignore"
							   value="${tbCustomerEntityPage.companyName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							描述:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="description" name="description" ignore="ignore"
							   value="${tbCustomerEntityPage.description}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							联系人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="contact" name="contact" ignore="ignore"
							   value="${tbCustomerEntityPage.contact}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							邮箱:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="email" name="email" ignore="ignore"
							   value="${tbCustomerEntityPage.email}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							电话:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="phone" name="phone" ignore="ignore"
							   value="${tbCustomerEntityPage.phone}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							收货地址ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="jobPlaceId" name="jobPlaceId" ignore="ignore"
							   value="${tbCustomerEntityPage.jobPlaceId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>