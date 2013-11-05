<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.system.*,com.shengdai.kpi.flow.valueobject.*" errorPage="" %>
<%@ include file="/web/pub/flow.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统信息列表</title>
</head>
<script language="JavaScript" type="text/javascript">

</script>

<body>
<br />
<form id="form1" name="form1" method="post" action="">
  <table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
    <tr>
      <td align="center">序号</td>
      <td align="center">被考核对象</td>
      <td align="center">创建时间</td>
    </tr>
<logic:iterate id="systemInfo" name="systemInfoList" indexId="index">
<%
int ii = ((Integer) index).intValue();
%>
    <tr>
      <td><%=ii+1%></td>
      <td><bean:write name="systemInfo" property="title"/>&nbsp;</td>
      <td><bean:write name="systemInfo" property="createDate" format="yyyy-MM-dd hh:ss"/>&nbsp;</td>
    </tr>
</logic:iterate>
  </table>
</form>
</body>
</html>
