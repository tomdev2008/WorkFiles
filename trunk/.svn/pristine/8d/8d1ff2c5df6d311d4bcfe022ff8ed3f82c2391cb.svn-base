<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbPostList" title="岗位表" actionUrl="tbPostController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="岗位名称" field="postName" ></t:dgCol>
   <t:dgCol title="岗位职责" field="postDuty" ></t:dgCol>
   <t:dgCol title="所属部门" field="deptId_departname" ></t:dgCol>
   
   <t:dgToolBar title="录入" icon="icon-add" url="tbPostController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbPostController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbPostController.do?addorupdate" funname="detail"></t:dgToolBar>
   <t:dgToolBar title="地市设置" icon="icon-edit" url="tbPostController.do?fun" funname="setfunbyrole"></t:dgToolBar>
   <t:dgToolBar title="删除" icon="icon-remove" url="tbPostController.do?del" funname="delone"></t:dgToolBar>
  </t:datagrid>
  </div>
 <div region="east" style="width: 200px;" split="true">
  <div tools="#tt" class="easyui-panel" title="地市管理设置" style="padding: 10px;" fit="true" border="false" id="function-panel">
  	
  </div>
 </div>
 <div id="tt">
<%--update by zjf 20130327 改用easyui panel方法实现以修复有时不显示的问题  <a href="#" class="icon-save" onclick="mysubmit();"></a>
 --%>
 </div>
 </div>
 <script type="text/javascript">
	
	function setfunbyrole(title,url,id) {
		var rowData = $('#'+id).datagrid('getSelected');
	 	if (!rowData) {
	 		tip('请选择设置项目');
	 		return;
	 	}
	 	
	 	url += '&postId='+rowData.id;
		$("#function-panel").panel(
			{
				title :rowData.postName+":管辖地市"
			}
		);
		$('#function-panel').panel("refresh", url);
	}
	function delone(title,url, id) {
	 	var rowData = $('#'+id).datagrid('getSelected');
	 	if (!rowData) {
	 		tip('请选择删除项目');
	 		return;
	 	}
	 	
	 	url += '&id='+rowData.id;
	 	delObj(url,id);
	 	
	 }
</script>