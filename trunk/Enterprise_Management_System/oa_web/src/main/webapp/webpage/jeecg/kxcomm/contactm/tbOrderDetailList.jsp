<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<script type="text/javascript">
	$('#addTbOrderDetailBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delTbOrderDetailBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addTbOrderDetailBtn').bind('click', function(){   
 		 var tr =  $("#add_tbOrderDetail_table_template tr").clone();
	 	 $("#add_tbOrderDetail_table").append(tr);
	 	 resetTrNum('add_tbOrderDetail_table');
    });  
	$('#delTbOrderDetailBtn').bind('click', function(){   
      	$("#add_tbOrderDetail_table").find("input:checked").parent().parent().remove();   
        resetTrNum('add_tbOrderDetail_table'); 
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
		
    });
    
    
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addTbOrderDetailBtn" href="#">添加</a> <a id="delTbOrderDetailBtn" href="#">删除</a> 
</div>
<div style="width: auto;height: 150px;overflow-y:auto;overflow-x:scroll;">
<table border="0" cellpadding="2" cellspacing="0" id="tbOrderDetail_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE">序号</td>
		<td align="center" bgcolor="#EEEEEE"></td>
		<td align="center" bgcolor="#EEEEEE">名称</td>
		<td align="center" bgcolor="#EEEEEE">型号</td>
		<td align="center" bgcolor="#EEEEEE">单价</td>
		<td align="center" bgcolor="#EEEEEE">数量</td>
		<td align="center" bgcolor="#EEEEEE">金额</td>
	</tr>
	<tbody id="add_tbOrderDetail_table">	
	<c:if test="${fn:length(tbOrderDetailList)  <= 0 }">
			<!--<tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
				  <td align="left"><input name="tbOrderDetailList[0].name" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].type" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].price" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].number" maxlength="85" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderDetailList[0].totalprice" maxlength="85" type="text" style="width:120px;" onfocus="insertSum();"></td>
   			</tr>  -->
	</c:if>
	<c:if test="${fn:length(tbOrderDetailList)  > 0 }">
		<c:forEach items="${tbOrderDetailList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
				<td align="center"><input name="tbOrderDetailList[${stuts.index }].id" maxlength="85" value="${poVal.id }" type="hidden"></td>
				<td align="center">
				<t:dictSelect field="tbOrderDetailList[${stuts.index }].name"  typeGroupCode="seltype"  hasLabel="N" defaultVal="${poVal.name }"></t:dictSelect>
				</td>
				<td align="center"><input name="tbOrderDetailList[${stuts.index }].type" maxlength="85" value="${poVal.type }" type="text" style="width:120px;"/></td>
				<td align="center"><input name="tbOrderDetailList[${stuts.index }].price" maxlength="85" value="${poVal.price }" type="text" style="width:120px;" ></td>
				<td align="center"><input name="tbOrderDetailList[${stuts.index }].number" maxlength="85" value="${poVal.number }" type="text" style="width:120px;" /></td>
				<td align="center"><input name="tbOrderDetailList[${stuts.index }].totalprice" maxlength="85" value="${poVal.totalprice }" type="text" readonly="readonly" style="width:120px;" onfocus="getSum(this);"/></td>
   			</tr>
   			
		</c:forEach>
			
	</c:if>
	
	</tbody>
</table>
</div>
