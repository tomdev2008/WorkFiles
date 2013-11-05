<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>指标内容</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.name = "assessmentIndicatorEditWin";
	function ev_submit(){
		if(CheckForm($_E("form1"))){
			$_E("form1").submit();
		}
	}
	function VC_Chnage(dom){
		var value = dom.value;
		var scale = $("scale");
		if(value=='DIRECTVALUE' && scale){
			scale.style.display='none';
			$("scaleNoShow").style.display = '';
		}else{
			scale.style.display='';
			$("scaleNoShow").style.display = 'none';
		}
	}

	function stringTrim(obj){
		obj.value = obj.value.trim();
	}
</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/saveAssessmentIndicators.do" target="assessmentIndicatorEditWin" id="form1">
 <input type="hidden" name="assessmentId" id="assessmentId" value="${assessment.id}"/>	
 <input type="hidden" name="indicatorId" id="indicatorId" value="${indicator.id}"/>	
  <input type="hidden" name="flowCode" id="flowCode" value="${param.flowCode}"/>	
    <input type="hidden" name="srcHandlerId" id="srcHandlerId" value="${param.srcHandlerId}"/>	
 <input type="hidden" name="close_window" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<c:if test="${isUndo && indicator.flgFixed==0}">
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${indicator.id==null?'新增':(isUndo?'编辑':'查看')}指标</div>
<div class="LN_colorRed">红*为必填项</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="configTable">
    <c:forEach var="o" items="${assessment.pageIndicatorAttributes}">
    	<tr style="display:${o.show?'':'none'}">
        <td width="15%" class="LN_tableBoxtitle">
        <c:if test="${o.edit}"><span class="LN_colorRed">*</span></c:if>${o.name}
        </td>
        <td width="90%" class="LN_tableBoxText">
        	<c:choose>
        		<c:when test="${o.editExtType==1}">
        			<select name="${o.code}" id="${o.code}">
		        		<c:forEach var="o" items="${assessment.assIndicatorTypes}">
		        			<option value="${o.id}" ${o.id==indicator.assIndicatorType.id?'selected':''}>${o.name}</option>
		        		</c:forEach>
		        	</select>
        		</c:when>
				<c:when test="${o.editExtType==2}">
        			<c:choose>
        				<c:when test="${o.code=='scale'}">
        				<c:set var="gradeScale1" value="-10"/>
        				<c:set var="gradeScale2" value="110"></c:set>
        				<input type="text" name="${o.code}" id="${o.code}" class="LN_Input50" check="notBlank;setNumber(0,100);" onblur="stringTrim(this)"
        					${o.validateCheck} showName='${o.name}' class="LN_InputBorder" value="${indicator.attributeValues[o.code]}"
        					style="display:${indicator.refResourceId=='DIRECTVALUE'?'none':''};"/>
        					<span id="scaleNoShow" style="display:${indicator.refResourceId=='DIRECTVALUE'?'':'none'};">--</span>
        				</c:when>
        				<c:otherwise>
        					<input type="text" name="${o.code}" id="${o.code}" class="LN_Input50" onblur="stringTrim(this)"
        					${o.validateCheck} showName='${o.name}' class="LN_InputBorder" value="${indicator.attributeValues[o.code]}"/>
        				</c:otherwise>
        			</c:choose>
        		</c:when>
        		<c:when test="${o.editExtType==3}">
        			<kpi:dictionary-select type="INDICATOR_QUANTIZED" name="quantized" selected="${indicator.quantized}"/>
        		</c:when>
				<c:when test="${o.editExtType==5}">
        			<ass-page:valueChannel selectedId="${indicator.attributeValues[o.code]}"/>
        		</c:when>
        		<c:otherwise>
        			<textarea name="${o.code}" id="${o.code}" cols="40" rows="4" ${o.validateCheck}
        				showName='${o.name}' style="width:650px; font-size:12px;">${indicator.attributeValues[o.code]}</textarea>
        		</c:otherwise>
        	</c:choose>
        </td>
        </tr>
    </c:forEach>
    </table>
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>


