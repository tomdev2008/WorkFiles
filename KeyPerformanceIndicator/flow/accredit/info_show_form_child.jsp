<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>
<%@ page import="java.util.Date" %>

<html:html>
<head>
<title>公告信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${ROOT}/component/calendar/Calendar.js"></script>
<SCRIPT src="${ROOT}/common/js/commonfunction.js" type=text/javascript></SCRIPT>
<script type="text/javascript">
function setDateFormat(){
	var sDate=infoForm.beginDate.value.substring(0,19);
		infoForm.beginDate.value=sDate;
	var eDate=infoForm.endDate.value.substring(0,19);
		infoForm.endDate.value=eDate;
   }
   </script>
</head>

<body>
<div align="center" class="title">
		公告信息
</div>
<br/>
<form method="post" action="" name="infoForm" target="_parent" >

   <table width="95%" border="0" cellspacing="1" cellpadding="0" bgcolor="B1BFDC" align="center"><tr><td bgcolor="#FFFFFF">
<table width="100%" bordercolor=#c0c0c0 bordercolordark=#ffffff align="center"
      bordercolorlight=#E1E1E1 border=1 cellpadding="2" cellspacing="0">
      
		<tr>
     		<td height="22" valign=top colspan="2" nowrap class="tdbulef"> </td>
    	</tr>	
    	 
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font size="2">标题：</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <input type="text" class="editLine" size="60" readOnly="true" value='<bean:write name="infoForm" property="title"/>'/>
	      </td>
	    </tr>
	   	
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font size="2">起始时间：</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <input type="text" class="editLine" size="20" readOnly="true" value='<bean:write name="infoForm" property="beginDate" format="yyyy-MM-dd HH:mm"/>'/>
	      </td>
	    </tr>
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font size="2">截止时间：</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <input type="text" class="editLine" size="20" readOnly="true" value='<bean:write name="infoForm" property="endDate" format="yyyy-MM-dd HH:mm"/>'/>
	      </td>
	    </tr>

        <tr>
	      <td height="22" valign=top  valign="top" ALIGN="right" width="85" > <font size="2">公告内容：</font> </td>
	      <td height="22" valign=top width="427">
				<html:textarea name="infoForm" property="contents" rows="8" cols="80" readonly="true"/>
		  </td>
   		</tr>
        
     </table></td></tr></table>
</form>

</body>      
    
</html:html>
	