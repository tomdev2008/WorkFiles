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
        String batch = ParamUtils.getDefaultStringValue(request,"batch","");
        if(!(batch.trim().length()>2)){
          batch = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
          request.setAttribute("batch",batch);
        }
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        String batch1 = ParamUtils.getDefaultStringValue(request,"batch1","");
	    String batch2 = ParamUtils.getDefaultStringValue(request,"batch2","");
    %>


	<title>

	    员工年度工作计划查询

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
    	   document.form1.action="<%=request.getContextPath()%>/queryGradeReport.do";
    	  // var info = document.getElementById("orgInfo").value;
    	   form1.target="_self";
    	   form1.enctype = "";
           form1.submit();
           return true;
    	 }
    	 
    	 function exportAssess(){
    	     //var totalNumber = document.getElementById("page.totalNumber").value;
    	   //if(parseInt(totalNumber)>0){
    	      document.getElementById("reportType").value="true";
    	    document.form1.action="<%=request.getContextPath()%>/queryGradeReport.do";
    	  // var info = document.getElementById("orgInfo").value;
    	   form1.target="_self";
    	   form1.enctype = "";
           form1.submit();
           document.getElementById("reportType").value="false";
    	   
    	   
    	  // }
    	   
           return true;
    	 }
    	 
    	/**
    	*  显示考核表
    	*/ 
    	function showAssessment(id,ownerType,ownerId,batchDate,batchType,loginId)
    	{
    	    openFullScreenWin("${ROOT}/listYearPlanByUser.do?boId="+id+"&ownerId="+ownerId+"&batchDate="+batchDate+"&batchType="+batchType+"&loginId="+loginId);
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
等 级 分 布 情 况 查 询
</div>
<form name="form1" id="form1" method="post" action="${ROOT}/queryGradeReport.do">
	<div class="LN_formTitle2">
	<input name="orgInfo" type="hidden" value="${orgInfo}" />
 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 	<tr>
        <td width="12%" nowrap height="22" align="left"><font color="red">*</font> 组 织 :</td>
        
        <td width="60%" align="left" >
        <textarea cols="65" rows="3" class="textarea1" name="orgName" readonly="true">${orgName}</textarea>
				&nbsp;&nbsp; 
		</td>		 
		<td width="28%" align="left" valign="bottom" colspan="2">		
				&nbsp;&nbsp;<a style="cursor:hand" class="choose" onclick="getAddressList('0','n','0','orgName','orgInfo','','','true');">选择查询对象</a><br></br>
        </td>       
        </tr>
        <tr>
        <td width="12%" nowrap height="22"   align="left" > 考核批次 :</td>
        
        <td width="76%" align="left" colspan="2">
		<page:doubleYMBatch  batch1="<%=batch1%>" batch2="<%=batch2%>" />&nbsp;&nbsp;
		</td>
		<td width="18%"  style="text-align:right;">
		<a href="#"  onclick="query();return false;"><img  src="${ROOT}/images/search.gif" >查询</a>&nbsp;&nbsp;
		<a href="#"  onclick="exportAssess();return false;"><img  src="${ROOT}/images/ico_05.gif" >导出</a>&nbsp;&nbsp;
         </td>
       
        </tr>
</table>
 

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
    <td class="LN_boxtitlebg">等级分布情况列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
        <td rowspan="2" width="6%" class="LN_tableBoxtitle2"><div align="center">序号</div></td>
        <td rowspan="2" width="15%" class="LN_tableBoxtitle2"><div align="center">部门</div></td>
        <td rowspan="2" width="8%" class="LN_tableBoxtitle2"><div align="center">考核周期</div></td>
        <td colspan="3" class="LN_tableBoxtitle2"><div align="center">优秀<strong>（≤10%）</strong></div></td>
        <td colspan="3" class="LN_tableBoxtitle2"><div align="center">良好<strong>（≤30%）</strong></div></td>
        <td class="LN_tableBoxtitle2"><div align="center">称职</div></td>
        <td class="LN_tableBoxtitle2"><div align="center">基本称职</div></td>
        <td class="LN_tableBoxtitle2"><div align="center">不称职</div></td>
      </tr>
       <tr>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">总人数</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">已使用</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">未使用</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">总人数</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">已使用</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">未使用</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">已使用</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">已使用</div></td>
        <td width="6%" class="LN_tableBoxtitle2"><div align="center">已使用</div></td>
        </tr>
             <c:choose>
               <c:when test="${!empty list}" >
               
                  <c:forEach var="o" items="${list}" varStatus="idx">
                  <tr id="showTr_${o.orgId}" name="qryOutTR"  
                     onmouseover="mouseOver(this,${idx.index%2})" onmouseout="mouseOut(this,${idx.index%2})">
                  <td class="LN_tableBoxText2">${idx.count}</td>  
                  <td class="LN_tableBoxText2" >${o.orgName}</td>
                  <td class="LN_tableBoxText2" >${o.batchDateDesc}</td>
                  <td class="LN_tableBoxText2" >${o.amount_P1}</td>
                  <td class="LN_tableBoxText2" >${o.hasUsed_P1}</td>
                  <td class="LN_tableBoxText2" >${o.unUsed_P1}</td>
                  <td class="LN_tableBoxText2" >${o.amount_P2}</td>
                  <td class="LN_tableBoxText2" >${o.hasUsed_P2}</td>
                  <td class="LN_tableBoxText2" >${o.unUsed_P2}</td>
                  <td class="LN_tableBoxText2" >${o.hasUsed_P3}</td>
                  <td class="LN_tableBoxText2" >${o.hasUsed_P4}</td>
                  <td class="LN_tableBoxText2" >${o.hasUsed_P5}</td>
                  </tr>
                  </c:forEach>	
                 <tr>
                 	说明：总人数：考核周期当年能使用的等级的数量；
                 	已使用：全年到当前月份为止已使用的等级的数量；
                 	未使用：全年还可以使用的等级的数量。
                 </tr>
                
               </c:when>
                <c:otherwise>
                 <tr>
                 
                  <td class="LN_tableBoxText2" colspan ="12" style="text-align:center">没有符合相关条件的记录！</td>
                 </tr> 
                </c:otherwise>
             </c:choose>	
             
         
            
           
          </table>
      </td>
  </tr>
</table>
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
