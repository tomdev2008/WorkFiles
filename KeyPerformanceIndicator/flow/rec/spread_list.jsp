<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*"%>
<%@ page import="com.shengdai.kpi.flow.valueobject.WorklistItem" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<%
	String status = (String)request.getAttribute("status");
	if(status==null) status = "-1";
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>绩效传阅</title>
<script type="text/javascript" >

function toOpenSpread(wid,status){
	var getview = "${ROOT}/changeSpreadStatus.do?wid="+wid+"&status="+status;
	var url = LoadAjaxContentSyn(getview,openSpread);
	if(status=='<%=WorklistItem.STATUS_UNREAD%>'){
		window.location.reload();		
	}
}

function openWin(boId,handlerId,nodeCode,batchId){
	var url="${ROOT}/openSpread.do?boId="+boId+"&nodeCode="+nodeCode+"&batchId="+batchId;
	if(!StringUtils.isEmpty(handlerId)) {
		url+="&handlerId="+handlerId;
	}
	var fwidth=screen.width; //屏幕的宽
   	var fheight=screen.height; //屏幕的高
	new_window = window.open(url,'_blank','left=0,top=0,width='+fwidth+', height='+fheight+', resizable=1,scrollbars=1');
}
function openSpread(){
	var temp = Trim(this.request.responseText);
	var arr = temp.split(";");
	openWin(arr[0],arr[1],arr[2],arr[3]);
}
function changeStatus(){
	var url = "${ROOT}/listSpread.do?status="+form1.status.value;
	window.location = url;
}
window.onload=function (){
	var options = form1.status.options;
	var status = <%=status%>;
	for(var i=0;i<options.length;i++){
		if(options[i].value==status){
			options[i].selected = true;
		}
	}
	setPHeight();
}

function selectAll(){
	var ids=document.getElementsByName("DOCID");
	var flag=document.getElementById("allDoc").checked;
	for (var i=0;i<ids.length;i++){
			ids[i].checked=flag;
	}
}
function changeRead(){

	var wids=document.getElementById("wids");
	wids.value="";
	var j=0;
	var ids=document.getElementsByName("DOCID");
	for (var i=0;i<ids.length;i++){
			if(ids[i].checked  && ids[i].status1=="11"){
				if(wids.value!=""){
					wids.value+=";"+ids[i].value;
				}else{
					wids.value=ids[i].value;
				}
				j++;
			}
	}
	if(j>0){
		form1.action="${ROOT}/changeSpread.do";
		form1.submit();
	}else{
		alert("请选择相应的文后再点[批量转已阅]按钮！");
	}
	
}
</script>
</head>
<body onmousewheel="setScrollzheight();">
<form name="form1" method="post">
<input type="hidden" name="wids"/>
  <table border="0" cellspacing="0" cellpadding="0" class="list-top">
    <tr>
      <td><h2>绩效传阅</h2></td>
    </tr>
    <tr>
      <td id="tdBtn" class="list-caozuo">&nbsp;<a href="javascript:changeRead();" >批量转已阅</a>
      </td>
    </tr>
  </table>
  <table class="listquery" cellpadding="0" cellspacing="1">
	<tr>
	  <td width="12%" class="t">传阅状态</td>
	  <td>
		<select name="status" onchange="changeStatus()">
		  <option value="-1">所有</option>
		  <option value="<%=WorklistItem.STATUS_UNREAD %>">待阅</option>
		  <option value="<%=WorklistItem.STATUS_HASREAD %>">已阅</option>
		</select>       
	  </td>
	</tr>
  </table>	
  <table class="list-box" cellspacing="0" cellpadding="0" border="0" id="ctl03_GridViewUserList">
	<tr>
	  <td class="list-title">
	  	<input type="checkbox" name="allDoc" onclick="selectAll();"/>
	  </td>
	  <td class="list-title" width="15%">业务类型
	  
	  </td>
      <td class="list-title" width="60%">任务描述</td>
      <td class="list-title" width="15%">到达时间</td>
      <td class="list-title" width="*">状态</td>
	</tr>
	<logic:iterate id="worklistItem" name="list" indexId="index">
	<tr class="list-color${index%2==0?'1':'2' }">
		<td class="list-text1" align="left">
			<input type="checkbox" name="DOCID" value="${worklistItem.id}" status1="${worklistItem.status}"/>
		</td>
	  <td class="list-text1" align="left"><bean:write name="worklistItem" property="busiTypeZH" /></td>
	  <td class="list-text1"><a href="javascript:toOpenSpread('<bean:write name="worklistItem" property="id" />','<bean:write name="worklistItem" property="status" />');"><bean:write name="worklistItem" property="worklistItemTitle" /></a></td>
	  <td class="list-text1"><bean:write name="worklistItem" property="genDate" format="yyyy-MM-dd HH:mm"/></td>
	  <td class="list-text1">
	  	<c:if test="${worklistItem.status==11 }">待阅</c:if>
	  	<c:if test="${worklistItem.status==12 }">已阅</c:if>&nbsp;
	  </td>
	</tr>
	</logic:iterate>
  </table>
  <kpi:page-bar formId="form1" />
</form>

</body>
</html>
