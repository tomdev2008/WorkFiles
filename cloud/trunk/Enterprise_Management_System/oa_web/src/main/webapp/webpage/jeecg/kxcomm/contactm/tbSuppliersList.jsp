<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbSuppliersList" title="供应商" actionUrl="tbCustomerEntityController.do?datagrid&type=2" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
    <t:dgCol title="公司名称" field="companyName" ></t:dgCol>
   <t:dgCol title="地址" field="address" width="70"></t:dgCol>
    <t:dgCol title="联系人" field="contact" ></t:dgCol>
   <t:dgCol title="邮箱" field="email" width="70"></t:dgCol>
   <t:dgCol title="电话" field="phone" width="70"></t:dgCol>
    <t:dgCol title="省份" field="jobPlaceId_jobPlace" ></t:dgCol>
    <t:dgCol title="纳税人识别号" field="taxpayerRegistrationNo" ></t:dgCol>
    <t:dgCol title="开户银行" field="depositBank" ></t:dgCol>
    <t:dgCol title="账户名称" field="accountName" ></t:dgCol>
    <t:dgCol title="账户号码" field="accountNumber" ></t:dgCol>
    <t:dgCol title="营业证" field="shopCard" ></t:dgCol>
    <t:dgCol title="开票信息" field="billingInformation" ></t:dgCol>
    <t:dgCol title="三证" field="threeCards" ></t:dgCol>
    <t:dgCol title="营业执照号" field="businessLicenseNo" ></t:dgCol>
    <t:dgCol title="企业法定代表人" field="legalRepresentative" width="70"></t:dgCol>
   <t:dgCol title="描述" field="description" ></t:dgCol>
   <t:dgToolBar title="录入" icon="icon-add" url="tbCustomerEntityController.do?suppliersAddorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbCustomerEntityController.do?suppliersAddorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbCustomerEntityController.do?suppliersAddorupdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove" url="tbCustomerEntityController.do?del" funname="delone"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
  <script type="text/javascript">
//删除
  function delone(title,url, id) {
  	var rowData = $('#'+id).datagrid('getSelected');
  	if (!rowData) {
  		tip('请选择要删除');
  		return;
  	}
  	$.dialog.confirm('确定删除吗', function(){
  		var i = rowData.id;
  		url += '&id='+rowData.id;
  		//直接操作
  		$.ajax({
  	    	url:'tbCustomerEntityController.do?del' , // 可以获取数据的接口
  	    	dataType:"json",
  	    	data:{'id':rowData.id},
  	    	success:function(data) {
  				$.dialog.tips(data.msg,2);
  				reloadTable();
  	    	}
  	    });
  	}, function(){
  	});
  }
  </script>