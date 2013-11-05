<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html:html>
<head>
	<title>主管专业线配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
	<script language="javascript" type="text/JavaScript">
		function ev_add(flag) {
			var highOrgId = "";
			var highOrgInfos = $_E("highOrgValue").value.split("!@!");
			if (highOrgInfos != "")
				highOrgId = highOrgInfos[2];
			
			var lowOrgId = "";
			var lowOrgInfos = $_E("lowOrgValue").value.split("!@!");
			if (lowOrgInfos != "")
				lowOrgId = lowOrgInfos[2];
			
			var lowOrgIds = "";
			var lowOrgValues = $_E("lowOrgValue").value.split(",");
			if (lowOrgValues != "") {
				for (var i = 0; i < lowOrgValues.length; i++) {
					var lowOrgInfos = "";
					lowOrgInfos = lowOrgValues[i].split("!@!");
					if (lowOrgInfos != "")
						lowOrgIds += lowOrgInfos[2] + ",";
				}
				lowOrgIds = lowOrgIds.substring(0, lowOrgIds.length - 1);
			}
			
			if (highOrgId == "") {
				alert("请选择上级主管部门。");
				return;
			}
			if (lowOrgIds == "") {
				alert("请选择下级分管部门。");
				return;
			}
			if (confirm("确定要添加所选的配置吗？")) {
				document.form1.action = "${ROOT}/addDepartmentConfig.do"
					+ "?highOrgId=" + highOrgId + "&lowOrgIds=" + lowOrgIds
					+ "&flag=" + flag;
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
		<div class="LN_popupsSafe-C"><a href="#" onclick="ev_add(1);return false;">保存并关闭</a></div>
		<div class="LN_popupsSafe"><a href="#" onclick="ev_add(0);return false;">保存</a></div>
	</div>
	<div class="LN_formBox">
		<div class="LN_formTitle">新增主管专业线配置</div>
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
				<td class="LN_boxtitlebg">主管专业线配置信息</td>
			</tr>
  			<tr>
  				<td class="LN_press">
  				
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
            <tr>
				<td class="LN_tableBoxtitle" width="35%" align="right">
					<font color="red">*</font>上级主管部门&nbsp;&nbsp;
				</td>
				<td class="LN_tableBoxText" width="65%">&nbsp;&nbsp;
					<input type="text" id="highOrgText" name="highOrgText" class="LN_Input" value="${highOrgText}" readonly="readonly"/>
					<input type="hidden" id="highOrgValue" name="highOrgValue" class="LN_Input" value="${highOrgValue}"/>
					<span class="LN_tableBoxText2">
						<input type="button" id="button1" name="button1" class="LN_button" value="选择" 
							onclick="getAddressList('0;','1','0','highOrgText','highOrgValue');return false;"/>
					</span>
				</td>
            </tr>
            <tr>
				<td class="LN_tableBoxtitle" width="35%" align="right">
					<font color="red">*</font>下级分管部门&nbsp;&nbsp;
				</td>
				<td class="LN_tableBoxText" width="65%">&nbsp;&nbsp;
					<input type="text" id="lowOrgText" name="lowOrgText" class="LN_Input" value="${lowOrgText}" readonly="readonly"/>
					<input type="hidden" id="lowOrgValue" name="lowOrgValue" class="LN_Input" value="${lowOrgValue}"/>
					<span class="LN_tableBoxText2">
						<input type="button" id="button" name="button2" class="LN_button" value="选择" 
							onclick="getAddressList('0;','n','0','lowOrgText','lowOrgValue');return false;"/>
					</span>
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