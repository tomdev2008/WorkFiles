<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<title>
		员工冻结报表
	</title>
	<script type="text/javascript">
	<!--
		function ev_exprot(){
			var orgInfo = document.getElementById("orgInfo").value;
			var queryType = document.getElementById("queryType").value;
			var form = document.getElementById("form1")
			form.action = "${ROOT}/exportInvadilUserReport.do";
			form.submit();
			//window.location.href="${ROOT}/exportInvadilUserReport.do?orgInfo="+orgInfo+"&queryType="+queryType;
			return false;
		}
	//-->
	</script>
</head>
<body class="LN_body">
<table cellspacing="0" cellpadding="0"  border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td align="left" height="32">
        				<h4>员工冻结报表</h4>
        			</td>
        			<td align ="right" >
        			    <%--<a style="cursor:hand"  class="choose"  onclick="print();">打 印</a>&nbsp;
        			    <a style="cursor:hand"  class="choose"  onclick="printPreView();">打印预览</a>&nbsp;
        			    --%><a style="cursor:hand"  class="choose"  onclick="ev_exprot();">导 出</a>
        			    &nbsp;&nbsp;&nbsp;
        			</td>
        		</tr>
        	</tbody>
  		</table>
  	  <br style='line-height:4px;'/>
  	  <form name="form1" method="post" action="" id="form1">
  	  	<input type= "hidden" name="orgInfo" id="orgInfo" value="${orgInfo }"/>
  	  	<input type= "hidden" name="queryType" id="queryType" value="${queryType }"/>
        <table cellspacing="0" cellpadding="0" class="listquery" width="100%" border="0" align="left">
        
	    <tr><td>查 询 部 门：&nbsp;${orgName}</td></tr>
	    <tr><td>
	        <table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      			bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="100%">  
      
	        <tr>
	            <td class="list-title" align="center" width="5%" nowrap="true" >序号</td>
	            <td class="list-title" align="center" width="12%">员工</td>
	      		<td class="list-title" align="center" width="10%">登陆帐号</td>
	      		<td class="list-title" align="center" width="*" >组织</td>
	      		
	      		<td class="list-title" align="center" width="20%">冻结时间</td>
	      		<td class="list-title" align="center" width="10%">冻结操作人</td>
	      	</tr>
	      	<c:forEach var="invadilUser" items="${userList}" varStatus="idx">
			<tr class="list-text${idx.index%2==0?'1':'2'}" >
				<td align="center" >${idx.count }</td>
				<td align="left" >${invadilUser.name }&nbsp;</td>
				<td align="left" >${invadilUser.logonId }&nbsp;</td>
				<td align="center" >${invadilUser.org.fullName }&nbsp;</td>
				
				<td align="center" >
					<fmt:formatDate value="${invadilUser.effectOUTDATE }">
		  			<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
		  			</fmt:formatDate>&nbsp;
				</td>
				<td align="center" >${invadilUser.modifierName }&nbsp;</td>
			</tr>
		     </c:forEach>			
	        </table>
	        </td>
	    </tr>
	    </table>     	
	</form>
</body>
</html>