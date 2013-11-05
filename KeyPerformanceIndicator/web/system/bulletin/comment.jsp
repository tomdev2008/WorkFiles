<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
  <head>

  	<title>系统公告</title>
  </head>
<body  class="main-body">	
	<form id="form1" name="form1" method="post" action="">
	  <table  border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg"><div  class="dialog-title">系统公告</div></td>
        </tr>
        <tr>
          <td height="367" valign="top" class="affiche-bg">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="affiche-title">系统公告</td>
            </tr>
            <tr>
              <td class="affiche-data">信息发布时间：
              <fmt:formatDate value="${comment.createDate }">
				<jsp:attribute name="pattern">yyyy-MM-dd hh:mm:ss</jsp:attribute>
			</fmt:formatDate> </td>
            </tr>
            <tr>
              <td class="affiche-text">
              	${comment.content }
              </td>
            </tr>
          </table></td>
        </tr>
      </table>
    </form>
	<div>
	<input type="button" class="button2" onClick="window.close();" value="关闭" />
</div>
</body>
</html>