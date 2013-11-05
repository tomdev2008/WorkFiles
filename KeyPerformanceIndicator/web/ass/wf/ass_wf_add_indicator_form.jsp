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
	window.name = "assessmentIndicatorEditWin";
	function ev_submit(){
		if(CheckForm($_E("form1"))){
			$_E("form1").submit();
		}
	}
	

</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/*.do" target="assessmentIndicatorEditWin" id="form1">
 <input type="hidden" name="id" id="indicatorId" value="${indicator.id}"/>	
  <input type="hidden" name="flowCode" id="flowCode" value="${param.flowCode}"/>	
 <input type="hidden" name="close_window" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">添加指标</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="configTable">
      <tr colIndex="name">
        <td width="15%" class="LN_tableBoxtitle">指标名称</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="name" id="name" cols="40" rows="2"
        check="notBlank;isString('#',50)" required='true' showName='指标名称' style="width:350px; font-size:12px;">${indicator.name}</textarea>
		</td>
      </tr>
      <tr colIndex="indiType">
        <td width="15%" class="LN_tableBoxtitle">指标类型</td>
        <td width="90%" class="LN_tableBoxText">
        	<select name="indiType" id="indiType">
        		<c:forEach var="o" items="${indicatorTypes}" varStatus="idx">
        			<option value="${o.id}" ${o.id==indicator.assIndicatorType.id?'selected':''}>${o.name}</option>
        		</c:forEach>
        	</select>
		</td>
      </tr>
      <tr colIndex="defined">
        <td width="15%" class="LN_tableBoxtitle">指指解释</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="defined" id="defined" cols="40" rows="2"
        check="isString('#',200)" required='nullable' showName='指指解释' style="width:650px; font-size:12px;">${templateIndicator.name}</textarea>
		</td>
      </tr>
      <tr colIndex="assWay">
        <td width="15%" class="LN_tableBoxtitle">考核方式</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="assWay" id="assWay" cols="40" rows="2"
        check="isString('#',200)" required='nullable' showName='考核方式' style="width:650px; font-size:12px;">${templateIndicator.name}</textarea>
		</td>
      </tr>
      <tr colIndex="baseValue">
        <td width="15%" class="LN_tableBoxtitle">基本目标</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="baseValue" id="baseValue" cols="40" rows="3" 
         check="isString('#',200)" required='nullable' showName='基本目标' style="width:650px; font-size:12px;">${templateIndicator.baseValue}</textarea>
		</td>
      </tr>
      <tr colIndex="defyValue">
        <td width="15%" class="LN_tableBoxtitle">挑战目标</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="defyValue" id="defyValue" cols="40" rows="3" 
        check="isString('#',200)" required='nullable' showName='挑战目标' style="width:650px; font-size:12px;">${templateIndicator.defyValue}</textarea>
		</td>
      </tr>
      <tr colIndex="dataSource">
        <td width="15%" class="LN_tableBoxtitle">数据来源</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="dateSource" id="dateSource" cols="40" rows="3" 
        check="isString('#',200)" required='nullable' showName='数据来源' style="width:650px; font-size:12px;">${templateIndicator.defyValue}</textarea>
		</td>
      </tr>
      <tr colIndex="calWay">
        <td width="15%" class="LN_tableBoxtitle">计分办法</td>
        <td width="90%" class="LN_tableBoxText">
        <textarea name="calWay" id="calWay" cols="40" rows="3" 
        check="isString('#',200)" required='nullable' showName='计分办法' style="width:650px; font-size:12px;">${templateIndicator.defyValue}</textarea>
		</td>
      </tr>
      <tr colIndex="quantized">
        <td width="15%" class="LN_tableBoxtitle">是否量化</td>
        <td width="90%" class="LN_tableBoxText">
        	<kpi:dictionary-select type="INDICATOR_QUANTIZED" name="quantized" selected="${templateIndicator.quantized}"/>
		</td>
      </tr>
      <tr colIndex="scale">
        <td width="15%" class="LN_tableBoxtitle">权重值(%)</td>
        <td width="90%" class="LN_tableBoxText">
        <input type="text" name="scale" id="scale" style="width:80px;" 
        check="notBlank;setNumber('#',100)" required='true' showName='权重值' class="LN_InputBorder" value="${templateIndicator.scale}"/>
		</td>
      </tr>
      <tr colIndex="priority">
        <td width="15%" class="LN_tableBoxtitle">排序号</td>
        <td width="90%" class="LN_tableBoxText">
        <input type="text" name="priority" id="priority" style="width:80px;" 
        check="notBlank;isInt()" required='true' showName='排序号' class="LN_InputBorder" value="${templateIndicator.priority}"/>
		</td>
      </tr>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>


