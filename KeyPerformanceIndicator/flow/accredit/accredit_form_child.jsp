<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.flow.web.form.AccreditForm"/>
<%@ include file="/web/pub/flow.inc" %>
<%
String theParam = (String)request.getAttribute("theParam");
AccreditForm fa=(AccreditForm)request.getAttribute("accreditForm");
String attack=(String)request.getAttribute("attack");//页面弹出选择待办的标志
%>

<html:html>
<head>
<title>授权记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${ROOT}/component/calendar/Calendar.js"></script>
<SCRIPT src="${ROOT}/common/js/commonfunction.js" type=text/javascript></SCRIPT>
<script type="text/javascript">
<%if("1".equals(theParam)){%>alert("保存成功");
<%} else if("2".equals(theParam)){%>alert("保存成功");window.opener.location.reload();  ev_close();<%}%>
window.moveTo(100,80);
//window.resizeTo(screen.availWidth, screen.availHeight);
<%if(attack!=null&&attack.equals("1")){
String acceptor=(String)request.getAttribute("acceptor");
String grantor=(String)request.getAttribute("grantor");
String busiType=(String)request.getAttribute("busiType");
%>

var aurl="${ROOT}/listWorkListByAccredit.do?accreditId=<%=fa.getId()%>&busiType=<%=busiType%>&grantor=<%=grantor%>&acceptor=<%=acceptor%>";
window.open(aurl,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
<%}%>

	var num=0;
	function setDateFormat()
	{
		var sDate=accreditForm.startDate.value.substring(0,19);
			accreditForm.startDate.value=sDate;
		var eDate=accreditForm.endDate.value.substring(0,19);
			accreditForm.endDate.value=eDate;
   	}
   
	function ev_exit()
	{
	   window.location.href="${ROOT}/listAccredit.do";
	}

	function ev_save(theParam)
	{
		var startDate = accreditForm.startDate.value;
		var endDate = accreditForm.endDate.value;
		<%
			java.text.SimpleDateFormat bartDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			java.util.Date date = new java.util.Date(); 
			String curdate = bartDateFormat.format(date); 
		%>
		var currentDate = ""+"<%=curdate%>";
		var alertMsg = "";
		if(accreditForm.grantorName.value==null || accreditForm.grantorName.value=="")
		{
			alertMsg+="授权人不能为空，请选择授权人！\n";
		}
		if(accreditForm.acceptorName.value==null || accreditForm.acceptorName.value=="")
		{
			alertMsg+="被授权人不能为空，请选择被授权人！\n";
		}
		 
		if(startDate==null || startDate=="")
		{
			alertMsg+="开始时间不能为空，请输入开始时间！\n";
		}
		if(currentDate>startDate)
		{
			alertMsg+="开始时间必须比当前时间晚，请重新选择时间。\n";
		}
		if(endDate==null || endDate=="")
		{
			alertMsg+="结束时间不能为空，请输入结束时间！\n";
		}
		if(startDate>=endDate ||  currentDate>=endDate)
		{
			alertMsg+="结束时间必须比当前时间和开始时间晚，请重新选择时间。\n";
		}
		if(accreditForm.remark.value.length>500){
			alertMsg+="备注长度不能大于500字！";
		}
		
		if(alertMsg!=null && alertMsg!="")
		{
			alert(alertMsg);
			return;
		}
	
		var method="<%=(String)request.getAttribute("method")%>";
		var acceptor = accreditForm.acceptor.value;
		var obje=acceptor.split(",")[2];
		var user=accreditForm.grantor.value;
		user=user.split(",")[2];
		var busyType=accreditForm.typeId.value;
		if (method=="update")
		{
			var url = "${ROOT}/checkAccredit.do?aid=<%=fa.getId()%>&user="+user+"&obj="+obje+"&busyType="+busyType+"&start="+startDate+"&end="+endDate+"&nocache="+Math.random();
			LoadAjaxContentSyn(url,check);
			if(num>0)
			{
				num=0;return;
			}
			accreditForm.action="${ROOT}/updateAccredit.do?theParam="+theParam;
		}
		if (method=="add")
		{
			var url = "${ROOT}/checkAccredit.do?user="+user+"&obj="+obje+"&busyType="+busyType+"&start="+startDate+"&end="+endDate+"&nocache="+Math.random();
			LoadAjaxContentSyn(url,check);
			if(num>0)
			{
				num=0;return;
			}
			accreditForm.action="${ROOT}/createAccredit.do?theParam="+theParam;
		}
	   	accreditForm.submit();
	}
	function check()
	{
		eval(this.request.responseText);
		if(num>0)
		{
			alert("存在相同的授权，请修改授权内容！");
		}
	}
	function ev_close()
	{
		window.opener.location.reload(); 
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
	 <input type="button" class="button1" value="保存后关闭" onclick="javascript: ev_save('2');">
	 </td>
	 <td align="right"><input type="button" class="button" value="关闭" onclick="javascript: ev_close();">
     </td></tr></table></td></tr></table>
     <br/>
<div align="center" class="title">
	<logic:notEmpty name="method" >
		<logic:equal name="method" value="add">
			增加授权记录
		</logic:equal>
		<logic:equal name="method" value="update">
			修改授权记录
		</logic:equal>
	</logic:notEmpty>
</div>
<form method="post" action="" name="accreditForm" target="_self" >

  <table width="95%" border="0" cellspacing="1" cellpadding="0" bgcolor="B1BFDC" align="center"><tr><td bgcolor="#FFFFFF">
<table width="100%" bordercolor=#c0c0c0 bordercolordark=#ffffff align="center"
      bordercolorlight=#E1E1E1 border=1 cellpadding="2" cellspacing="0">

	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" ><font color="red" size="2">*</font><FONT size="2">业务类型</FONT> </td>
	      <td height="22" valign=top valign="top" width="427">
				<html:select name="accreditForm" property="typeId" size="1">
				<html:option value="*">所有业务类型</html:option>
  					 <html:options collection="busiList" property="id" labelProperty="busiName"/> 
				</html:select>
	      </td>
	    </tr>
	  
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">授权人</font></td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <html:text name="accreditForm" property="grantorName" size="20" readonly="true" styleClass="editline"/> 
	      <html:hidden name="accreditForm" property="grantor"/>
	      <INPUT name="selectUser" type="button" class="button" value="选择" onClick="showAddr('grantorName','grantor','20;1')"/> 
	      </td>
	    </tr>
	    
	     <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">被授权人</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <html:text name="accreditForm" property="acceptorName" size="20" readonly="true" styleClass="editline"/>
	      <html:hidden name="accreditForm" property="acceptor"/>
	      <INPUT name="selectUser" type="button" class="button" value="选择" onClick="showAddr('acceptorName','acceptor','20;1')"/> 
	      </td>
	    </tr>
	    	
	    <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">开始时间</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <input type="text" name="startDate" class="editline" value="<bean:write name="accreditForm" property="startDate" format="yyyy-MM-dd HH:mm:ss"/>" size="20" readOnly="readOnly" onfocus="calendar(this,true)" />
	      <%-- <html:text name="accreditForm" property="startDate" size="20" readonly="true" onfocus="calendar(this,true)"/>--%>
	      </td>
	    </tr>
        
        <tr>
	      <td height="22" valign=top align="right" nowrap width="85" > <font color="red" size="2" face="arial,sans-serif">*</font><font size="2">结束时间</font> </td>
	      <td height="22" valign=top valign="top" width="427"> 
	      <input type="text" name="endDate" class="editline" value="<bean:write name="accreditForm" property="endDate" format="yyyy-MM-dd HH:mm:ss"/>" size="20" readOnly="readOnly" onfocus="calendar(this,true)" />	      
	      <%--<html:text name="accreditForm" property="endDate" size="20" readonly="true" onfocus="calendar(this,true)"/>--%>
	      </td>
	    </tr>    
        
        <tr>
	      <td height="22" valign=top align="right" nowrap width="85" ><FONT size="2">是否启动</FONT> </td>
	      <td height="22" valign=top valign="top" width="427">
				<html:radio name="accreditForm" property="flgStart" value="1">
			  		是
				</html:radio> 
				<html:radio name="accreditForm" property="flgStart" value="0">
			  		否
				</html:radio>
	      </td>
	    </tr>
        
        <tr>
	      <td height="22" valign=top  valign="top" ALIGN="right" width="85" > <font size="2">备 注</font> </td>
	      <td height="22" valign=top width="427">
				<html:textarea name="accreditForm" property="remark" rows="3" cols="70" styleClass="area" />
		  </td>
    </tr>
        
 </table></td></tr></table>  
	<html:hidden name="accreditForm" property="grantDate"/>
	<html:hidden name="accreditForm" property="id"/>
</form>

</body>
      
    
</html:html>
	