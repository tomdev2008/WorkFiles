<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<script type="text/javascript">
var tbContractTemplatesDocVariableList='${tbContractTemplatesDocVariableList}';
var templeDocId='${templeDocId}';
	$('#addTbOrderDetailBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delTbOrderDetailBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	//添加事件
	$('#addTbOrderDetailBtn').bind('click', function(){   
 	//	 var tr1 =  $("#add_tbOrder_table_template tr").clone();
 		 var tr="<tr><td align='center'><input style='width:20px;' type='checkbox' name='ck'/></td>"
 		    +"<td align='center'><input type='hidden' name='tbContractTemplatesDocVariableList[#index#].id'/></td>"
 		    +"<td align='left'><input name='tbContractTemplatesDocVariableList[#index#].templatesdocId.id' type='hidden' value='${templeDocId}'/></td>"
 		   +"<td align='left'><input name='tbContractTemplatesDocVariableList[#index#].variablename' maxlength='50' type='text' style='width:200px;'/></td>"
 		   +"<td align='left'><input name='tbContractTemplatesDocVariableList[#index#].description' maxlength='50' type='text' style='width:200px;'/></td></tr>";
	 	 $("#add_tbOrderDetail_table").append(tr);
	 	 resetTrNum('add_tbOrderDetail_table');
    });
	//删除事件
	$('#delTbOrderDetailBtn').bind('click', function(){
		var end = null;
		var ids = "";
		$("#tbOrderDetail_table input:checkbox").each(function(){
			end = $(this).attr("checked");
			if("checked" == end) {
				var tt = $(this).parent().parent();
				var id = $(tt.find("input")[1]).val();
				if(id==null || id=="")
					{
					tip('删除成功',3);
					$("#add_tbOrderDetail_table").find("input:checked").parent().parent().remove();   
			        resetTrNum('add_tbOrderDetail_table'); 
					}else{
	 		     	ids += id+",";
					}
	 		}
		});
		ids = ids.substring(0,ids.length-1);
		if(ids==null || ids=="")
			{
			 return false;
			}else{
		//$("#hiddenids").val(ids);
		 $.ajax({
	    	url:'tbContractTemplatesDocVariableController.do?del' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{'ids':ids},
	    	success:function(data) {
				if(data!=null){ 	
					if(data.msg="删除成功"){
						$("#add_tbOrderDetail_table").find("input:checked").parent().parent().remove();   
			        resetTrNum('add_tbOrderDetail_table'); 
			        $.dialog.tips('删除成功',3);
					}else{
						tip('删除失败',3);
					}
				}else
					{
					tip('删除失败',3);
					}
	    	}
	    			 
	    });    
	}
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
	    <td align="center" bgcolor="#EEEEEE"></td>
		<td align="center" bgcolor="#EEEEEE">变量名</td>
		<td align="center" bgcolor="#EEEEEE">描述</td>
	</tr>
	<tbody id="add_tbOrderDetail_table">	
	<c:if test="${fn:length(tbContractTemplatesDocVariableList)  <= 0 }">
	</c:if>
	<c:if test="${fn:length(tbContractTemplatesDocVariableList)  > 0 }">
		<c:forEach items="${tbContractTemplatesDocVariableList}" var="poVal" varStatus="stuts">
		 	<tr>
			   <td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
			   <td align="center"><input name="tbContractTemplatesDocVariableList[${stuts.index }].id" maxlength="50" type="hidden" style="width:200px;" value="${poVal.id}"></td>
			   <td align="left"><input name="tbContractTemplatesDocVariableList[${stuts.index }].templatesdocId.id" maxlength="50" type="hidden" style="width:200px;" value="${poVal.templatesdocId.id}"></td>
			   <td align="left"><input name="tbContractTemplatesDocVariableList[${stuts.index }].variablename" maxlength="50" type="text" style="width:200px;" value="${poVal.variablename}"></td>
   			   <td align="left"><input name="tbContractTemplatesDocVariableList[${stuts.index }].description" maxlength="50" type="text" style="width:200px;" value="${poVal.description}"></td>
   			</tr> 
   	   </c:forEach>
   	</c:if>
	</tbody>
</table>
</div>
