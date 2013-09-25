<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机型配置</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbConfigModelsController.do?save">
			<input id="id" name="id" type="hidden" value="${tbConfigModelsPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="configId" name="configId" 
							   value="${tbConfigModelsPage.configId}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							折扣后现场价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="afterDiscountNowPrice" name="afterDiscountNowPrice" ignore="ignore"
							   value="${tbConfigModelsPage.afterDiscountNowPrice}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							折扣后价格:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="afterDiscountPrice" name="afterDiscountPrice" ignore="ignore"
							   value="${tbConfigModelsPage.afterDiscountPrice}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							目录合价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="catalogTotalPrice" name="catalogTotalPrice" ignore="ignore"
							   value="${tbConfigModelsPage.catalogTotalPrice}">
						<span class="Validform_checktip"></span>
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
							   value="<fmt:formatDate value='${tbConfigModelsPage.createTime}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" ignore="ignore"
							   value="${tbConfigModelsPage.name}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="status" name="status" ignore="ignore"
							   value="${tbConfigModelsPage.status}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							总价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="totalPrice" name="totalPrice" ignore="ignore"
							   value="${tbConfigModelsPage.totalPrice}">
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
							   value="${tbConfigModelsPage.type}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							创建者ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="creatorId" name="creatorId" ignore="ignore"
							   value="${tbConfigModelsPage.creatorId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>