<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
function getOrder(object){
    var kxOrderNo = $(object).val();
    	
    $.ajax({
    	url:'tbOrderController.do?getOrderByKxOrderNo' , // 可以获取数据的接口
    	dataType:"json",
    	data:{'kxOrderNo':kxOrderNo},
    	success:function(data) {
			if(data!=null){
				var tt = $("input[name='"+object.name+"']").parent().parent();
				$(tt.find("input")[1]).val(data[0].kxOrderNo);
				$(tt.find("input")[2]).val(data[0].projectName);
    			$(tt.find("input")[3]).val(data[0].client);
    			$(tt.find("input")[4]).val(data[0].finalClient);
    			$(tt.find("input")[5]).val(data[0].payment);
    			$(tt.find("input")[6]).val(data[0].principal);
    			$(tt.find("input")[7]).val(data[0].totalPrice);
    			$(tt.find("input")[8]).val(data[0].remark);
    			
				for( i=1;i<data.length;i++){
					 var tr =  $("#add_tbOrder_table_template tr").clone();
				 	 $("#add_tbOrder_table").append(tr);
				 	 resetTrNum('add_tbOrder_table');
				 	var tt =tr;
				 	    $(tt.find("input")[1]).val(data[i].kxOrderNo);
			            $(tt.find("input")[2]).val(data[i].projectName);
		    			$(tt.find("input")[3]).val(data[i].client);
		    			$(tt.find("input")[4]).val(data[i].finalClient);
		    			$(tt.find("input")[5]).val(data[i].payment);
		    			$(tt.find("input")[6]).val(data[i].principal);
		    			$(tt.find("input")[7]).val(data[i].totalPrice);
		    			$(tt.find("input")[8]).val(data[i].remark);
				}
			}else{  	
				alert("订单号有误");
				return false;
			}
    	}
    			 
    });    	
 }

	$('#addTbOrderBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delTbOrderBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addTbOrderBtn').bind('click', function(){   
 		 var tr =  $("#add_tbOrder_table_template tr").clone();
	 	 $("#add_tbOrder_table").append(tr);
	 	 resetTrNum('add_tbOrder_table');
    });  
	$('#delTbOrderBtn').bind('click', function(){   
      	$("#add_tbOrder_table").find("input:checked").parent().parent().remove();   
        resetTrNum('add_tbOrder_table'); 
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addTbOrderBtn" href="#">添加</a> <a id="delTbOrderBtn" href="#">删除</a> 
</div>
<div style="width: auto;height: 250px;overflow-y:auto;overflow-x:scroll;">
<table border="0" cellpadding="2" cellspacing="0" id="tbOrder_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE">序号</td>
				  <td align="left" bgcolor="#EEEEEE">康讯订单号</td>
				  <td align="left" bgcolor="#EEEEEE">项目名称</td>
				  
				  <td align="left" bgcolor="#EEEEEE">客户名称</td>
				  <td align="left" bgcolor="#EEEEEE">最终客户</td>
				  <td align="left" bgcolor="#EEEEEE">付款方式</td>
				  <td align="left" bgcolor="#EEEEEE">项目负责人</td>
				  <td align="left" bgcolor="#EEEEEE">订单总价</td>
				  <td align="left" bgcolor="#EEEEEE">备注</td>
	</tr>
	<tbody id="add_tbOrder_table">	
	<c:if test="${fn:length(tbOrderList)  <= 0 }">
			<!--  <tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
				  <td align="left"><input name="tbOrderList[0].kxOrderNo" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderList[0].projectName" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderList[0].contractNo" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderList[0].client" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderList[0].finalClient" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderList[0].payment" maxlength="33" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderList[0].principal" maxlength="16" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="tbOrderList[0].remark" maxlength="85" type="text" style="width:120px;" ></td>
   			</tr>-->
	</c:if>
	<c:if test="${fn:length(tbOrderList)  > 0 }">
		<c:forEach items="${tbOrderList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
				   <td align="left"><input name="tbOrderList[${stuts.index }].kxOrderNo" maxlength="16" value="${poVal.kxOrderNo }" onblur="getOrder(this)" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderList[${stuts.index }].projectName" maxlength="16" value="${poVal.projectName }" type="text" style="width:120px;"></td>
				  
				   <td align="left"><input name="tbOrderList[${stuts.index }].client" maxlength="16" value="${poVal.client }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderList[${stuts.index }].finalClient" maxlength="16" value="${poVal.finalClient }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderList[${stuts.index }].payment" maxlength="33" value="${poVal.payment }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderList[${stuts.index }].principal" maxlength="16" value="${poVal.principal }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderList[${stuts.index }].totalPrice" maxlength="16" value="${poVal.totalPrice }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="tbOrderList[${stuts.index }].remark" maxlength="85" value="${poVal.remark }" type="text" style="width:120px;"></td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>