<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.util.AddressHelper"/>
<jsp:directive.page import="java.util.Calendar"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/web/pub/head.inc"%>
<head>
   <%
         //selectType
        String selYear = ParamUtils.getDefaultStringValue(request,"selYear","");
        if(!(selYear.trim().length()>2)){
          selYear = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
        }
        
        String batch1 = ParamUtils.getDefaultStringValue(request,"batch1","");
	    String batch2 = ParamUtils.getDefaultStringValue(request,"batch2","");    
       
    %>


	<title>
	    <c:if test="${selectType eq 'month' }">
	    员工月度考核成绩查询
	    </c:if>
	    <c:if test="${selectType eq 'quarter' }">
	    员工季度度考核成绩查询
	    </c:if>
	    <c:if test="${selectType eq 'year' }">
	    员工年度度考核成绩查询
	    </c:if>
	</title>
	
	
	<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout_1.css" />
   
    <script>
    
       // 去掉空格
       String.prototype.trim = function()
       {
         return this.replace(/(^[\s]*)|([\s]*$)/g, "");
        }
        
        function onInit()
	    { 
	      // alert("qryInit!");
	     
	         
	     // alert("setPHeight()");
	      
	    }
	    
        function checkForm2()
        {  
          
    	  
          
        }
      
    	function query()
    	{
    	   document.getElementById("INIT_QRY").value="false";
    	   document.getElementById("reportType").value="query";
    	   document.form1.action="<%=request.getContextPath()%>/queryPersonAssessment.do";
    	  // var info = document.getElementById("orgInfo").value;
    	   form1.target="_self";
    	   form1.enctype = "";
           form1.submit();
           return true;
    	 }
    	 
    	 function exportAssess(){
    	     var totalNumber = document.getElementById("page.totalNumber").value;
    	   if(parseInt(totalNumber)>0){
    	      document.getElementById("reportType").value="export";
    	    document.form1.action="<%=request.getContextPath()%>/queryPersonAssessment.do";
    	  // var info = document.getElementById("orgInfo").value;
    	   form1.target="_self";
    	   form1.enctype = "";
           form1.submit();
           document.getElementById("reportType").value="query";
    	   
    	   
    	   }
    	   
           return true;
    	 }
    	 
    	/**
    	*  显示考核表
    	*/ 
    	function showAssessment(id,ownerType,ownerId,batchDate,batchType,loginId)
    	{
    	    if(batchType=="year"){ //年度考核
    	       openFullScreenWin("${ROOT}/openStaticAssessmentYearByInfo.do?id="+id+"&ownerId="+ownerId+"&batchDate="+batchDate+"&batchType="+batchType+"&loginId="+loginId);
    	    }
    	    else{
    	       //if(document.getElementById("isSa").value=="true"){
    	           
    	           if(parseInt(ownerType)==20){
    	             openFullScreenWin("${ROOT}/openStaticAssessmentByUser.do?id="+id);
    	           }
    	           if(parseInt(ownerType)==0){ // qryType=person 用来控制 组织考核明细表 里 等级是否显示
    	             openFullScreenWin("${ROOT}/openStaticAssessmentByOrg.do?qryType=person&id="+id);
    	            }
    	      // }
    	    }
    	   
    	    
    	    
    		return true;
    	}
    	
    
   
     
       function mouseOver(e,index)
    	{
    	//background-color:#fff; padding:6px 5px 3px 5px; line-height:17px; color:#333;
    	  // alert(e.cells.length);
    	   var isSA = document.getElementById("isSa").value=="true"?true:false;
	       var isYEAR = document.getElementById("selectType").value=="year"?true:false;
	       
    	   for(var i=0;i<e.cells.length;i++){
    	     e.cells(i).style.setAttribute("backgroundColor","#bed7f4");
    	     if(isSA || isYEAR){
    	       e.cells(i).style.cursor="hand";
    	     }
    	     
    	   }
    	   
    	 //  e.style.setAttribute("backgroundColor","red");
    	   //e.style.backgroundColor='#bed7f4';// 'lightblue';   
    	 //  e.style.cursor="hand";
    	}
    	
    	function   mouseOut(e,index){  
    	   
    	 
	       
    	   for(var i=0;i<e.cells.length;i++){
    	     e.cells(i).style.setAttribute("backgroundColor","#ffffff");
    	    // e.cells(i).style.cursor="hand";
    	   }
    	   
    	   
    	 // if(parseInt(index)==0)
    	 // {  
    	    // alert(index);
    	//    e.style.backgroundColor   =   '#fff';   
    	 // }
    	//  else
    	///  {// alert(index);
    	////    e.style.backgroundColor   =   '#F5F7FE';   
    	///  }
          
       }
       
 		
    
    </script>
</head>


<body class="LN_body" onmousewheel="setScrollzheight()">
    	<div class="LN_popupsBox">


<div class="LN_formBox">
<div class="LN_formTitle2">
<c:if test="${selectType eq 'month' }">员 工 月 度 考 核 成 绩 查 询</c:if>
<c:if test="${selectType eq 'quarter' }">员 工 季 度 考 核 成 绩 查 询</c:if>
<c:if test="${selectType eq 'year' }">员 工 年 度 考 核 成 绩 查 询</c:if>
</div>
<form name="form1" id="form1" method="post" action="${ROOT}/queryPersonAssessment.do">
<div class="LN_formTitle2">
 <c:if test="${singleQry eq 'false' }">
 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 <tr>
        <td width="12%" nowrap height="22"   align="left" id="showTd"> 部门/人员:</td>
       
        <td width="53%" align="left"  valign="bottom">
          <input id="orgInfo" name="orgInfo" type="hidden" value="${orgInfo}" />
        <textarea cols="65" rows="3" class="textarea1" id="orgName" name="orgName" readonly="true">${orgName}</textarea>
				&nbsp;&nbsp;  
        </td>
        <td width="35%" colspan="2" align="left" valign="bottom">
            &nbsp;&nbsp;<a style="cursor:hand" class="choose" onclick="getAddressList('0;10;20','n','0','orgName','orgInfo');">选择查询对象</a><br></br>
        </td>
        
</tr>
 <tr>
        <td width="12%" nowrap height="22"   align="left" > 员工名称 :</td>
        
        <td width="76%" align="left" colspan="3">
        <input  id="selPerson" name="selPerson" type="text"  class="input-text1"  size="76" value="${selPerson}">     
		&nbsp;&nbsp;(注:多人查询请用","键隔开)
		
		</td>
		
       
 </tr>
 <tr>
        <td width="12%" nowrap height="22"   align="left" > 考核批次 :</td>
        
        <td width="76%" align="left" colspan="2">
        <c:if test="${selectType eq 'month' }"><page:doubleMonBatch batch1="<%=batch1%>" batch2="<%=batch2%>" /></c:if>
		<c:if test="${selectType eq 'year' }"><page:doubleYearBatch batch1="<%=batch1%>" batch2="<%=batch2%>" /></c:if>&nbsp;&nbsp;</td>
		<td width="18%"  style="text-align:right;">
		<a href="#"  onclick="query();return false;"><img  src="${ROOT}/images/search.gif" >查询</a>&nbsp;&nbsp;
		<a href="#"  onclick="exportAssess();return false;"><img  src="${ROOT}/images/ico_05.gif" >导出</a>&nbsp;&nbsp;
         </td>
       
 </tr>

</table>

 </c:if>
 <c:if test="${singleQry eq 'true' }">
 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 
        <tr>
        <td width="12%" nowrap height="22"   align="left" > 考核批次 :</td>
        
        <td width="76%" align="left" colspan="2">
        <c:if test="${selectType eq 'month' }"><page:doubleMonBatch batch1="<%=batch1%>" batch2="<%=batch2%>" /></c:if>
		<c:if test="${selectType eq 'year' }"><page:doubleYearBatch batch1="<%=batch1%>" batch2="<%=batch2%>" /></c:if>&nbsp;&nbsp;</td>
		<td width="18%"  style="text-align:right;">
		<a href="#"  onclick="query();return false;"><img  src="${ROOT}/images/search.gif" >查询</a>&nbsp;&nbsp;
		<a href="#"  onclick="exportAssess();return false;"><img  src="${ROOT}/images/ico_05.gif" >导出</a>&nbsp;&nbsp;
         </td>
       
        </tr>
</table>
 </c:if>
 

</div>


<input name="INIT_QRY" type="hidden" value="${initQry}" />
<input name="singleQry" type="hidden" value="${singleQry}" />
 <input name="reportType" type="hidden" value="${reportType}" />
  <input name="selectType" type="hidden" value="${selectType}" />
    <input name="isSa" type="hidden" value="${isSa}" />

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">查询列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">序号</td>
            <td width="14%" class="LN_tableBoxtitle2" style="text-align:center;">员工编号</td>
            <td width="14%" class="LN_tableBoxtitle2" style="text-align:center;">姓名</td>
            <td width="30%" class="LN_tableBoxtitle2" style="text-align:center;">部门</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">评分</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">评分等级</td>
            <td width="12%" class="LN_tableBoxtitle2" style="text-align:center;">评分周期</td>
            </tr>
             <c:if test="${initQry eq 'false' }">
             <c:choose>
               <c:when test="${!empty list}" >
               
                  <c:forEach var="o" items="${list}" varStatus="idx">
                  <tr id="showTr_${o.id}" name="qryOutTR"  
                     onmouseover="mouseOver(this,${idx.index%2})" onmouseout="mouseOut(this,${idx.index%2})" 
                     onclick="showAssessment('${o.id}','${o.ownerType}','${o.ownerId}','${o.batchDate}','${o.batchType}','${o.loginId}');return false;">
                  <td class="LN_tableBoxText2">${idx.count}</td>  
                  <td class="LN_tableBoxText2" >${o.loginId}</td>
                  <td class="LN_tableBoxText2" >&nbsp;${o.userName}</td>
                  <td class="LN_tableBoxText2" >&nbsp;${o.topOrgName}</td>
                  <td class="LN_tableBoxText2" >${o.htmlScore}</td>
                  <td class="LN_tableBoxText2" >${o.assGrade}</td>
                  <td class="LN_tableBoxText2" >${o.batchDateDesc}</td>
                  </tr>
                  </c:forEach>	
                 
                
               </c:when>
                <c:otherwise>
                 <tr>
                 
                  <td class="LN_tableBoxText2" colspan ="8" style="text-align:center">没有符合相关条件的记录！</td>
                 </tr> 
                </c:otherwise>
             </c:choose>	
             
         
             </c:if>
            
           
          </table>
      </td>
  </tr>
</table>
		
	<kpi:page-bar formId="form1"/>	
	</form>
	
</div>
</div>	
</body>
<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
<script>
	
		
	


function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}		
</script>
</html>




<kpi:UIResponse />	
