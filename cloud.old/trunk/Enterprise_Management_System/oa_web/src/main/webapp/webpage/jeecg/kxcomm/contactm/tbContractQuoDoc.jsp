<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>销售合同</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
    <style type="text/css">
          #formobj{
                  height: 65%;
                  min-height:300px;
                  overflow-y:auto;
                  overflow-x:auto;
            min-width:800px;
          }
  </style>
  <script type="text/javascript">
  var tbConfigModelsEntities='${tbConfigModelsEntities}';
  //计算总价
	function getSum(object){
		 var tt =$("#"+object);
		 var price = $(tt.find("input")[5]).val();
		 var num = $(tt.find("input")[6]).val();
		 var totalprice;
		 if(num==null || num=="")
			 {
			 totalprice=price;
			 }else{
				 totalprice= price*num;
			 }
		 var num = $(tt.find("input")[7]).val(totalprice);
		
		     
	}
  
 
  function checkContactType()
  {
	  var contactType='${contactType}';
	  if(contactType==1)
		  {
		  $("#temporaryCon").hide();
		  $("#officialCon").show();
		  }else{
			  $("#officialCon").hide();
			  $("#temporaryCon").show();
		  }
  }
 /*  //初始化下标
	function resetTrNum(tableId) {
		$tbody = $("#"+tableId+"");
		$tbody.find('>tr').each(function(i){
			$(':input, select', this).each(function(){
				var $this = $(this), name = $this.attr('name'), val = $this.val();
				if(name!=null){
					if (name.indexOf("#index#") >= 0){
						$this.attr("name",name.replace('#index#',i));
					}else{
						var s = name.indexOf("[");
						var e = name.indexOf("]");
						var new_name = name.substring(s+1,e);
						$this.attr("name",name.replace(new_name,i));
					}
				}
			});
		});
	}
  
	
	
	function check(){
		var contractNo = $("#contractNo").val();
		$.ajax({
	    	url:'tbContractController.do?getContractByContractNo' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{'contractNo':contractNo},
	    	success:function(data) {
				if(data!=null){
					$("#contractNo").css("color","red");
				}else{
					$("#contractNo").css("color","black");
				}
	    	}
	    });
	}
	
	
	//获取用户选择的报价表ID
	function getQuotationsId(){
	 var ids = "";
		var rows = $("#quotations").datagrid("getSelections");
		if(0 >= rows.length) {
			$.dialog.tips("请选择报价表",3);
			return false;
		}
		for(var i=0;i<rows.length;i++){
			ids += rows[i].id+",";
		}
		ids = ids.substring(0,ids.length-1);
		$("#hiddenids").val(ids);
	} */
	//关闭按钮
	 function btnClose()
	 {
		 frameElement.api.close();
	 }
 </script>
 </head>
 <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="tbContractController.do?saveContract"> 
 <div class="easyui-layout" fit="true">
 	<div data-options="region:'center'"  style="overflow:hidden;">
   
	  <div id="myTabs" title="报价表&合同文件" class="easyui-tabs" style="height:600px;width: auto;"  data-options="tools:'#tab-tools'" >
		  <div title="报价表" data-options="closable:false,cache:false">
			 <table border="0" cellpadding="2" cellspacing="0" id="tbOrderDetail_table">
					<tr bgcolor="#E6E6E6">
					    <td align="center" bgcolor="#EEEEEE"></td>
					    <td align="center" bgcolor="#EEEEEE"></td>
					    <td align="center" bgcolor="#EEEEEE">项目名称</td>
						<td align="center" bgcolor="#EEEEEE">数据源名称</td>
						<td align="center" bgcolor="#EEEEEE">配置单名称</td>
						<td align="center" bgcolor="#EEEEEE">单价</td>
						<td align="center" bgcolor="#EEEEEE">数量</td>
						<td align="center" bgcolor="#EEEEEE">总价</td>
					</tr>
						<c:if test="${fn:length(tbConfigModelsEntities)  <= 0 }">
						<button>ddd</button>
	                </c:if>
	          <c:if test="${fn:length(tbConfigModelsEntities)  > 0 }">
					<c:forEach items="${tbConfigModelsEntities}" var="poVal" varStatus="stuts">
					<tr id="t${poVal.id}">
			           	<td align="center"><input name="quotationsDataList[${stuts.index }].tbConfigModels.id" maxlength="50" type="hidden" style="width:80px;" value="${poVal.id}"></td>
						<td align="center"><input name="quotationsDataList[${stuts.index }].tbQuotations.id" maxlength="50" type="hidden" style="width:80px;" value="${poVal.tbQuotations.id}"></td>
					    <td align="center"><input name="quotationsDataList[${stuts.index }].projectName" maxlength="50" type="text" style="width:150px;"  value=""></td>
						<td align="center"><input name="" maxlength="50" type="text" style="width:150px;" readonly="readonly" value="${poVal.tbDataSource.sourcename}"></td>
						<td align="center"><input name="quotationsDataList[${stuts.index }].name" maxlength="50" type="text" style="width:150px;" readonly="readonly" value="${poVal.name}"></td>
						<td align="center"><input name="quotationsDataList[${stuts.index }].tbConfigModels.totalPrice" maxlength="50" type="text" style="width:80px;" readonly="readonly" value="${poVal.totalPrice}"></td>
					    <td align="center"><input name="quotationsDataList[${stuts.index }].quantity" maxlength="50" type="text" style="width:80px;" datatype="n0-10" errormsg="请输入数字" value="1"></td>
						<td align="center"><input name="" maxlength="50" type="text" style="width:150px;" readonly="readonly" value="${poVal.totalPrice}" onclick="getSum('t${poVal.id}');"></td>
					</tr>
					</c:forEach>
					</c:if>
			</table>
		  </div>
		  <div title="合同文件" data-options="closable:false,cache:false">
		  	 <div id="officialCon" class="easyui-panel" data-options="collapsible:true" style="width: 800px;height: 300px;overflow-y:scroll;overflow-x:scroll;">
			   <t:datagrid name="contractDoc" pagination="false" fitColumns="true" actionUrl="tbContractController.do?getConDocList" idField="id" fit="true">
				    <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	   			    <t:dgCol title="文件名称" field="templatesdocId_docname"></t:dgCol>
	   				<t:dgCol title="创建时间" field="createtime" formatter="yyyy-mm-dd"></t:dgCol>
	   				<t:dgCol title="文件类型" field="templatesdocId_docType_typename" ></t:dgCol>
	   				<t:dgCol title="是否设置变量" field="templatesdocId_bvariable" replace="否_0,是_1"></t:dgCol>
	   				<t:dgToolBar funname="editone" title="设置变量" icon="icon-edit"></t:dgToolBar>
			 	</t:datagrid> 
			  </div>
			 <div  id="temporaryCon" style="display: none;"><!-- 临时合同 -->
			 <table style="width: 500px;height: 100px;" cellpadding="0" cellspacing="1" class="formtable">
			<tr>
			  <td>
			 <label class="Validform_label">
							上传文件:
						</label>
			</td>
			<td>
			 <div class="form" id="filediv">
	                </div>
			    <t:upload name="fiels"  view="true" auto="true" buttonText="上传文件" dialog="false" callback="openrcon" uploader="tbContractController.do?uploadTemporaryDoc" extend="*.pdf" id="files" formData="id,docname,docType,bvariable">
					  </t:upload>
                          <span class="Validform_checktip">请选择要上传的文件</span> 
                       <!--    <input name="filedata" class="easyui-validatebox"
                                   required="true" type="file" missingMessage="请选择上传文件" /> -->
             </td>
              </tr>
                </table>     
			 </div>
			
		  </div>
	  </div>
<!-- 	  <div id="tab-tools" style="margin-right: 30px;">
			<a href="javascript:void(0)" onClick="fanhui();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'" >返回</a>
	  </div> -->
  </div>
 </div>
  <div align="right"><button class="Validform_label">确定</button><button class="Validform_label" onclick="btnClose();">关闭</button></div>
 </t:formvalid>
 <script type="text/javascript">
 checkContactType();
//设置变量
 function editone(title,url, id) {
 	var rowData = $('#'+id).datagrid('getSelected');
 	if (!rowData) {
 		tip('请选择需要设置变量的文件');
 		return;
 	}
 	if(rowData.bvariable==0)
 		{
 		tip('该文件不需设置变量',3);
 		return;
 		}
 	var i = rowData.id;
 	url += '&id='+rowData.id;
 	createcontractwindow(title,'tbContractController.do?tbSContractDocVariable&id='+rowData.id); 
 }
 </script>