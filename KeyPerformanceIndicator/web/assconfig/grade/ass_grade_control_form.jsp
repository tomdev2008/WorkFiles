
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>${WEB_TITLE}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
	<script language="javascript" type="text/JavaScript">
		function ev_save(flag) {
			var fm = document.form1;	
			if(CheckForm(fm)){
				fm.close_window.value = flag;
				fm.submit();
			}
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="${ROOT}/saveAssessmentGradeSet.do">
<input type="hidden" name="resflush_parent" value="1"/>
<input type="hidden" name="close_window" value="0"/>
<input type="hidden" name="id" value="${instance.id}"/>
<input type="hidden" name="bindOrgId" value="${orgId}"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
	<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
	<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
</div>
	<div class="LN_formBox">
	<div class="LN_formTitle">等级比例控制配置</div>
		<div class="LN_colorRed">红星*是必填</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">等级比例控制信息</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="LN_press">
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
						<tr>
							<td class="LN_tableBoxtitle" width="10%"><span class="LN_colorRed">*</span>组织名称</td>
							<td class="LN_tableBoxText" width="35%">
								<input type="hidden" name="orgValue" value="${instance.orgAddress}"/>
								<input type="text" id="orgName" name="orgName" class="LN_Input300" value="${instance.orgName}" check="notBlank;isString('#',100)" required='true' showName='组织名称' readOnly="true"/>
								<span class="LN_tableBoxText2">
								<input name="Submit7" type="button" id="Submit7" class="LN_big_button3" value="选择" onclick="getAddressList('0','1','0','orgName','orgValue');return false;" />
								</span>
							</td>
						</tr>
						<tr>
							<td class="LN_tableBoxtitle" width="10%"><span class="LN_colorRed">*</span>适用周期</td>
							<td class="LN_tableBoxText" width="30%">
							<page:singleBatchLN batch1="${instance.batchDate}" batchType="4"/>
							</td>
						</tr>
						<c:forEach var="o" items="${gradeMappings}">
						<tr>
							<td class="LN_tableBoxtitle" width="10%">${o.name}数量</td>
							<td class="LN_tableBoxText" width="30%">
							<c:choose>
								<c:when test="${o.code==instance.gradeP1}"><c:set var="gradeNum" value="${instance.gradeP1MaxNum}"/></c:when>
								<c:when test="${o.code==instance.gradeP2}"><c:set var="gradeNum" value="${instance.gradeP2MaxNum}"/></c:when>
								<c:when test="${o.code==instance.gradeP3}"><c:set var="gradeNum" value="${instance.gradeP3MaxNum}"/></c:when>
								<c:when test="${o.code==instance.gradeP4}"><c:set var="gradeNum" value="${instance.gradeP4MaxNum}"/></c:when>
								<c:when test="${o.code==instance.gradeP5}"><c:set var="gradeNum" value="${instance.gradeP5MaxNum}"/></c:when>
								<c:otherwise><c:set var="gradeNum" value="0"/></c:otherwise>
							</c:choose>
								<input type="text" id="${o.code}" name="grade_${o.code}" class="LN_Input100" check="notBlank;isInt('+0')" required='true' value="${gradeNum}"/>
							</td>
						</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html>