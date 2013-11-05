<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/web/pub/head.inc"%>
<head>
  

	<title>
	   员 工 年 度 考 核 成 绩 统 计 处 理
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
	    
        function doStat()
        {  
            var dealAction = document.getElementById("dealAction").value;
            if(dealAction=="false"){
            
               if(confirm("确定要 进行员工年度统计处理 吗？\r \r建议此操作在晚上11点执行！")){
              
                 document.getElementById("dealAction").value = "true";
                 document.getElementById("dealUnit").disabled = true;
                 form1.action="<%=request.getContextPath()%>/dealPersonYearStat.do";
                 form1.target="_self";
    	         form1.enctype = "";
                 form1.submit();
                 return true;
              }
             
            }
        
            
    	}
      
    
    	   
    
       
 		
    
    </script>
</head>


<body class="LN_body" onmousewheel="setScrollzheight()">
    	<div class="LN_popupsBox">


<div class="LN_formBox">
<div class="LN_formTitle2">
员 工 年 度 考 核 成 绩 统 计 处 理
</div>
<form name="form1" id="form1" method="post" action="${ROOT}/queryPersonAssessment.do">
<input name="dealAction" type="hidden" value="false" />
<div class="LN_formTitle2">
 </br>
 </br>
 </br>
 </br>
 <table cellspacing="0" cellpadding="0" border="0" class="listquery">
 
        <tr>
        <td width="100%" style="text-align:center;" >
        <a id="dealUnit" class="choose2" style="cursor:hand" onclick="doStat();return false;">开始进行员工年度统计处理</a>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;</td>
       
        </tr>
</table>
 

</div>


	
</form>
	
</div>
</div>	
</body>
<script>
	
function doInit(){
  var dealOption = "${dealOption}";
  if(dealOption!=null&&dealOption=="suc"){
    alert("员工年度统计处理 操作成功！");
  }
 
}
	

addLoadEvent(doInit);	

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
