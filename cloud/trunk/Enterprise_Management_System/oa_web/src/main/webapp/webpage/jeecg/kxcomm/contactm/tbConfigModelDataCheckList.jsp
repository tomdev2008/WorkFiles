<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<style>
.bgColor{
  background-color:red;
}
</style>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;" title="配置单数据">
  <%--<t:datagrid name="tbConfigModelDataList" title="配置单数据" actionUrl="tbConfigModelDataController.do?datagrid&configId=${configId }" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="产品订货号" field="dataRecordId" ></t:dgCol>
   <t:dgCol title="产品名称" field="configId" ></t:dgCol>
   <t:dgCol title="产品描述" field="configId" ></t:dgCol>
   <t:dgCol title="数量" field="quantity" ></t:dgCol>
   <t:dgCol title="目录单价" field="" ></t:dgCol>
   <t:dgCol title="目录合价" field="catalogPrice" ></t:dgCol>
   <t:dgCol title="折扣率" field="discountrate" ></t:dgCol>   
   <t:dgCol title="折扣后价格" field="discountedPrice" ></t:dgCol>
   <t:dgCol title="运保及其他费率" field="discountedPrice" ></t:dgCol>
   <t:dgCol title="折扣后现场价" field="discountedAfterPrice" ></t:dgCol>
   <t:dgCol title="安装服务费" field="installservicecharge" ></t:dgCol>
   <t:dgCol title="第一年保修期费用" field="firstYear" ></t:dgCol>
   <t:dgCol title="第二年保修期费用" field="secondYear" ></t:dgCol>
   <t:dgCol title="第三年保修期费用" field="thirdYear" ></t:dgCol>
   <t:dgCol title="合计" field="totalPrice" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbConfigModelDataController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbConfigModelDataController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbConfigModelDataController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbConfigModelDataController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid> --%>
   
   <div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	 <button onClick="back();">返回</button> &nbsp;<button onClick="save();">保存</button>&nbsp;<button onClick="del();">删除</button>
	</div>
  	<table id="ttt" width="1380px">
  	   <tbody id="tb">
  		<tr  class="datagrid-toolbar">
  			<td align="center" width="2%"></td>
  			<td align="center" style="display:none"></td>
  			<td align="center" width="2%"><input type="checkbox" id="checkAll" name="cb"/> </td>
  			<td align="center"  width="6%">产品订货号</td>
  			<td align="center" width="5%">产品名称</td>
  			<td align="center" width="15%">产品描述</td>
  			<td align="center" width="2%">数量</td>
  			<td align="center" width="5%">目录单价</td>
  			<td align="center" width="5%">目录合价</td>
  			<td align="center" width="3%">折扣率</td>
  			<td align="center" width="6%">折扣后价格</td>
  			<td align="center" width="6%">运保及其他费率</td>
  			<td align="center" width="6%">折扣后现场价</td>
  			<td align="center" width="6%">安装服务费</td>
  			<td align="center" width="6%">第一年保修期费用</td>
  			<td align="center" width="6%">第二年保修期费用</td>
  			<td align="center" width="6%">第三年保修期费用</td>
  			<td align="center" width="6%">合计</td>
  			<td align="center" style="display:none"></td>
  			
  		</tr>
  		<c:if test="${fn:length(tbConfigModelDataPage)  > 0 }">
		<c:forEach items="${tbConfigModelDataPage}" var="poVal" varStatus="stuts">
			<tr  align="center" >
				<td bgcolor="#F5F5F5" style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="2%">${stuts.index+1}</td>
  				<td align="center" style="display:none">${poVal.tbDataRecord.id }</td>
  				<td align="center" width="2%"><input type="checkbox" name="box" /> </td>
  				<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.tbDataRecord.productorderno }</label></td>
  				<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.tbDataRecord.tbProductType.producttypename }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.tbDataRecord.productdesc }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><input type="text" name="quantity" size="5" value="${poVal.quantity }" onblur="change1(this);"/></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.tbDataRecord.unitprice }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.catalogPrice }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><input type="text" name="discountrate" size="5" value="${poVal.discountrate }" onblur="change2(this);"/></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.discountedPrice }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.tbDataRecord.otherrates }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.discountedAfterPrice }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.tbDataRecord.installservicecharge }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.firstYear }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.secondYear }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.thirdYear }</label></td>
	  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;"><label>${poVal.totalPrice }</label></td>
	  			<td align="center" style="display:none">${poVal.id }</td>
	  		</tr>
	  	</c:forEach>
	  	</c:if>
	  	</tbody>
  		<tr id="tt" bgcolor="#F5F5F5"  height="30px">
  			<td colspan="18"></td>
  			
  		</tr>
  		<tr height="30px" >
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="2%"></td>
  			<td align="center" style="display:none" ></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="2%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="6%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="5%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="15%">典配总价</td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="3%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="5%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" id="t1" align="center" width="5%">0</td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="5%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" id="t2" align="center" width="6%">0</td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="6%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" id="t3" align="center" width="6%">0</td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="6%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="6%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="6%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" align="center" width="6%"></td>
  			<td style="border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;" id="t4" align="center" >0</td>
  			<td align="center" style="display:none"></td>
  			
  		</tr>	
  	</table>
  </div>
  <div region="south"  style="height:290px;overflow: hidden;" split="true" border="false">
    <div id="myTabs" title="数据源详情" class="easyui-tabs" style="width:aotu;height:295px;"  >
		<div title="基本配置单元" data-options="closable:false,cache:false">
		<c:if test="${fn:length(volist)  > 0}">
		<c:forEach items="${volist}" var="poVal" varStatus="stuts">
		<c:if test="${poVal.param ==1}">
		  <div class="easyui-panel" data-options="collapsible:true" title="${poVal.name}" style="overflow:hidden;width:1390px;height:240px;">
			   <t:datagrid name="tbConfigModelDataList${stuts.index }"   actionUrl="${poVal.url}" idField="id" fit="true" onClick="add">
			   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
			   <t:dgCol title="产品订货号" field="productorderno" width="70"></t:dgCol>
			   <t:dgCol title="产品名称" field="productTypeName" width="70"></t:dgCol>
			   <t:dgCol title="产品描述" field="productdesc" width="80"></t:dgCol>
			   <t:dgCol title="数量" field="quantity" width="50"></t:dgCol>
			   <t:dgCol title="目录单价" field="unitprice" width="70"></t:dgCol>
			   <t:dgCol title="目录合价" field="heJia" width="70"></t:dgCol>
			   <t:dgCol title="折扣率" field="discountrate" width="70"></t:dgCol>
			   <t:dgCol title="折扣后价格" field="discountPrice" width="70"></t:dgCol>
			   <t:dgCol title="运保及其他费率" field="otherrates" width="70"></t:dgCol>
			   <t:dgCol title="折扣后现场价" field="xianChangJia" width="70"></t:dgCol>
			   <t:dgCol title="安装服务费" field="installservicecharge" width="70"></t:dgCol>
			   <t:dgCol title="第一年保修期费用" field="firstyear" width="70"></t:dgCol>
			   <t:dgCol title="第二年保修期费用" field="secondyear" width="70"></t:dgCol>
			   <t:dgCol title="第三年保修期费用" field="thirdyear" width="70"></t:dgCol>
			   <t:dgCol title="合计" field="totalPrice" width="70"></t:dgCol>
			   
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
		  <div class="easyui-panel" data-options="collapsible:true" title="${poVal.name}" style="overflow:hidden;width:1390px;height:240px;">
			   <t:datagrid name="tbConfigModelDataList${stuts.index }"  actionUrl="${poVal.url}" idField="id" fit="true" onClick="add">
			   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
			   <t:dgCol title="产品订货号" field="productorderno" width="70"></t:dgCol>
			   <t:dgCol title="产品名称" field="productTypeName" width="70"></t:dgCol>
			   <t:dgCol title="产品描述" field="productdesc" width="80"></t:dgCol>
			   <t:dgCol title="数量" field="quantity" width="50"></t:dgCol>
			   <t:dgCol title="目录单价" field="unitprice" width="70"></t:dgCol>
			   <t:dgCol title="目录合价" field="heJia" width="70"></t:dgCol>
			   <t:dgCol title="折扣率" field="discountrate" width="70"></t:dgCol>
			   <t:dgCol title="折扣后价格" field="discountPrice" width="70"></t:dgCol>
			   <t:dgCol title="运保及其他费率" field="otherrates" width="70"></t:dgCol>
			   <t:dgCol title="折扣后现场价" field="xianChangJia" width="70"></t:dgCol>
			   <t:dgCol title="安装服务费" field="installservicecharge" width="70"></t:dgCol>
			   <t:dgCol title="第一年保修期费用" field="firstyear" width="70"></t:dgCol>
			   <t:dgCol title="第二年保修期费用" field="secondyear" width="70"></t:dgCol>
			   <t:dgCol title="第三年保修期费用" field="thirdyear" width="70"></t:dgCol>
			   <t:dgCol title="合计" field="totalPrice" width="70"></t:dgCol>
			   
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
		  <div  class="easyui-panel" data-options="collapsible:true" title="${poVal.name}" style="overflow:hidden;width:1390px;height:240px;">
			   <t:datagrid name="tbConfigModelDataList${stuts.index }"  actionUrl="${poVal.url}" idField="id" fit="true" onClick="add">
			   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
			   <t:dgCol title="产品订货号" field="productorderno" width="70"></t:dgCol>
			   <t:dgCol title="产品名称" field="productTypeName" width="70"></t:dgCol>
			   <t:dgCol title="产品描述" field="productdesc" width="80"></t:dgCol>
			   <t:dgCol title="数量" field="quantity" width="50"></t:dgCol>
			   <t:dgCol title="目录单价" field="unitprice" width="70"></t:dgCol>
			   <t:dgCol title="目录合价" field="heJia" width="70"></t:dgCol>
			   <t:dgCol title="折扣率" field="discountrate" width="70"></t:dgCol>
			   <t:dgCol title="折扣后价格" field="discountPrice" width="70"></t:dgCol>
			   <t:dgCol title="运保及其他费率" field="otherrates" width="70"></t:dgCol>
			   <t:dgCol title="折扣后现场价" field="xianChangJia" width="70"></t:dgCol>
			   <t:dgCol title="安装服务费" field="installservicecharge" width="70"></t:dgCol>
			   <t:dgCol title="第一年保修期费用" field="firstyear" width="70"></t:dgCol>
			   <t:dgCol title="第二年保修期费用" field="secondyear" width="70"></t:dgCol>
			   <t:dgCol title="第三年保修期费用" field="thirdyear" width="70"></t:dgCol>
			   <t:dgCol title="合计" field="totalPrice" width="70"></t:dgCol>
			   
		  </t:datagrid>
		  </div>
		  </c:if>
		  </c:forEach>
		  </c:if>
		  </div>
	  </div>
	  
  </div>
 </div>
 <script type="text/javascript">
 
 $(function(){
	
	if($("#ttt tr").length>3){
		sum();
	}
	
	checkAll();
	
 });
 
 	function add(rowIndex, rowData){
 		
 		var flag=true;
 		var _len = $("#ttt tr").length-2;
 		$('#ttt tr').each(function(){
 			if($(this).children('td').eq(1).html()==rowData.id){
 				flag=false;
 			}
 		 });
 		
 		if(flag){
 				$('#tb tr:last').after("<tr id="+_len+"  align='center'>"
 	 		 			+"<td bgcolor='#F5F5F5' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;'>"+_len+"</td>"
 	 		 			+"<td style='display:none' id='"+_len+"'>"+rowData.id+"</td>"
 	 		 			+"<td align='center'width='2%'><input type='checkbox' name='box'/> </td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.productorderno+"</label></td>"
 	 		 			+"<td width='5%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.productTypeName+"</label></td>"
 	 		 			+"<td width='15%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.productdesc+"</label></td>"
 	 		 			+"<td width='2%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;'><input type='text' name='quantity' size='6' value='"+rowData.quantity+"' onblur='change1(this);'/></td>"
 	 		 			+"<td width='5%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+(rowData.unitprice*1).toFixed(2)+"</label></td>"
 	 		 			+"<td width='5%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.heJia+"</label></td>"
 	 		 			+"<td width='3%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;'><input type='text' name='discountrate' size='6' value='"+rowData.discountrate+"' onblur='change2(this);'/></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.discountPrice+"</label></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.otherrates+"</label></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.xianChangJia+"</label></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.installservicecharge+"</label></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.firstyear+"</label></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.secondyear+"</label></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.thirdyear+"</label></td>"
 	 		 			+"<td width='6%' style='border-style: dotted;border-color: #ccc;border-width: 0 1px 1px 0;' ><label>"+rowData.totalPrice+"</label></td>"
 	 		 			+"<td style='display:none' ></td>"
 	 		 			+"</tr>"); 
 				sum();
 				checkAll();
 				
 			}
 		
 	}
 	
 	function save(){
 		var a="";
 		var b="";
 		var c="";
 		var d="";
 		var e="";
 		var f="";
 		var g="";
 		var h="";
 		var j="";
 		var id="";
 		var oid="";
 		var vo="";
 		var configId='${configId}';
 		if($("#ttt tr").length<4){
 			$.dialog.tips("请先添加数据",2);
 			return;
 		}
 		for(var i=1;i<$("#ttt tr").length-2;i++){
 			$('#ttt tr').eq(i).each(function(){
 				a=$(this).children('td').eq(6).children('input').val()+",";
 				b=$(this).children('td').eq(8).text()+",";
 				c=$(this).children('td').eq(9).children('input').val()+",";
 				d=$(this).children('td').eq(10).text()+",";
 				e=$(this).children('td').eq(12).text()+",";
 				f=$(this).children('td').eq(14).text()+",";
 				g=$(this).children('td').eq(15).text()+",";
 				h=$(this).children('td').eq(16).text()+",";
 				j=$(this).children('td').eq(17).text()+",";
 				id=$(this).children('td').eq(1).text()+",";
 				oid=$(this).children('td').eq(18).text()+",";
 				vo+=a+b+c+d+e+f+g+h+j+id+oid+configId+",";
 				
 		 	});	
 		}
 		vo = vo.substring(0,vo.length-1);
 		$.ajax({
	    	url:'tbConfigModelDataController.do?save' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{'vo':vo},
	    	success:function(data) {
	    		$.dialog.tips(data.msg,2);
	    	}
	    });
 	}
 	function back(){
 		var configId='${configId}';
 		$('#quotations').panel("refresh", "tbConfigModelDataController.do?back&configId="+configId);
 	}
 	
 	function change1(obj){
 		var heJia=0;
 		var discountPrice=0;
 		var xianChangJia=0;
 		var totalPrice=0;
 		
 		var quantity = $(obj).val();
 		var tt = $(obj).parent().parent();
 		var discountrate = $(tt.find("input")[2]).val();
 		
 		heJia = ($(tt.find("td")[7]).text()*1)*quantity;
		discountPrice = heJia*(1-discountrate);
		xianChangJia = discountPrice*($(tt.find("td")[11]).text()*1+1);
		totalPrice = xianChangJia+($(tt.find("td")[13]).text()*1)+($(tt.find("td")[14]).text()*1)+($(tt.find("td")[15]).text()*1)+($(tt.find("td")[16]).text()*1);
		$(tt.find("td")[8]).text(heJia.toFixed(4));
		$(tt.find("td")[10]).text(discountPrice.toFixed(4));
		$(tt.find("td")[12]).text(xianChangJia.toFixed(4));
		$(tt.find("td")[17]).text(totalPrice.toFixed(4));
		
		sum();
 	}
 	function change2(obj){
 		var heJia=0;
 		var discountPrice=0;
 		var xianChangJia=0;
 		var totalPrice=0;
 		
 		var discountrate = $(obj).val();
 		var tt = $(obj).parent().parent();
 		var quantity = $(tt.find("input")[1]).val();
 		
 		var endid= $(tt.find("td")[1]).text();
 		$.ajax({
	    	url:'tbConfigModelDataController.do?getDiscountRate' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{'endid':endid},
	    	success:function(data) {
	    		if(discountrate !=data){
	    			$(obj).css("color","red");
	    		}else{
	    			$(obj).css("color","black");
	    		}
	    	}
	    });
 		
 		heJia = ($(tt.find("td")[7]).text()*1)*quantity;
		discountPrice = heJia*(1-discountrate);
		xianChangJia = discountPrice*($(tt.find("td")[11]).text()*1+1);
		totalPrice = xianChangJia+($(tt.find("td")[13]).text()*1)+($(tt.find("td")[14]).text()*1)+($(tt.find("td")[15]).text()*1)+($(tt.find("td")[16]).text()*1);
		$(tt.find("td")[8]).text(heJia.toFixed(4));
		$(tt.find("td")[10]).text(discountPrice.toFixed(4));
		$(tt.find("td")[12]).text(xianChangJia.toFixed(4));
		$(tt.find("td")[17]).text(totalPrice.toFixed(4));
		
		sum();
 	}
 	
 	function sum(){
 		var heJia=0;
 		var discountPrice=0;
 		var xianChangJia=0;
 		var totalPrice=0;
 		for(var i=1;i<$("#ttt tr").length-2;i++){
 			$('#ttt tr').eq(i).each(function(){
 				heJia += ($(this).children('td').eq(8).text())*1;
 				discountPrice += ($(this).children('td').eq(10).text())*1;
 				xianChangJia += ($(this).children('td').eq(12).text())*1;
 				totalPrice += ($(this).children('td').eq(17).text())*1;
 		 	});
 		}
 		
 		$('#t1').html(heJia.toFixed(4));
 		$('#t2').html(discountPrice.toFixed(4));
 		$('#t3').html(xianChangJia.toFixed(4));
 		$('#t4').html(totalPrice.toFixed(4));
 	}
 	
 	function del(){
 		$("input[name='box']:checked").each(function(){
 			$(this).parent().parent().remove();
 		});
 		
 		if($("#ttt tr").length<4){
 			$("#checkAll").attr("checked",false);
 		}
 		
 		if($("#ttt tr").length>3){
 			sum();
 			for(var i=1;i<$("#ttt tr").length-2;i++){
 	 			$('#ttt tr').eq(i).each(function(){
 	 				$(this).children('td').eq(0).text(i);	
 	 		 	});
 	 		}
 		}else{
 			$('#t1').html(0);
 	 		$('#t2').html(0);
 	 		$('#t3').html(0);
 	 		$('#t4').html(0);
 		}	
 	}
 	function checkAll(){
 		
 		$("#checkAll").click(function() {
 			$('input[name="box"]').attr("checked",this.checked);
 		});

 		$('input[name="box"]').each(function(){
 			$(this).click(function(){
 				$("#checkAll").attr("checked",$('input[name="box"]').length == $("input[name='box']:checked").length ? true : false);
 			});
 		});
 	}
	/*function clickByTr(){
		var i=1;
 		$("#tb tr").each(function(){
 			$(this).click(function(){
 				if($(this).find(":checkbox").attr("checked")){
 		          	
 		          	$(this).find(":checkbox").attr("checked",false);
 		      	}
 		      	else{
 		        	
 		        	$(this).find(":checkbox").attr("checked",true);
 		      	}
 			});
 		});
 		
 		
 	}*/
 	
 </script>