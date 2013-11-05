<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
  	<title>系统公告</title>
  	<script src="${ROOT}/js/kpiCalendar.js"></script>
  	<script type="text/javascript">
  	<!--
  		function ev_save(){
  			if(checkTime("beginDate","endDate")){
	  			var form = $_E("form");
	  			form.action = "${ROOT}/saveComment.do";
	  			form.submit();
  			}
  		}
  		
  		function ev_back(){
  			window.location.href = "${ROOT}/listComment.do";
  		}
  	//-->
  	</script>
</head>  
<body onmousewheel="setScrollzheight()" class="LN_body">
<form id="form" name="form" method="post" action="">
<input type="hidden" name="id" value="${comment.id }" />
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>系统公告管理</h2></td></tr>
  <tr><td class="list-caozuo">
    <a id="hlinkAddNew" href="javascript:ev_save();">保存</a>|
    <a id="hlinkAddNew" href="javascript:ev_back();">返回</a>
  </td></tr>
</table>



<table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
<tr>
	<td width="20%" class="t">标题</td>
	<td width="*"><input type="text" name="title" value="${comment.title }"/></td>
</tr>
<tr>
	<td width="20%" class="t">公告时间段</td>
	<td width="*">
		<input type="text" id="beginDate" name="beginDate" value="<fmt:formatDate value="${comment.beginDate }" pattern="yyyy-MM-dd"></fmt:formatDate>" readonly="readonly" onfocus="calendar()" 
			check="notBlank" required="true" showName="公告起始时间" /><font color="red">*</font>
		&nbsp;&nbsp;&nbsp;至&nbsp;&nbsp;&nbsp;
		<input type="text" id="endDate" name="endDate" readonly="readonly" value="<fmt:formatDate value="${comment.endDate }" pattern="yyyy-MM-dd"></fmt:formatDate>" onfocus="calendar()"
			 check="notBlank" required="true" showName="公告结束时间" /><font color="red">*</font>
	</td>
</tr>
<tr>
	<td width="20%" class="t">公告范围</td>
	<td width="*">
		<textarea rows="2" cols="50" name="scopeText" readonly="readonly" value="${scopeText }">${scopeText }</textarea>
			<a href="#" onclick="getAddressList('0;20','n','1','scopeText','scopeInfo');" class="choose">选择</a>
		<input type="hidden" name="scopeInfo" value="${scopeInfo }" />
		<!--<c:if test="${empty comment.id }">
			<input type="checkbox" name="sendMail" value="0"  />抄送邮件
		</c:if>-->
	</td>
</tr>

<tr>
	<td width="20%" class="t">公告内容</td>
	<td width="*">
		<textarea rows="20" cols="80" name="content"  value="${comment.content }">${comment.content }</textarea>
	</td>
</tr>

</table>
</form>
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>
<kpi:UIResponse />