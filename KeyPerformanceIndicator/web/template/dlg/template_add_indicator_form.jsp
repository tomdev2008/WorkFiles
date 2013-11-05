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
	window.name = "templateIndicaotrEditWin";
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
		//alert(obj.value);
		obj.value = obj.value.trim();
		//alert("--"+obj.value+"--");
	}

</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/addTemplateIndicator.do" id="form1" target="templateIndicaotrEditWin">	
<input type="hidden" name="id" value="${templateIndicator.id}"/>
<input type="hidden" name="templateId" value="${template.id}"/>
<input type="hidden" name="close_window" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">添加指标</div>
<div class="LN_colorRed">说明：1、红星*是必填；2、取值渠道为加扣分指标时不需要设置指标分值；
3、如果指标为固化状态，则在考核过程中不可修改此指标，默认为非固化的。</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
    <c:forEach var="o" items="${template.pageTemplateIndiAttributes}">
    	<c:if test="${o.show}">
    	<tr>
        <td width="15%" class="LN_tableBoxtitle">
        <c:if test="${o.edit}"><span class="LN_colorRed">*</span></c:if>${o.name}
        </td>
        <td width="90%" class="LN_tableBoxText">
        	<c:choose>
        		<c:when test="${o.editExtType==1}">
        			<select name="indicatorType" id="indicatorType">
		        		<c:forEach var="o" items="${template.templateIndicatorTypes}">
		        			<option value="${o.id}" ${o.id==templateIndicator.templateIndicatorType.id?'selected':''}>${o.name}</option>
		        		</c:forEach>
		        	</select>
        		</c:when>
        		<c:when test="${o.editExtType==2}">
        			<c:choose>
        				<c:when test="${o.code=='scale'}">
        				<input type="text" name="${o.code}" id="${o.code}" class="LN_Input50" onblur="stringTrim(this)"
        					${o.validateCheck} showName='${o.name}' class="LN_InputBorder" value="${templateIndicator.attributeValues[o.code]}"
        					style="display:${templateIndicator.refResourceId=='DIRECTVALUE'?'none':''};"/>
        					<span id="scaleNoShow" style="display:${templateIndicator.refResourceId=='DIRECTVALUE'?'':'none'};">--</span>
        				</c:when>
        				<c:otherwise>
        					<input type="text" name="${o.code}" id="${o.code}" class="LN_Input50" onblur="stringTrim(this)"
        					${o.validateCheck} showName='${o.name}' class="LN_InputBorder" value="${templateIndicator.attributeValues[o.code]}"/>
        				</c:otherwise>
        			</c:choose>
        		</c:when>
        		<c:when test="${o.editExtType==3}">
        			<kpi:dictionary-select type="INDICATOR_QUANTIZED" name="quantized" selected="${templateIndicator.quantized}"/>
        		</c:when>
        		<c:when test="${o.editExtType==5}">
        			<ass-page:valueChannel selectedId="${templateIndicator.attributeValues[o.code]}"/>
        		</c:when>
        		<c:otherwise>
        			<textarea name="${o.code}" id="${o.code}" cols="40" rows="4" ${o.validateCheck}
        				showName='${o.name}' style="width:650px; font-size:12px;">${templateIndicator.attributeValues[o.code]}</textarea>
        		</c:otherwise>
        	</c:choose>
        </td>
        </tr>
        </c:if>
    </c:forEach>
    <tr>
        <td width="15%" class="LN_tableBoxtitle">是否固化指标</td>
         <td width="85%" class="LN_tableBoxText"><input type="radio" name="flgFixed" value="1" ${templateIndicator.flgFixed==1?'checked':''}/>是
         <input type="radio" name="flgFixed" value="0" ${templateIndicator.flgFixed==0?'checked':''}/>否</td>
   </tr>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>


