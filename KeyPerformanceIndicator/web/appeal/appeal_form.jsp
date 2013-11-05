<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<htm>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${WEB_TITLE}</title>
<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css"> 
<script src="${ROOT}/web/appeal/js/appeal.js"></script>
<script type="text/javascript">
<!--
	/*
	*验证一下是否已经保存了
	*/
	function checkView(routeId){
		var flag = false;
		if(CheckForm(document.form1)){
			var url = "${ROOT}/saveAppealCheck.do";
			new Ajax.Request(url, {
					onSuccess:function(response){
						var result = eval('('+response.responseText+')');
						if(result.returnValue=="ok"){
							document.getElementById("resourceId").value = result.resourceId;
							document.getElementById("appealId").value = result.resourceId;
							flag = true;
						}else{
							alert(result.returnValue);
							flag = false;
						}
					},
					parameters: $('form1').serialize(true),
					asynchronous:false
				});
		}
		return flag;
	}
	
	function AA_Save(){
		if(CheckForm(document.form1)){
			var url = "${ROOT}/saveAppealCheck.do";
			new Ajax.Request(url, {
					onSuccess:function(response){
						var result = eval('('+response.responseText+')');
						if(result.returnValue=="ok"){
							document.getElementById("resourceId").value = result.resourceId;
							document.getElementById("appealId").value = result.resourceId;
							alert("操作成功！");
						}else{
							alert(result.returnValue);
						}
					},
					parameters: $('form1').serialize(true),
					asynchronous:false
				});
		}
	}
	
	function AA_Back(){
		window.location = "${ROOT}/listAppealCheck.do";
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="">
<input type="hidden" name="appealId" id="appealId" value="${appeal.id}" />
<input type="hidden" name="resourceId" id="resourceId" value="${appeal.id}" />
<div class="LN_popupsBox">
<div class="LN_Append">
     <div class="LN_bottomReset60"><a href="#" onclick="AA_Back();return false;">返回</a></div>
     <div id="controlArea">
	     <page:route/>
	     <div class="LN_popupsSafe"><a href="#" onclick="AA_Save();return false;">保存</a></div>
     </div>
     <c:if test="${appeal.boStatus!=0}">
     <div class="LN_popupsTrace100"><a href="#" onclick="ev_wlTrace('${appeal.id }');return false;">流程跟踪信息</a></div>
     </c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">员工绩效考核申诉表</div>
<kpi:WorkFlowItemTag working="false"/>
<div class="LN_colorRed">红星*是必填项</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">申诉表</td>
  </tr>
  <tr>
    <td class="LN_press">
	<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
	      <tr>
	        <td width="8%" class="LN_tableBoxtitle2">部门</td>
	        <td width="25%" class="LN_tableBoxText">
	        <input type="text" name="textfield" id="textfield" class="LN_Input" readOnly="true" value="${user.org.name}"/></td>
	        <td class="LN_tableBoxtitle2">姓名</td>
	        <td class="LN_tableBoxText"><input type="text" name="textfield5" id="textfield5" class="LN_Input" readOnly="true" value="${appeal.ownerName}"/></td>
	        <td width="8%" class="LN_tableBoxtitle2">岗位名称</td>
	        <td class="LN_tableBoxText">
	        <input type="text" name="textfield3" id="textfield3" class="LN_Input" readOnly="true" value="${user.positionName}"/></td>
	      </tr>
	      <tr>
	        <td class="LN_tableBoxtitle2">岗位等级</td>
	        <td class="LN_tableBoxText"><input type="text" name="textfield4" id="textfield4" class="LN_Input" readOnly="true" value="${user.positionLayer}"/></td>
	        <td class="LN_tableBoxtitle2">申诉周期</td>
	        <td class="LN_tableBoxText" colspan="3">
	        	<page:singleBatchLN batch1="${appeal.batchDate}" batchType="${param.busiId=='SSFHM'?1:4}"/>
	        </td>
	      </tr>
	   </table>
	   <br/>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
			<tr>
		        <td height="97" width="20%" class="LN_tableBoxtitle">
		        <div align="center">申诉内容<span class="LN_colorRed">*</span></div></td>
		        <td align="left" valign="bottom" class="LN_tableBoxText">
		        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		        		<tr align="left" valign="bottom">
		        			<td><textarea style="width:600px;height:120px;" name="applealContent" 
		        			required="true" check="notBlank;isString('#',500);" showName="申诉内容">${appeal.applealContent}</textarea></td>
		        			<td><p align="left">申诉人：${appeal.appealorName}</p>
		          			<p align="left"><fmt:formatDate value="${appeal.createDate}" pattern="yyyy年MM月dd日"/></p></td>
		        		</tr>
		        </table>
		    </tr>
		    <tr>
		        <td class="LN_tableBoxtitle" width="20%"><div align="center">申诉人意见<span class="LN_colorRed">*</span></div></td>
		        <td align="left" valign="bottom" class="LN_tableBoxText">
		        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		        		<tr align="left" valign="bottom">
		        			<td><textarea style="width:600px;height:120px;" name="appealOpinion" required="true"
		        			 check="notBlank;isString('#',500);"  showName="申诉人意见">${appeal.appealOpinion}</textarea></td>
		        			<td><p align="left">申诉人签名：${appeal.appealorName}&nbsp;&nbsp;&nbsp;&nbsp;</p>
		          			<p align="left"><fmt:formatDate value="${appeal.createDate}" pattern="yyyy年MM月dd日"/>
		          			<!-- 
<input type="text" name="textfield11" class="LN_InputNoWidth" size="4" readOnly="true"/>年
<input type="text" name="textfield11" class="LN_InputNoWidth" size="1" readOnly="true"/>月
<input type="text" name="textfield11" class="LN_InputNoWidth" size="1" readOnly="true"/>日</p> --></td>
		        		</tr>
		        	</table>
		        </td>
		    </tr>
          </table>
		<br/>
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
		  <tr>
		    <td height="3" bgcolor="#4F81CE"></td>
		  </tr>
		</table>
      </td>
  </tr>
</table>
</div>
</div>
</form>
<script type="text/javascript">window.onload = function(){setPHeight3();if(${appeal.boStatus!=0}){FF_ControlArea();}}</script>
</body>
</html>