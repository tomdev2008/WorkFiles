<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div style="width: auto;height: 560px;overflow-y:auto;overflow-x:scroll;">
<table border="0" cellpadding="2" cellspacing="0" id="tbOrderDetail_table">
	<tr bgcolor="#E6E6E6">
		
				  <td align="left" bgcolor="#EEEEEE">名称</td>
				  <td align="left" bgcolor="#EEEEEE">型号</td>
				  <td align="left" bgcolor="#EEEEEE">单价</td>
				  <td align="left" bgcolor="#EEEEEE">数量</td>
				  <td align="left" bgcolor="#EEEEEE">金额</td>
	</tr>
	<tbody id="add_tbOrderDetail_table">	
	<c:if test="${fn:length(tbOrderDetailList)  <= 0 }">
			<tr>
				
				  <td align="left"><input name="tbOrderDetailList[0].name" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].type" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].price" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].number" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].totalprice" maxlength="85" type="text" style="width:120px;" ></td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(tbOrderDetailList)  > 0 }">
		<c:forEach items="${tbOrderDetailList}" var="poVal" varStatus="stuts">
			<tr>

				   <td align="left"><input name="tbOrderDetailList[${stuts.index }].name" maxlength="85" value="${poVal.name }" type="text" style="width:120px;" readonly="readonly"></td>
				   <td align="left"><input name="tbOrderDetailList[${stuts.index }].type" maxlength="85" value="${poVal.type }" type="text" style="width:120px;" readonly="readonly"></td>
				   <td align="left"><input name="tbOrderDetailList[${stuts.index }].price" maxlength="85" value="${poVal.price }" type="text" style="width:120px;" readonly="readonly"></td>
				   <td align="left"><input name="tbOrderDetailList[${stuts.index }].number" maxlength="85" value="${poVal.number }" type="text" style="width:120px;" readonly="readonly"></td>
				   <td align="left"><input name="tbOrderDetailList[${stuts.index }].totalprice" maxlength="85" value="${poVal.totalprice }" type="text" style="width:120px;" readonly="readonly"></td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>