<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<htm>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css"> 
<title>考核表列表</title>
<script src="${ROOT}/js/prototype.js"></script>
<script type="text/javascript">
<!--
	function ev_save(status){
		form1.close_window.value = status;
		$_E("form1").submit();
	}
	
	function ev_showAssessment(assID,userId){
		var viewType = "${viewType}";
			var params = "?boId="+assID
			+"&nodeCode=${nodeCode}&groupId=${groupId}&type=${type}&flowCode=${flowCode}"
			+"&viewType=${viewType}&isUndo=${isUndo}&srcHandlerId="+userId;
		var url = "";
		if(viewType=='4'){
			 url = "${ROOT}/*.do";
		}else if(viewType=='10'){
			url = "${ROOT}/*.do";
		}else{
			url = "${ROOT}/*.do";
		}

		openFullScreenWin(url+params);
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="${ROOT }/*.do">
<input type="hidden" name="close_window" value="0"/>
<input type="hidden" name="batchId" value="${batchId}"/>
<input type="hidden" name="groupId" value="${groupId}"/>
<input type="hidden" name="flowCode" value="${flowCode}" />
<input type="hidden" name="nodeCode" value="${nodeCode}" />
<input type="hidden" name="flgFullScreen" value="${param.flgFullScreen }"/>
<input type="hidden" name="viewType" value="${viewType}"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="isUndo" value="${isUndo}"/>
<input type="hidden" name="boIds" value="${boIds}"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
  <div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
 <c:if test="${isUndo}">
  <div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
  <div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">分管领导审批(等级评定)</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">审批列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="10%" class="LN_tableBoxtitle2">序号
              <input type="checkbox" name="checkAll" id="checkAll" onclick="SelectUtil.checkAll(this, 'selectedRow');"/></td>
            <td width="35%" class="LN_tableBoxtitle2"><p>被考核对象</p></td>
            <td width="20%" class="LN_tableBoxtitle2">单位</td>
            <td width="15%" class="LN_tableBoxtitle2">评分(排序)</td>
            <td class="LN_tableBoxtitle2">评分等级</td>
            </tr>
             <c:forEach var="o" items="${assessmentList}" varStatus="idx">
            <tr>
              	<td  class="LN_tableBoxText2">${idx.count}
              	<input type="hidden" name="assId" value="${o.id}"/>
	              <input type="hidden" name="srcHandlerId${o.id}" value="${boInfoM[o.id].srcHandlerId}" />
              	<!-- <input type="checkbox" name="selectedRow" value="${o.id}"/> -->
              	</td>
	            <td class="LN_tableBoxText2">
	            	<a href="#" class="LN_BlueLink" onclick="ev_showAssessment('${o.id }','${boInfoM[o.id].srcHandlerId}');return false;">${o.ownerName }</a>
	            </td>
	            <td class="LN_tableBoxText2"><a href="#" class="LN_BlueLink" onclick="ev_showAssessment('${o.id }','${boInfoM[o.id].srcHandlerId}');return false;">${o.owner.subCommpanyName}</a></td>
	            <td class="LN_tableBoxText2">
	             <a href="#" class="LN_BlueLink" onclick="ev_showAssessment('${o.id }','${boInfoM[o.id].srcHandlerId}');return false;"><fmt:formatNumber value="${o.assScore}" pattern="##0.0#"/></a></td>
	            <td class="LN_tableBoxText2">
	            <kpi:dictionary-select  name='assGrade' type='SCROEGRADE_MAPPING' id="assGrade${o.id}"
	            		style="width:60px;" selected="${o.assGrade==null?o.assGradeValue:o.assGrade}" />
	            </td>
            </tr>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
<!-- <div class="LN_pagebody">
	<kpi:page-bar formId="form1"/> 
</div> -->
</div>
</div>
</form>
</body>
</html>