<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head >
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
</head>
<body onmousewheel='setScrollzheight();' class="LN_body">
    <form name="form1" method="post" style="margin-top: 0px">
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>流程管理</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
					</td>
				</tr>
  			</tbody>
  		</table>    				
        <div align="left">
        	[<font color="#CC3300"></font>]下的流程列表。
        </div>    
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="50%">名称</td>
				<td class="list-title" width="20%">类别</td>
				<td class="list-title" width="*" colspan="2">操作</td>
			</tr>
			<tr class="list-color1">
				<td colspan="5" style="text-align:center" class="list-text1">请先选择组织....</td>
			</tr>
		</table>

	</form>
</body>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>
</html>
