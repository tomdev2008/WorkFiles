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
        
    %>


	<title>
	    
	    <c:if test="${selectType eq 'month' }">
	    组织月度考核查询
	    </c:if>
	     <c:if test="${selectType eq 'quarter' }">
	    组织季度考核查询
	    </c:if>
	     <c:if test="${selectType eq 'year' }">
	    组织年度考核查询
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
    	  // name='page.totalNumber'
    	   
    	   document.getElementById("INIT_QRY").value="false";
    	   document.getElementById("reportType").value="query";
    	   document.form1.action="<%=request.getContextPath()%>/queryOrgAssessment.do";
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
    	    document.form1.action="<%=request.getContextPath()%>/queryOrgAssessment.do";
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
    	function showAssessment(id,ownerType)
    	{
    	   
    	    if(parseInt(ownerType)==20){
    	       openFullScreenWin("${ROOT}/openStaticAssessmentByUser.do?id="+id);
    	    }
    	    if(parseInt(ownerType)==0){
    	       openFullScreenWin("${ROOT}/openStaticAssessmentByOrg.do?id="+id);
    	    }
    	    
    		return true;
    	}
    	
    	
    	/**
    	*  显示用户信息
    	*/
    	function showAssUser(id)
    	{
    	}
    	
   
     
       function mouseOver(e,index)
    	{
    	//background-color:#fff; padding:6px 5px 3px 5px; line-height:17px; color:#333;
    	  // alert(e.cells.length);
    	   for(var i=0;i<e.cells.length;i++){
    	     e.cells(i).style.setAttribute("backgroundColor","#bed7f4");
    	     e.cells(i).style.cursor="hand";
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
<c:if test="${selectType eq 'month' }">组 织 月 度 考 核 查 询</c:if>
<c:if test="${selectType eq 'quarter' }">组 织 季 度 考 核 查 询</c:if>
<c:if test="${selectType eq 'year' }">组 织 年 度 考 核 查 询</c:if>
</div>
<form name="form1" id="form1" method="post" action="${ROOT}/queryOrgAssessment.do">
<div class="LN_formTitle2">
 <c:if test="${singleQry eq 'false' }">
 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 <tr>
        <td width="12%" nowrap height="22"   align="left" id="showTd"> 部门:</td>
       
        <td width="76%" align="left"  valign="bottom">
          <input id="orgInfo" name="orgInfo" type="hidden" value="${orgInfo}" />
        <textarea cols="65" rows="3" class="textarea1" id="orgName" name="orgName" readonly="true">${orgName}</textarea>
				&nbsp;&nbsp;&nbsp;<a style="cursor:hand" class="choose" onclick="getAddressList('0','n','0','orgName','orgInfo');">选择查询对象</a>  
        </td>
        <td width="18%"  style="text-align:right;" vAlign="bottom">
		<a href="#"  onclick="query();return false;"><img  src="${ROOT}/images/search.gif" >查询</a>&nbsp;&nbsp;
		<a href="#"  onclick="exportAssess();return false;"><img  src="${ROOT}/images/ico_05.gif" >导出</a>&nbsp;&nbsp;
        </td>
</tr>
 
</table>

 </c:if>
 <c:if test="${singleQry eq 'true' }">
 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 
        <tr>
        <td width="100%" style="text-align:right;" >
        <a href="#"  onclick="query();return false;"><img  src="${ROOT}/images/search.gif" >查询</a>&nbsp;
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

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">查询列表</td>
  </tr>
  <tr>
    <td class="LN_press"><div class="LN_inquiry">历史查询：
      <select name="selYear" id="selYear">
       <%for(int i=2006;i<=(Calendar.getInstance().get(Calendar.YEAR)+15);i++){%>
			<option value="<%=String.valueOf(i)%>" <%if(selYear.equals(String.valueOf(i))) out.print("selected"); %>><%=String.valueOf(i)%>年</option>
	   <%}%>
      </select>
    </div>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="7%" class="LN_tableBoxtitle2" style="text-align:center;">序号</td>
            <td width="15%" class="LN_tableBoxtitle2" style="text-align:center;">单位</td>
            <td width="28%" class="LN_tableBoxtitle2" style="text-align:center;">部门</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">部门负责人</td>
            <td width="18%" class="LN_tableBoxtitle2" style="text-align:center;">岗位</td>
            <td width="10%" class="LN_tableBoxtitle2" style="text-align:center;">评分</td>
            <td width="12%" class="LN_tableBoxtitle2" style="text-align:center;">评分周期</td>
            </tr>
             <c:if test="${initQry eq 'false' }">
             <c:choose>
               <c:when test="${!empty list}" >
               
                  <c:forEach var="o" items="${list}" varStatus="idx">
                  <tr id="showTr_${o.id}" name="qryOutTR"  
                     onmouseover="mouseOver(this,${idx.index%2})" onmouseout="mouseOut(this,${idx.index%2})" 
                     onclick="showAssessment('${o.id}','${o.ownerType}');return false;" >
                  <td class="LN_tableBoxText2">${idx.count}</td>  
                  <td class="LN_tableBoxText2" style="text-align:left;word-break:break-all;">${o.topOrgName}</td>
                  <td class="LN_tableBoxText2" style="text-align:left;word-break:break-all;">${o.endOrgName}</td>
                  <td class="LN_tableBoxText2" >${o.userName}</td>
                  <td class="LN_tableBoxText2" style="text-align:left;word-break:break-all;">${o.positionName}</td>
                  <td class="LN_tableBoxText2" >${o.htmlScore}</td>
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
