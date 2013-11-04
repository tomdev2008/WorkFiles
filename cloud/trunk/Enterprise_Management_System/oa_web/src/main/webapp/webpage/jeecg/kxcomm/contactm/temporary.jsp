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
 	<br/>
 	<div>
 	  <label class="Validform_label">
							报价表名称:
						</label>
		<input class="inputxt" style="width: 200px" id="quoName" name="quoName" datatype="s0-20">
 	</div>
 	<br/>
  <div title="报价表" data-options="closable:false,cache:false">
			 <table border="0" cellpadding="2" cellspacing="0" id="tbOrderDetail_table">
					<tr bgcolor="#E6E6E6">
					    <td align="center" bgcolor="#EEEEEE"></td>
					    <td align="center" bgcolor="#EEEEEE"></td>
					      <td align="center" bgcolor="#EEEEEE">所属报价表名称</td>
					    <td align="center" bgcolor="#EEEEEE">项目名称</td>
						<td align="center" bgcolor="#EEEEEE"></td>
						<td align="center" bgcolor="#EEEEEE">配置单名称</td>
						<td align="center" bgcolor="#EEEEEE">单价</td>
						<td align="center" bgcolor="#EEEEEE">数量</td>
						<td align="center" bgcolor="#EEEEEE">已下单</td>
						<td align="center" bgcolor="#EEEEEE">总价</td>
					</tr>
						<c:if test="${fn:length(alllist)  <= 0 }">
	                </c:if>
	          <c:if test="${fn:length(alllist)  > 0 }">
					<c:forEach items="${alllist}" var="poVal" varStatus="stuts">
					<tr id="t${poVal.id}">
			           	<td align="center"><input name="quotationsDataList[${stuts.index }].tbConfigModels.id" maxlength="50" type="hidden" style="width:80px;" value="${poVal.id}"></td>
						<td align="center"><input name="quotationsDataList[${stuts.index }].tbQuotations.id" maxlength="50" type="hidden" style="width:80px;" value="${poVal.quoId}"></td>
					   <td align="center"><input name="" maxlength="50" type="text" style="width:80px;" readonly="readonly" value="${poVal.quotationsName}"></td>
					    <td align="center"><input name="quotationsDataList[${stuts.index }].projectName" maxlength="50" type="text" style="width:150px;"  value="${poVal.projectName}"></td>
						<td align="center"><input name="quotationsDataList[${stuts.index }].id" maxlength="50" type="hidden" style="width:150px;" readonly="readonly" value="${poVal.quoDataId}"></td>
						<td align="center"><input name="quotationsDataList[${stuts.index }].name" maxlength="50" type="text" style="width:150px;" readonly="readonly" value="${poVal.quoName}"></td>
						<td align="center"><input name="quotationsDataList[${stuts.index }].tbConfigModels.totalPrice" maxlength="50" type="text" style="width:80px;" readonly="readonly" value="${poVal.totalPrice}"></td>
					    <td align="center"><input name="quotationsDataList[${stuts.index }].quantity" maxlength="50" type="text" style="width:80px;" datatype="n0-10" errormsg="请输入数字" value="${poVal.shuliang}"></td>
						<td align="center"><input name="" maxlength="50" type="text" style="width:80px;" readonly="readonly" value="${poVal.ordered}"></td>
						<td align="center"><input name="" maxlength="50" type="text" style="width:150px;" readonly="readonly" value="${poVal.quoTotalPrice}"></td>
					</tr>
					</c:forEach>
					</c:if>
			</table>
		  </div>
  </div>
 </div>
  <div align="right"><button class="Validform_label">下一步</button><button class="Validform_label" onclick="btnClose();">关闭</button></div>
 </t:formvalid>
 <script type="text/javascript">
 checkContactType();
 </script>