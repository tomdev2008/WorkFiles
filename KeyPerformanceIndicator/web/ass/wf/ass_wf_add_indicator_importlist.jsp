<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加指标</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.name = "upLoadWin";
	function ev_submit(){
		if(CheckForm($_E("form1"))){
			$_E("form1").submit();
		}
	}
	

</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/importAssessmentIndicator.do" target="upLoadWin" id="form1">
  <input type="hidden" name="flowCode" id="flowCode" value="${flowCode}"/>	
    <input type="hidden" name="id" id="id" value="${assessment.id}"/>	
<input type="hidden" name="type" id="type" value="${param.type}"/>	
 <input type="hidden" name="close_window" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">导入</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">导入新指标</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="configIndiTable">
      <tr>
	          <c:forEach var="o" items="${assessment.pageIndicatorAttributes}">
	          <c:set var="showNone" value="${o.show?'':'none'}"/>
	          <td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};">${o.name}
	          	<c:if test="${o.showExtType==1}">
	          		<input type="checkbox" id="selectAllHandler1" onclick="SelectUtil.checkAll(this,'priorityCBX');"/>
	          	</c:if>
	          	</td>
	          </c:forEach>
       </tr>
       <c:forEach var="o" items="${indicatorList}" varStatus="idx">
       <input type="hidden" name="indicatorId" value="${idx.index}"/>
       <tr>
       <c:forEach var="o1" items="${assessment.pageIndicatorAttributes}">
       	<c:set var="showNone" value="${o1.show?'':'none'}"/>
       	<td class="LN_tableBoxText2" style="display:${showNone};">
        	<c:choose>
        		<c:when test="${o1.editExtType==1}">
        			<select name="indiType${idx.index}" id="indiType${idx.index}">
		        		<c:forEach var="o2" items="${indicatorTypes}">
		        			<option value="${o2.id}" ${o2.id==o.assIndicatorType.id?'selected':''}>${o2.name}</option>
		        		</c:forEach>
		        	</select>
        		</c:when>
        		<c:when test="${o1.editExtType==2}">
        			 <input type="text" name="${o1.code}${idx.index}" id="${o1.code}${idx.index}" class="LN_Input50" 
        				${o1.validateCheck} showName='${o1.name}' class="LN_InputBorder" value="${o.attributeValues[o1.code]}"/>
        		</c:when>
        		<c:when test="${o1.editExtType==3}">
        			<kpi:dictionary-select type="INDICATOR_QUANTIZED" name="quantized${idx.index}" selected="${o.quantized}"/>
        		</c:when>
        		<c:otherwise>
        			<textarea name="${o1.code}${idx.index}" id="${o1.code}${idx.index}" cols="40" rows="4" ${o1.validateCheck}
        				showName='${o1.name}' style="width:250px; font-size:12px;">${o.attributeValues[o1.code]}</textarea>
        		</c:otherwise>
        	</c:choose>
       	</td>
       </c:forEach>
       </tr>
       </c:forEach>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>


