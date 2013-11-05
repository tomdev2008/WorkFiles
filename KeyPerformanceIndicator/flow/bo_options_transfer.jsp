<%-- add by zyf 2008-2-18 --%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
	<head>
		<title>流程转办意见</title>
	</head>
	<script>
	window.name="win_transfer" 
	var obj = window.dialogArguments;
	
function turningItem(btn){
	if(!check()) return;
	document.all.id.value = obj.ids;
	var url = "${ROOT}/turningItem.do?";
	var confirmContent = "您确认要转办吗?";
	
 	if (confirm(confirmContent)) { 
 		document.all.BATCH_ACTION_STARTING.style.display="";
 		inputoption.createOpinion();
 		btn.disabled = true;
   		form1.action= url;
		form1.submit();
	}
}

function check(){
	if(document.all.turningUserId.value==""){
		alert("请选择转办处理人!!");
		return false;
	}
	return true;
}

window.onload = function (){
	document.all.resourceId.value = obj.boIds;
	//alert(document.all.resourceId.value);
	var url = "${ROOT}/listOpinions.do?nodeId=${param.nodeCode}&isWrite=0&isAll=${param.isAll }";
	//alert(url)
	form2.action = url;
	form2.submit();
}
</script>
	<body>
	<html:base target="_self" />
		<form action="" name="form2" target="inputoption" method="post">
			<input type="hidden" name="resourceId" value="" />
		</form>
		<table height="100%" width="100%" border="0" cellpadding="0"
			cellspacing="0" class="define-box">
			<tr>
				<td class="dialog-titlebg" style="text-align: right;">
					<div class="dialog-title">
						<input type="button" class="button2" value="提交"
							onclick="turningItem(this);" />
						<input type="button" class="button2" value="关闭"
							onclick="window.close();" />&nbsp;&nbsp;&nbsp;
					</div>
				</td>
			</tr>
			<tr>
				<td height="481px" valign="top" class="address-text-bg">
					<div class="address-depict">

						<form name="form1" target="win_transfer" method="post" action="">
							<input type="hidden" name="close_window" value="1"/>
							<table height=23 cellSpacing=1 borderColorDark=#f4f5ff
								align="center" cellPadding=1 borderColorLight=#b5caff border=1
								width="95%">
								<tr>
									<td colspan="3" align="center" height="24">
										<b>意见记录</b>
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<iframe id="inputoption" name="inputoption" src="about:blank" frameborder="0"
											width="95%" height="100%"></iframe>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" width="30%">
										转办处理人：
									</td>
									<td align="left" width="70%">
										<INPUT type="hidden" name="turningUserId" value="" />
										<INPUT id="turningHandlerName" class=editline size=35 value=""
											name="turningHandlerName" readonly="readonly" />
										<input type='button' id='b1' value='选择' class="button"
											onclick="javascript:getAddressList('20','1','1','turningHandlerName','turningUserId');" />
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<INPUT type="hidden" name="id" value="" />
									</td>
								</tr>
							</table>
							<DIV id='BATCH_ACTION_STARTING' style="display: none;">
								<TABLE width='352' align='center' border='1' cellSpacing='0'
									cellpadding='3' bordercolorlight='#E2D7CF'
									bordercolordark='#FAF8F6'>
									<TR>
										<TD align="center">
											<img
												src='${ROOT}/web/flow/img/indicator_big.gif' />
											正在执行中....
										</TD>
									</TR>
								</TABLE>

							</DIV>
						</form>

					</div>
				</td>
			</tr>
		</table>

	</body>
</html>
