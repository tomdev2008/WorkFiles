<%@ page contentType="text/html; charset=utf-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>意见</title>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
</head>
<body class="LN_body">
<form name="formOpinion" method="post" action="">
<!-- 流程意见 -->
<table width="100%" border="0" cellspacing="1" cellpadding="0">
<td>
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
	<tr>
	</td>
	  <td width="25%" class="LN_tableBoxtitle2">环节</td>
	  <td width="15%" class="LN_tableBoxtitle2">处理人</td>
	  <td width="20%" class="LN_tableBoxtitle2">处理时间</td>
	  <td class="LN_tableBoxtitle2">意见</td>
	</tr>
<c:forEach var="opinion" items="${opinionlist}" varStatus="idx" >
  <tr class="list-color${idx.index%2==0?'1':'2' }">
  <td width="25%" class="LN_tableBoxText2">${opinion.nodeName }&nbsp;</td>
  <td width="15%" class="LN_tableBoxText2">${opinion.creatorName }&nbsp;</td>
  <td width="20%" class="LN_tableBoxText2">&nbsp;<fmt:formatDate value="${opinion.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
  <td class="LN_tableBoxText2">${opinion.opinion }&nbsp;</td>
  </tr>
</c:forEach>
</table>   
</table>
</form>
</body>
</html>