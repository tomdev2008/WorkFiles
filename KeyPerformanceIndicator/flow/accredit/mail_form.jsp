<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.utils.mail.DBEmail"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.system.common.StringUtils"/>
<%@ include file="/web/pub/flow.inc"%>
<html><html:base target="_self"/>
<head>
<title>邮件编辑</title>
</head>
<%
	DBEmail mail = (DBEmail)request.getAttribute("mail");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<script type="text/javascript" src="${ROOT}/common/js/Check.js"></script>
<script type="text/javascript">

function ev_ok(){
<%if(StringUtils.isEmpty(mail.getId())){%>
	form1.action=${ROOT}"/createMail.do";
<%}else{%>
	form1.action=${ROOT}"/updateMail.do";
<%}%>
	if(CheckForm(document.form1)){
		document.form1.submit();
	}
}

</script>

<body >
<br>
<div align="center" class="title">邮件编辑</div><br>
<form name="form1" method="post" >
<input type="hidden" name="id" value="<%=mail.getId()%>" >

<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr> 
  	<td height="22" width="30%" align="center"><font color=red>*</font>邮件标题</td>
	<td width="70%" >
		<input type="text" class=editline name="title" size="50" value="<%=mail.getMailTitle()==null?"":mail.getMailTitle()%>" 
		check="notBlank;isString('#',100)" required="true" showName="邮件标题">
	</td>
  </tr>
  <tr> 
  	<td height="22" align="center" ><font color=red>*</font>收件人</td>
	<td >
		<input type="text" class=editline name="address" size="50" value="<%=mail.getReceiverMail()==null?"":mail.getReceiverMail()%>"
		check="notBlank;isString('#',100)" required="true" showName="收件人">
	</td>
  </tr>
  <tr> 
  	<td align="center" ><font color=red>*</font>内&nbsp;容<br>(1000字内)</td>
	<td >
		<textarea name=content rows="5" cols="70" class=area check="notBlank;isString('#',1000)" required="true" showName="内容"
		><%=mail.getMailContent()==null?"":mail.getMailContent()%></textarea>
	</td>
  </tr>
  <tr> 
  	<td align="center" height="22" >发送时间</td>
	<td >
		<input type="text" class=editline name="sendDt" size="20" readonly="readonly"
		value="<%=mail.getSendDt()==null?"":sdf.format(mail.getSendDt())%>">
	</td>
  </tr>
</table><br>
<div align="center">
<input type="button" value="确定" class="button" onclick="ev_ok();"/>&nbsp;
<input type="button" value="取消" class="button" onclick="window.close()"/>
</div>
</form>
</body>
</html>
