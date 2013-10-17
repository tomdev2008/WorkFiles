<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>数据源详情</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbDataRecordEntityController.do?save">
			<input id="id" name="id" type="hidden" value="${tbDataRecordEntityPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属数据源:
						</label>
					</td>
					<td class="value">
					<select id="dataSourceId"  name="dataSourceId"   datatype="*">
							
					       <c:forEach items="${tbDataSourceList}" var="temp">
					        <option value="${temp.id }" >
					         ${temp.sourcename}
					        </option>
					       </c:forEach>
				      	</select>
				     </td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品类型:
						</label>
					</td>
					<td class="value">
						<select id="typeId"  name="typeId"   datatype="*">
							
					       <c:forEach items="${tbProductTypeList}" var="temp">
					        <option value="${temp.id }" >
					         ${temp.producttypename}
					        </option>
					       </c:forEach>
				      	</select>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品订货号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="productorderno" name="productorderno" ignore="ignore"
							   value="${tbDataRecordEntityPage.productorderno}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品描述:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="productdesc" name="productdesc" ignore="ignore"
							   value="${tbDataRecordEntityPage.productdesc}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品数量:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="quantity" name="quantity" ignore="ignore"
							   value="${tbDataRecordEntityPage.quantity}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单价:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="unitprice" name="unitprice" ignore="ignore"
							   value="${tbDataRecordEntityPage.unitprice}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							折扣率:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="discountrate" name="discountrate" ignore="ignore"
							   value="${tbDataRecordEntityPage.discountrate}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							运保及其他费率:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="otherrates" name="otherrates" ignore="ignore"
							   value="${tbDataRecordEntityPage.otherrates}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							安装服务费:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="installservicecharge" name="installservicecharge" ignore="ignore"
							   value="${tbDataRecordEntityPage.installservicecharge}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							第一年保修复:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="firstyear" name="firstyear" ignore="ignore"
							   value="${tbDataRecordEntityPage.firstyear}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							第二年保修费:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="secondyear" name="secondyear" ignore="ignore"
							   value="${tbDataRecordEntityPage.secondyear}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							第三年保修费:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="thirdyear" name="thirdyear" ignore="ignore"
							   value="${tbDataRecordEntityPage.thirdyear}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							产品备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="remark" name="remark" ignore="ignore"
							   value="${tbDataRecordEntityPage.remark}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>