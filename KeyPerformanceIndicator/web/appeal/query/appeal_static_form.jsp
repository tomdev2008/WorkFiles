<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<htm>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${WEB_TITLE}</title>
<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css"> 
<script type="text/javascript">
<!--
	function AA_Show(){
		if(${appeal.busiType=='SSFHY'}){
			openFullScreenWin("${ROOT}/editYearAssessmentAllByUser.do?boId=${appeal.assessmentId}&viewType=3");
		}
		else{
			openFullScreenWin("${ROOT}/openStaticAssessmentByUser.do?id=${appeal.assessmentId}");
		}
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="">
<input type="hidden" name="appealId" value="${appeal.id}" />
<input type="hidden" name="resourceId" value="${appeal.id}" />
<div class="LN_popupsBox">
<div class="LN_Append">
	 <div class="LN_popupsRef100"><a href="#" onclick="AA_Show();return false;">查看考核表</a></div>
	 <div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">员工绩效考核申诉表</div>
<kpi:WorkFlowItemTag working="true"/>
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
		        		<tr  valign="bottom">
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
		        		<tr valign="bottom">
		        			<td style="width:600px;"><textarea style="width:600px;height:120px;" name="appealOpinion" readOnly="true">${appeal.appealOpinion}</textarea></td>
		        			<td><p align="left">申诉人签名：${appeal.appealorName}&nbsp;&nbsp;&nbsp;&nbsp;</p>
		          			<p align="left">
								<fmt:formatDate value="${appeal.createDate}" pattern="yyyy年MM月dd日"/></p></td>
		        		</tr>
		        	</table>
		        </td>
		    </tr>
		    <c:forEach var="o" items="${appealResults}">
			    <tr>
			        <td class="LN_tableBoxtitle" width="20%"><div align="center">${o.nodeName}意见及建议</div></td>
			        <td align="left" valign="bottom" class="LN_tableBoxText">
			        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			        		<tr align="left" valign="bottom">
			        			<td style="width:600px;">
			        				<textarea style="width:600px;height:120px;" name="resultOpinion${o.id}" readOnly="true">${o.resultOpinion}</textarea>
			        			</td>
			        			<td><p align="left">处理人签名：${o.handlerName}&nbsp;&nbsp;&nbsp;&nbsp;</p>
			          			<p align="left">
									<fmt:formatDate value="${o.createDate}" pattern="yyyy年MM月dd日"/></p></td>
			        		</tr>
			        	</table>
			        </td>
			    </tr>
		    </c:forEach>
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
</body>
</html>