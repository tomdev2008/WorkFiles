<%@ page contentType="text/html; charset=utf-8" language="java"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.system.common.StringUtils"/>
<jsp:directive.page import="com.shengdai.kpi.utils.sms.DBMessage"/>
<%@ include file="/web/pub/flow.inc"%>
<html><html:base target="_self"/>
<head>
<title>短信编辑</title>
</head>
<%
	DBMessage message = (DBMessage)request.getAttribute("message");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<script type="text/javascript" src="${ROOT}/common/js/Check.js"></script>
<script type="text/javascript">

function ev_ok(){
<%if(StringUtils.isEmpty(message.getId())){%>
	form1.action=${ROOT}"/createMessage.do";
<%}else{%>
	form1.action=${ROOT}"/updateMessage.do";
<%}%>
	if(CheckForm(document.form1)){
		document.form1.submit();
	}
}

</script>

<body >
<br>
<div align="center" class="title">短信编辑</div><br>
<form name="form1" method="post" >
<input type="hidden" name="id" value="<%=message.getId()%>" >

<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr> 
  	<td height="22" align="center" ><font color=red>*</font>收消息人小灵通</td>
	<td >
		<input type="text" class=editline name="xltNum" size="20" value="<%=message.getReceiverXlt()==null?"":message.getReceiverXlt()%>"
		check="notBlank;isString('#',20)" required="true" showName="收消息人小灵通">
	</td>
  </tr>
  <tr> 
  	<td align="center" ><font color=red>*</font>内&nbsp;容<br>(50字内)</td>
	<td >
		<textarea name=content rows="3" cols="70" class=area check="notBlank;isString('#',50)" required="true" showName="内容"
		><%=message.getMessageBody()==null?"":message.getMessageBody()%></textarea>
	</td>
  </tr>
  <tr> 
  	<td align="center" height="22" >发送时间</td>
	<td >
		<input type="text" class=editline name="sendDt" size="20" readonly="readonly"
		value="<%=message.getSendDt()==null?"":sdf.format(message.getSendDt())%>">
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
