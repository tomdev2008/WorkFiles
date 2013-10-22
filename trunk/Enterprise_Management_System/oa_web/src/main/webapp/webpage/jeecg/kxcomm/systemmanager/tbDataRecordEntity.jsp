<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>数据源详情</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="tbDataRecordEntityController.do?save">
			<input id="id" name="id" type="hidden" value="${tbDataRecordEntityPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属数据源:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.tbDataSource.sourcename}</label>
				     </td>
				     
				     <td align="right">
						<label class="Validform_label">
							产品类型:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.tbProductType.producttypename}</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品订货号:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.productorderno}</label>
					</td>
					
					<td align="right">
						<label class="Validform_label">
							产品描述:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.productdesc}</label>
						
					</td>
				</tr>
				
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品数量:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.quantity}</label>
						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							单价:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.unitprice}</label>
						
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							折扣率 (%):
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.discountrate}</label>
						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							运保及其他费率 (%):
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.otherrates}</label>
						
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							安装服务费:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.installservicecharge}</label>
						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							第一年保修费:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.firstyear}</label>
						
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							第二年保修费:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.secondyear}</label>
						
					</td>
					
					<td align="right">
						<label class="Validform_label">
							第三年保修费:
						</label>
					</td>
					<td class="value">
						<label>${tbDataRecordEntityPage.thirdyear}</label>
						
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品备注:
						</label>
					</td>
					<td class="value" colspan="3">
						<textarea style="width:90%;height:80px;" id="remark" name="remark" ignore="ignore" readonly="readonly">${tbDataRecordEntityPage.remark}</textarea>
						
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>