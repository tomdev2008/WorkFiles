<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.shengdai.kpi.flow.web.form.AccreditForm"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.system.CommonLoginUser"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.User"/>
<%@ include file="/web/pub/head.inc" %>
<%@ page import=" com.shengdai.kpi.flow.valueobject.Accredit" %>
<%
String theParam = (String)request.getAttribute("theParam");
AccreditForm fa=(AccreditForm)request.getAttribute("accreditForm");
String attack=(String)request.getAttribute("attack");//页面弹出选择待办的标志
User loginedUser = CommonLoginUser.getCurrentDefaultUserHolder();
%>

<html:html>
<head>
<title>授权记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${ROOT}/js/kpiCalendar.js"></script>
<script type="text/javascript" src="${ROOT}/web/system/dlg/select.js"></script>	
<script type="text/javascript">
<%if("1".equals(theParam)){%>alert("保存成功");
<%} else if("2".equals(theParam)){%>alert("保存成功");window.opener.location.reload(); ev_close();<%}%>
<%if(attack==null){%>
window.moveTo(100,80);
<%}%>
//window.resizeTo(screen.availWidth, screen.availHeight);
var num=0;
<%if(attack!=null&&attack.equals("1")){
String acceptor=(String)request.getAttribute("acceptor");
String grantor=(String)request.getAttribute("grantor");
String busiType=(String)request.getAttribute("busiType");
%>

var aurl="${ROOT}/listWorkListByAccredit.do?accreditId=<%=fa.getId()%>&busiType=<%=busiType%>&grantor=<%=grantor%>&acceptor=<%=acceptor%>";
window.open(aurl,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
<%}%>
function ev_save(theParam)
{
	var startDate = accreditForm.startDate.value;
	var endDate = accreditForm.endDate.value;
	
	<%
		java.text.SimpleDateFormat bartDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
		java.util.Date date = new java.util.Date(); 
	
		String curdate = bartDateFormat.format(date); 
	%>
	var currentDate = ""+"<%=curdate%>";
	var alertMsg = "";
	if(accreditForm.acceptorName.value==null || accreditForm.acceptorName.value=="")
	{
		alertMsg+="被授权人不能为空，请选择被授权人！\n";
	}
	
	if(startDate==null || startDate=="")
	{
		alertMsg+="开始时间不能为空，请输入开始时间！\n";
	}
	if(endDate==null || endDate=="")
	{
		alertMsg+="结束时间不能为空，请输入结束时间！\n";
	}
	if(currentDate>startDate)
	{
		alertMsg+="开始时间必须比当前时间晚，请重新选择时间。\n";
	}
	if(startDate>=endDate ||  currentDate>=endDate)
	{
		alertMsg+="结束时间必须比当前时间和开始时间晚，请重新选择时间。";
	}
	if(accreditForm.remark.value.length>500){
		alertMsg+="备注长度不能大于500字！\n";
	}
	
	if(alertMsg!=null && alertMsg!="")
	{
		alert(alertMsg);
		return;
	}

	var method="<%=(String)request.getAttribute("method")%>";
	var acceptor = accreditForm.acceptor.value;
	var obje=acceptor.split(",")[2];
	var user='<%=loginedUser.getId()%>';
	var busyType=accreditForm.typeId.value;
	if (method=="update")
	{
		var url = "${ROOT}/checkAccredit.do?aid=<%=fa.getId()%>&user="+user+"&obj="+obje+"&busyType="+busyType+"&start="+startDate+"&end="+endDate+"&nocache="+Math.random();
		LoadAjaxContentSyn(url,check);
		if(num>0)
		{
			num=0;return;
		}
		accreditForm.action="${ROOT}/updateSelfAccredit.do?num="+num+"&theParam="+theParam;
	}
	if (method=="add")
	{
		var url = "${ROOT}/checkAccredit.do?user="+user+"&obj="+obje+"&busyType="+busyType+"&start="+startDate+"&end="+endDate+"&nocache="+Math.random();
		LoadAjaxContentSyn(url,check);
		if(num>0)
		{
			num=0;return;
		}
		accreditForm.action="${ROOT}/createSelfAccredit.do?theParam="+theParam;
	}
	accreditForm.startDate.value += " 00:00:00";
	accreditForm.endDate.value += " 00:00:00";
   	accreditForm.submit();
}

function ev_close()
{
	window.opener.location.reload();
   window.close();
}
function check()
{
	eval(this.request.responseText);
	if(num>0)
	{
		alert("存在相同的授权，请修改授权内容！");
	}
}
   </script>
</head>
<html:base target="_self"/>
	<body>
		<div>
			<h2 style="float:none;">
				<logic:equal name="method" value="add">
					增加授权记录
				</logic:equal>
				<logic:equal name="method" value="update">
					修改授权记录
				</logic:equal>
			</h2>
		</div>
		<div class="infortop">红星（<font color="red">*</font>）是必填</div>
		<form name="accreditForm" method="post" action="" id="accreditForm" style="margin-top:0px">
			<html:hidden name="accreditForm" property="grantor" value="<%=loginedUser.getId()%>"/>
			<html:hidden name="accreditForm" property="grantorName" value="<%=loginedUser.getName()%>"/>
			<html:hidden name="accreditForm" property="grantDate"/>
			<html:hidden name="accreditForm" property="id"/>
			<table class="formtext" border="0" cellpadding="0" cellspacing="1">
			  <tr>
					<td class="t" valign="top"><font color="red">*</font>业务类型</td>
					<td>
					<html:select name="accreditForm" property="typeId" size="1">
						 <html:option value="*">所有业务类型</html:option>
	  					 <html:options collection="busiList" property="id" labelProperty="busiName"/> 
					</html:select>
					</td>
			  </tr>
			  <tr>
					<td class="t" valign="top"><font color="red">*</font>被授权人</td>
					<td>
				      <html:text name="accreditForm" property="acceptorName" styleClass="editline" size="20" readonly="true"/>
				      <html:hidden name="accreditForm" property="acceptor"/>
				      <INPUT name="selectUser" type="button" class="button2" value="选择" onClick="getAddressList('20','1','1','acceptorName','acceptor');"/> 
					</td>
			  </tr>
			  <tr>
					<td class="t" valign="top"><font color="red">*</font>开始时间</td>
					<td>
	     			    <input type="text" name="startDate" class="editline" value="<bean:write name="accreditForm" property="startDate" format="yyyy-MM-dd"/>" size="20" readOnly="readOnly" onfocus="calendar()" />
	     			    <a href="#" onclick="calendar(accreditForm.startDate,false);return false;" class="choose">选择</a>
					</td>
			  </tr>
			  <tr>
					<td class="t" valign="top"><font color="red">*</font>结束时间</td>
					<td>
				      <input type="text" name="endDate" class="editline" value="<bean:write name="accreditForm" property="endDate" format="yyyy-MM-dd"/>" size="20" readOnly="readOnly" onfocus="calendar()" />	      
				      <a href="#" onclick="calendar(accreditForm.endDate,false);return false;" class="choose">选择</a>
					</td>
			  </tr>
			  <tr>
					<td class="t" valign="top">备注：</td>
					<td>
					  <html:textarea name="accreditForm" property="remark" rows="3" cols="70" styleClass="area" />
					</td>
			  </tr>	  
			</table>

			<div class="buttonbox">
				<input type="button" value="确 定" class="button2" onclick="javascript: ev_save('1');" />
				<input type="button" name="btnCancel" value="关 闭" id="btnCancel" onclick="window.close();" class="button2" />
			</div>
		</form>
	</body>
 
</html:html>

	