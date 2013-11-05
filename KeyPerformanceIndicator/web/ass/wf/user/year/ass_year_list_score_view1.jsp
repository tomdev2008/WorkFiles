<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<htm>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考核表列表</title>
<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css"> 
<script src="${ROOT}/js/prototype.js"></script>
<script type="text/javascript">
<!--
	function ev_showAssessment(assID,userId,isUndo){
		var editView = "${viewType}";
		var params = "?boId="+assID
			+"&nodeCode=${param.nodeCode}&type=${type}&flowCode=${param.flowCode}"
			+"&viewType=${viewType}&isUndo="+isUndo+"&srcHandlerId="+userId;
		
			url = "${ROOT}/editYearAssessmentNodeGradeInheritByUser.do";

		url = url+params;
		openFullScreenWin(url);
	}
	/*
	*验证一下是否已经保存了
	*/
	function checkView(routeId){
		return true;
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="">
<input type="hidden" name="wid" value="${param.wid}" />
<input type="hidden" name="batchId" value="${param.batchId}" />
<input type="hidden" name="flowCode" value="${param.flowCode}" />
<input type="hidden" name="nodeCode" value="${param.nodeCode}" />
<input type="hidden" name="flgFullScreen" value="${param.flgFullScreen }"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="viewType" value="${viewType}"/>
<input type="hidden" name="isUndo" value="${isUndo}"/>
<div class="LN_popupsBox">
<div class="LN_Append">
<c:if test="${isUndo}">
      	<page:route/>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">
	${WORK_LIST_NODE_TITLE}
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">考核对象列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="7%" class="LN_tableBoxtitle2">序号
              <input type="checkbox" name="checkAll" id="checkAll" onclick="SelectUtil.checkAll(this, 'id');"/>
              </td>
            <td width="10%" class="LN_tableBoxtitle2">被考核对象</td>
            <td width="15%" class="LN_tableBoxtitle2">部门</td>
            <td width="10%" class="LN_tableBoxtitle2">岗位名称</td>
            <td width="10%" class="LN_tableBoxtitle2">岗位层级</td>
            <td width="10%" class="LN_tableBoxtitle2">考核周期</td>
            <c:forEach var="o" items="${preNodes}">
            	<td width="10%" class="LN_tableBoxtitle2">${o.nodeName }</td>
            </c:forEach>
            <td width="10%" class="LN_tableBoxtitle2">${lastNode.nodeName }</td>
            </tr>
            <c:forEach var="o" items="${assessmentList}" varStatus="idx">
	            <tr>
	              <td  class="LN_tableBoxText2"> 
	              ${idx.count}<input type="hidden" name="assId" value="${o.id }"/>
	                <input type="hidden" name="srcHandlerId${o.id}" value="${boInfoM[o.id].srcHandlerId}" />
	            	<c:if test="${boInfoM[o.id].status==1}">
	            	<input type="checkbox" name="id" boId="${o.id }" value="${boInfoM[o.id].worklistItemId }" />
	            	</c:if>
	            	</td>
	            	<td class="LN_tableBoxText2">
	            	${o.ownerName }</td>
	            <td class="LN_tableBoxText2">${o.owner.parentName }&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.owner.positionName }&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.owner.positionLayer }&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.batchDateDesc }</td>
	            
	            <c:forEach var="o1" items="${preNodes}">
		            <td class="LN_tableBoxText2">
						<c:forEach var="o2" items="${o.assNodeGradeHandlerSums}" varStatus="idx1">
	
							<c:if test="${o1.id==o2.nodeId}">
								评分${idx1.count }：${o2.score }<br/>
							</c:if>
	
						</c:forEach>
					</td>
				</c:forEach>
				<td class="LN_tableBoxText2">
					<c:forEach var="o2" items="${o.assNodeGradeHandlerSums}" varStatus="idx1">
	
							<c:if test="${lastNode.id==o2.nodeId}">
								评分${idx1.count }：${o2.score }<br/>
							</c:if>
	
						</c:forEach>
				</td>
				
	            </tr>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
</div>
</div>

<kpi:page-bar formId="form1"/>
</form>
<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
</body>
</html>