<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbOrgenController.do?save">
			<input id="id" name="id" type="hidden" value="${tbOrgenPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							机构名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="permName" name="permName" ignore="ignore"
							   value="${tbOrgenPage.permName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							联系电话:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orgenPhone" name="orgenPhone" ignore="ignore"
							   value="${tbOrgenPage.orgenPhone}">
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
						<input class="inputxt" id="place" name="place" ignore="ignore"
							   value="${tbOrgenPage.place}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							类型:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="type" name="type" ignore="ignore"
							   value="${tbOrgenPage.type}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							成立时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="createTime" name="createTime" ignore="ignore"
							   value="<fmt:formatDate value='${tbOrgenPage.createTime}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							上级机构:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="parentOrgen" name="parentOrgen" ignore="ignore"
							   value="${tbOrgenPage.parentOrgen}" datatype="n">
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
							   value="${tbOrgenPage.number}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							手机号码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="tellPhone" name="tellPhone" ignore="ignore"
							   value="${tbOrgenPage.tellPhone}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							税务登记证:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="businessLicenseNo" name="businessLicenseNo" ignore="ignore"
							   value="${tbOrgenPage.businessLicenseNo}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							开户行名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="bankName" name="bankName" ignore="ignore"
							   value="${tbOrgenPage.bankName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							营业执照:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="taxRegistrationCertificate" name="taxRegistrationCertificate" ignore="ignore"
							   value="${tbOrgenPage.taxRegistrationCertificate}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>