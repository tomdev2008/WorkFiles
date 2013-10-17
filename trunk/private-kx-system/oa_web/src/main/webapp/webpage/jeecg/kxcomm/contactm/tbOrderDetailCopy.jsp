<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>销售订单明细</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table"  action="tbOrderDetailController.do?save"  refresh="true" tiptype="1">
			<input id="id" name="id" type="hidden" value="${tbOrderDetailCopyPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							康讯订单号:
						</label>
					</td>
					<td class="value">
					<label>${tbOrderDetailCopyPage.tbOrder.kxOrderNo}</label>
					</td>
					
					<td align="right">
						<label class="Validform_label">
							项目名称:
						</label>
					</td>
					<td class="value">
					<label>${tbOrderDetailCopyPage.tbOrder.projectName}</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							最终客户:
						</label>
					</td>
					<td class="value">
					<label>${tbOrderDetailCopyPage.tbOrder.finalClient}</label>
					</td>
					
					<td align="right">
						<label class="Validform_label">
							数量:
						</label>
					</td>
					<td class="value">
					<label>${tbOrderDetailCopyPage.number}</label>
					</td>
					
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							商品名称:
						</label>
					</td>
					<td class="value">
					<label>${tbOrderDetailCopyPage.name}</label>
					</td>
					
					<td align="right">
						<label class="Validform_label">
							型号:
						</label>
					</td>
					<td class="value">
					<label>${tbOrderDetailCopyPage.type}</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							负责人:
						</label>
					</td>
					<td class="value">
					<label>${tbOrderDetailCopyPage.tbOrder.principal}</label>
					</td>
					
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
					<t:dictSelect field="status" typeGroupCode="status"  title="状态"  hasLabel="N" defaultVal="${tbOrderDetailCopyPage.status}"></t:dictSelect>
					</td>
				</tr>
				
			</table>
			<div align="right"><button class="Validform_label"  >确定</button></div>
			
		</t:formvalid>
 </body>