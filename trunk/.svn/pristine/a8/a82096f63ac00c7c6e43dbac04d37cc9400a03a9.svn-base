<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>

<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbPostList" title="岗位表" actionUrl="tbPostController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="岗位名称" field="postName" ></t:dgCol>
   <t:dgCol title="岗位职责" field="postDuty" ></t:dgCol>
   <t:dgCol title="所属部门" field="deptId_departname" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbPostController.do?del&id={id}" />
   <t:dgFunOpt title="地市设置" funname="setfunbyrole(id,postName)"></t:dgFunOpt>
   <t:dgToolBar title="录入" icon="icon-add" url="tbPostController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbPostController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbPostController.do?addorupdate" funname="detail"></t:dgToolBar>
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
	function setfunbyrole(id,roleName) {
		$("#function-panel").panel(
			{
				title :roleName+":管辖地市"
			}
		);
		$('#function-panel').panel("refresh", "tbPostController.do?fun&postId=" + id);
	}
</script>