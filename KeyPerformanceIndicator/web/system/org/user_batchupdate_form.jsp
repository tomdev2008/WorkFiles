<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>员工信息</title>
	<script type="text/javascript" src="/web/system/dlg/select.js"></script>
	<script src="${ROOT}/web/system/dlg/dateselector.js"></script>
	<script type="text/javascript">
	<!--
		function ev_doSubmit(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/batchUpdateUser.do";
			form.submit();
		}
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="main-body">
<form name="form" method="post">
<input type="hidden" value="<%=request.getParameter("ids") %>" name="ids" />
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>员工信息批量修改</h2></td></tr>
  <Tr>
  	<td class="list-caozuo">
    <a id="hlinkAddNew" href="javascript:ev_doSubmit();">保存</a>|
    <a id="hlinkAddNew" href="javascript:ev_back();">关闭</a></td></Tr>
</table>
    <table  width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">

      <tr>
        
         <td  class="t">岗位</td>
        <td>
	        <input name="positionName" type="text" class="editline" value=""/>&nbsp;
	    </td>
      </tr>
      
      </tr>
      
       <tr>
      	<td class="t">员工属性</td>
        <td>
        	<select id="flgDegree" name="flgDegree">
        		<option value="0">电信员工</option>
				<option value="1">失效用户</option>
				<option value="2">维护用户</option>
				<option value="3">测试用户</option>
        	</select>
        </td>
   	</tr>
    </table>
    
    <div align="center">     
          <input name="btnQuery" type="submit" value="确定" class="button2" onclick="ev_doSubmit()"/>
          <input name="btnQuery" type="button"  value="关闭" class="button2" onclick="window.close();"/>
 	</div>
</form>
</body>
</html>
