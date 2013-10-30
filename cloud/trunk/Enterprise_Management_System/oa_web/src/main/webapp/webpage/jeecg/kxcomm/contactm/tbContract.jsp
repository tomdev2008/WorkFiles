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
  //初始化下标
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
  
  function changeConType()
  {
	  var contactType=$("#contactType").val();
	  
	  if(contactType==1)
		  {
		  $("#contractTem").show();
		  }else
			  {
			  $("#contractTem").hide();
			  }
  }
	
	//保存合同下一步操作
	function saveContractNext(){
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
		var contractName=$("#contractName").val();
		var contractNo = $("#contractNo").val();
		var contactType=$("#contactType").val();
		var contractNumber=$("#contractNumber").val();
		var projectId=$("#projectId").val();
		var ratio=$("#ratio").val();
		var invoiceType=$("#invoiceType").val();
		var contractDate=$("#contractDate").val();
		var contractTem=$("#contractTemId").val();
		var remark=$("#remark").val();
		$.ajax({
	    	url:'tbContractController.do?save' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{
	    		'ids':ids,
	    		'contractName':contractName,
	    		'contractNo':contractNo,
	    		'contactType':contactType,
	    		'contractNumber':contractNumber,
	    		'projectId':projectId,
	    		'ratio':ratio,
	    		'invoiceType':invoiceType,
	    		'contractDate':contractDate,
	    		'contractTem':contractTem,
	    		'remark':remark
	    		},
	    	success:function(data) {
		 		if(data!=null)
					{
		 			createcontractwindow("销售合同","tbContractController.do?tbContractQuoDoc");
					btnClose();
					
						
					} 
	    	}
	    });
	}
	
	//关闭按钮
	 function btnClose()
	 {
		 frameElement.api.close();
	 }
	//获取用户选择的报价表ID
	function getQuotationsId(){
	
	}
 </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
   <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1"> 
			<input id="id" name="id" type="hidden" value="${tbContractPage.id }">
		   <input id="hiddenids" name="ids" style="display: none;" >
			<table cellpadding="0" cellspacing="1" class="formtable">
			<tr>
					<td align="right">
						<label class="Validform_label">
							合同名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" style="width: 200px" id="contractName" name="contractName" datatype="s1-20"
							   value="${tbContractTemplatesDocPage.docname}">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
						<label class="Validform_label">
							合同类型:
						</label>
					</td>
					<td class="value" colspan="3">
						<select id="contactType" style="width: 200px"  name="contactType"  datatype="*" onchange="changeConType();">
					        <option value="1">正式合同</option>
					        <option value="2">临时合同</option>
				      	</select>
					</td>
			</tr>
			<tr>
				<td align="right">
						<label class="Validform_label">
							合同号:
						</label>
					</td>
					<td class="value" >
						<input class="inputxt" style="width: 200px" id="contractNo" name="contractNo" datatype="s0-20"
							   value="${tbContractTemplatesDocPage.docname}">
						<span class="Validform_checktip"></span>
					</td>
			<%-- <td align="right"><label class="Validform_label" >合同编号:</label></td>
			<td class="value" >
			<c:if test="${tbContractPage.contractNo!=null }">
			<input onblur="check()" style="width: 200px" nullmsg="请填写合同编号" errormsg="contrac格式不对" class="inputxt" id="contractNo" name="contractNo" datatype="*"
									   value="${tbContractPage.contractNo}" readonly="readonly">
								<span class="Validform_checktip"></span>
			</c:if>
			<c:if test="${tbContractPage.contractNo==null }">
				<input onblur="check()" style="width: 200px" nullmsg="请填写合同编号" errormsg="contrac格式不对" class="inputxt" id="contractNo" name="contractNo" datatype="*"
									   value="${tbContractPage.contractNo}">
								<span class="Validform_checktip"></span>
			</c:if>
			</td> --%>
			<td align="right">
						<label class="Validform_label">
							合同内部编号:
						</label>
					</td>
					<td class="value" >
						<input class="inputxt" style="width: 200px" id="contractNumber" name="contractNumber" datatype="s0-20"
							   value="${tbContractTemplatesDocPage.docname}">
						<span class="Validform_checktip"></span>
					</td>
			</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							项目名称:
						</label>
					</td>
					<td class="value">
						<select id="projectId" style="width: 200px"  name="projectId" >
					       <c:forEach items="${projectList}" var="project">
					        <option value="${project.id}" >
					         ${project.projectName}
					        </option>
					       </c:forEach>
				      	</select>
					</td>
					<td align="right">
						<label class="Validform_label">
							比例:
						</label>
					</td>
					<td class="value">
						<select id="ratio" style="width: 200px"  name="ratio" >
					        <option value="1" >
					        80% 10% 10%
					        </option>
					           <option value="2" >
					        70% 20% 10%
					        </option>
				      	</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							发票类型:
						</label>
					</td>
					<td class="value">
						<select id="invoiceType" style="width: 200px"  name="invoiceType" >
					        <option value="1" >
					        增值税专用发票
					        </option>
					           <option value="2" >
					       增值税普通发票
					        </option>
				      	</select>
					</td>
					<td align="right">
					<label class="Validform_label">合同签订日期:</label></td>
			       <td class="value">
				  <input class="Wdate" style="width: 200px" onClick="WdatePicker()" id="contractDate" name="contractDate" datatype="*"
									     value="<fmt:formatDate value='${tbContractPage.daohuoPaymentDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			   </td>
				</tr>
				<tr id="contractTem">
					<td align="right">
						<label class="Validform_label">
							合同模板:
						</label>
					</td>
					<td class="value" colspan="3">
						<select id="contractTemId" style="width: 300px"  name="contractTemId" >
					       <c:forEach items="${contractTemplateList}" var="contractTemplate">
					        <option value="${contractTemplate.id}" >
					         ${contractTemplate.name}
					        </option>
					       </c:forEach>
				      	</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value" colspan="3">
					<textarea style="width:60%;" id="remark" name="remark"  datatype="s0-50">${tbProjectEntityPage.description}</textarea>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				</table>
		<div id="myTabs" class="easyui-tabs" style="height:30px;">
				<div title="报价表" ></div>
			</div>
			<div  style="width: 800px;height: 300px;overflow-y:scroll;">
			 <t:datagrid name="quotations" pagination="false" fitColumns="true" actionUrl="tbContractController.do?quotations" checkbox="true" idField="id" fit="true" onClick="contractDetail" queryMode="group">
			    <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
  			    <t:dgCol title="报价表名称" field="quotationName" query="true"></t:dgCol>
   			    <t:dgCol title="目录合价(元)" field="catalogTotalPrice"></t:dgCol>
   				<t:dgCol title="折扣后价格(元)" field="afterPrice" ></t:dgCol>
   				<t:dgCol title="折扣后现场价(元)" field="nowPrice" ></t:dgCol>
   				<t:dgCol title="创建时间" field="createTime" ></t:dgCol>
   				<t:dgCol title="合计" field="totalPrice" ></t:dgCol>
			 </t:datagrid>
	<!-- 		<table id="checkstabel">
			<input id="hiddenids" name="ids" style="display: none;" >
			<tr bgcolor="#E6E6E6">
				  <td align="center" bgcolor="#EEEEEE">序号</td>
				    <td></td>
				  <td align="center" bgcolor="#EEEEEE">报价表名</td>
				  <td align="center" bgcolor="#EEEEEE">目录合价(元)</td>
				  <td align="center" bgcolor="#EEEEEE">折扣后价格(元)</td>
				  <td align="center" bgcolor="#EEEEEE">折扣后现场价(元)</td>
				   <td align="center" bgcolor="#EEEEEE">创建时间</td>
				  <td align="center" bgcolor="#EEEEEE">合计(元)</td>
				 
	     </tr>		
		</table> -->
		</div>
		</t:formvalid>
		<div align="right"><button class="Validform_label" onclick="saveContractNext();">下一步</button><button class="Validform_label" onclick="btnClose();">关闭</button></div>
 </body>