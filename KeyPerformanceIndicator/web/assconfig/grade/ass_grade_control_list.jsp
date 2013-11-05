<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/web/pub/head.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>${WEB_TITLE}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/JavaScript">
		function ev_edit(id) {
			openWin("${ROOT}/editAssessmentGradeSet.do?orgId=${org.id}&id=" + id,
				{showCenter:true,width:640,height:450});
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
				document.form1.action="${ROOT}/deleteAssessmentGradeSet.do";
				document.form1.submit();
			}
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="${ROOT}/listAssessmentGradeSet.do">
<div class="LN_popupsBox">
	<div class="LN_formBox">
	<div class="LN_formTitle">等级比例控制</div>
	<div align="left">[<font color="#CC3300" >${org.fullName}</font>]下的等级比例控制。</div> 
		<table width="95%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">等级比例控制列表</div>
						<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
						<div class="LN_popupsAdd60"><a href="#" onclick="ev_edit('');return false;">新增</a></div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="LN_press">
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
						<tr>
							<td class="LN_tableBoxtitle2" width="10%"><input type="checkbox" id="selectall" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/>序号</td>
							<td class="LN_tableBoxtitle2" width="25%">组织名称</td>
							<td class="LN_tableBoxtitle2" width="10%">周期</td>
							<td class="LN_tableBoxtitle2" width="20%">创建时间</td>
							<td class="LN_tableBoxtitle2" width="10%">优秀人数</td>
							<td class="LN_tableBoxtitle2" width="10%">良好人数</td>
							<td class="LN_tableBoxtitle2" width="10%">其它人数</td>
							<!-- <td class="LN_tableBoxtitle2" width="5%">操作</td> -->
						</tr>
						<tbody id="itemList">
							<c:forEach var="o" items="${setList}" varStatus="idx">
								<tr>
            						<td class="LN_tableBoxText2"><input type="checkbox" name="selectrow" class="checkboxInput" value="${o.id}"/>${idx.count}</td>
            						<td class="LN_tableBoxText2"><a class="LN_BlueLink" href="#" onclick="ev_edit('${o.id}');return false;">${o.orgName}</a></td>
            						<td class="LN_tableBoxText2">${o.batchDateDesc}</td>
            						<td class="LN_tableBoxText2"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
            						<td class="LN_tableBoxText2">${o.gradeP1MaxNum}</td>
            						<td class="LN_tableBoxText2">${o.gradeP2MaxNum}</td>
            						<td class="LN_tableBoxText2">${o.totalOtherNum}</td>
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