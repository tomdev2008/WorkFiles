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

//-->
</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/*.do">	
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
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${assessment.name}</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
   <tr>
    <td class="LN_boxtitlebg">组织部门考核指标信息</td>
  </tr>
  <tr>
    <td class="LN_press">
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2" id="configIndiTable">
            <tr>
	          <c:forEach var="o" items="${assessment.pageIndicatorAttributes}">
	          <c:set var="showNone" value="${o.show?'':'none'}"/>
	          <td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};">${o.name}
	          	<c:if test="${o.showExtType==1}">
	          		<input type="checkbox" id="selectAllHandler1" onclick="SelectUtil.checkAll(this,'priorityCBX');"/>
	          	</c:if>
	          	</td>
	          </c:forEach>
            <!-- 放置环节信息 -->
	          <c:forEach var="o" items="${preNodes}">
	          	<td colspan="1" width="10%" class="LN_tableBoxtitle2">${o.nodeName}</td>
	          </c:forEach>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${indicatorTypeList}" varStatus="idx">
            	<c:if test="${fn:length(o.indicatorList)==0}"><!-- 补空行 -->
            		<tr>
            		<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
            		 <c:set var="showNone" value="${o2.show?'':'none'}"/>
            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
		             			<td class="LN_tableBoxText2" colIndex="${o2.code}" style="display:${showNone};">${o.name}</td>           			
	            			</c:when>
	            			<c:otherwise>
            					<td class="LN_tableBoxText2" title="" colIndex="${o2.code}" style="display:${showNone};">
	            				&nbsp;</td>	            			
	            			</c:otherwise>
	            	</c:choose>
            		</c:forEach>
		            <!-- 放置环节信息 -->
			          <c:forEach var="p" items="${preNodes}">
			          	<td colspan="1" width="10%" class="LN_tableBoxtitle2">&nbsp;</td>
			          </c:forEach>
            		</tr>
            	</c:if>
         	  <c:if test="${fn:length(o.indicatorList)>0}">
	            <c:forEach var="o1" items="${o.indicatorList}" varStatus="idx1">
	            <input type="hidden" name="indicatorId" value="${o1.id}"/>
	            	<tr>
	            		<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
	            		<c:set var="showNone" value="${o2.show?'':'none'}"/>
	            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
	            				<c:if test="${idx1.count==1}">
		             			<td class="LN_tableBoxText2" rowspan="${fn:length(o.indicatorList)}" colIndex="${o2.code}" style="display:${showNone};">
				            		${o1.attributeValues[o2.code]}
				            	</td></c:if>           			
	            			</c:when>
	            			<c:when test="${o2.showExtType==2}">
	            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
	            				<a href="javascript:void(0);" class="LN_BlueLink" onclick="ev_edit('${o1.id }','${assessment.id}');return false;">
	            				<kpi:escapeHtmlTag length="10" ellipsis="..." content="${o1.attributeValues[o2.code]}"/></a></td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==3}">
	            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
	            				${o1.attributeValues[o2.code]}
	            				<input type="hidden" class="LN_Input50" name="scale" value="${o1.attributeValues[o2.code]}"/>%</td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==1}">
	            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
	            				<input type="checkbox" value="${o1.id}" name="priorityCBX" />
	            				<input type="text" class="LN_Input20" name="priority" value="${o1.attributeValues[o2.code]}" readOnly="true"/></td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==6}">
		            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
		            				${o1.attributeValues[o2.code]==1?'是':'否'}
		            			</td>
	            			</c:when>
	            			<c:otherwise>
	            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
	            				<kpi:escapeHtmlTag length="15" ellipsis="..." content="${o1.attributeValues[o2.code]}"/>
	            				</td>
	            			</c:otherwise>
	            		</c:choose>
	            		</c:forEach>
						<!-- 放置环节信息 -->
			          		<c:forEach var="o2" items="${preNodes}">
			          		<td class="LN_tableBoxText2" width="10%">
			          			<c:forEach var="o3" items="${o1.nodeGradeList}">
			          				<c:if test="${o2.id==o3.nodeId}">
					          		${o3.handlerName}&nbsp;:&nbsp;<span class="LN_colorOrange"><fmt:formatNumber  value="${o3.score}" pattern="##0.0#"/>
					          		</span>&nbsp;
					          		<c:if test="${fn:length(o3.remark)>0}">
									<input name="Submit9"  id="remarkButton${o2.id}${idx1.count}${idx.count}" type="button" class="LN_button2"
							 				value="说明" onclick="ev_showRemark('${o2.id}${idx1.count}${idx.count}');" />
									<input name="remark${o2.id}" type="hidden" id="remark${o2.id}${idx1.count}${idx.count}" value="${o3.remark}"/>	          					
			          				</c:if><br/></c:if>
			          			</c:forEach>	
			          			</td>
			          		</c:forEach>	 
	            	</tr>
	            </c:forEach>   
	            </c:if>
            </c:forEach>
         </tbody>
 		<tr>
		<td align="right" class="LN_tableBoxText22" colspan="${fn:length(assessment.assIndicatorUseAttributes)}"><strong>权重汇总：</strong>
			          <input name="scaleTotal" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
			            id="scaleTotal" value="${scaleTotal}" />％
		</td>
		<c:forEach var="o1" items="${preNodes}">
		<c:forEach var="o2" items="${preNodeSum}">
				<c:if test="${o1.id==o2.nodeId}">
			          	<td width="10%" align="right" class="LN_tableBoxText22">
			            <strong>环节汇总分：</strong>
			            <fmt:formatNumber var="formatScore" value="${o2.score}" pattern="##0.0#"/>
						<input name="scoreTotal${o2.nodeId}" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
			            	id="scoreTotal${o2.nodeId}" value="${formatScore}" />
			         	</td>
			    </c:if>
		</c:forEach>
		</c:forEach>
          </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
        <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText">
          <textarea name="textarea" id="textarea" cols="45" rows="8" style="width:724px; font-size:12px;" readOnly="true">${assessment.remark}</textarea></td>
          </tr>
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
		ev_calOrg();
	}
</script>
</body>
</html>


