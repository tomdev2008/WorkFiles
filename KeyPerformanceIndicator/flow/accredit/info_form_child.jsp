<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>
<%@ page import="java.util.Date" %>
<%
String theParam = (String)request.getAttribute("theParam");
%>
<html:html>
<head>
<title>公告信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${ROOT}/component/calendar/Calendar.js"></script>
<SCRIPT src="${ROOT}/common/js/commonfunction.js" type=text/javascript></SCRIPT>
<script type="text/javascript">
<%if("1".equals(theParam)){%>alert("保存成功");
<%} else if("2".equals(theParam)){%>alert("保存成功"); ev_close();<%}%>
window.moveTo(0,0);
window.resizeTo(screen.availWidth, screen.availHeight);


function setDateFormat(){
	var sDate=infoForm.beginDate.value.substring(0,19);
		infoForm.beginDate.value=sDate;
	var eDate=infoForm.endDate.value.substring(0,19);
		infoForm.endDate.value=eDate;
   }
   
 function ev_exit()
{
   window.location.href="${ROOT}/listInfo.do";
   
}

function ev_save(theParam)
{
	var alertMsg = "";
	if(infoForm.title.value==null || infoForm.title.value=="")
	{
		alertMsg+="请先填写标题！\n";
	}else if(infoForm.title.value.length>100){
		alertMsg+="标题长度不能大于100字！\n";
	}

	if(infoForm.objName.value==null || infoForm.objName.value=="")
	{
		alertMsg+="请先填写公告对象！\n";
	}
	
	if(infoForm.contents.value==null || infoForm.contents.value=="")
	{
		alertMsg+="请先填写公告内容！\n";
	}else if(infoForm.contents.value.length>2000){
		alertMsg+="公告内容长度不能大于2000字！\n";
	}
	
	var beginDate = infoForm.beginDate.value;
	var endDate = infoForm.endDate.value;
	<%
		java.text.SimpleDateFormat bartDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		java.util.Date date = new java.util.Date(); 
	
		String curdate = bartDateFormat.format(date); 
	%>
	var currentDate = ""+"<%=curdate%>";
	
	if(beginDate==null || beginDate=="")
	{
		alertMsg+="请输入起始时间！\n";
	}
	if(endDate==null || endDate=="")
	{
		alertMsg+="请输入截止时间！\n";
	}
	if(beginDate>=endDate || currentDate>=endDate)
	{
		alertMsg+="截止时间必须比当前时间和起始时间晚，请重新选择时间。"
	}
	if(alertMsg!=null && alertMsg!="")
	{
		alert(alertMsg);
		return;
	}

	var method="<%=(String)request.getAttribute("method")%>";

	if (method=="update")
	{
		infoForm.action="${ROOT}/updateInfo.do?theParam="+theParam;
	}
	if (method=="add")
	{
		infoForm.action="${ROOT}/createInfo.do?theParam="+theParam;
	}
   	infoForm.submit();
}

function ev_close()
{
   window.close();
}
   </script>
</head>

<body>
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/images/cmd.jpg" height="30"><table width="100%">
   <tr> 
     <td align=left width=3 ><img src="${ROOT}/images/cmd01.gif" ></td>
     <td id=search onaction="ev_search(50)" width="380"> 
     <input type="button" class="button" value="保存" onclick="javascript: ev_save('1');">
	 <input type="button" class="button" value="保存后关闭" onclick="javascript: ev_save('2');">
	 </td>
	 <td align="right"><input type="button" class="button" value="关闭" onclick="javascript: ev_close();">
     </td></tr></table></td></tr></table>
     <br/>
<div align="center" class="title">
	<logic:notEmpty name="method" >
		<logic:equal name="method" value="add">
			增加公告信息
		</logic:equal>
		<logic:equal name="method" value="update">
			修改公告信息
		</logic:equal>
	</logic:notEmpty>
</div>
<br/>
<form method="post" action="" name="infoForm" target="_self" >

  <table width="95%" border="0" cellspacing="1" cellpadding="0" bgcolor="B1BFDC" align="center"><tr><td bgcolor="#FFFFFF">
<table width="100%" bordercolor=#c0c0c0 bordercolordark=#ffffff align="center"
      bordercolorlight=#E1E1E1 border=1 cellpadding="2" cellspacing="0">
      
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">标题</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <html:text name="infoForm" property="title" size="60"/>
	      </td>
	    </tr>
	   	
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">起始时间</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <input type="text" name="beginDate" value="<bean:write name="infoForm" property="beginDate" format="yyyy-MM-dd HH:mm:ss"/>" size="20" readOnly="readOnly" onfocus="calendar(this,true)" />
	      <!--  html:text name="infoForm" property="beginDate" size="20" readonly="true" onfocus="calendar(this,true)"/>-->
	      </td>
	    </tr>
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">截止时间</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <input type="text" name="endDate" value="<bean:write name="infoForm" property="endDate" format="yyyy-MM-dd HH:mm:ss"/>" size="20" readOnly="readOnly" onfocus="calendar(this,true)" />
	      <!--  html:text name="infoForm" property="endDate" size="20" readonly="true" onfocus="calendar(this,true)"/>-->
	      </td>
	    </tr>
        
        
		<tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">公告对象</font> </td>
	      <td height="22" valign=top valign="top" width="600"> 
	      <html:textarea name="infoForm" property="objName" rows="4" cols="80" readonly="true" styleClass="editTxt" />
	      <html:hidden name="infoForm" property="objDetail"/>
	      <INPUT name="selectObject" type="button" class="button" value="选择" onClick="showAddr('objName','objDetail','0,10,20,30,40;n')"/> 
	      </td>
	    </tr>
      
        <tr>
	      <td height="22" valign=top  valign="top" ALIGN="right" width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">内容</font> </td>
	      <td height="22" valign=top width="427">
				<html:textarea name="infoForm" property="contents" rows="8" cols="100" styleClass="editTxt" />
		  </td>
   		</tr>
        
    </table></td></tr></table>
    
	<html:hidden name="infoForm" property="genDate"/>
	<html:hidden name="infoForm" property="id"/> 
	<html:hidden name="infoForm" property="genPersonId" value="<%=loginedUser.getId()%>"/>
	<html:hidden name="infoForm" property="deletePerson" value="<%=loginedUser.getId()%>"/>
	<html:hidden name="infoForm" property="deleteDt"/>
</form>

</body>

</html:html>
	