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
	function ev_showAssessment(assID,userId){
		var editView = "${viewType}";
		var params = "?boId="+assID
			+"&nodeCode=${param.nodeCode}&type=${type}&flowCode=${param.flowCode}"
			+"&viewType=${viewType}&isUndo=${isUndo}&srcHandlerId="+userId;
		var url = "";
		if(editView=='1'){
			url = "${ROOT}/*.do";
		}else if(editView=='2'){
			url = "${ROOT}/*.do";
		}else if(editView=='3'){
			url = "${ROOT}/*.do";
		}else if(editView=='4'){
			url = "${ROOT}/*.do";
		}else if(editView=='5'){
			url = "${ROOT}/*.do";
		}else if(editView=='7'){
			url = "${ROOT}/*.do";
		}else if(editView=='8'){
			url = "${ROOT}/*.do";
		}else if(editView=='9'){
			url = "${ROOT}/*.do";
		}else if(editView=='11'){
			url = "${ROOT}/*.do";
		}
		url = url+params;
		openFullScreenWin(url);
	}
	/*
	*验证一下是否已经保存了
	*/
	function checkView(routeId){
		var boIds = getAllChecked('id');
		var url = "${ROOT}/checkAssessmentDataEfficiency.do?ids="+boIds;
		var flag = true;
			new Ajax.Request(url, {
				onSuccess:function(response){
					var result = response.responseText;
					if(result=="ok"){
						var retV = eval(result);
						alert("["+retV.name+"]考核表数据不完整，请保存后再进行提交！");
						flag = true;
					}else{
						var retV = eval("(" + result + ")");  // parse JSON 数据
						alert("["+retV.name+"]考核表数据不完整，请保存后再进行提交！");
						flag = false;
					}
				},
				parameters: $('form1').serialize(true),
				asynchronous:false
			});
		return flag;
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="">
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
            <td width="20%" class="LN_tableBoxtitle2">被考核对象</td>
            <td width="15%" class="LN_tableBoxtitle2">单位</td>
            <td width="*" class="LN_tableBoxtitle2">考核周期</td>
            </tr>
            <c:forEach var="o" items="${assessmentList}" varStatus="idx">
	            <tr>
	              <td  class="LN_tableBoxText2"> 
	              ${idx.count}<input type="hidden" name="assId" value="${o.id }"/>
	              <input type="hidden" name="srcHandlerId${o.id}" value="${boInfoM[o.id].srcHandlerId}" />
	            	<input type="checkbox" name="id" boId="${o.id }" value="${boInfoM[o.id].worklistItemId }" /></td>
	            	<td class="LN_tableBoxText2">
	            	<a href="#" class="LN_BlueLink" onclick="ev_showAssessment('${o.id }','${boInfoM[o.id].srcHandlerId}');return false;">${o.ownerName }</a></td>
	            <td class="LN_tableBoxText2">${o.owner.subCommpanyName}&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.batchDateDesc }</td>
	            </tr>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
</div>
</div>

<kpi:page-bar formId="form1"/>
<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
</form>
</body>
</html>