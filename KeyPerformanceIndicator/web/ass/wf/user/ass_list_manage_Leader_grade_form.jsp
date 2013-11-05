<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.shengdai.kpi.util.ParamUtils"%>
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
			+"&viewType=${viewType}&isUndo="+isUndo+"&srcHandlerId="+userId+"&workitemId="+wid;
		var url = "";
		if(editView=='4'){
			 url = "${ROOT}/editAssessmentScoreGradeByUser.do";
		}else{
			url = "${ROOT}/editAssessmentAllByUser.do";
		}

		openFullScreenWin(url+params);
	}
	/*
	*验证一下是否已经保存了
	*/
	function checkView(routeId){
		var url = "${ROOT}/saveAssessmentGradeByUser.do?isAjax=true";
		var flag = true;
		var ids = getAllChecked('id');
		if(ids=="") {alert("请您选择要提交的记录!");return;}
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
<input type="hidden" name="isUndo" value="${isUndo}"/>
<input type="hidden" name="boIds" value="${boIds}"/>
<div class="LN_popupsBox">
<div class="LN_Append">
  <!-- <div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>-->
 <c:if test="${isUndo}">
  <!-- <div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>-->
  <div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
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
    	  <div class="LN_TopInfor">
    	  	<c:forEach var="o" items="${assOrgGradeSets}">
    	  		${o.orgName}${o.batchDateDesc}总体优秀人数${o.gradeP1MaxNum}，已使用${o.gradeUserP1Num}，未使用${o.gradeP1MaxNum-o.gradeUserP1Num}；
    	  		良好人数${o.gradeP2MaxNum }，已使用${o.gradeUserP2Num }，未使用${o.gradeP2MaxNum-o.gradeUserP2Num}。
    	  	</c:forEach>
    	  </div>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="7%" class="LN_tableBoxtitle2">序号
              <input type="checkbox" name="checkAll" id="checkAll" onclick="SelectUtil.checkAll(this, 'id');"/></td>
            <td width="13%" class="LN_tableBoxtitle2">员工工号</td>
            <td width="7%" class="LN_tableBoxtitle2"><p>姓名</p></td>
            <td width="14%" class="LN_tableBoxtitle2">部门</td>
            <td width="17%" class="LN_tableBoxtitle2">岗位名称</td>
            <td width="8%" class="LN_tableBoxtitle2">岗位层级</td>
            <td width="11%" class="LN_tableBoxtitle2">评分(排序)</td>
            <td class="LN_tableBoxtitle2">评分等级</td>
            </tr>
             <c:forEach var="o" items="${assessmentList}" varStatus="idx">
            <tr>
              	<td  class="LN_tableBoxText2">${idx.count}
	              <input type="hidden" name="srcHandlerId${o.id}" value="${boInfoM[o.id].srcHandlerId}" />
	              <c:if test="${boInfoM[o.id].status==1}">
              	  	<input type="hidden" name="assId" value="${o.id}"/>
	            	<input type="checkbox" name="id" boId="${o.id }" value="${boInfoM[o.id].worklistItemId }" />
	            	</c:if>
              	</td>
	            <td class="LN_tableBoxText2">${o.owner.loginId }</td>
	            <td class="LN_tableBoxText2">
	            	<a href="#" class="LN_BlueLink" onclick="ev_showAssessment('${boInfoM[o.id].worklistItemId }','${o.id }','${boInfoM[o.id].srcHandlerId}',${boInfoM[o.id].status==1});return false;">${o.ownerName }</a>
	            </td>
	            <td class="LN_tableBoxText2">${o.owner.parentName}</td>
	            <td class="LN_tableBoxText2">${o.owner.positionName}</td>
	            <td class="LN_tableBoxText2">${o.owner.positionLayer}</td>
	            <td class="LN_tableBoxText2"><fmt:formatNumber value="${o.assScore}" pattern="##0.0#"/></td>
	            <td class="LN_tableBoxText2">
	            <%--
	            	<ass-page:assGradeMapping selectedId="${o.assGrade!=null?o.assGrade:o.assGradeValue}" attrExtends="${boInfoM[o.id].status!=1?\"disabled='true'\":\"\"}"/>
	            	--%><%--
	            	根据要求，修改为不可修改等级，等级默认为分数对应的等级，在分数等级映射里管理。
	            	在这里特别开放一个字段，如果在url中加上editGrade=true，则可以编辑分数。
	            	--%><% String editGrade = ParamUtils.getDefaultStringValue(request,"editGrade","false");
	            		request.setAttribute("editGrade",editGrade); %>
	            <c:if test="${editGrade=='true'}">
	            	<ass-page:assGradeMapping selectedId="${o.assGrade!=null?o.assGrade:o.assGradeValue}" attrExtends="${boInfoM[o.id].status!=1?\"disabled='true'\":\"\"}"/>
	            </c:if>
	            <c:if test="${editGrade!='true'}">
	        		<c:set var="grade" value="${o.assGrade!=null?o.assGrade:o.assGradeValue}"></c:set>
					<select name="${boInfoM[o.id].status==1?'assGrade':''}" ${boInfoM[o.id].status!=1?'disabled':''}>
						<option value="${grade}" >${grade=='P1'?'优秀':''}${grade=='P2'?'良好':''}${grade=='P3'?'称职':''}${grade=='P4'?'基本称职':''}${grade=='P5'?'不称职':''}</option>
					</select>
	        	</c:if>
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