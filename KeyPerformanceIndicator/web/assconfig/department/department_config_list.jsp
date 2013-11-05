<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>主管专业线配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/web/pub/head.inc"%>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/JavaScript">
		function ev_query() {
			var highOrgId = "";
			var highOrgInfos = $_E("highOrgValue").value.split("!@!");
			if (highOrgInfos != "")
				highOrgId = highOrgInfos[2];
			
			var lowOrgId = "";
			var lowOrgInfos = $_E("lowOrgValue").value.split("!@!");
			if (lowOrgInfos != "")
				lowOrgId = lowOrgInfos[2];
			
			document.form1.action = "${ROOT}/listDepartmentConfig.do"
				+ "?highOrgId=" + highOrgId + "&lowOrgId=" + lowOrgId;
			document.form1.submit();
		}
		
		function ev_add() {
			openWin("${ROOT}/addDepartmentConfigOpen.do",
				{showCenter:true,width:640,height:450});
		}
		
		function ev_edit(id) {
			openWin("${ROOT}/editDepartmentConfigOpen.do"
				+ "?configId=" + id,
				{showCenter:true,width:640,height:450});
		}
		
		function ev_delete(id) {
			var highOrgId = "";
			var highOrgInfos = $_E("highOrgValue").value.split("!@!");
			if (highOrgInfos != "")
				highOrgId = highOrgInfos[2];
			
			var lowOrgId = "";
			var lowOrgInfos = $_E("lowOrgValue").value.split("!@!");
			if (lowOrgInfos != "")
				lowOrgId = lowOrgInfos[2];
			
			if (confirm("确定要删除所选配置吗？")) {
				document.form1.action = "${ROOT}/delDepartmentConfig.do"
					+ "?highOrgId=" + highOrgId + "&lowOrgId=" + lowOrgId
					+ "&configId=" + id;
				document.form1.submit();
			}
		}
		
		function ev_delete() {
			var highOrgId = "";
			var highOrgInfos = $_E("highOrgValue").value.split("!@!");
			if (highOrgInfos != "")
				highOrgId = highOrgInfos[2];
			
			var lowOrgId = "";
			var lowOrgInfos = $_E("lowOrgValue").value.split("!@!");
			if (lowOrgInfos != "")
				lowOrgId = lowOrgInfos[2];
			
			var number = 0;
			for (var i = 0; i < form1.elements.length; i++) {
				var e = form1.elements[i];
				if (e.name == "selectrow") {
					if (e.checked)
						number = number + 1;
				}
			}
			
			if (number == 0) {
				alert("请选择要删除的配置。");
				return false;
			}
			if (confirm("确定要删除所选的配置吗？")) {
				document.form1.action = "${ROOT}/delDepartmentConfigBatch.do"
					+ "?highOrgId=" + highOrgId + "&lowOrgId=" + lowOrgId;
				document.form1.submit();
			}
		}
		
		function ev_show() {
			if ($_E("paramTable").style.display == "none") {
				$_E("paramTable").style.display = "";
				$_E("paramBr").style.display = "";
			} else {
				$_E("paramTable").style.display = "none";
				$_E("paramBr").style.display = "none";
			}
		}
		
		function ev_reset() {
			$_E("highOrgText").value = "";
			$_E("highOrgValue").value = "";
			$_E("lowOrgText").value = "";
			$_E("lowOrgValue").value = "";
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="">
<div class="LN_popupsBox">
	<div class="LN_formBox">
	<div class="LN_formTitle">主管专业线配置</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">主管专业线配置列表</div>
						<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
						<!-- <div class="LN_popupsEdit60"><a href="#" onclick="ev_edit();return false;">修改</a></div> -->
						<div class="LN_popupsQuery60"><a href="#" onclick="ev_show();return false;">查询</a></div>
						<div class="LN_popupsAdd60"><a href="#" onclick="ev_add();return false;">新增</a></div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="LN_press">
					<table id="paramTable" name="paramTable" style="display:none" width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
						<tr>
							<td class="LN_tableBoxtitle" width="11%">上级主管部门</td>
							<td class="LN_tableBoxText" width="31%">
								<input type="text" id="highOrgText" name="highOrgText" class="LN_Input" value="${highOrg.name}" readonly="readonly"/>
								<input type="hidden" id="highOrgValue" name="highOrgValue" class="LN_Input" value="${highOrg.addressInfo}"/>
								<span class="LN_tableBoxText2">
									<input type="button" id="button1" name="button1" class="LN_button" value="选择" 
									onclick="getAddressList('0','1','0','highOrgText','highOrgValue');return false;"/>
								</span>
							</td>
							<td class="LN_tableBoxtitle" width="11%">下级分管部门</td>
							<td class="LN_tableBoxText" width="31%">
								<input type="text" id="lowOrgText" name="lowOrgText" class="LN_Input" value="${lowOrg.name}" readonly="readonly"/>
								<input type="hidden" id="lowOrgValue" name="lowOrgValue" class="LN_Input" value="${lowOrg.addressInfo}"/>
								<span class="LN_tableBoxText2">
									<input type="button" id="button2" name="button2" class="LN_button" value="选择" 
									onclick="getAddressList('0','1','0','lowOrgText','lowOrgValue');return false;"/>
								</span>
							</td>
							<td class="LN_tableBoxText" width="16%">
								<span class="LN_tableBoxText2">
									<input type="button" id="button3" name="button3" class="LN_button" value="确定" onclick="ev_query();return false;"/>
								</span>
								<span class="LN_tableBoxText2">
									<input type="button" id="button4" name="button4" class="LN_button" value="重置" onclick="ev_reset();return false;"/>
								</span>
							</td>
						</tr>
					</table>
					<br id="paramBr" name="paramBr" style="display:none"/>
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
						<tr>
							<td class="LN_tableBoxtitle2" width="10%"><input type="checkbox" id="selectall" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/>序号</td>
							<td class="LN_tableBoxtitle2" width="22%">上级主管单位</td>
							<td class="LN_tableBoxtitle2" width="23%">上级主管部门</td>
							<td class="LN_tableBoxtitle2" width="22%">下级分管单位</td>
							<td class="LN_tableBoxtitle2" width="23%">下级分管部门</td>
							<!-- <td class="LN_tableBoxtitle2">操作</td> -->
						</tr>
						<tbody id="itemList">
							<c:forEach var="o" items="${configList}" varStatus="idx">
								<tr>
									<td class="LN_tableBoxText2"><input type="checkbox" name="selectrow" class="checkboxInput" value="${o.id}"/>${idx.count}</td>
									<td class="LN_tableBoxText2">${o.highOrg.companyName}</td>
									<td class="LN_tableBoxText2">${o.highOrg.departmentName}</td>
									<td class="LN_tableBoxText2">${o.lowOrg.companyName}</td>
									<td class="LN_tableBoxText2">${o.lowOrg.departmentName}</td>
									<!-- <td class="LN_tableBoxText2">
										<input name="Submit9" type="submit" id="Submit9" class="LN_button" value="删除" 
										onclick="ev_delete('${o.id}');return false;" />
									</td> -->
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
</body>
</html>