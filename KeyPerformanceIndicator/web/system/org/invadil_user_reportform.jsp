<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/web/pub/head.inc"%>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<title>
		员工冻结报表
	</title>
	<script>
<!--
		function query(){
			var form = document.getElementById("form1");
			if(CheckForm(form)){
				form.action="${ROOT}/invadilUserReport.do";
    	      	form.target="_blank"; 
    	      	form.submit();
			}
		}
//-->
	</script>
</head>

<body onmousewheel="setScrollzheight()" class="LN_body">
    	<table cellspacing="0" cellpadding="0"  border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td align="left" height="32">
        				<h4>员工冻结报表</h4>
        			</td>
        		</tr>
        		<tr>
      			<td class="list-caozuo">
				<a id="hlinkDelete" href="#" onclick="window.location='${ROOT}/listInvadilUsers.do';">返回</a>&nbsp;|&nbsp;
				</td></tr>
        	</tbody>
  		</table>
  	  <br style='line-height:4px;'/>
  	  
      <form name="form1" method="post" action="" id="form1">
       <input name="orgInfo" type="hidden" value="${orgInfo}" />
        <table cellspacing="0" cellpadding="0" border="0" class="listquery">
        <tr>
        <td width="12%" nowrap height="22" align="left" check="notBlank" required="true" showName="组织"><font color="red">*</font> 组织:</td>
        <td width="60%" align="left" >
        <textarea cols="65" rows="3" class="textarea1" name="orgName" readonly="true">${orgName}</textarea>	</td>
				<td>&nbsp;&nbsp;<a style="cursor:hand" class="choose" onclick="getAddressList('0','n','0','orgName','orgInfo');">选 择</a><br></br>
        </td>       
        </tr>	
        <tr>
        <td>查询方式:</td>
        <td>
        	<input type="radio" name="queryType" value="0" checked/>组织所有人员（含子组织的子组织）&nbsp;&nbsp;
        	<input type="radio" name="queryType" value="1" />组织直属人员（不含子组织的子组织）&nbsp;&nbsp;
        </td>

        	<td  align="center">&nbsp; <a style="cursor:hand"  class="choose"  onclick="query();">查 询</a></td>
        </tr>
        </table>	
	</form>
</body>
</html>
