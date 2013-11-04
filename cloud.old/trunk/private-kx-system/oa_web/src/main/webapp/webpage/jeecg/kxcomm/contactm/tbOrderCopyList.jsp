<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addTbOrderCopyBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delTbOrderCopyBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addTbOrderCopyBtn').bind('click', function(){   
 		 var tr =  $("#add_tbOrderCopy_table_template tr").clone();
	 	 $("#add_tbOrderCopy_table").append(tr);
	 	 resetTrNum('add_tbOrderCopy_table');
    });  
	$('#delTbOrderCopyBtn').bind('click', function(){   
      	$("#add_tbOrderCopy_table").find("input:checked").parent().parent().remove();   
        resetTrNum('add_tbOrderCopy_table'); 
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    });
    
   
    
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addTbOrderCopyBtn" href="#">添加</a> <a id="delTbOrderCopyBtn" href="#">删除</a> 
</div>
<div style="width: auto;height: 135px;overflow-y:auto;overflow-x:scroll;">
<table border="0" cellpadding="2" cellspacing="0" id="tbOrderCopy_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE">序号</td>
				  <td align="left" bgcolor="#EEEEEE">kxOrder</td>
				  <td align="left" bgcolor="#EEEEEE">project</td>
				  <td align="left" bgcolor="#EEEEEE">contrac</td>
				  <td align="left" bgcolor="#EEEEEE">client</td>
				  <td align="left" bgcolor="#EEEEEE">finalCl</td>
				  <td align="left" bgcolor="#EEEEEE">payment</td>
				  <td align="left" bgcolor="#EEEEEE">princip</td>
				  <td align="left" bgcolor="#EEEEEE">remark</td>
	</tr>
	<tbody id="add_tbOrderCopy_table">	
	<c:if test="${fn:length(tbOrderCopyList)  <= 0 }">
			<!--  <tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
				  <td align="left"><input name="tbOrderCopyList[0].kxOrderNo" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderCopyList[0].projectName" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderCopyList[0].contractNo" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderCopyList[0].client" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderCopyList[0].finalClient" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderCopyList[0].payment" maxlength="33" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderCopyList[0].principal" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderCopyList[0].remark" maxlength="85" type="text" style="width:120px;" ></td>
   			</tr>-->
	</c:if>
	<c:if test="${fn:length(tbOrderCopyList)  > 0 }">
		<c:forEach items="${tbOrderCopyList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].kxOrderNo" maxlength="16" value="${poVal.kxOrderNo }" onblur="getOrder(this)" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].projectName" maxlength="16" value="${poVal.projectName }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].contractNo" maxlength="16" value="${poVal.contractNo }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].client" maxlength="16" value="${poVal.client }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].finalClient" maxlength="16" value="${poVal.finalClient }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].payment" maxlength="33" value="${poVal.payment }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].principal" maxlength="16" value="${poVal.principal }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderCopyList[${stuts.index }].remark" maxlength="85" value="${poVal.remark }" type="text" style="width:120px;"></td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>