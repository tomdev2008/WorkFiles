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
			var url = "${ROOT}/saveOpinionAppealCheck.do?isAjax=true";
			new Ajax.Request(url, {
					onSuccess:function(response){
						var result = response.responseText;
						if(result=="ok"){
							flag = true;
						}else{
							alert(result);
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
			var url = "${ROOT}/saveOpinionAppealCheck.do";
			document.form1.action = url;
			document.form1.submit();
		}
	}
	

	function AA_Edit(){
		var obj = document.getElementById("worklistItemId");
		var workitemId = obj.value;
		var params = "?boId=${appeal.assessmentId}&nodeCode=${assessBo.currentNode}&type=${type}&flowCode=${assessBo.flowCode}"
			+"&viewType=${viewType}&isUndo=true&srcHandlerId=${assessBo.srcHandlerId}&isAppeal=true&workitemId="+workitemId;
		var url = "${ROOT}/editAssessmentScoreGradeByUser.do"+params;
		if('${appeal.busiType}'=='<%=com.shengdai.kpi.flow.Constant.SSFHY%>'){
			params = "?boId=${appeal.assessmentId}&nodeCode=${assessBo.currentNode}&type=${type}&flowCode=${assessBo.flowCode}"
			+"&viewType=4&isUndo=true&srcHandlerId=${assessBo.srcHandlerId}&workitemId="+workitemId;
			url = "${ROOT}/editYearAssessmentNodeGradeInheritByUser.do"+params;	
		}
		openFullScreenWin(url);
	}
	
	function AA_Show(){
	if('${appeal.busiType}'=='<%=com.shengdai.kpi.flow.Constant.SSFHY%>'){
		var params = "?boId=${appeal.assessmentId}&nodeCode=${assessBo.currentNode}&type=${type}&flowCode=${assessBo.flowCode}"
			+"&viewType=2&isUndo=true&srcHandlerId=${assessBo.srcHandlerId}";
	    var url = "${ROOT}/editYearAssessmentAllByUser.do"+params;	
		openFullScreenWin(url);
	}
	else{
		openFullScreenWin(context+"/openStaticAssessmentByUser.do?id=${appeal.assessmentId}");
	}
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="">
<input type="hidden" name="appealId" value="${appeal.id}" />
<input type="hidden" name="workitemId" value="${param.workitemId }"/>
<div class="LN_popupsBox">
<div class="LN_Append">
     <c:if test="${isUndo}">
	     <page:route/>
	     <div class="LN_popupsSafe"><a href="#" onclick="AA_Save();return false;">保存</a></div>
	</c:if>
	 <div class="LN_popupsRef100"><a href="#" onclick="AA_Show();return false;">查看考核表</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">员工绩效考核申诉表</div>
<kpi:WorkFlowItemTag working="true"/>
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
	        					<input type="text" name="textfield5" id="textfield5" class="LN_Input" readOnly="true" value="${appeal.batchDateDesc}"/>
	        </td>
	      </tr>
	   </table>
	   <br/>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
			<tr>
		        <td height="97" width="20%" class="LN_tableBoxtitle">
		        <div align="center">申诉内容</div></td>
		        <td align="left" valign="bottom" class="LN_tableBoxText">
		        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		        		<tr align="left" valign="bottom">
		        			<td style="width:600px;"><textarea style="width:600px;height:120px;" name="applealContent" 
		        			readOnly="true"">${appeal.applealContent}</textarea></td>
		        			<td><p align="left">申诉人：${appeal.appealorName}</p>
		          			<p align="left"><fmt:formatDate value="${appeal.createDate}" pattern="yyyy年MM月dd日"/></p></td>
		        		</tr>
		        </table>
		    </tr>
		    <tr>
		        <td class="LN_tableBoxtitle" width="20%"><div align="center">申诉人意见</div></td>
		        <td align="left" valign="bottom" class="LN_tableBoxText">
		        	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		        		<tr align="left" valign="bottom">
		        			<td style="width:600px;"><textarea style="width:600px;height:120px;" name="appealOpinion" readOnly="true">${appeal.appealOpinion}</textarea></td>
		        			<td><p align="left">申诉人签名：${appeal.appealorName}&nbsp;&nbsp;&nbsp;&nbsp;</p>
		          			<p align="left">
								<fmt:formatDate value="${appeal.createDate}" pattern="yyyy年MM月dd日"/></p></td>
		        		</tr>
		        	</table>
		        </td>
		    </tr>
		    <c:forEach var="o" items="${appealResults}">
		    <c:if test="${o.status==1}">
			    <tr>
			        <td class="LN_tableBoxtitle" width="20%"><div align="center">${o.nodeName}意见及建议</div></td>
			        <td align="left" valign="bottom" class="LN_tableBoxText">
			        	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
			        		<tr align="left" valign="bottom">
			        			<td style="width:600px;">
			        				<textarea style="width:600px;height:120px;" name="resultOpinion${o.id}" >${o.resultOpinion}</textarea>
			        			</td>
			        			<td><p align="left">处理人签名：${o.handlerName}&nbsp;&nbsp;&nbsp;&nbsp;</p>
			          			<p align="left">
									<fmt:formatDate value="${o.createDate}" pattern="yyyy年MM月dd日"/></p></td>
			        		</tr>
			        	</table>
			        </td>
			    </tr>
			</c:if>
		    </c:forEach>
		    <c:if test="${isUndo}">
		    	<input type="hidden" name="resultId" value="${appealResult.id}" />
 				<tr>
			        <td class="LN_tableBoxtitle" width="20%"><div align="center">${FLOW_CURRENTNODE.nodeName}意见及建议<span class="LN_colorRed">*</span></div></td>
			        <td align="left" valign="bottom" class="LN_tableBoxText">
			        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			        		<tr align="left" valign="bottom">
			        			<td style="width:600px;">
			        				<textarea style="width:600px;height:120px;" name="resultOpinion" required="true"
			        			 				check="notBlank;isString('#',500);"  showName="${FLOW_CURRENTNODE.nodeName}意见">${appealResult.resultOpinion}</textarea>
			        			</td>
			        			<td><p align="left">处理人签名：${appealResult.realHandlerName }&nbsp;&nbsp;&nbsp;&nbsp;</p>
			          			<p align="left"><fmt:formatDate value="${appealResult.createDate}" pattern="yyyy年MM月dd日"/></p>
								</p>	
								</td>
			        		</tr>
			        		<tr>
			        			<td colspan="2"><p align="right">${appeal.assessmentName}
								<a href="#" class="LN_BlueLink" onclick="AA_Edit();return false;">编辑考核表</a></td>
			        		</tr>
			        	</table>
			        </td>
			    </tr>
		    </c:if>
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
<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
</body>
</html>