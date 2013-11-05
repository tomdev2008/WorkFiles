<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>多重身份列表</title>
	<script type="text/javascript">
	<!--
	
		function ev_confirmDegree(userID,mss,orgID){
			if(confirm("确定切换当前用户的身份吗?")){
				var form = document.getElementById("form");
				var url = "${ROOT}/confirmDegree.do?userID="+userID+"&mss="+mss+"&orgID="+orgID;
				form.action= url;
				form.submit();
			}
		}
		
	//-->
	</script>
 </head>

<body  onmousewheel="setScrollzheight()" class="main-body">
<form name="form" method="post">
<input type="hidden" name="currOrgID" value="${currOrgID }" />

<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
      <td><h2>多重身份列表</h2></td>
    </tr>
	<tr>
		<td class="list-caozuo">
		</td>
	</tr>
</table>


<table class="list-box" cellspacing="0" rules="all"  border="0">
<tr>
	<th align="center" width="10%" class="list-title">用户名</th>
	<th align="center" width="*" class="list-title">所属部门</th>
	<th align="center" width="15%" class="list-title">登陆帐号</th>
	<th align="center" width="15%" class="list-title">操作</th>
</tr>

<c:forEach var="mutiUser" items="${mutiUserList }" varStatus="idx">
	<tr  class="list-text${idx.index%2==0?'1':'2' }">
		<td colspan="4" width="100%" >
			<table width="100%" cellspacing="0" border="1">
				<tr>
					<td rowspan="${fn:length(mutiUser.list)+1 }" width="10%">${mutiUser.name }</td>
					<td width="*">${mutiUser.org.fullName }</td>
					<td width="15%">${mutiUser.logonID }</td>
					<td width="15%">当前身份</td>
				</tr>
		<c:forEach var="uuvMutiUser" items="${mutiUser.list }" varStatus="idx">
				<tr>
					<td width="*">${uuvMutiUser.org.fullName }</td>
					<td width="15%">${uuvMutiUser.logonID }</td>
					<td width="15%">
						<a href="javascript:ev_confirmDegree('${uuvMutiUser.id }','${uuvMutiUser.mss }','${uuvMutiUser.orgID }')">切换身份</a>
					</td>
				</tr>
		</c:forEach>
			</table>
		</td>
	</tr>
	
</c:forEach>
</table>


</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight();}
//-->
</script>


