<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考核流程环节视图</title>
</head>
	<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2" id="configIndiTable">
            <tr>
	          <c:forEach var="o" items="${assessment.pageIndicatorAttributes}">
	          <c:set var="showNone" value="${o.show && o.code!='refResourceId'?'':'none'}"/>
	          <td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};text-align: center;">${o.name}
	          	<c:if test="${o.showExtType==1}">
	          		<input type="checkbox" id="selectAllHandler1" onclick="SelectUtil.checkAll(this,'priorityCBX');"/>
	          	</c:if>
	          	</td>
	          </c:forEach>
            <!-- 放置环节信息 -->
	          <c:forEach var="o" items="${preNodes}">
	          	<td colspan="1" width="10%" class="LN_tableBoxtitle2" style="text-align: center;">${o.nodeName}</td>
	          </c:forEach>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${indicatorTypeList}" varStatus="idx">
            	<c:if test="${fn:length(o.indicatorList)==0}"><!-- 补空行 -->
            		<tr>
            		<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
            		 <c:set var="showNone" value="${o2.show && o2.code!='refResourceId'?'':'none'}"/>
            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
		             			<td class="LN_tableBoxText2" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">${o.name}</td>           			
	            			</c:when>
	            			<c:otherwise>
            					<td class="LN_tableBoxText2" title="" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
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
				<input type="hidden" name="detailId" value="${o1.detailId}"/>
	            	<tr>
	            		<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
	            		<c:set var="showNone" value="${o2.show && o2.code!='refResourceId'?'':'none'}"/>
	            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
	            				<c:if test="${idx1.count==1}">
		             			<td class="LN_tableBoxText2" rowspan="${fn:length(o.indicatorList)}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">
				            		${o1.attributeValues[o2.code]}
				            	</td></c:if>           			
	            			</c:when>
	            			<c:when test="${o2.showExtType==2}">
	            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	            				<a href="javascript:void(0);" class="LN_BlueLink" onclick="ev_edit('${o1.id }','${assessment.id}');return false;">
	            				<kpi:escapeHtmlTag length="2000" ellipsis="..." content="${o1.attributeValues[o2.code]}"/></a></td>
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
	            				</td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==1}">
	            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
	            				<input type="checkbox" value="${o1.id}" name="priorityCBX" />
	            				<input type="text" class="LN_Input20" name="priority" value="${o1.attributeValues[o2.code]}" readOnly="true"/></td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==6}">
		            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
		            				${o1.attributeValues[o2.code]==1?'是':'否'}
		            			</td>
	            			</c:when>
	            			<c:otherwise>
	            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
	            				<kpi:escapeHtmlTag length="2000" ellipsis="..." content="${o1.attributeValues[o2.code]}"/>
	            				</td>
	            			</c:otherwise>
	            		</c:choose>
	            		</c:forEach>
						<!-- 放置环节信息 -->
			          		<c:forEach var="o2" items="${preNodes}">
			          		<td class="LN_tableBoxText2" width="10%" style="word-break : break-all;text-align: center;">
			          			<c:forEach var="o3" items="${o1.nodeGradeList}">
			          				<c:if test="${o2.nodeId==o3.nodeId}">
						          		${o3.handlerName}&nbsp;:&nbsp;<span class="LN_colorOrange">
						          		<fmt:formatNumber  value="${o3.score}" pattern="##0.0#"/>
						          		</span>&nbsp;
						          		<c:if test="${fn:length(o3.remark)>0}">
							          		<a href="#" class="LN_BlueLink" id="remarkA${o3.detailId}" onclick="ev_showRemark('${o3.detailId}',false);return false;" title="${o3.remark}">
							          			<kpi:escapeHtmlTag length="2000" ellipsis="..." content="${o3.remark}"/>
							          		</a>
							          		<br/>
							          		<input name="remark${o3.detailId}" type="hidden" id="remark${o3.detailId}" value="${o3.remark}"/>
					          			</c:if>
					          		</c:if>
			          			</c:forEach>	
			          			</td>
			          		</c:forEach>	
	            	</tr>
	            </c:forEach>   
	            </c:if>
            </c:forEach>
         </tbody>
 		<tr>
		<td align="right" class="LN_tableBoxText22" colspan="${fn:length(assessment.assIndicatorUseAttributes)-1}"><strong>分值汇总：</strong>
			          <input name="scaleTotal" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
			            id="scaleTotal" value="${scaleTotal}" />
		</td>
		<c:forEach var="o1" items="${preNodes}">
			          	<td width="10%" align="right" class="LN_tableBoxText22">
			            <strong>环节汇总分：</strong>
			            <fmt:formatNumber var="formatScore" value="${o1.score}" pattern="##0.0#"/>
						<input name="scoreTotal${o1.nodeId}" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
			            	id="scoreTotal${o1.nodeId}" value="${formatScore}" />
			         	</td>
		</c:forEach>
          </tr>
</table>
      
<script type="text/javascript">
	window.onload = function(){
		//ev_cal();
	}
</script>