<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>固定资产</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbPermanentAssetsController.do?save">
			<input id="id" name="id" type="hidden" value="${tbPermanentAssetsPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							固定资产类别:
						</label>
					</td>
					<td class="value">
					<t:dictSelect field="category" typeGroupCode="per_type"   hasLabel="N" defaultVal="${tbPermanentAssetsPage.category}"></t:dictSelect>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							固定资产名称:
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
							规格型号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="model" name="model" ignore="ignore"
							   value="${tbPermanentAssetsPage.model}">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							配置:
						</label>
					</td>
					<td class="value">
					<textarea id="configuration" name="configuration" ignore="ignore"  style="width: 150px;">${tbPermanentAssetsPage.configuration}</textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							数量:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="num" name="num" ignore="ignore"
							   value="${tbPermanentAssetsPage.num}">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							单位:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="unit" name="unit" ignore="ignore"
							   value="${tbPermanentAssetsPage.unit}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							购置日期:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="buydate" name="buydate" ignore="ignore"
							   value="<fmt:formatDate value='${tbPermanentAssetsPage.buydate}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							购置金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="buymoney" name="buymoney" ignore="ignore"
							   value="${tbPermanentAssetsPage.buymoney}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							所在地点:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="place" name="place" ignore="ignore"
							   value="${tbPermanentAssetsPage.place}">
						<span class="Validform_checktip"></span>
					</td>
			
					<td align="right">
						<label class="Validform_label">
							盘存时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="inventorydate" name="inventorydate" ignore="ignore"
							   value="<fmt:formatDate value='${tbPermanentAssetsPage.inventorydate}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							领用人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="users" name="users" ignore="ignore"
							   value="${tbPermanentAssetsPage.users}">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							领用时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="usedate" name="usedate" ignore="ignore"
							   value="<fmt:formatDate value='${tbPermanentAssetsPage.usedate}' type="date" pattern="yyyy-MM-dd"/>">
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
						<textarea id="remark" name="remark" ignore="ignore"  style="width: 150px;">${tbPermanentAssetsPage.remark}</textarea>
						
					</td>
					<td align="right">
						
					</td>
					<td class="value">
						
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>