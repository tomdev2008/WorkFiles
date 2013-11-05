<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" language="java"%>

<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<%
   String selectType = ParamUtils.getDefaultStringValue(request,"selectType","");
   
   String ifilename="员工月度考核成绩查询.xls"; 
   if(selectType.equals("quarter")){
      ifilename="员工季度考核成绩查询.xls"; 
   }
   if(selectType.equals("year")){
      ifilename="员工年度考核成绩查询.xls"; 
   }
   String filename = new String(ifilename.getBytes("GBK"),"iso8859-1"); 
   response.setHeader("Content-disposition", "attachment;filename="+filename);// 设定输出文件头 
//response.setContentType("application/vnd.ms-excel");// 定义输出类型
   
   //response.setHeader("Content-Disposition", "attachment;filename="+filename);
   //response.setHeader("Content-disposition","attachment; filename=PersonAsseementQry.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档 
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>



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
        
    </script>
</head>



<body class="LN_body" onmousewheel="setScrollzheight()">
    	<table cellspacing="0" cellpadding="0"  border="0" class="list-top" style='width:1200px;'>
        	<tbody>
        		<tr>  
        			<td  colspan="9" align="center" height="32" style='width:1200px;'>
        				<h4><c:if test="${selectType eq 'month' }">员 工 月 度 考 核 成 绩 查 询</c:if>
<c:if test="${selectType eq 'quarter' }">员 工 季 度 考 核 成 绩 查 询</c:if>
<c:if test="${selectType eq 'year' }">员 工 年 度 考 核 成 绩 查 询</c:if></h4>
        			</td>
        			
        		</tr>
        	</tbody>
  		</table>
  	  <br style='line-height:4px;'/>
  	  
  	  
      <form name="form1" method="post" action="">
        <table cellspacing="0" cellpadding="0" class="listquery"  style='width:1300px;' border="0" align="left">
        
        <c:if test="${singleQry eq 'true' }">
        <tr><td style="text-align:left;">查询时间范围：&nbsp;${selYear}年</td></tr>
        </c:if>
        <c:if test="${singleQry eq 'false' }">
         <tr><td style="text-align:left;">部门/人员：&nbsp;${orgName}</td></tr>
	     <tr><td style="text-align:left;">查询时间范围：&nbsp;${batchInfo}</td></tr>
        </c:if>
        
        <tr><td>
        
 <table width="100%" border="0" cellspacing="0" cellpadding="0"  class="LN_infbox-border">
  
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
                  <tr id="showTr_${o.id}" name="qryOutTR"  >
                  <td class="LN_tableBoxText2">${idx.count}</td>  
                  <td class="LN_tableBoxText2" >${o.loginId}</td>
                  <td class="LN_tableBoxText2" >${o.userName}</td>
                  <td class="LN_tableBoxText2" >${o.topOrgName}</td>
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
	        
	        </td>
	    </tr>
	    </table>     
        
   
	</form>
	<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
</body>

</html>
