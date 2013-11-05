<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>test</title>
</head>


<SCRIPT type=text/javascript>
function listFreeFlow(flwCode){
var url = "${ROOT}/listFreeFlow.do?flwCode="+flwCode;
window.open(url,'',"dialogHeight:500px;dialogWidth:720px;status=off");
}
</SCRIPT>
<body>
<form name="form1" method="post" action="">

<input type="button" onClick="listFreeFlow('2c9289ec0f5c8a5a010f5c8cf1900002')" value="test" size="32"/>

</form>

</body>
</html>
