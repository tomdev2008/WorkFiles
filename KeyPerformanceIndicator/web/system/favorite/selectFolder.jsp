<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	选择要转移的目标目录
</title>



<%@ include file="/web/pub/head.inc"%>
<script type="text/javascript">
<!--

function save2()
{
  //alert(document.getElementById("selectFolder").value);
  window.returnValue = document.getElementById("selectFolder").value;
  window.close();
}
function close2()
{
    
   window.returnValue ="";
   window.close();
}
//-->
</script>
</head>




<body  class="main-body" style="background-color:#eff0f4">
	<form method="post" name="form">
    <input type="hidden" name="selectFolder" value="" />
    <input type="hidden" name="moveFolder" value="moveFolder" />
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="blue-box" height="70%">
	<tr>
	<td>
	   <table border="0" cellspacing="0" cellpadding="0" class="list-top" height="99%" width="99%">
		<tr>
		<td height="160"  class="blue-td">
		<div id="divTree2" class="sidebar">
	    <h3>目录架构</h3>
		<iframe id="ftree" src="${ROOT}/treePersonFolder.do?jsFunc=list_folder&listType=select"  scrolling="auto"  frameborder="0" name="ftree" width="100%" height="100%"></iframe>
        </div>
		</td>
		</tr>
	</table>
	<td>
	</tr>
	</table>
	<table border="0" cellspacing="0" cellpadding="0" class="list-top" width="100%">
	<tr>
	<td height="2">
	&nbsp;
	</td>
	</tr>
   <tr><td align="right" class="list-caozuo">
  	<input type="button" name="button4" class="dialog-button2"
												value="确定" onClick="save2();"/>
											&nbsp;&nbsp;
											<input type="button" name="button4" class="dialog-button2"
												value="取消" onClick="close2();"  />
   </td>
   </tr>
  </table>


</form>
</body>
</html>