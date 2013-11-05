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
	//保存
	function ev_save(status){
		var fm = $_E('form1');
		if(CheckForm(fm)){
			fm.close_window.value = status
			fm.submit();
		}
	}
	
	function ev_change(obj){
		alert(obj.value);
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/saveYearAssessmentIndicatorsScoreByUser.do">	
 <input type="hidden" name="id" id="assessmentId" value="${assessment.id}"/>
  <input type="hidden" name="close_window" id="close_window" value="1"/>
  <input type="hidden" name="resflush_parent" id="resflush_parent" value="1"/>
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
<c:if test="${isUndo}">
<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
</c:if>
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
	<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2" id="configIndiTable">
            <tr>
	          <c:forEach var="o" items="${assessment.pageIndicatorAttributes}">
	          <!-- 取值渠道，在考核表中不显示 -->
	           	<c:set var="showNone" value="${o.show && o.code!='refResourceId'?'':'none'}"/>
	          	<c:choose>
	          			<c:when test="${o.showExtType==1}">
	          				<td width="" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	          				${o.name }
	          				<input type="checkbox" id="selectAllHandler1" onclick="SelectUtil.checkAll(this,'priorityCBX');"/>
	          				</td>
	          			</c:when>
	          			<c:when test="${o.showExtType==4}">
	          				<td width="4%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	          					考核项目
	          				</td>
	          			</c:when>
	          			<c:when test="${o.showExtType==2}">
	          				<td width="5%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	          				考核指标
	          				</td>
	          			</c:when>
	          			<c:when test="${o.name=='目标值'}">
	          				<td width="20%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	          					行为描述
	          				</td>
	          			</c:when>
	          			<c:when test="${o.name=='考核标准'}">
	          				<td width="20%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	          					评价参考
	          				</td>
	          			</c:when>
	          			<c:when test="${o.name=='考核分值'}">
	          				<td width="4%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	          					权重
	          				</td>
	          			</c:when>
	          			<c:otherwise>
	          				<td width="${o.showWidth }%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	          				${o.name}
	          				</td>
	          			</c:otherwise>
	          		</c:choose>
	          </c:forEach>
            <!-- 放置环节信息 -->
            
              <c:forEach var="o" items="${preNodes}">
	          	<td colspan="1" width="10%" class="LN_tableBoxtitle2" style="text-align: center;">${o.nodeName}</td>
	          </c:forEach>
	          <c:if test="${lastNode!=null}"> 
	         	<td colspan="1" width="10%" class="LN_tableBoxtitle2" style="text-align: center;">${lastNode.nodeName}</td>
	         </c:if>
           </tr>
           <tbody id="itemList">
           	  <c:forEach var="o" items="${indicatorTypeList}" varStatus="idx">
            	<c:if test="${fn:length(o.indicatorList)==0}"><!-- 补空行 -->
            		<tr>
            			<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
            		 	<!-- 取值渠道，在考核表中不显示 -->
	            			<c:set var="showNone" value="${o2.show && o2.code!='refResourceId'?'':'none'}"/>
            				<c:choose>
	            				<c:when test="${o2.showExtType==4}">
		             				<td class="LN_tableBoxText2" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">${o.name}</td>           			
	            				</c:when>
	            				<c:otherwise>
            						<td class="LN_tableBoxText2" title="" colIndex="${o2.code}" style="display:${showNone};word-break : break-all; ">
	            				&nbsp;</td>	            			
	            				</c:otherwise>
	            			</c:choose>
            			</c:forEach>
		           		 <!-- 放置环节信息 -->
            		</tr>
            	</c:if>
         	  <c:if test="${fn:length(o.indicatorList)>0&&o.code!='YG0011'&&o.code!='YG0012'}">
	            <c:forEach var="o1" items="${o.indicatorList}" varStatus="idx1">
	            	<input type="hidden" name="indicatorId" value="${o1.id}"/>
					<input type="hidden" name="detailId" value="${o1.detailId}"/>
	            	<tr>
	            		<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
	            			<!-- 取值渠道，在考核表中不显示 -->
	            			<c:set var="showNone" value="${o2.show && o2.code!='refResourceId'?'':'none'}"/>
	            			<c:choose>
	            				<c:when test="${o2.showExtType==4}">
	            					<c:if test="${idx1.count==1}">
			             				<td class="LN_tableBoxText2" rowspan="${fn:length(o.indicatorList)}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">
					            			${o1.attributeValues[o2.code]}
					            		</td>
				            		</c:if>           			
	            				</c:when>
	            				<c:when test="${o2.showExtType==2}">
	            					<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">
		            					<a href="javascript:void(0);" class="LN_BlueLink" onclick="ev_edit('${o1.id }','${assessment.id}');return false;">
		            						<kpi:escapeHtmlTag length="1000" ellipsis="..." content="${o1.attributeValues[o2.code]}"/>
		            					</a>
	            					</td>
	            				</c:when>
	            				<c:when test="${o2.showExtType==3}">
	            					<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	            						<c:choose>
	            							<c:when test="${o1.attributeValues['refResourceId']=='DIRECTVALUE'}">--
	            								<input type="hidden" name="scale" value="0"/></c:when>
	            							<c:otherwise>
	            								${o1.attributeValues[o2.code]}
	            								<input type="hidden" class="LN_Input50" name="scale" value="${o1.attributeValues[o2.code]}"/>
	            							</c:otherwise>
	            						</c:choose>
	            					%
	            					</td>
	            				</c:when>
	            				<c:when test="${o2.showExtType==1}">
		            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
		            					<input type="checkbox" value="${o1.id}" name="priorityCBX" />
		            					<input type="text" class="LN_Input20" name="priority" value="${o1.attributeValues[o2.code]}" readOnly="true"/>
		            				</td>
		            			</c:when>
	            				<c:when test="${o2.showExtType==6}">
		            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
		            					${o1.attributeValues[o2.code]==1?'是':'否'}
		            				</td>
	            				</c:when>
	            				<c:otherwise>
	            					<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
	            						<kpi:escapeHtmlTag length="1500" ellipsis="..." content="${o1.attributeValues[o2.code]}"/>
	            					</td>
	            				</c:otherwise>
	            			</c:choose>
	            		</c:forEach>	          	
	            	</tr>
	         	</c:forEach>
	         </c:if>
          </c:forEach>
         </tbody>
 		<tr>
			<td align="right" class="LN_tableBoxText22" colspan="${fn:length(assessment.assIndicatorUseAttributes)}">
						<strong>权重汇总：</strong>
			          <input name="scaleTotal" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
			            id="scaleTotal" value="${scaleTotal}" />%
			</td>
			
		<c:if test="${currentNode!=null}"> 
				          	<td width="10%" align="right" class="LN_tableBoxText22">
				            <strong>评分汇总：</strong>
				            <fmt:formatNumber var="formatScore" value="${currentNodeSum==null?0:currentNodeSum.score}" pattern="##0.0#"/>
							<input name="scoreTotal" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
				            	id="scoreTotal" value="${formatScore}" />
				         	</td>	
		</c:if>	  
          </tr>
</table>
      <br />
 
      <c:if test="${currentNode!=null}">
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
       <%-- <tr>
          <td width="15%" class="LN_tableBoxtitle">例外情况说明</td>
          <td class="LN_tableBoxText" style="word-break : break-all;color:#3F51CE">
          <c:choose>
          <c:when test="${fn:contains(currentNode.nodeName,'评')}">
          <textarea name="importantDesc" id="importantDesc" required="nullable" check="isString('#','2000')" showName="例外情况说明" cols="45" rows="3" style="width:724px;color:#3F51CE; font-size:12px;" >${assessment.importantDesc}</textarea>
          </c:when>
          <c:otherwise><font color="blue">${assessment.importantDesc}
          <input type="hidden" name="importantDesc" value="${assessment.importantDesc}"/>
          </font></c:otherwise>
          </c:choose>
          </td>
          </tr>
          --%>
          
          <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText">
          	${assessment.remark}
          </td>
          </tr>
          
      </table>
      </c:if>
      </td>
  </tr>
</table>

<br />
<!-- 附件信息 -->
<%--@ include file="/web/ass/wf/ass_attach_list.jsp"--%>

</div>
</div>
<script type="text/javascript">
	window.onload = function(){
		ev_cal();
	}
</script>
</body>
</html>


