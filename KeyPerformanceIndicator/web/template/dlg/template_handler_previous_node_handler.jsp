<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>指标处理人继承关系选择</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.name = "previousNodeHandlerWin";
	function ev_submit(){
		var radioHandler = SelectUtil.getFirstChecked("radioHandler");
		if(radioHandler){
			 window.returnValue = {id:radioHandler.value,name:radioHandler.title};
		}
		window.close();
	}
	

</script>
</head>

<body class="LN_body">
<form name="form1" method="post" action="" id="form1" target="templateRemoveWin">	
<input type="hidden" name="ids" value="${param.ids}"/>
<input type="hidden" name="close_window" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">请选择继承处理人</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
    <tr>
    	<td class="LN_tableBoxText">
    	 <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="configTable">
        	<tr>
        		<td width="20%" class="LN_tableBoxtitle2">序号</td>
        		<td width="80%" class="LN_tableBoxtitle2">处理人</td>
        	</tr>
			<c:forEach var="o" items="${detail.handler.instancesSet}" varStatus="idx">
				<tr>
        		<td width="20%" class="LN_tableBoxText">${idx.count}
        		<input type="radio" name="radioHandler" value="${o.id}" title="${o.handlerName}" ${param.selectedId==o.id?'checked':''}/>
        		</td>
        		<td width="80%" class="LN_tableBoxText">${o.handlerName}</td>
        	</tr>
			</c:forEach>
        </table>
    	</td>
    </tr>
   </table>
      <br />
      </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>


