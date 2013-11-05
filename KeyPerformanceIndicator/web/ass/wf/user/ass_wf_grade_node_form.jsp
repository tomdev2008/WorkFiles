<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考核流程环节视图</title>
<script type="text/javascript" src="${ROOT}/js/kpiCalendar.js"></script>
<script type="text/javascript" src="${ROOT}/js/assessment.js"></script>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
	/*function checkView(){
		var flag = false;
			new Ajax.Request(form1.action, {
				onSuccess:function(response){
					var result = response.responseText || "操作出错!";
					if(result=='ok'){
						flag = true;
					}else{
						alert(result);
					}
				},
				parameters: $('form1').serialize(true),
				asynchronous:false
			});
		return flag;	
	}*/
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }">	
 <input type="hidden" name="workitemId" id="workitemId" value="${param.workitemId}"/>
 <input type="hidden" name="id" id="assessmentId" value="${assessment.id}"/>
  <input type="hidden" name="close_window" id="close_window" value="1"/>
  <input type="hidden" name="flowCode" value="${flowCode}" />
<input type="hidden" name="nodeCode" value="${nodeCode}" />
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="viewType" value="${viewType}"/>
<input type="hidden" name="isUndo" value="${isUndo}"/>
<input type="hidden" name="srcHandlerId" value="${srcHandlerId}"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsTrace100"><a href="#" onclick="ev_wlTrace('${assessment.id }','${nodeCode}');return false;">流程跟踪信息</a></div>
  <div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
 <c:if test="${isUndo}"><page:route/></c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${assessment.name}</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">员工基本信息</td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
      <tr>
        <td width="8%" class="LN_tableBoxtitle">所在部门</td>
        <td width="25%" class="LN_tableBoxText">
        <input type="text" name="textfield" id="textfield" class="LN_Input" readOnly="true" value="${assessment.owner.parentName}"/></td>
        <td class="LN_tableBoxtitle">岗位层级</td>
        <td class="LN_tableBoxText"><input type="text" name="textfield5" id="textfield5" class="LN_Input" readOnly="true" value="${assessment.owner.positionLayer}"/></td>
        <td width="8%" class="LN_tableBoxtitle">员工编号</td>
        <td class="LN_tableBoxText">
        <input type="text" name="textfield3" id="textfield3" class="LN_Input" readOnly="true" value="${assessment.owner.loginId}"/></td>
      </tr>
      <tr>
        <td class="LN_tableBoxtitle">员工姓名</td>
        <td class="LN_tableBoxText"><input type="text" name="textfield4" id="textfield4" class="LN_Input" readOnly="true" value="${assessment.owner.name}"/></td>
        <td width="8%" class="LN_tableBoxtitle">岗位名称</td>
        <td width="25%" class="LN_tableBoxText">
        <input type="text" name="textfield2" id="textfield2" class="LN_Input" readOnly="true" value="${assessment.owner.positionName }"/></td>
        <td class="LN_tableBoxtitle">考核周期</td>
        <td class="LN_tableBoxText"><input type="text" name="textfield6" id="textfield6" class="LN_Input" readOnly="true" value="${assessment.batchDateDesc }"/></td>
      </tr>
   </table>
      <br />
		<%@ include file="/web/ass/wf/ass_user_wf_indicaotor_score_form.jsp" %>
      <br/>
         <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
        <tr>
        <c:if test="${assessment.batchType==4}">
          <td  width="15%" align="right" class="LN_tableBoxText22"><strong>组织KPI考核得分:</strong>
          <fmt:formatNumber pattern="##0.0#" value="${orgAssessment==null?0:orgAssessment.assScore}"/>*${100-assessment.scale}%
          </td>
          <td  width="15%" align="right" class="LN_tableBoxText22"><strong>个人KPI考核得分:</strong>
          <fmt:formatNumber pattern="##0.0#" value="${assessment.middleScore}"/>*${assessment.scale}%
          </td>
          </c:if>
          <td width="15%" align="right" class="LN_tableBoxText22"><strong>最终得分：
          <fmt:formatNumber var="formatScore" value="${assessment.assScore}" pattern="##0.0#"/>
						<input name="scoreFinal" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
			            	id="scoreFinal" value="${formatScore}" />
			评分等级：<span class="LN_colorRed">
			<c:set var="disabled" value="disabled='true'"/>${currentNode.gNVGradeNode }
			<c:if test="${currentNode!=null && currentNode.gNVGradeNode && isUndo}"><c:set var="disabled" value=""/></c:if>
			<ass-page:assGradeMapping selectedId="${assessment.assGrade!=null?assessment.assGrade:assessment.assGradeValue}" attrExtends="${disabled}"/>
			</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
          </td>
          </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
        <tr>
          <td width="15%" class="LN_tableBoxtitle">例外情况说明</td>
          <td class="LN_tableBoxText" style="color:blue;word-break : break-all;">${assessment.importantDesc}</td>
          </tr>
          <!-- 
          <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText">
          	${assessment.remark}
          </td>
          </tr>
           -->
      </table>
      </td>
  </tr>
</table>

<br />
<!-- 附件信息 -->
<%@ include file="/web/ass/wf/ass_attach_list.jsp"%>

</div>
</div>
<script type="text/javascript">
	window.onload = function(){
		ev_cal();
	}
</script>
</body>
</html>


