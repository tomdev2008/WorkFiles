<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">

  <div data-options="region:'center'"  style="overflow:hidden;">
   
	  <div id="myTabs" title="数据源详情" class="easyui-tabs" style="width:auto;height:600px;"  data-options="tools:'#tab-tools'" >
		  <div title="基本配置单元" data-options="closable:false,cache:false">
	<c:if test="${fn:length(volist)  > 0}">
		<c:forEach items="${volist}" var="poVal" varStatus="stuts">
		<c:if test="${poVal.param ==1}">
		  <div class="easyui-panel" data-options="collapsible:true" title="${poVal.name}" style="overflow:hidden;width:1390px;height:280px;">
			   <t:datagrid name="tbDataRecordEntityList${stuts.index }" actionUrl="${poVal.url}" idField="id" fit="true" onClick="check">
			  <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
			   <t:dgCol title="产品订货号" field="productorderno" width="70" ></t:dgCol>
			   <t:dgCol title="产品名称" field="productTypeName" width="70" ></t:dgCol>
			   <t:dgCol title="产品描述" field="productdesc" width="80"></t:dgCol>
			   <t:dgCol title="数量" field="quantity" width="50" ></t:dgCol>
			   <t:dgCol title="目录单价" field="unitprice" width="70" ></t:dgCol>
			   <t:dgCol title="目录合价" field="heJia" width="70" ></t:dgCol>
			   <t:dgCol title="折扣率" field="discountrate" width="50" ></t:dgCol>
			   <t:dgCol title="折扣后价格" field="discountPrice" width="70" ></t:dgCol>
			   
			   <t:dgCol title="运保及其他费率" field="otherrates" width="70" ></t:dgCol>
			   <t:dgCol title="折扣后现场价" field="xianChangJia" width="70" ></t:dgCol>
			   <t:dgCol title="综合汇率" field="exchangeRate" width="50"></t:dgCol>
			   <t:dgCol title="安装服务费" field="installservicecharge" width="70" ></t:dgCol>
			   <t:dgCol title="第一年保修期费用" field="firstyear" width="70" ></t:dgCol>
			   <t:dgCol title="第二年保修期费用" field="secondyear" width="70" ></t:dgCol>
			   <t:dgCol title="第三年保修期费用" field="thirdyear" width="70" ></t:dgCol>
			   <t:dgCol title="合计" field="totalPrice" width="70" ></t:dgCol>
			   <t:dgCol title="备注" field="remark" ></t:dgCol>
			</t:datagrid>
		  </div>
		  </c:if>
		 </c:forEach>
		</c:if>
		  </div>
		  <div title="同系列通用单元" data-options="closable:false,cache:false">
	<c:if test="${fn:length(volist)  > 0}">
		<c:forEach items="${volist}" var="poVal" varStatus="stuts">
		<c:if test="${poVal.param ==2}">
		  <div class="easyui-panel" data-options="collapsible:true" title="${poVal.name}" style="overflow:hidden;width:1390px;height:280px;">
			   <t:datagrid name="tbDataRecordEntityListTwo${stuts.index }"  actionUrl="${poVal.url}" idField="id" fit="true" onClick="check">
			   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
			   <t:dgCol title="产品订货号" field="productorderno" width="70"></t:dgCol>
			   <t:dgCol title="产品名称" field="productTypeName" width="70"></t:dgCol>
			   <t:dgCol title="产品描述" field="productdesc" width="80"></t:dgCol>
			   <t:dgCol title="数量" field="quantity" width="50"></t:dgCol>
			   <t:dgCol title="目录单价" field="unitprice" width="70"></t:dgCol>
			   <t:dgCol title="目录合价" field="heJia" width="70"></t:dgCol>
			   <t:dgCol title="折扣率" field="discountrate" width="50"></t:dgCol>
			   <t:dgCol title="折扣后价格" field="discountPrice" width="70"></t:dgCol>
			   
			   <t:dgCol title="运保及其他费率" field="otherrates" width="70"></t:dgCol>
			   <t:dgCol title="折扣后现场价" field="xianChangJia" width="70"></t:dgCol>
			   <t:dgCol title="综合汇率" field="exchangeRate" width="50"></t:dgCol>
			   <t:dgCol title="安装服务费" field="installservicecharge" width="70"></t:dgCol>
			   <t:dgCol title="第一年保修期费用" field="firstyear" width="70"></t:dgCol>
			   <t:dgCol title="第二年保修期费用" field="secondyear" width="70"></t:dgCol>
			   <t:dgCol title="第三年保修期费用" field="thirdyear" width="70"></t:dgCol>
			   <t:dgCol title="合计" field="totalPrice" width="70"></t:dgCol>
			   <t:dgCol title="备注" field="remark" ></t:dgCol>
		  </t:datagrid>
		  </div>
		  </c:if>
		  </c:forEach>
		  </c:if>
		  </div>
		 <div title="全通用单元" data-options="closable:false,cache:false">
	<c:if test="${fn:length(volist)  > 0}">
		<c:forEach items="${volist}" var="poVal" varStatus="stuts">
		<c:if test="${poVal.param ==3}">
		  <div  class="easyui-panel" data-options="collapsible:true" title="${poVal.name}" style="overflow:hidden;width:1390px;height:280px;">
			   <t:datagrid name="tbDataRecordEntityListThree${stuts.index }"  actionUrl="${poVal.url}" idField="id" fit="true" onClick="check">
			   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
			   <t:dgCol title="产品订货号" field="productorderno" width="70"></t:dgCol>
			   <t:dgCol title="产品名称" field="productTypeName" width="70"></t:dgCol>
			   <t:dgCol title="产品描述" field="productdesc" width="80"></t:dgCol>
			   <t:dgCol title="数量" field="quantity" width="50"></t:dgCol>
			   <t:dgCol title="目录单价" field="unitprice" width="70"></t:dgCol>
			   <t:dgCol title="目录合价" field="heJia" width="70"></t:dgCol>
			   <t:dgCol title="折扣率" field="discountrate" width="50"></t:dgCol>
			   <t:dgCol title="折扣后价格" field="discountPrice" width="70"></t:dgCol>
			   <t:dgCol title="运保及其他费率" field="otherrates" width="70"></t:dgCol>
			   <t:dgCol title="折扣后现场价" field="xianChangJia" width="70"></t:dgCol>
			   <t:dgCol title="综合汇率" field="exchangeRate" width="50"></t:dgCol>
			   <t:dgCol title="安装服务费" field="installservicecharge" width="70"></t:dgCol>
			   <t:dgCol title="第一年保修期费用" field="firstyear" width="70"></t:dgCol>
			   <t:dgCol title="第二年保修期费用" field="secondyear" width="70"></t:dgCol>
			   <t:dgCol title="第三年保修期费用" field="thirdyear" width="70"></t:dgCol>
			   <t:dgCol title="合计" field="totalPrice" width="70"></t:dgCol>
			   <t:dgCol title="备注" field="remark" ></t:dgCol>
		  </t:datagrid>
		  </div>
		  </c:if>
		  </c:forEach>
		  </c:if>
		  </div>
	  </div>
	  <div id="tab-tools" style="margin-right: 30px;">
			<a href="javascript:void(0)" onClick="fanhui();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-undo'" >返回</a>
		</div>
  </div>
 </div>
 <script type="text/javascript">
  function fanhui(){
	  $('#dataSourceDetailPanel').panel("refresh", "tbDataSourceEntityController.do?tbDataSourceEntity");
  }
  
  function check(rowIndex, rowData){
	  var url = "tbDataRecordEntityController.do?check&id="+rowData.id;
	  createdetailwindow(url);
  }
  
  function createdetailwindow(url) {
		if(typeof(windowapi) == 'undefined'){
			$.dialog({
				content: 'url:'+url,
				lock : true,
				
				opacity : 0.3,
				cache:false, 
			    cancelVal: '关闭',
			    cancel: true /*为true等价于function(){}*/
			});
		}else{
			W.$.dialog({
				content: 'url:'+url,
				lock : true,
				parent:windowapi,
				
				opacity : 0.3,
				cache:false, 
			    cancelVal: '关闭',
			    cancel: true /*为true等价于function(){}*/
			});
		}
		
  }
 </script>