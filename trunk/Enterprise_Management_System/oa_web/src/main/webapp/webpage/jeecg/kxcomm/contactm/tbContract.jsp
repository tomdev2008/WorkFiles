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
 </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" tiptype="1" action="tbContractController.do?save">
			<input id="id" name="id" type="hidden" value="${tbContractPage.id }">
			<table cellpadding="0" cellspacing="1" class="formtable">
			<tr>
					<td align="right">
						<label class="Validform_label">
							合同名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" style="width: 200px" id="docname" name="docname" datatype="s1-20"
							   value="${tbContractTemplatesDocPage.docname}">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
						<label class="Validform_label">
							合同类型:
						</label>
					</td>
					<td class="value" colspan="3">
						<select id="bvariable" style="width: 200px"  name="bvariable"  datatype="*">
					        <option value="1">正式合同</option>
					        <option value="2">临时合同</option>
				      	</select>
					</td>
			</tr>
			<tr>
			<td align="right"><label class="Validform_label" >合同编号:</label></td>
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
			</td>
			<td align="right">
						<label class="Validform_label">
							合同内部编号:
						</label>
					</td>
					<td class="value" >
						<input class="inputxt" style="width: 200px" id="docname" name="docname" datatype="s1-20"
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
						<select id="project" style="width: 200px"  name="project.id" >
					       <c:forEach items="${tbCustomerList}" var="customer">
					        <option value="${customer.id}" >
					         ${customer.companyName}
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
						<select id="customer" style="width: 200px"  name="customer.id" >
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
						<select id="customer" style="width: 200px"  name="customer.id" >
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
				  <input class="Wdate" style="width: 200px" onClick="WdatePicker()" id="daohuoPaymentDate" name="daohuoPaymentDate" ignore="ignore"
									     value="<fmt:formatDate value='${tbContractPage.daohuoPaymentDate}' type="date" pattern="yyyy-MM-dd"/>">
								<span class="Validform_checktip"></span>
			   </td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value" colspan="3">
					<textarea style="width:60%;" id="description" name="description"  datatype="s0-50">${tbProjectEntityPage.description}</textarea>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				</table>
		<div id="myTabs" class="easyui-tabs" style="height:30px;">
				<div title="报价表" ></div>
			</div>
			<div  style="width: 800px;height: 300px;overflow-y:scroll;overflow-x:scroll;">
			 <t:datagrid name="tbContractList11" pagination="false" fitColumns="true" title="销售合同" actionUrl="tbContractController.do?quotations" checkbox="true" idField="id" fit="true" onClick="contractDetail" queryMode="group">
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
 </body>