<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>休假人员配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@ include file="/web/pub/head.inc"%>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/JavaScript">
		function ev_query() {
			document.form1.action = "${ROOT}/listHolidayConfig.do";
			document.form1.submit();
		}
		
		function ev_add() {
			openWin("${ROOT}/addHolidayConfigOpen.do",
				{showCenter:true,width:640,height:450});
		}
		
		function ev_edit(id) {
			openWin("${ROOT}/editHolidayConfigOpen.do" 
				+ "?configId=" + id,
				{showCenter:true,width:640,height:450});
		}
		
		function ev_delete(id) {
			if (confirm("确定要删除所选休假人员配置吗？")) {
				document.form1.action = "${ROOT}/delHolidayConfig.do"
					+ "?configId=" + id;
				document.form1.submit();
			}
		}
		
		function ev_delete() {
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
				document.form1.action="${ROOT}/delHolidayConfigBatch.do";
				document.form1.submit();
			}
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="">
<div class="LN_popupsBox">
	<div class="LN_formBox">
	<div class="LN_formTitle">休假人员配置</div>
	<div align="left">[<font color="#CC3300" >${org.fullName}</font>]下的休假人员配置。</div> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">休假人员配置列表</div>
						<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
						<!-- <div class="LN_popupsEdit60"><a href="#" onclick="ev_edit();return false;">修改</a></div> -->
						<!-- <div class="LN_popupsQuery60"><a href="#" onclick="ev_show();return false;">查询</a></div> -->
						<div class="LN_popupsAdd60"><a href="#" onclick="ev_add();return false;">新增</a></div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="LN_press">
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
						<tr>
							<td class="LN_tableBoxtitle2" width="10%"><input type="checkbox" id="selectall" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/>序号</td>
							<td class="LN_tableBoxtitle2" width="10%">员工工号</td>
							<td class="LN_tableBoxtitle2" width="10%">姓名</td>
							<td class="LN_tableBoxtitle2" width="20%">岗位</td>
							<td class="LN_tableBoxtitle2" width="15%">休假周期</td>
							<td class="LN_tableBoxtitle2" width="10%">休假原因</td>
							<td class="LN_tableBoxtitle2" width="25%">休假说明</td>
							<!-- <td class="LN_tableBoxtitle2" width="5%">操作</td> -->
						</tr>
						<tbody id="itemList">
							<c:forEach var="o" items="${configList}" varStatus="idx">
								<tr>
            						<td class="LN_tableBoxText2"><input type="checkbox" name="selectrow" class="checkboxInput" value="${o.id}"/>${idx.count}</td>
            						<td class="LN_tableBoxText2">${o.user.userCode}</td>
            						<td class="LN_tableBoxText2"><a class="LN_BlueLink" href="#" onclick="ev_edit('${o.id}');return false;">${o.user.name}</a></td>
            						<td class="LN_tableBoxText2">${o.user.positionName}</td>
            						<td class="LN_tableBoxText2">${o.batchDesc}</td>
            						<td class="LN_tableBoxText2">${o.reasonDesc}</td>
            						<td class="LN_tableBoxText2">${o.description}</td>
            						<!-- <td class="LN_tableBoxText2">
										<input name="Submit9" type="submit" id="Submit9" class="LN_button" value="删除" 
										onclick="ev_delete('${o.id}');return false;"/>
									</td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
		<br />
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