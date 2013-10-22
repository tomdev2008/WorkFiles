<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>产品库存</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbInventoryController.do?save">
			<input id="id" name="id" type="hidden" value="${tbInventoryPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品类别:
						</label>
					</td>
					<td class="value">
					<t:dictSelect field="category" typeGroupCode="seltype"   hasLabel="N" defaultVal="${tbInventoryPage.category}"></t:dictSelect>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							产品名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" ignore="ignore"
							   value="${tbInventoryPage.name}">
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
							   value="${tbInventoryPage.model}">
						<span class="Validform_checktip"></span>
					</td>
			
					<td align="right">
						<label class="Validform_label">
							配置:
						</label>
					</td>
					<td class="value">
					<textarea style="width:150px;"   id="configuration" name="configuration" ignore="ignore">${tbInventoryPage.configuration}</textarea>
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
							   value="${tbInventoryPage.num}">
						<span class="Validform_checktip"></span>
					</td>
			
					<td align="right">
						<label class="Validform_label">
							单位:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="unit" name="unit" ignore="ignore"
							   value="${tbInventoryPage.unit}">
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
							   value="<fmt:formatDate value='${tbInventoryPage.buydate}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							购置金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="buymoney" name="buymoney" ignore="ignore"
							   value="${tbInventoryPage.buymoney}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
				<td align="right">
						<label class="Validform_label">
							康讯订单号:
						</label>
					</td>
					<td class="value">
					<select id="kxorderno"  name="kxorderno"   >
							<option value="null">无</option>
					       <c:forEach items="${orderList}" var="temp">
					        <option value="${temp.kxOrderNo }" <c:if test="${temp.kxOrderNo==tbInventoryPage.kxorderno}">selected="selected"</c:if>>
					         ${temp.kxOrderNo}
					        </option>
					       </c:forEach>
				      	</select>
					</td>
					
					<td align="right">
						<label class="Validform_label">
							合同号:
						</label>
					</td>
					<td class="value">
					<select id="contractno"  name="contractno"   >
							<option value="null">无</option>
					       <c:forEach items="${contractList}" var="temp">
					        <option value="${temp.contractNo }" <c:if test="${temp.contractNo==tbInventoryPage.contractno}">selected="selected"</c:if>>
					         ${temp.contractNo}
					        </option>
					       </c:forEach>
				      	</select>
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
							   value="${tbInventoryPage.place}">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							盘存时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="inventorydate" name="inventorydate" ignore="ignore"
							   value="<fmt:formatDate value='${tbInventoryPage.inventorydate}' type="date" pattern="yyyy-MM-dd"/>">
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
							   value="${tbInventoryPage.users}">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							领用时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="usedate" name="usedate" ignore="ignore"
							   value="<fmt:formatDate value='${tbInventoryPage.usedate}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							领用数量:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="usenum" name="usenum" ignore="ignore"
							   value="${tbInventoryPage.usenum}">
						<span class="Validform_checktip"></span>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
					<textarea style="width:150px;"   id="remark" name="remark" ignore="ignore">${tbInventoryPage.remark}</textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
					<t:dictSelect field="status" typeGroupCode="inv_stat"   hasLabel="N" defaultVal="${tbInventoryPage.status}"></t:dictSelect>
					</td>
				
					<td align="right">
						<label class="Validform_label">
							出库时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="outdate" name="outdate" ignore="ignore"
							   value="<fmt:formatDate value='${tbInventoryPage.outdate}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							出库编号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="outno" name="outno" ignore="ignore"
							   value="${tbInventoryPage.outno}">
						<span class="Validform_checktip"></span>
					</td>
			
					<td align="right">
						<label class="Validform_label">
							出库用途:
						</label>
					</td>
					<td class="value">
					<textarea style="width:150px;"   id="outdescribe" name="outdescribe" ignore="ignore">${tbInventoryPage.outdescribe}</textarea>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>