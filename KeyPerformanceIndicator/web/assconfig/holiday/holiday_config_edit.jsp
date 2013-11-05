<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html:html>
<head>
	<title>休假人员配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/JavaScript">
		function ev_save(flag) {
			var userId = "";
			var userInfos = $_E("userValue").value.split("!@!");
			if (userInfos != "")
				userId = userInfos[2];
			var batchType = document.form1.selectType.value;
			var batchYear = document.form1.year1.value;
			var batchQuarter = document.form1.quarter1.value;
			var batchMonth = document.form1.month1.value;
			var reason = document.form1.reason.value;
			var description = document.form1.description.value;
			
			if (userId == "") {
				alert("请选择休假人员。");
				return;
			}
			
			var configId = "${config.id}"
			if (confirm("确定要修改所选的配置吗？")) {
				document.form1.action = "${ROOT}/editHolidayConfig.do" 
					+ "?configId=" + configId + "&userId=" + userId 
					+ "&batchType=" + batchType + "&batchYear=" + batchYear 
					+ "&batchQuarter=" + batchQuarter + "&batchMonth=" + batchMonth 
					+ "&reason=" + reason + "&flag=" + flag;
				document.form1.submit();
			}
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="">
<div class="LN_popupsBox">
	<div class="LN_popupsTop"></div>
	<div class="LN_Append">
		<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
		<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
		<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
	</div>
	<div class="LN_formBox">
		<div class="LN_formTitle">修改休假人员配置</div>
		<div align="right">
			<tr>
				<td class="list-caozuo">红星（<font color="red">*</font>）是必填</td>
			</tr>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td height="3" bgcolor="#4F81CE"></td>				
			</tr>
			<tr>
				<td class="LN_boxtitlebg">休假人员配置信息</td>
			</tr>
  			<tr>
  				<td class="LN_press">
  				
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
            <tr>
            	<td class="LN_tableBoxtitle" width="30%" align="right">
            		<font color="red">*</font>休假人员&nbsp;&nbsp;
            	</td>
          		<td class="LN_tableBoxText" width="70%">&nbsp;&nbsp;
            		<input type="text" id="userText" name="userText" class="LN_Input" value="${config.user.name}" />
            		<input type="hidden" id="userValue" name="userValue" class="LN_Input" value="${config.user.addressInfo}" />
            		<input type="button" id="button1" name="button1" class="LN_button" value="选择"
            			onclick="getAddressList('20','1','0','userText','userValue');return false;"/>
            	</td>
            </tr>
            <tr>
            	<td class="LN_tableBoxtitle" width="30%" align="right">
            		<font color="red">*</font>休假周期&nbsp;&nbsp;
            	</td>
            	<td class="LN_tableBoxText" width="70%">&nbsp;&nbsp;
            		<page:singleBatchLN batch1="${config.batch}" batchType="5"/>
            	</td>
            </tr>
            <tr>
            	<td class="LN_tableBoxtitle" width="30%" align="right">
            		<font color="red">*</font>休假原因&nbsp;&nbsp;
            	</td>
            	<td class="LN_tableBoxText" width="70%">&nbsp;&nbsp;
					<html:select name="config" property="reason">
						<html:optionsCollection name="reasonList" label="key" value="value"/>
					</html:select>
            	</td>
            </tr>
            <tr>
            	<td class="LN_tableBoxtitle" width="30%" align="right">
            		休假说明&nbsp;&nbsp;
            	</td>
            	<td class="LN_tableBoxText" width="70%">&nbsp;&nbsp;
            		<textarea name="description" cols="50" rows="5">${config.description}</textarea>
            	</td>
            </tr>
          </table>

				</td>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html:html>
<kpi:UIResponse/>