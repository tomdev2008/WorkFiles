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
		form1.action = "${ROOT}/saveAssessmentGradeByUser.do";
		$_E("form1").submit();
	}
	
	function ev_showAssessment(wid, assID,userId,isUndo){
		var editView = "${viewType}";
		var params = "?boId="+assID
			+"&nodeCode=${param.nodeCode}&type=${type}&flowCode=${param.flowCode}"
			+"&viewType=1&isUndo="+isUndo+"&srcHandlerId="+userId+"&workitemId="+wid;
		var url = "${ROOT}/editYearAssessmentAllByUser.do";
		

		openFullScreenWin(url+params);
	}
	/*
	*验证一下是否已经保存了
	*/
	function checkView(routeId){
		var url = "${ROOT}/saveAssessmentGradeByUser.do?isAjax=true";
		var flag = true;
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
		return flag;
	}
	
	function ev_showMonthScore(gradeId,assId,ownerId){
		var url = "${ROOT}/editAvgMonthScore.do?gradeId="+gradeId+"&assId="+assId+"&ownerId="+ownerId+"&isUndo=false&batchId=${batchId}";
		window.open(url, "_blank", "width=850,height=500,left=110,top=80,resizable=1,status=no,scrollbars=1");
	}
	
	function VC_Chnage(dom){}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="">
<input type="hidden" name="close_window" value="0"/>
<input type="hidden" name="wid" value="${param.wid}" />
<input type="hidden" name="batchId" value="${batchId}"/>
<input type="hidden" name="groupId" value="${groupId}"/>
<input type="hidden" name="flowCode" value="${flowCode}" />
<input type="hidden" name="nodeCode" value="${nodeCode}" />
<input type="hidden" name="flgFullScreen" value="${flgFullScreen}"/>
<input type="hidden" name="viewType" value="${viewType}"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="isUndo" value="false"/>
<input type="hidden" name="boIds" value="${boIds}"/>
<div class="LN_popupsBox">
<div class="LN_Append">
 <c:if test="${isUndo}">
  <page:route/>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${WORK_LIST_NODE_TITLE}</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">审批列表</td>
  </tr>
  <tr>
    <td class="LN_press">
    	  <div class="LN_TopInfor" style="background-color:white">
    	  		${batchYear }年度考核优秀人数:${orgAssessGradeSet.gradeP1MaxNum}
    	  		&nbsp;&nbsp;良好人数:${orgAssessGradeSet.gradeP2MaxNum}
    	  		&nbsp;&nbsp;称职人数:${orgAssessGradeSet.gradeP3MaxNum}
    	  		&nbsp;&nbsp;基本称职人数:${orgAssessGradeSet.gradeP4MaxNum}
    	  		&nbsp;&nbsp;不称职人数:${orgAssessGradeSet.gradeP5MaxNum}
    	 
    	  </div>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="7%" class="LN_tableBoxtitle2">序号
              <input type="checkbox" name="checkAll" id="checkAll" onclick="SelectUtil.checkAll(this, 'id');"/></td>
            <td width="9%" class="LN_tableBoxtitle2"><p>姓名</p></td>
            <td width="14%" class="LN_tableBoxtitle2">部门</td>
            <td width="15%" class="LN_tableBoxtitle2">月度考核平均分${monthScale }</td>
            <td width="15%" class="LN_tableBoxtitle2">行为考核成绩${yearScale }</td>
            <td width="15%" class="LN_tableBoxtitle2">部门成绩${orgScale }</td>
            <td width="11%" class="LN_tableBoxtitle2">汇总评分</td>
            <td class="LN_tableBoxtitle2">评分等级</td>
            </tr>
             <c:forEach var="o" items="${assessmentYearGradeScoreList}" varStatus="idx">
            <tr>
              	<td  class="LN_tableBoxText2">${idx.count}
              	<input type="hidden" name="gradeId" value="${o.id }"/>
	              <input type="hidden" name="srcHandlerId${o.assessment.id}" value="${boInfoM[o.assessment.id].srcHandlerId}" />
	              <c:if test="${boInfoM[o.assessment.id].status==1}">
              		<input type="hidden" name="assId" value="${o.assessment.id}"/>
	            	<input type="checkbox" name="id" boId="${o.assessment.id }" value="${boInfoM[o.assessment.id].worklistItemId }" />
	            	</c:if>
              	</td>
	            <!--<td class="LN_tableBoxText2">${o.owner.loginId }</td>
	            -->
	            <td class="LN_tableBoxText2">
	            	<a href="#" class="LN_BlueLink" onclick="ev_showAssessment('${boInfoM[o.assessment.id].worklistItemId }','${o.assessment.id }','${boInfoM[o.id].srcHandlerId}',${boInfoM[o.id].status==1});return false;">${o.assessment.ownerName }</a>
	            </td>
	            <td class="LN_tableBoxText2">${o.assessment.owner.parentName}</td>
	            <td class="LN_tableBoxText2">
	            	<a href="#" class="LN_BlueLink" onclick="ev_showMonthScore('${o.id }','${o.assessment.id }','${o.assessment.ownerId }')">
	            		<fmt:formatNumber value="${o.avgMonthScore}" pattern="##0.0#"/>
	            	</a>
	            </td>
	            <td class="LN_tableBoxText2">${o.yearScore}</td>
	            <td class="LN_tableBoxText2">${o.orgScore}</td>
	            <td class="LN_tableBoxText2"><fmt:formatNumber value="${o.assessment.assScore}" pattern="##0.0#"/></td>
	            <td class="LN_tableBoxText2">
	            	<ass-page:assGradeMapping selectedId="${o.assessment.assGrade!=null?o.assessment.assGrade:o.assessment.assGradeValue}" attrExtends="${\"disabled='true'\"}"/>
	            	
	            </td>
            </tr>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
<div class="LN_pagebody">
	<kpi:page-bar formId="form1"/> 
</div> 
</div>
</div>
</form>
</body>
</html>