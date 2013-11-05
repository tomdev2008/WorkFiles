<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>流程环节评分权重设置</title>
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/JavaScript">
<!--
function ev_save(flgClose){
	var fm = $_E('form1');
	if(CheckForm(fm)){
		fm.close_window.value = flgClose;
		fm.submit();
	}
}

function checkScale(){
	var scaleDOM = $_EN("gradeScale");
	if(scaleDOM && scaleDOM.length>0){
		var total = 0;
		for(var i=0;i<scaleDOM.length;i++){
			total += parseInt(scaleDOM[i].value);
		}
		if(total!=100){
			alert("权重和应为100！");
			return false;
		}else{
			return true;
		}
	}
	return false;
}
function ev_reload(){
	var fm = $_E('form1');
	fm.action = "${ROOT}/editFlowGradeNodeScaleSet.do?flowId=${flowId}";
	fm.submit();
}
function initFunction(){
	var ways = "${ways}";
	if(ways!=null&&ways!=""){
		var way = ways.split(";");
		var handleTypeway = document.getElementsByName("way");
		for(var i=0;i<handleTypeway.length;i++){
			for(var j=0;j<way.length;j++){
				if(handleTypeway[i].value==way[j]){
					handleTypeway[i].checked = true;
					break;	
				}
			}
		}
	}
}
window.onload = function (){
	initFunction();
}
//-->
</script>
</head>
<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/saveFlowGradeNodeScaleSet.do" id="form1">	
<input type="hidden" name="close_window" value="0"/>
<input type="hidden" name="resflush_parent" value="0"/>
<input type="hidden" name="flowId" value="${flowId}"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">环节评分权重配置</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
      <tr>
        <td width="15%" class="LN_tableBoxtitle">处理方式</td>
        <td width="90%" class="LN_tableBoxText">
        	<c:forEach var="o" items="${handleTypewayList}">
        	<input type="checkbox" name="way" onclick="ev_reload();" value="${o.id}" />${o.handleWayName }
        	</c:forEach>
		</td>
      </tr>
   </table>
   <br/>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
    <tr>
            <td width="10%" class="LN_tableBoxtitle2">序号</td>
            <td width="20%" class="LN_tableBoxtitle2">环节</td>
            <td width="20%" class="LN_tableBoxtitle2">处理方式</td>
            <td width="20%" class="LN_tableBoxtitle2">权重(%)</td>
     </tr>
     <c:forEach var="o" items="${flowList}">
     <input type="hidden" name="scaleflowId" value="${o.id}"/>
     	<tr><td class="LN_tableBoxtitle" colspan="3">流程名称:${o.flowName}</td>
     	<td class="LN_tableBoxText">
     	<input type="text" name="flowGradeScale" class="LN_Input30" value="${o.gradeScale}" check="notBlank;isInt()" required='true' showName='权重值'/></td></tr>
    <c:forEach var="o1" items="${mainList}" varStatus="idx">
    	<c:if test="${o.id==o1.flow.id}">
      <tr>
      	<input type="hidden" name="nodeId" value="${o1.id}"/>
      	<td width="10%" class="LN_tableBoxText">${idx.count}</td>
      	<td width="20%" class="LN_tableBoxText">${o1.nodeName}</td>
      	<td width="20%" class="LN_tableBoxText">${o1.handleTypeway.handleWayName}</td>
        <td width="20%" class="LN_tableBoxText">
        <input type="text" name="gradeScale" class="LN_Input30" value="${o1.gradeScale}" check="notBlank;isInt()" required='true' showName='权重值'/>
		</td>
      </tr></c:if>
      </c:forEach>
     </c:forEach>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
<kpi:UIResponse/>
</body>
</html>