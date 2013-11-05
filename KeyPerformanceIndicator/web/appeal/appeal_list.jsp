<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>考核关系配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/JavaScript">
		function ev_add(busi) {
			window.location = "${ROOT}/openWorkFlowBusiness.do?busiId="+busi;
		}
		
		function ev_edit(id, busi) {
			window.location = "${ROOT}/openWorkFlowBusiness.do?busiId="+busi+"&resourceId="+id;
		}
		
		function ev_delete() {
			if (SelectUtil.checkedCount("selectrow")>0 ){
				if(window.confirm("确定要删除所选项吗？")) {
					var form = $_E("form1");
					form.action = "${ROOT}/deleteAppealCheck.do";
					form.submit();
				}
			}else{
				alert("请选择要删除的项!");
			}
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="${ROOT}/listAppealCheck.do">
<div class="LN_popupsBox">
	<div class="LN_formBox">
	<div class="LN_formTitle">员工绩效考核申诉表</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">申诉表列表</div>
						<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
						<div class="LN_popupsAdd60" style="width:120px;"><a href="#" onclick="ev_add('SSFHY');return false;">填写年度申诉表</a></div>
						<div class="LN_popupsAdd60" style="width:120px;"><a href="#" onclick="ev_add('SSFHM');return false;">填写月度申诉表</a></div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="LN_press">
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
						<tr>
							<td class="LN_tableBoxtitle2" width="8%">
							<input type="checkbox" id="selectall" name="selectall" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/>序号</td>
							<td class="LN_tableBoxtitle2" width="20%">部门</td>
							<td class="LN_tableBoxtitle2" width="10%">申请人</td>
							<td class="LN_tableBoxtitle2" width="20%">申请时间</td>
							<td class="LN_tableBoxtitle2" width="15%">考核周期</td>
							<td class="LN_tableBoxtitle2" width="10%">状态</td>
						</tr>
						<tbody id="itemList">
							<c:forEach var="o" items="${list}" varStatus="idx">
								<tr>
            						<td class="LN_tableBoxText2">
            						<input type="checkbox" id="selectrow" name="selectrow" class="checkboxInput" value="${o.id}"/>${idx.count}</td>
            						<td class="LN_tableBoxText2">${o.appliorOrg.name}</td>
            						<td class="LN_tableBoxText2">
            						<a href="#" class="LN_BlueLink" onclick="ev_edit('${o.id}','${o.busiType}');return false;">${o.appealorName}</a></td>
            						<td class="LN_tableBoxText2"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd"/></td>
            						<td class="LN_tableBoxText2">${o.batchDateDesc}</td>
            						<td class="LN_tableBoxText2">${o.boStatusDesc}</td>
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