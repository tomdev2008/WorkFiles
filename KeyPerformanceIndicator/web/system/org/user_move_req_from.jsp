<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<%@ include file="/web/pub/head.inc"%> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>员工调动申请</title>

	<script type="text/javascript">
	<!--
		function ev_save(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/sendMoveRequisition.do?orgID=${orgID }";
			if(CheckForm(form)){
				pageShield();
				form.submit();
			}	
		}
		
		/**
		*返回列表
		*/
		function ev_back(){
			var url = "${ROOT}/listUserByOrg.do?orgId=${orgID }";
			pageBack2List();
		}
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="main-body" >
<form method="post" name="form" id="form">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td> <h2>员工调动申请</h2></td></tr>
  <Tr><td class="list-caozuo">
  	<a id="hlinkAddNew" href="javascript:ev_save();">提交申请</a>|
  	<a id="hlinkAddNew" href="javascript:window.close();">关闭</a>
  	</td></Tr>
</table>

<table class="listquery" border="0" cellpadding="0" cellspacing="1">
	<tr>
		<td  width="15%"  class="t" >
		<div align="center"><strong>&nbsp;&nbsp;&nbsp;注意事项：</strong></div>
		</td>
		<td>
			<font color="red">
			1、发送了调出申请的员工,在员工管理和地址本中不可见；<br />
			2、如果员工需要从当前组织调动到另一个一级责任单位下，请在调入组织处选择一级责任单位即可；
			</font>
		</td>
	</tr>
	
	<tr>
        <td  width="15%"  class="t">调出员工<font color="red">*</font></td>
        <td>
        	<input name="userInfo" type="hidden" id="userInfo"/>
	         <textarea name="userName" id="userName" rows="5" cols="45" class=area readOnly check="notBlank" required="true" showName="调出员工"></textarea>&nbsp;
	        <a href="#"  class="choose" onclick="getAddressList('20','n','0','userName','userInfo');">选择</a>
        </td>
      </tr> 
      
      <tr>
        <td  width="15%"  class="t">说明</td>
        <td>
	         <textarea name="remark" rows="3" id="remark" cols="45" class=area ></textarea>&nbsp;
        </td>
      </tr> 
      
      <tr> 
        <td  width="15%"  class="t">调入组织<font color="red">*</font></td>
        <td>
        	<input name="moveToOrgInfo" type="hidden" id="moveToOrgInfo"  />
	         <input type="text" name="moveToOrgName" id="moveToOrgName" size="45" readOnly check="notBlank" required="true" showName="调入组织"/>
	        <a href="#"  class="choose" onclick="getAddressList('0','1','9','moveToOrgName','moveToOrgInfo');">选择</a>
        </td>     
      </tr>  
</table>
<br />
<div align="center">     
<input name="btnQuery" type="button" value="提交" class="button2" onclick="ev_save();"/>	
<input name="btnQuery" type="button" value="关闭" class="button2" onclick="window.close();"/>
</div>

</form>
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight();}
//-->
</script>
<kpi:UIResponse />