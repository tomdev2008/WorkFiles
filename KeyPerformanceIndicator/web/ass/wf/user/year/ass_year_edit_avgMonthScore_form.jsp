<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>月度考核成绩</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var index = "${param.index}";
	var isUndo = "${param.isUndo}";
		function ev_submit(status){
			if(isUndo && isUndo=='true'){
				var form = $_E('form1');
				if(CheckForm(form)){
				form.close_window.value = status;
					form1.action = "${ROOT}/saveAvgMonthScore.do";
					$_E("form1").submit();
				}
			}
		}
	
		function ev_onChange(){
			var form = $_E('form1');
			if(CheckForm(form)){
				var avgMonthScore = parseFloat(document.getElementById("avgMonthScore").value);
				if(avgMonthScore<0){
					alert("月度考核平均分不能小于0分！");
					return;
				}
				else if(avgMonthScore>100){
					alert("月度考核平均分不能大于100分！")
					return;
				}
				var monthScale = parseFloat("${assessmentYearGradeScore.monthScale}");
				var assScore = parseFloat("${assessmentYearGradeScore.assessment.assScore}");
				var oldAvgMonthScore = parseFloat("${assessmentYearGradeScore.avgMonthScore}");
				assScore = assScore + (avgMonthScore-oldAvgMonthScore)*monthScale/100;
				var ass = document.getElementById("assScore");
				ass.value = assScore;
			}
		}

</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="">	
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<c:if test="${param.isUndo=='true'&&viewType!=3}">
<div class="LN_popupsSafe-C"><a href="#" onclick="ev_submit(1);return false;">保存并关闭</a></div>
<div class="LN_popupsSafe"><a href="#" onclick="ev_submit(0);return false;">保存</a></div>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${assessmentYearGradeScore.assessment.batchDateDesc }月度考核成绩</div>
<input type="hidden" name="close_window" id="close_window" value="1"/>
<input type="hidden" name="ownerId" value="${ownerId }"/>
<input type="hidden" name="batchId" value="${batchId }"/>
<input type="hidden" name="assId" value="${assId }"/>
<input type="hidden" name="gradeId" value="${gradeId }"/>
<input type="hidden" name="isUndo" value="${param.isUndo==true?'true':'false' }"/>
<table width="100%" border="0" cellspacing="1" cellpadding="1" class="LN_tableBox2">
   <tr>
              <td width="7%" class="LN_tableBoxtitle2">序号</td>
            <td width="9%" class="LN_tableBoxtitle2"><p>姓名</p></td>
            <td width="14%" class="LN_tableBoxtitle2">部门</td>
            <td width="15%" class="LN_tableBoxtitle2">评分</td>
            <td width="15%" class="LN_tableBoxtitle2">评分等级</td>
            <td width="15%" class="LN_tableBoxtitle2">考核周期</td>
          
    </tr>
    <c:forEach var="o" items="${yearList}" varStatus="idx">
    	<tr>
    		<td class="LN_tableBoxText2">${idx.count }</td>
    		<td class="LN_tableBoxText2">${o.ownerName}</td>
    		<td class="LN_tableBoxText2">${o.owner.parentName}</td>
    		<td class="LN_tableBoxText2">${o.assScore}</td>
    		<td class="LN_tableBoxText2">
				<ass-page:assGradeMapping selectedId="${o.assGrade!=null?o.assGrade:o.assGradeValue}" attrExtends="${\"disabled='true'\"}"/>
			</td>
			<td class="LN_tableBoxText2" >${o.batchDateDesc}</td>
    	</tr>
    </c:forEach>
</table>
 <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
 	<tr>
    	<td width="15%" align="right" class="LN_tableBoxText22">
    		<strong>月度考核原始平均得分：
         	 	<input name="avgScore" type="text" class="LN_Input50" style="color:red;"
		     	 readOnly id="originalMonthScore" value="${originalMonthScore }"/>
		     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		<strong>月度考核修改平均得分：
         	 	<input name="avgMonthScore" onblur="ev_onChange()" type="text" required="true" check="notBlank;isFloat();"  class="LN_Input50" style="${isUndo=='true'?'color:blue':'color:red'}"
		     	 ${isUndo=='true'?'':'readOnly'} id="avgMonthScore" value="${assessmentYearGradeScore.avgMonthScore }"/>
		     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;汇总评分
		     	<input name="assScore" type="text"  class="LN_Input50" readOnly="true" style="color:red;"
		     		id="assScore" value="${assessmentYearGradeScore.assessment.assScore }"/>
		     </strong>
		</td>
	</tr>	
			      
</div>
</div></form>
<script type="text/javascript">
	window.onload = function(){
		try{
			if(index){
				var arg = window.dialogArguments;
				$_E("remark").value = arg.document.getElementById("remark"+index).value;
			}
		}catch(e){}
	}
</script>
</body>
</html>


