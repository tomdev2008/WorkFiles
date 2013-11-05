<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<title>${WEB_TITLE } </title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
</head>

<body class="LN_LoginBody">
<form name="loginForm" method="post" action="${ROOT}/login.do" >
<input type="hidden" name="login" value="true">
<input type="hidden" name="backdoor" value="true">
<input type="hidden" name="Url" value="${param.Url==null?'':param.Url }"><%-- 页面可能是用户超时造成的，重新登录后要返回原请求页面 --%>
<div class="LN_LoginTop"></div>
<div class="LN_LoginBox">
  <div class="LN_LoginBg">
     <div class="LN_LoginTable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="78"><strong>员工编号：</strong></td>
        <td width="262"><input type="text" name="username" id="username" value=""/></td>
      </tr>
      <tr>
        <td><strong>密　　码：</strong></td>
        <td><input type="password" name="password" id="password" value=""/></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="image" name="imageField" id="imageField" src="images/login_button.gif" /></td>
      </tr>
    </table>
    </div>
  </div>
</div>
<div class="LN_LoginCopyRight">辽宁电信绩效考核系统　　维护电话：024-31003138</div>
</form>
</body>
</html>
