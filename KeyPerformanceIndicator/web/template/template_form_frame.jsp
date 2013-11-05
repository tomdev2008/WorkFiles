<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	辽宁电信KPI考核系统
</title>
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
<%
	session.setAttribute(Globals.COPY_DATA_IDS,null);
%>
		<script type="text/javascript">
			
			function switchBar(){
				var img = Util.$_E('fBtn');
				var td = Util.$_E('fTd');

				if(img.src.indexOf('mid_right_02') == -1) {
					img.src="${ROOT}/img/mid_right_02.gif";
					td.style.background="url(${ROOT}/img/mid_bg_02.gif) repeat";
					$_E('divForm').width = '80%';
				} else {
					img.src="${ROOT}/img/mid_left_01.gif";
					td.style.background="url(${ROOT}/img/mid_bg_01.gif) repeat";
					$_E('divForm').width = '100%';
				}
			}
		</script>
</head>
<body class="LN_body">
<form action="${ROOT }/saveTemplate.do" name="form1" method="post" id="form1">
<div class="LN_popupsBox">
	<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
	<div class="LN_popupsSafe-C"><a href="#" onclick="fbody.ev_save(1);return false;">保存并关闭</a></div>
	<div class="LN_popupsSafe"><a href="#" onclick="fbody.ev_save(0);return false;">保存</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">模板配置</div>
<div class="LN_colorRed">红星*是必填</div>
<table width="100%" height="100%" cellspacing="0" cellpadding=0 border=0>
			<tr>
				<td width="80%" id="divForm">
					<IFRAME scrolling="auto" frameborder="0" src="${ROOT}/editTemplate.do?templateId=${param.templateId}&orgId=${param.orgId}" width=100% height=100% name="fform"></IFRAME>
				</td>
				
				<td  style="background:url(${ROOT}/img/mid_bg_02.gif) repeat ; width:5px;" id="fTd">
					<a title="关闭/打开左栏" href="javascript:switchBar()">
						<img id="fBtn" src="${ROOT}/img/mid_right_02.gif" border="0">
					</a>
				</td>
				<td width="20%" id='divTree' name="divTree">
					
				</td>				
				<td  style="background:url(${ROOT}/img/mid_bg_02.gif) repeat ; width:5px;" >&nbsp;</td>
			</tr>
		</table>
</div>
</div>
</form>
</body>
</html>
