<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.shengdai.kpi.system.CommonLoginUser"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.User"/>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link rel="stylesheet" type="text/css" href="${ROOT}/css/GDCCS.css"/> 
		<title>${WEB_TITLE}</title>
		
		<script type="text/javascript">
<!--
	function showComment(commentId){
		openWindow("${ROOT}/getContent.do?id="+commentId,750,450);
	}
	
	function ev_setHeight() {

	}
	
	function changePage(url) {
		window.parent.document.getElementById("workspace").src = url;
	}
	
	
//-->
    function personMonthQry(selectType){
      
       if(selectType=='month'){
         <%
	       
	       User user2=CommonLoginUser.getCurrentDefaultUserHolder();
	       if(user2!=null){
	          //if(user2.isSa()||(user2.getAssessmentType()>0&&user2.isMonthAss())){
	             %>
	                 var url = "${ROOT}/queryPersonAssessment.do?INIT_QRY=true&selectType="+selectType;
	               window.parent.document.getElementById("workspace").src = url;
	               //  window.location=url;
	             <%
	         // }
	       }
	      
	      
	    %>
       
       }
	}

	function ev_logout() {
		window.parent.ev_logout();
	}
		 
</script>
</head>
<body style="background-color: white;">
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="10" colspan="2" bgcolor="#FFFFFF"></td>
  </tr>
  <tr>
    <td width="190" align="center" valign="top" bgcolor="#FFFFFF"><table width="180" border="0" cellspacing="1" cellpadding="0" class="LN_boxboder">
      <tr>
        <td class="LN_boxtitlebg">系统公告</td>
      </tr>
      <tr>
        <td height="84" valign="top" class="LN_boxtext">
         <marquee direction="up" behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()"
															scrollamount="3" style="height:69px;">
			<c:forEach var="o" items="${commentList}" varStatus="idx">														
			<img src="${ROOT}/img/iconRight3.gif"/><a href="javascript:showComment('${o.id }');">${o.title}</a>
			<br/>
			</c:forEach>
        </marquee> 
        </td>
      </tr>
    </table>
      <table width="180" border="0" cellspacing="1" cellpadding="0" class="LN_boxboder">
        <tr>
          <td class="LN_boxtitlebg">快捷工作台</td>
        </tr>
        <tr>
          <td align="left" class="LN_boxtext"><table width="50" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td><a href="#" onclick="changePage('${ROOT}/listUndoWorklist.do?busiType=YGKHM');return false;" target="_self"><img src="images/lefttu_09.gif" width="169" height="54" /></a></td>
            </tr>
            <tr>
              <td><a href="#" onclick="changePage('${ROOT}/listUndoWorklist.do?busiType=YGKHY');return false;" target="_self"><img src="images/lefttu_101.gif" width="169" height="54" /></a></td>
            </tr>
            <tr>
              <td><a href="#" onclick="changePage('${ROOT}/listDoneWorklist.do');return false;" target="_self"><img src="images/lefttu_081.gif" width="169" height="54" /></a></td>
            </tr>
            <tr>
              <td><a href="#" onclick="personMonthQry('month');return false;" target="_self"><img src="images/lefttu_13.gif" width="169" height="54" /></a></td>
			  <!-- <td><a href="#" onclick="personMonthQry('month');openFullScreenWin('${ROOT}/web/query/month_assess_qry_list.jsp');return false;"><img src="images/lefttu_13.gif" width="169" height="54" /></a></td>-->
              <!-- <td><a href="#" onclick="changePage('${ROOT}/listUserDuty.do');return false;"><img src="images/lefttu_13.gif" width="169" height="54" /></a></td>-->
            </tr>
            <!-- <tr>
            	<td><a href="#" onclick="changePage('${ROOT}/web/query/year_assess_qry_list.jsp');return false;" target="_self"><img src="images/lefttu_14.gif" width="169" height="54" /></a></td>
				<td><a href="#" onclick="personMonthQry('year');openFullScreenWin('${ROOT}/web/query/year_assess_qry_list.jsp');return false;"><img src="images/lefttu_14.gif" width="169" height="54" /></a></td>
            </tr>
            <tr>
              <td><a href="#" onclick="changePage('${ROOT}/web/plan/year_plan_qry_list.jsp');return false;" target="_self"><img src="images/lefttu_15.gif" width="169" height="54" /></a></td>
            </tr> 
            <tr>
              <td><a href="#" onclick="changePage('${ROOT}/web/system/org/user_pwd_form.jsp');return false;" target="_self"><img src="images/lefttu_16.gif" width="169" height="54" /></a></td>
            </tr>-->
            <tr>
              <td><a href="#" onclick="ev_logout();return false;" target="top"><img src="images/lefttu_17.gif" width="169" height="54" /></a></td>
            </tr>
          </table></td>
        </tr>
      </table>
    </td>
    <td align="center" valign="top" bgcolor="#FFFFFF">
    <iframe id="rightspace" name="rightspace" src="${ROOT}/undoMainByBusiType.do" 
    	align="middle" frameborder="0" width="800" height="670" scrolling="no">
    </iframe>
    </td>
  </tr>
</table>
<script type="text/javascript">
	window.onload = function() {

	}
</script>
</body>
</html>