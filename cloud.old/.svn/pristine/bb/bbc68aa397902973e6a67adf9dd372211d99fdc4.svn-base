<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbInventoryList" title="产品库存" actionUrl="tbInventoryController.do?datagrid" idField="id" fit="true"  sortName="buydate" sortOrder="desc" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="产品类别" field="category" ></t:dgCol>
   <t:dgCol title="产品名称" field="name" ></t:dgCol>
   <t:dgCol title="规格型号" field="model" ></t:dgCol>
   <t:dgCol title="配置" field="configuration" ></t:dgCol>
   <t:dgCol title="数量" field="num" ></t:dgCol>
   <t:dgCol title="单位" field="unit" ></t:dgCol>
   <t:dgCol title="购置日期" field="buydate" formatter="yyyy-MM-dd"  ></t:dgCol>
   <t:dgCol title="购置金额" field="buymoney"  ></t:dgCol>
   <t:dgCol title="合同号" field="contractno"  ></t:dgCol>
   <t:dgCol title="康讯订单号" field="kxorderno"  ></t:dgCol>
   <t:dgCol title="所在地点" field="place" ></t:dgCol>
   <t:dgCol title="盘存时间" field="inventorydate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="领用人" field="users" ></t:dgCol>
   <t:dgCol title="领用时间" field="usedate" formatter="yyyy-MM-dd"  ></t:dgCol>
   <t:dgCol title="领用数量" field="usenum"  ></t:dgCol>
   <t:dgCol title="备注" field="remark"  ></t:dgCol>
   <t:dgCol title="状态" field="status" ></t:dgCol>
   <t:dgCol title="出库时间" field="outdate" formatter="yyyy-MM-dd" ></t:dgCol>
   <t:dgCol title="出库编号" field="outno"  ></t:dgCol>
   <t:dgCol title="出库用途" field="outdescribe"  ></t:dgCol>
   
   <t:dgToolBar title="录入" icon="icon-add" url="tbInventoryController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbInventoryController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbInventoryController.do?addorupdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove"  funname="delone"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 function delone() {
		var rowData = $('#tbInventoryList').datagrid('getSelected');
		if (!rowData) {
			tip('请选择要删除');
			return;
		}
		delObj('tbInventoryController.do?del&id='+ rowData.id,'tbInventoryList');
	}
 </script>