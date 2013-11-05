<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>编辑岗位职责</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script src="${ROOT}/component/FCKeditor/fckeditor.js" ></script>
	<script language="javascript" type="text/JavaScript">
		/**
		 * 文档内容编辑器
 		*/
		function initFCKEditor(contentID) {
			var sBasePath = '<%=request.getContextPath()%>/component/FCKeditor/' ;
			var oFCKeditor = new FCKeditor(contentID);
			oFCKeditor.BasePath	= sBasePath;
			oFCKeditor.Width = ${editWidth};
			oFCKeditor.Height = ${editHeight};
			oFCKeditor.ReplaceTextarea();
		}
		
		function ev_save() {
			var form = $_E("form1");
			var value = form.userDuty.value;
			if(value.length>2000){
				alert("不可超过2000字符！");return ;
			}
			form.action = "${ROOT}/saveUserDuty.do";
			form.submit();
		}
		
		function ev_back() {
			window.location = "${ROOT}/editUser.do?id=${user.id}";
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="">
<input type="hidden" id="id" name="id" value="${user.id}"/>
<input type="hidden" id="backUrl" name="backUrl" value="${backUrl}"/>
<input type="hidden" id="editWidth" name="editWidth" value="${editWidth}"/>
<input type="hidden" id="editHeight" name="editHeight" value="${editHeight}"/>
<div class="LN_popupsBox">
	<div class="LN_formBox">
		<div class="LN_formTitle">编辑岗位职责</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">岗位职责</div>
						<div class="LN_popupsReset60"><a href="#" onclick="ev_back();return false;">返回</a></div>
						<div class="LN_popupsSafe"><a href="#" onclick="ev_save();return false;">保存</a></div>
					</div>
				</td>
			</tr>
			<tr>
				<td width="100%">
					<textarea name="userDuty" id="userDuty" rows="30" cols="80" class="area" type="_moz">${user.userDuty}</textarea>
				</td>
				<script type="text/javascript">
					initFCKEditor('userDuty');
				</script>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html>