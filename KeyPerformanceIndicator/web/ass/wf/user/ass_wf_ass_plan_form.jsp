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
	 *AJAX方式提交，默认form1表单
	 */
	function ev_ajax(url){
			var flag = false;
			new Ajax.Request(url, {
				onSuccess:function(response){
					var result = response.responseText || "操作出错!";
					if(result=='ok'){
						flag = true;
					}else{
						alert(result);
					}
				},
				parameters: $('form1').serialize(true),
				asynchronous:false
			});
			return flag;	
	}
	function checkView(){
		var fm = $_E('form1');
		if(CheckForm(fm)){
			var obj = document.getElementById("scaleTotal");
			if(obj.value!='100')
			{
				alert("考核分值汇总必须等100分");
				return;
			}
			fm.close_window.value = 1;
			return ev_ajax(fm.action);
		}
		return false;
	}
	//保存
	function ev_save(status){
		var fm = $_E('form1');
		if(CheckForm(fm)){
			var obj = document.getElementById("scaleTotal");
			if(obj.value!='100')
			{
				alert("考核分值汇总必须等100分");
				return;
			}
			fm.close_window.value = status;
			fm.submit();
		}
	}
	//添加指标项
	function ev_edit(indicatorId,assId){
		var url = "${ROOT}/editAssIndicatorByDlg.do?srcHandlerId=${srcHandlerId}&flowCode=${flowCode}&id=${assessment.id}&isUndo=${isUndo}&indicatorId="+indicatorId;
		var retV = window.showModalDialog(url,window,"dialogWidth:900px;dialogHeight:750px;status=no;");
		if(retV){//如果有返回值,刷新页面
			window.location.reload();
		}
	}
	//引用上一期
	function ev_ref(){
		var msg = "将引用上一期的考核指标到本考核表，是否继续?";
		if(window.confirm(msg)){
			form1.action = "${ROOT}/referencePreviousBatchAssess.do";
			form1.submit();
		}
	}

	function stringTrim(obj){
		obj.value = obj.value.trim();
	}
	
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="${ROOT }/saveAssessmentIndicatorsByUser.do">
 <input type="hidden" name="workitemId" id="workitemId" value="${param.workitemId}"/>
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
<c:if test="${isUndo}">
<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
<div class="LN_popupsLeading-In100"><a href="#" onclick="ev_import('${assessment.id }','${flowCode}');return false;">导入指标</a></div>
<div class="LN_popupsExport100"><a href="#" onclick="ev_export('${assessment.id }','${type}');return false;">导出指标模板</a></div>
<div class="LN_popupsDelete"><a href="#" onclick="ev_delete();return false;">删除指标</a></div>
<div class="LN_popupsAdd"><a href="#" onclick="ev_edit('');return false;">添加指标</a></div>
<div class="LN_popupsRef100"><a href="#" onclick="ev_ref();return false;" title="引用上一期将不会对原有指标产生影响，上期考核表与本期考核表中指标类型不对应时将终止导入">引用上一期</a></div>
<page:route />
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
	          <td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};word-break : break-all;text-align: center;" 
	          		onclick="${o.showExtType==1?'AA_Resort()':''};">${o.name}
	          	<c:if test="${o.showExtType==1}">
	          		<input type="checkbox" id="selectAllHandler1" onclick="SelectUtil.checkAll(this,'priorityCBX');"/>
	          	</c:if>
	          	</td>
	          </c:forEach>
            </tr>
            <tbody id="indicatorList">
            <c:forEach var="o" items="${assessment.assIndicatorTypes}" varStatus="idx">
        	<c:if test="${fn:length(o.assessmentIndicators)==0}"><!-- 补空行 -->
            		<tr>
            		<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
            		<!-- 取值渠道，在考核表中不显示 -->
	            		<c:set var="showNone" value="${o2.show && o2.code!='refResourceId'?'':'none'}"/>
            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
		             			<td class="LN_tableBoxText2" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">${o.name}<br/>
		             			<c:if test="${o.name=='行为类'}">
		             			<a class="LN_BlueLink" href="${ROOT}/downloadStaticFileByName.do?fileNo=1" title="点击下载行为类指标参考文档" target="_blank">(指标参考)</a></c:if></td>           			
	            			</c:when>
	            			<c:otherwise>
            					<td class="LN_tableBoxText2" title="" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
	            				&nbsp;</td>	            			
	            			</c:otherwise>
	            	</c:choose>
            		</c:forEach>
            		</tr>
            </c:if>
			<c:if test="${fn:length(o.assessmentIndicators)>0}">
	            <c:forEach var="o1" items="${o.assessmentIndicators}" varStatus="idx1">
	            <input type="hidden" name="indicatorId" value="${o1.id}"/>
	            	<tr>
	            		<c:forEach var="o2" items="${assessment.pageIndicatorAttributes}">
	            		<!-- 取值渠道，在考核表中不显示 -->
	            		<c:set var="showNone" value="${o2.show && o2.code!='refResourceId'?'':'none'}"/>
	            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
	            				<c:if test="${idx1.count==1}">
		             			<td class="LN_tableBoxText2" rowspan="${fn:length(o.assessmentIndicators)}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align:center;">
				            		${o1.attributeValues[o2.code]}<br/>
				            		<c:if test="${o.name=='行为类'}"><a class="LN_BlueLink" href="${ROOT}/downloadStaticFileByName.do?fileNo=1" title="点击下载行为类指标参考文档" target="_blank">(指标参考)</a></c:if>
				            	</td></c:if>           			
	            			</c:when>
	            			<c:when test="${o2.showExtType==2}">
	            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	            				<a href="javascript:void(0);" class="LN_BlueLink" onclick="ev_edit('${o1.id }','${assessment.id}');return false;">
	            				<kpi:escapeHtmlTag length="1000" ellipsis="..." content="${o1.attributeValues[o2.code]}"/></a></td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==3}">
	            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;text-align: center;">
	            				<c:choose>
	            					<c:when test="${o1.attributeValues['refResourceId']=='DIRECTVALUE'}">--
	            					<input type="hidden" name="scale" value="0"/></c:when>
	            					<c:otherwise><input type="text" class="LN_Input50" name="scale" value="${o1.attributeValues[o2.code]}" onblur="ev_cal();stringTrim(this);"
	            				check="notBlank;setNumber(0,100)" required='true' showName='${o2.name}'/></c:otherwise>
	            				</c:choose>
	            				</td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==1}">
	            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};word-break : break-all;">
	            				<c:if test="${o1.flgFixed==0}"><input type="checkbox" value="${o1.id}" name="priorityCBX" /></c:if>
	            				<input type="text" class="LN_Input20" name="priority" value="${o1.attributeValues[o2.code]}" ${o2.validateCheck } onblur="stringTrim(this);" showName="${o2.name}"/></td>
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
          <td colspan="${fn:length(assessment.assIndicatorUseAttributes)}" align="right" class="LN_tableBoxText22">&nbsp;
          <strong>考核分值汇总：</strong>
            <input name="scaleTotal" type="text"  class="LN_Input" readOnly="true"
            id="scaleTotal" style="width:50px; color:#ff0000;" value="${scaleTotal}" check="notBlank;setNumber(100,100)" required='true' showName='考核分值汇总'/>
            </td>
          </tr>
      </table>
      <br />
     <!--  <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
        <tr>
          <td width="15%" class="LN_tableBoxtitle">例外情况说明</td>
          <td class="LN_tableBoxText">
          <textarea name="importantDesc" id="importantDesc" cols="45" rows="8" style="width:724px; font-size:12px;">${assessment.importantDesc}</textarea></td>
          </tr>
          
          <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText">
          	${assessment.remark}
          </td>
          </tr>
          
      </table> -->
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


