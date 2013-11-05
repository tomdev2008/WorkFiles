<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考核流程环节视图</title>
<script type="text/javascript" src="${ROOT}/js/prototype.js"></script>
<script type="text/javascript" src="${ROOT}/js/assessment.js"></script>
<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
	/**
	  * 设置处理人
	  **/
	function ev_Handler(indiId, nodeId){
		var returnValue = window.showModalDialog("${ROOT}/*.do?id=${assessment.id}&nodeId="
		+ nodeId +"&indiId="+indiId,window,"dialogHeight:500px;dialogWidth:600px;status=no;scroll=yes;");
		if(returnValue && returnValue=='ok'){//如果有返回值,刷新页面
			window.location.reload();
			//var handlerValue = $("handlerValue").value;
			/*.do?nodeId="+nodeId+"&priorityCBX1="+indiId, {
			//			onSuccess:function(response){
			//				var result = response.responseText;
			//				if(result=="ok"){
			//					var handlerName = $("handlerName").value;
			//					$("handler_"+indiId+nodeId).innerHTML = handlerName;
			//				}else{
			//					alert(result);
			//				}
			//			},
			//			parameters: $('form1').serialize(true),
			//			asynchronous:false
			//});
		}
	}
	 
	/**
	  * 设置处理人
	  **/
	function ev_AllHandler(){
		if(SelectUtil.checkedCount("selectNodeHandler")==1){
			var nodeId = SelectUtil.getFirstChecked("selectNodeHandler").value;
			var indiIds = SelectUtil.serialize("priorityCBX");
			if(indiIds && indiIds.length>0){
				var returnValue = window.showModalDialog("${ROOT}/*.do?id=${assessment.id}&nodeId="
					+ nodeId +"&indiId="+indiIds,window,"dialogHeight:500px;dialogWidth:600px;status=no;scroll=yes;");
				if(returnValue && returnValue=='ok'){//如果有返回值,刷新页面
					window.location.reload();
					/*.do?nodeId="+nodeId, {
					//	onSuccess:function(response){
					//		var result = response.responseText;
					//		if(result=="ok"){
					//			var indicator_ids = $_EN("priorityCBX");
					//			var handlerName = $("handlerName").value;
					//			for(var i=0;i<indicator_ids.length;i++){
					//				if(indicator_ids[i].checked)
					//					$("handler_"+indicator_ids[i].value+nodeId).innerHTML = handlerName;
					//			}
					//			ev_clearAllChecked();
					//		}else{
					//			alert(result);
					//		}
					//	},
					//	parameters: $('form1').serialize(true),
					//	asynchronous:false
					//});
				}
			}else{
				alert("请选择需要设置处理人的指标序号！");
			}
		}else if(SelectUtil.checkedCount("selectNodeHandler")<=0){
			alert("请先选择环节！");
			return false;
		}else{
			alert("一次只可设置一个环节！");
			return false;
		}
	}
	
	function ev_clearAllChecked(){
		var indicators = $_EN("priorityCBX");
		var nodes = $_EN("selectNodeHandler");
		for(var i=0;i<indicators.length;i++){
			indicators[i].checked = false;
		}
		for(var i=0;i<nodes.length;i++){
			nodes[i].checked = false;
		}
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/*.do" id="form1">	
 <input type="hidden" name="id" id="assessmentId" value="${assessment.id}"/>
 <input type="hidden" name="handlerValue" id="handlerValue" value=""/>
 <input type="hidden" name="handlerName" id="handlerName" value=""/>
  <input type="hidden" name="close_window" id="close_window" value="1"/>
<input type="hidden" name="srcHandlerId" value="${srcHandlerId}"/>
  <input type="hidden" name="viewType" value="${viewType}"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="isUndo" value="${isUndo}"/>
    <input type="hidden" name="flowCode" id="flowCode" value="${flowCode}"/>
    <input type="hidden" name="nodeCode" id="nodeCode" value="${nodeCode}"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsTrace100"><a href="#" onclick="ev_wlTrace('${assessment.id }','${nodeCode}');return false;">流程跟踪信息</a></div>
  <div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<c:if test="${viewRoute and isUndo}">
	<page:route/>
</c:if>
<c:if test="${isUndo}">
<!-- <div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div> -->
<div class="LN_popupsAdd80"><a href="#" onclick="ev_AllHandler();return false;">设置处理人</a></div>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${assessment.name}</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">考核指标列表</td>
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
	        <c:forEach var="o" items="${nodeList}" varStatus="idx">
            	<td width="10%" class="LN_tableBoxtitle2" >${o.nodeName}
            	<input type="checkbox" name="selectNodeHandler" id="NodeHandler${o.id}"  value="${o.id}"/>
            	</td>
            </c:forEach>
       </tr>
       <tbody id="indicatorList">
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
            		<c:forEach var="o" items="${nodeList}" varStatus="idx">
            				<td  class="LN_tableBoxText2"  colIndex="scale">&nbsp;</td>
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
	            				<input type="hidden" class="LN_Input50" name="scale" value="${o1.attributeValues[o2.code]}" />%</td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==1}">
	            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
	            				<input type="checkbox" value="${o1.id}" name="priorityCBX" />
	            				<input type="text" class="LN_Input20" name="priority" value="${o1.attributeValues[o2.code]}"/></td>
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
						<!-- 环节处理人设置 -->
						<c:forEach var="o2" items="${nodeList}" varStatus="idx">
		            	<td class="LN_tableBoxText2" >
		            	<span class="LN_colorOrange" id="handler_${o1.id}${o2.id}"><c:forEach var="o3" items="${o1.nodeGradeList}">
		            	<c:if test="${o2.id==o3.nodeId}">${o3.handlerText}</c:if>
		            	</c:forEach></span>
		            	<c:if test="${isUndo}">
						<input name="Submit9" id="remarkButton${idx.count}" type="button" class="LN_big_button3"
							 				value="设置处理人" onclick="ev_Handler('${o1.id}','${o2.id}');" />
						</c:if>
						</td>
		           		 </c:forEach>
	            	</tr>
	            </c:forEach>
	            </c:if>
            </c:forEach>
       </tbody>
        <tr>
          <td align="right" class="LN_tableBoxText22" colspan="${fn:length(assessment.assIndicatorUseAttributes)}">
         <strong>权重汇总：</strong>
            <input name="scaleTotal" type="text"  class="LN_Input" readOnly="true"
            id="scaleTotal" style="width:50px; color:#ff0000;" value="${scaleTotal}" check="notBlank;setNumber(100,100);" required='true' showName='权重汇总'/>％
            </td>
            <td class="LN_tableBoxText22" colspan="100">&nbsp;</td>
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
</form>
<script type="text/javascript">
	window.onload = function(){
		ev_cal();
	}
</script>
</body>
</html>


