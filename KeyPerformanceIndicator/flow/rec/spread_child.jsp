<%@ page contentType="text/html;charset=utf-8" language="java" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.WorklistItem"/>
<jsp:directive.page import="com.shengdai.kpi.system.common.ParamUtils"/>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<title>传 阅</title>
</head>
<script src="../../component/calendar/CompareAbleCalendar.js"></script>
<script src="../../component/calendar/Calendar.js"></script>
<script type="text/javascript" >

/**ajax方式从后台取得传阅视图的URL
  *@nodeCode 环节id
  *@id       业务对象的id
  *@wid 	 传阅消息的id，也就是worklistItemId
  */
function toOpenSpread(nodeCode,id,wid){
	var getview = "${ROOT}/getFlowNodeExt.do?key=SPREAD_VIEW&id="+nodeCode+"&wid="+wid;
	var url = LoadAjaxContent(getview,openSpread);
	boid = id;
	worklistId = wid;
}
var boid = "";
var worklistId = "";
function openSpread(){
	var temp = "${ROOT}"+this.request.responseText;
	if(temp.split("@:@").length==2){
		var time = temp.split("@:@")[1];
		var url = temp.split("@:@")[0];
		if(url.indexOf("?")>0)
			url = url + "&id=" + boid;
		else
			url = url + "?id=" + boid;
		window.open(url, "_blank", "width=600,height=500,left=0,top=0,resizable=yes,status=no,scrollbars=yes");
		if("none"!=time){//本来就是已阅的情况，传回的时间为“none”
			document.getElementById("time_"+worklistId).innerHTML=time;
			document.getElementById("status_"+worklistId).innerHTML = "已阅";
		}
	} else {
		alert("传阅视图没正确设置，请联系管理员。");
	}
}

function ev_setRead(){
	var ids = getAllChecked("checkname");
	if(ids!=""){
		var getview = "${ROOT}/setSpreadRead.do?ids="+ids;
		var url = LoadAjaxContent(getview,setReadStatus);
	}
}
function setReadStatus(){
	var back = this.request.responseText;
	var timeInfo = back.split(";")[1];
	var idInfo = back.split(";")[0]; 
	var ids = idInfo.split(",");
	for(i=0; i<ids.length; i++){
		var id=ids[i];
		var status = "status_" + id;
		var time = "time_" + id;
		document.getElementById(status).innerHTML = "已阅";
		document.getElementById(time).innerHTML = timeInfo;
	}	
}

function ev_query_open(){
  document.getElementById("queryid").style.display = "";
}

function ev_query_close(){
  	document.getElementById("queryid").style.display = "none";
}

function ev_query(){
	if(document.getElementById("query_status1").checked ||
		document.getElementById("query_status2").checked){
		document.form2.submit();
	} else {
		alert("请选择状态");
	}
}

</script>

<body >
<form name=form2 method="post" action="${ROOT}/querySpread.do">
<table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/web/flow/img/cmd.jpg" height="30"><table width="100%">
   	<tr> 
     	<td align=left width=3 ><img src="${ROOT}/web/flow/img/cmd01.gif" ></td>
     	<td id=search width="500"> 
	 	<input type="button" class="button" value="已阅" onclick="ev_setRead();">
	 	<input type="button" class="button" value="查询" onclick="ev_query_open();" >
     </td>     
     </tr></table></td></tr> 
     <tr id="queryid" style="display: none">     
	  	<td colspan="2" width="100%" height="3%">
	  	<font color="red" size="2" face="arial,sans-serif">*</font>	  	
	  	状态:<input type=checkbox name=status id=query_status1 value="<%=WorklistItem.STATUS_UNREAD%>">未阅&nbsp;
			<input type=checkbox name=status id=query_status2 value="<%=WorklistItem.STATUS_HASREAD%>">已阅&nbsp;&nbsp;&nbsp;
		到达时间:<input id=beginDate type=text class=editline size=12 name=beginDate value="" onclick="calendar(this);" readonly >&nbsp;至&nbsp;
			<input id=endDate type=text class=editline size=12 name=endDate value="" onclick="calendar(this);" readonly >
	  	&nbsp;<input type="button" class="button" value="查找" onclick="javascript:ev_query()"/>
	  	&nbsp;<input type="button" class="button" value="关闭" onclick="javascript:ev_query_close()"/>
	  	</td>
	  </tr>    
</table></form>
<form id="form1" name="form1" method="post" action="">
<input type="hidden" name="busi" value="<%=ParamUtils.getParameter(request, "busi", "")%>" /> 
<input type="hidden" name="status" value="<%=ParamUtils.getParameter(request, "status", "10")%>" /> 
<div align="center" class="title">传阅信息列表</div>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      			bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">  
  <tr> 
  	<td class="title-header" align="center" width="5%" nowrap>
  	<input type="checkbox" id="ctrlcheck" onClick="javascript:checkAll(this.id, 'checkname');">选择</td>
    <td class="title-header" align="center" width="45%" nowrap>标题</td> 
    <td class="title-header" align="center" width="20%">收到时间</td>
    <td class="title-header" align="center" width="20%">已阅时间</td>
    <td class="title-header" align="center" width="10%">状态</td>  
  </tr> 
  <logic:iterate id="item" name="list">
  <tr>
  	<td align="center"><input type="checkbox" name="checkname" value="<bean:write name="item" property="id"/>" 
  	<logic:equal name="item" property="status" value="<%=String.valueOf(WorklistItem.STATUS_HASREAD)%>" >disabled</logic:equal>></td>
    <td align="left" >
     <A href="javascript:toOpenSpread('<bean:write name="item" property="nodeCode"/>','<bean:write name="item" property="boId"/>','<bean:write name="item" property="id"/>')">
     <bean:write name="item" property="worklistItemTitle"/></A>&nbsp;
    </td> 
    <td align="center" ><bean:write name="item" property="genDate" format="yyyy-MM-dd HH:mm"/></td> 
    <td align="center" id="time_<bean:write name="item" property="id"/>"><bean:write name="item" property="compDate" format="yyyy-MM-dd HH:mm"/></td>
    <td align="center" id="status_<bean:write name="item" property="id"/>">
    	<logic:equal name="item" property="status" value="<%=String.valueOf(WorklistItem.STATUS_UNREAD)%>" >未阅</logic:equal>
    	<logic:equal name="item" property="status" value="<%=String.valueOf(WorklistItem.STATUS_HASREAD)%>" >已阅</logic:equal></td>
  </tr>
  </logic:iterate>
</table>
<page:root inputclass="editline" formId="form1" />
</form>
</body>
</html>