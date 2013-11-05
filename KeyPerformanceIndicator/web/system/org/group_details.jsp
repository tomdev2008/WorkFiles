<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>群组成员</title>
    <script>
    <!--
    	function ev_back(){
    		var url =  "${ROOT}/listGroup.do?orgId=${group.org.id}";
    		document.location.href = url;
    	}		
    //-->
    </script>
 </head>
 
<body  onmousewheel="setScrollzheight()" class="main-body">
 <form name="form" method="post">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr>
      <td><h2>[${group.name }]下成员列表</h2></td>
  </tr>
  <tr><td class="list-caozuo">
		  <a href="javascript:ev_back();">返回</a>
	</td></tr>
 </table>

<table class="list-box" cellspacing="0" rules="all" border="0px"id="ctl03_GridViewUserList">
	<tr align="left">
		  <td width="40" style="padding-left:7px; text-align:left; background:#D9E1F9;" >
            <input  type="checkbox" id="selectAll" onclick="javascript:checkAll(this.id,'uid');"  class="checkboxInput"/>
          </td>
          <th align="center" width="*" class="list-title">成员名称</td>
          <th align="center" width="15%" class="list-title">序号</td>
	</tr>
	<c:set var="size" value="${fn:length(group.details) }"></c:set>
	<c:forEach var="detail" items="${group.details}" varStatus="idx" >
	<tr class="list-text${idx.index%2==0?'1':'2' }">
		  <td align="left"><input name="uid" type="checkbox" value="${detail.id }" class="checkboxInput"/></td>
		  <td align="left">${detail.detailName }</td>
		  <td align="left">
		  	${idx.count }
		  	<%--<input  type="text" maxlenght="2" value="${detail.priority }" size="2" class="input-textline"/>&nbsp;
		  	<c:choose>
		  		<c:when test="${idx.index!=0 }">
		  			<a href="#" onclick="alert('上移');">
	              	 <img src="${ROOT}/img/arrow_up.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
	          		</a>
		  		</c:when>
		  		<c:otherwise>
		  			<img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
		  		</c:otherwise>
		  	</c:choose>
		  	
		  	<c:choose>
		  		<c:when test="${idx.index<size-1}">
		  			 <a href="#" onClick="alert('下移');">
                  		 <img src="${ROOT}/img/arrow_down.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
              		</a>
		  		</c:when>
		  		<c:otherwise>
		  			<img src="${ROOT}/img/blank.gif" width="13" height="9" border="0" vspace="2" hspace="2"/>
		  		</c:otherwise>
		  	</c:choose>
		  --%></td>
     </tr>
     </c:forEach>
</table>
  <kpi:page-bar formId="form" />
<input type="hidden" name="groupId" value="${group.id }" />

</form>	
</body>
</html>

<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>

