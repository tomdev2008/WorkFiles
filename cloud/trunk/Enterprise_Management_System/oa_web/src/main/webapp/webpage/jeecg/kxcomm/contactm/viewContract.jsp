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
	

	//关闭按钮
	 function btnClose()
	 {
		 frameElement.api.close();
	 }

	  //判断是新增还是修改
	  function checkAddOrUpdate()
	  {
		  var endid = '${tbContractPage.id}';
			if(null != endid && "" != endid) {
				var contactType = '${tbContractPage.contactType}';
				var projectId = '${tbContractPage.projectId.id}';
				var ratio = '${tbContractPage.ratio}';
				var invoiceType = '${tbContractPage.invoiceType}';
				var contractTemId = '${tbContractPage.contractTemplatesId.id}';
				$("#contactType").val(contactType);
				$("#projectId").val(projectId);
				$("#ratio").val(ratio);
				$("#invoiceType").val(invoiceType);
				$("#contractTemId").val(contractTemId);
				 if(contactType==1)
				  {
				  $("#contractTem").show();
				  $("#cDoc").show();
				  }else
					  {
					  $("#contractTem").hide();
					  $("#cDoc").hide();
					  }
			}
	  }
 </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
   <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1"> 
			<input id="id" name="id" type="hidden" value="${tbContractPage.id }">
		<div data-options="region:'center'"  style="overflow:hidden;">
	  <div id="myTabs" title="查看合同" class="easyui-tabs" style="height:600px;width: auto;"  data-options="tools:'#tab-tools'" >
		  <div title="基本信息" data-options="closable:false,cache:false">
			<table cellpadding="0" cellspacing="1" class="formtable">
			<tr>
					<td align="right">
						<label class="Validform_label">
							合同名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" style="width: 200px" id="contractName" name="contractName" datatype="s1-20" readonly="readonly"
							   value="${tbContractPage.contractName}">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
						<label class="Validform_label">
							合同类型:
						</label>
					</td>
					<td class="value" colspan="3">
						<select id="contactType" style="width: 200px"  name="contactType"  datatype="*" disabled="true">
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
						<input class="inputxt" style="width: 200px" id="contractNo" name="contractNo" datatype="s0-20" disabled="true"
							   value="${tbContractPage.contractNo}">
						<span class="Validform_checktip"></span>
					</td>
			<td align="right">
						<label class="Validform_label">
							合同内部编号:
						</label>
					</td>
					<td class="value" >
						<input class="inputxt" style="width: 200px" id="contractNumber" name="contractNumber" datatype="s0-20" disabled="true"
							   value="${tbContractPage.contractNumber}">
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
						<select id="projectId" style="width: 200px"  name="projectId" disabled="true">
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
						<select id="ratio" style="width: 200px"  name="ratio" disabled="true">
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
						<select id="invoiceType" style="width: 200px"  name="invoiceType" disabled="true">
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
				  <input class="Wdate" style="width: 200px" onClick="WdatePicker()" id="contractDate" name="contractDate" datatype="*" disabled="true"
									     value="<fmt:formatDate value='${tbContractPage.contractDate}' type="date" pattern="yyyy-MM-dd"/>">
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
						<select id="contractTemId" style="width: 300px"  name="contractTemId" disabled="true">
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
					<textarea style="width:60%;" id="remark" name="remark"  datatype="s0-50" disabled="true">${tbContractPage.remark}</textarea>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				</table>
		<div id="myTabs" class="easyui-tabs" style="height:30px;">
				<div title="报价表" ></div>
			</div>
			<div  style="width: 800px;height: 300px;overflow-y:scroll;">
			 <t:datagrid name="quotations" pagination="false" fitColumns="true" actionUrl="tbContractController.do?viewQuotations&id=${tbContractPage.id }"  idField="id" fit="true">
			    <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
			     <t:dgCol title="选中" field="downUrl" hidden="false"></t:dgCol>
  			    <t:dgCol title="报价表名称" field="quotationName" query="true"></t:dgCol>
   			    <t:dgCol title="目录合价(元)" field="catalogTotalPrice"></t:dgCol>
   				<t:dgCol title="折扣后价格(元)" field="afterPrice" ></t:dgCol>
   				<t:dgCol title="折扣后现场价(元)" field="nowPrice" ></t:dgCol>
   				<t:dgCol title="创建时间" field="createTime" ></t:dgCol>
   				<t:dgCol title="合计" field="totalPrice" ></t:dgCol>
			 </t:datagrid>
		</div>
		</div>
		 <div title="报价总表" data-options="closable:false,cache:false">
			 <t:datagrid name="quotationdata" pagination="false" fitColumns="true" actionUrl="tbContractController.do?viewQuotationData&id=${tbContractPage.id }"  idField="id" fit="true">
			    <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
  			    <t:dgCol title="报价表名称" field="quotationsName" query="true"></t:dgCol>
   			    <t:dgCol title="项目名称" field="projectName"></t:dgCol>
   				<t:dgCol title="配置单名称" field="quoName" ></t:dgCol>
   				<t:dgCol title="单价" field="totalPrice" ></t:dgCol>
   				<t:dgCol title="数量" field="shuliang" ></t:dgCol>
   				<t:dgCol title="合计" field="quoTotalPrice" ></t:dgCol>
			 </t:datagrid>
		  </div>
		    <div title="合同文件" data-options="closable:false,cache:false" id="cDoc">
		    <div id="cDoc1" class="easyui-panel" data-options="collapsible:true" style="width: 800px;height: 500px;overflow-y:scroll;">
		      <t:datagrid name="contractDoc1" pagination="false" fitColumns="true" actionUrl="tbContractController.do?getConDocViewList&id=${tbContractPage.id }" idField="id" fit="true">
				    <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
	   			    <t:dgCol title="文件名称" field="fileName"></t:dgCol>
	   				<t:dgCol title="创建时间" field="createTime" formatter="yyyy-mm-dd"></t:dgCol>
	   				<t:dgCol title="文件类型" field="fileType" ></t:dgCol>
	   				<t:dgCol title="是否设置变量" field="isB" replace="否_0,是_1"></t:dgCol>
	   				<t:dgToolBar funname="editone" title="查看变量" icon="icon-search"></t:dgToolBar>
			 	</t:datagrid> 
			</div>
		  </div>
		</div>
		</div>
		</t:formvalid>
		<div align="right"><button class="Validform_label" onclick="btnClose();">关闭</button></div>
 </body>
 <script type="text/javascript">
 checkAddOrUpdate();
//设置变量
 function editone(title,url, id) {
 	var rowData = $('#'+id).datagrid('getSelected');
 	if (!rowData) {
 		tip('请选择需要设置变量的文件');
 		return;
 	}
 	if(rowData.isB==0)
 		{
 		tip('该文件不需设置变量',3);
 		return;
 		}
 	var i = rowData.id;
 	url += '&id='+rowData.id;
 	createcontractwindow(title,'tbContractController.do?tbSContractDocVariable&id='+rowData.id+'&vi=y'); 
 }
 </script>