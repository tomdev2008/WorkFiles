<%@ page contentType="text/html; charset=utf-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>流程提交意见--${WEB_TITLE}</title>
</head>
<script type="text/javascript">
	window.name="win_options" ;
function submitNext(){
	var routeId = "${flwRoute.id}";
	var val = $_EV("opinion");
		if(val.trim()==''){
			alert("处理意见不可为空!");
			return;
		}
 		if(val.trim().length > 200) {
 			alert("意见只可以输入200个字符！");
			return;	
 		} 
 	var url = "";
 	if(${isBatchFlow}){
		url = "${ROOT}/submitNextSync.do";
	}else{
		url = "${ROOT}/submitFreeFlowNext.do";
	}
	if(window.confirm("您确认要提交${nextNode.nodeName}?")){
		form1.action= url;
	   	form1.target = "win_options";
	   	showProcessor();
	   	form1.opinion.focus();
		form1.submit();		
	}
}
</script>
<body>
<form name="form1" method="post" action="" target="win_options">
<input type="hidden" name="routeId" value="${flwRoute.id}"/>
<input type="hidden" name="id" value="${worklistItemIds}"/>
<input type="hidden" name="resourceId" value="${resourceId}"/>
<table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg" style="text-align: right;"><div class="dialog-title">
            <input type="button" class="button2" value="提交" onclick="submitNext(this);"/>
			<input type="button" class="button2" value="关闭" onclick="window.close();"/>&nbsp;&nbsp;&nbsp;
          </div></td>
        </tr>
        <tr valign="top" align="left">
          <td height="500px" valign="top" align="left" class="address-text-bg">
          <table  cellSpacing=1 borderColorDark=#f4f5ff align="center" cellPadding=1 borderColorLight=#b5caff border=1 width="95%" >
          	<c:if test="${not empty NO_HANDLER}">
          		<tr>
					<td align="center" width="70%" colspan="2">
						环节处理人：<input type="hidden" name="nodeHandler" value="" />
						<INPUT type="hidden" name="nodeProcessorValue" value="" />
						<INPUT id="nodeProcessorText" class=editline size=35 value="" name="nodeProecessorText" readonly="true"/>
						<input type='button' id='b1' value='选择' class="button" onclick="javascript:getAddressList('0;10;20','n','1','nodeProcessorText','nodeProcessorValue');"/>
					</td>
				</tr>
          	</c:if>
			<tr>
			    <td class="t" width="10%">意见填写</td>
				<td width="80%">
				  <textarea id="opinion" name="opinion" rows="4" cols="50">已确认</textarea>
			      <select title="选择意见" onmousewheel="return false;"  onchange="if(this.value!='')document.getElementById('opinion').innerHTML=this.value;">
			      	<option value="">请选择意见</option>
			      	<option value="已确认">已确认</option>
			      	<option value="已填写,请领导审核">已填写,请领导审核</option>
			      	<option value="已修改,请领导审核">已修改,请领导审核</option>
			      	<option value="已审核">已审核</option>
			      	<option value="已评分，请领导审核">已评分，请领导审核</option> 
			      	 <option value="已评分，请确认">已评分，请确认</option>
			      	<option value="请修改后再提交">请修改后再提交</option>
			      </select>
				</td>
			  </tr>
          	</table>
          	<center>
          	<!-- 环节信息 -->
			<iframe src="${ROOT}/listFlowOpinions.do?resourceId=${resourceId}&nodeCode=${nextNode.id}" width="95%" height="100%" frameborder="0"></iframe>
          </center>
          </td>
         </tr>
</table>

</form>
</body>
</html>