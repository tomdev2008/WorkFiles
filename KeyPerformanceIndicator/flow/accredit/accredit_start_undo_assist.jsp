<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>

<html>
  <head>  

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
 
</head>
<script type="text/javascript">
window.moveTo((screen.availWidth-400)/2,(screen.availHeight-200)/2);
window.resizeTo(400, 200);
</script>
 <body>
 

<form id="form1" name="form1" method="post" action="" >
<br>
  <div align="center">正在处理，请稍候...
</div>   
  

<input type="hidden" name="acids">
  </form>
  <script type="text/javascript">

  var acid=window.opener.window.obj.id;
  form1.acids.value=acid;
  form1.action="${ROOT}/listUndoByAccStart.do?tag=1";
  form1.submit()

  </script>
  </body>
</html>
