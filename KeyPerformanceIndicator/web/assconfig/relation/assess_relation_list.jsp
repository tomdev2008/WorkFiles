<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>考核关系配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/JavaScript">
		function ev_add() {
			var orgid = '${org.id}';
			if(orgid==''){
					alert("请选择组织！");
					return ;
			}
			openFullScreenWin("${ROOT}/listEditAssessRelation.do?orgId=${org.id}");
		}
		
		function ev_edit(id) {
			openFullScreenWin("${ROOT}/listEditAssessRelation.do?orgId=${org.id}&id=" + id);
		}
		
		function ev_delete() {
			if (SelectUtil.checkedCount("selectrow")>0 ){
				if(window.confirm("确定要删除所选的配置吗？")) {
					var form = $_E("form1");
					form.action = "${ROOT}/delAssessRelation.do";
					form.submit();
				}
			}else{
				alert("请选择要删除的配置。");
			}
		}
		
		function ev_query() {
			var form = $_E("form1");
			form.action = "${ROOT}/queryAssessRelation.do";
			form.submit();
		}
		
		function ev_reset() {
			$_E("name").value = "";
			$_E("scopeType").selectedIndex = 0;
			$_E("batchType").selectedIndex = 0;
			$_E("relationType").selectedIndex = 0;
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="${ROOT}/queryAssessRelation.do">
<div class="LN_popupsBox">
	<div class="LN_formBox">
	<div class="LN_formTitle">考核关系配置</div>
	 <div align="left">
       [<font color="#CC3300" >${org.fullName }</font>]下的考核关系配置。
	</div> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">考核关系配置列表</div>
						<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
						<div class="LN_popupsQuery60"><a href="#" onclick="Util.toggle('paramTable');setPHeight3();return false;">查询</a></div>
						<div class="LN_popupsAdd60"><a href="#" onclick="ev_add();return false;">新增</a></div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="LN_press">
					<table id="paramTable" name="paramTable" style="display:none" width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
						<tr>
							<td class="LN_tableBoxtitle" width="11%">名称</td>
							<td class="LN_tableBoxText" width="31%">
								<input type="text" name="name" value="${name}" class="LN_Input300"/>
							</td>
							<td class="LN_tableBoxtitle" width="11%">适用类型</td>
							<td class="LN_tableBoxText" width="31%">
								<select id="scopeType" name="scopeType" onchange="ev_paramRefresh()">
									<option value="">请选择</option>
									<option value="0" ${scopeType==0?'selected':''}>组织</option>
									<option value="20" ${scopeType==20?'selected':''}>员工</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="LN_tableBoxtitle" width="11%">考核周期</td>
							<td class="LN_tableBoxText" width="31%">
								<kpi:dictionary-select  name='batchType' type='ASS_CYCLE_TYPE' style="width:100px;" selected="${batchType}" htmlType="select" tipOptionText="请选择"/>								
							</td>
							<td class="LN_tableBoxtitle" width="11%">关系类型</td>
							<td class="LN_tableBoxText" width="31%">
								<kpi:dictionary-select  name='relationType' type='ASS_RELATION_TYPE' style="width:100px;" selected="${relationType}" htmlType="select" tipOptionText="请选择"/>
							</td>
						</tr>
						<tr>
							<td class="LN_tableBoxText" width="16%" colspan="4">
								<center>
									<input type="button" id="button3" name="button3" class="LN_big_button2" value="确定" onclick="ev_query();return false;"/>
									<input type="button" id="button4" name="button4" class="LN_big_button2" value="重置" onclick="ev_reset();return false;"/>
								</center>
							</td>
						</tr>
					</table>
					<br id="paramBr" name="paramBr" style="display:none"/>
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
						<tr>
							<td class="LN_tableBoxtitle2" width="10%"><input type="checkbox" id="selectall" name="selectall" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/>序号</td>
							<td class="LN_tableBoxtitle2" width="25%">名称</td>
							<td class="LN_tableBoxtitle2" width="10%">创建人</td>
							<td class="LN_tableBoxtitle2" width="20%">创建时间</td>
							<td class="LN_tableBoxtitle2" width="10%">适用类型</td>
							<td class="LN_tableBoxtitle2" width="15%">关系类型</td>
							<td class="LN_tableBoxtitle2" width="10%">排序</td>
						</tr>
						<tbody id="itemList">
							<c:forEach var="o" items="${relationList}" varStatus="idx">
								<tr>
            						<td class="LN_tableBoxText2"><input type="checkbox" id="selectrow" name="selectrow" class="checkboxInput" value="${o.id}"/>${idx.count}</td>
            						<td class="LN_tableBoxText2"><a class="LN_BlueLink" href="#" onclick="ev_edit('${o.id}');return false;">${o.name}</a></td>
            						<td class="LN_tableBoxText2">${o.createName}</td>
            						<td class="LN_tableBoxText2">${o.createDateDesc}</td>
            						<td class="LN_tableBoxText2">${o.scopeTypeDesc}</td>
            						<td class="LN_tableBoxText2">${o.relationTypeDesc}</td>
            						<td class="LN_tableBoxText2">${o.priority}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
		<br/>
		<kpi:page-bar formId="form1"/>
	</div>
</div>
</form>
<script>
	window.onload = function() {
		setPHeight3();
	}
</script>
</body>
</html>