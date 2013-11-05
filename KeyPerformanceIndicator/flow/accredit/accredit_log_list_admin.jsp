<%@ page contentType="text/html; charset=utf-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.system.service.IUserService"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<%@ include file="/web/pub/flow.inc" %>
<html>

<head>
<title>授权日志</title>
</head>
<script type="text/javascript">
function ev_search()
{
	var gid= document.all.grantorId.value;
	if(gid=="")
	{
		alert("没有选择授权人，请选择！");
		return;
	}
	alert(gid.split(",")[2]);
	document.frame1.ev_search(gid.split(",")[2]);
}
</script>
<body>
<table width="100%" height="100%">
  <tr>
	<td width="100%" height="5%">
	  <table width="100%" height="5%" cellpadding=0 border=0>
		<tr>
		  <td><br>
			&nbsp;请选择人员：<input name="grantor" type="text" class="editline" onClick="showAddr('grantor','grantorId','20;1')">
			<input name="grantorId" type="hidden"> <input type="button" class="button" value="查询" onclick="javascript:ev_search();">  
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
  <tr>
	<td width="100%">
		<iframe name="frame1" src="${ROOT}/listAccreditHistory.do?uid=<%=loginedUser.getId()%>" scrolling="auto" frameborder="0" width=100% height=100% ></iframe>
	</td>
  </tr>
</table>
</body>
</html>
