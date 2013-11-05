<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>部门职责</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css"> 
	<script src="${ROOT}/component/FCKeditor/fckeditor.js" ></script>
	<script language="javascript" type="text/JavaScript">
		/**
		 * 文档内容编辑器
 		*/
		function initFCKEditor(contentID) {
			var sBasePath = '${ROOT}/component/FCKeditor/' ;
			var oFCKeditor = new FCKeditor(contentID);
			oFCKeditor.BasePath	= sBasePath;
			oFCKeditor.Width = 760;
			oFCKeditor.Height = 550;
			oFCKeditor.ReplaceTextarea();
		}
		function ev_edit() {
			var form = $_E("form1");
			form.action = "${ROOT}/editOrgDuty.do";
			form.submit();
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="">
<input type="hidden" id="id" name="id" value="${org.id}"/>
<input type="hidden" id="backUrl" name="backUrl" value="${ROOT}/listOrgDuty.do"/>
<input type="hidden" id="editWidth" name="editWidth" value="760"/>
<input type="hidden" id="editHeight" name="editHeight" value="550"/>
	<div class="LN_path">当前位置：<a href="${ROOT}/main.jsp" target="workspace">首页</a> &gt; 部门职责</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
		<tr>
			<td>
				<div class="LN_Append">
					<div class="LN_popupsName">部门职责</div>
					<c:if test="${editFlag}">
					<div id="editBtn" name="editBtn" class="LN_popupsEdit60"><a href="#" onclick="ev_edit();return false;">编辑</a></div>
					</c:if>
				</div>
			</td>
		</tr>
		<tr>
			<td height="585" valign="top" class="LN_press LN_font">
				<div class="LN_Title2">${org.fullName}</div>
				<textarea name="userDuty" id="orgDuty" rows="50" cols="100" class="area" type="_moz">${org.orgDuty}</textarea>
				<script type="text/javascript">
					initFCKEditor('orgDuty');
				</script>
            </td>
		</tr>
	</table>
</form>
</body>
</html>