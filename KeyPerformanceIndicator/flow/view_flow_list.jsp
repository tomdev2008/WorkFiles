<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.shengdai.kpi.system.OrgType" %>
<%@ page import="com.shengdai.kpi.common.webservice.EIAC.EAC.SSO.PSOConfig" %>
<%@ page import="com.shengdai.kpi.system.CommonLoginUser" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/flow/secure.inc" %>
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
	<script>
		
		function ev_new() {
			openWin("${ROOT}/flow/flow_view_frame.jsp?orgId=${org.id }&busiId=${busiId}",{showCenter:true,width:850,height:500});
		}
		function ev_edit(id) {
			openWin("${ROOT}/flow/flow_view_frame.jsp?flowCode="+id+urlPara,{showCenter:true,width:850,height:500});
		}
		function ev_del() {
			var number = 0;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked)
						number = number + 1;
				}							
			}
			if(number == 0){
				alert("请选择要删除的记录");
				return false;
			}
			if(confirm("确定删除所选的记录吗？")){
				document.form1.action="${ROOT}/deleteFlow.do?"+urlPara;
				document.form1.submit();
			}	
		}
		function ev_monitor_start(id){
			var url = "${ROOT}/watchMonitorStart.do?id="+id+urlPara;
			window.open(url, "_blank", "width=850,height=500,left=210,top=50,resizable=1,status=no,scrollbars=1");
		}
		function ev_monitor(id){
			var url = "${ROOT}/watchMonitor.do?id="+id+urlPara;
			window.open(url, "_blank", "width=850,height=500,left=110,top=80,resizable=1,status=no,scrollbars=1");
		}
		//复制,粘贴
		function copyData(){
			var id = getAllChecked('selectedrow');
			if(id==""){
				alert('请选择要复制的项！！');
				return ;
			}
			var url = "${ROOT}/copyData.do?flowIds="+id+"&nocache="+Math.random()+urlPara;
			LoadAjaxContent(url,copyCallBackMethod);
		}
		function copyCallBackMethod(){
			alert(this.request.responseText+'复制成功!');
		}
		function copyCallBackMethodByPaste(){
			var val = Trim(this.request.responseText);
			if(val == ""){
				alert('粘贴成功!');
				//window.location.href = window.location.href;
				window.location.reload();
			}
			else{
				alert(val);
			}
				
		}
		function pasteData(){
			var orgId = document.forms[0].orgId.value;
			var url = "${ROOT}/loadCopyData.do?nocache="+Math.random()+urlPara;
			LoadAjaxContent(url,pasteBackMethod);
		}
		function pasteBackMethod(){
			eval(this.request.responseText);
		}
function judge()
{
	var selectedRow = document.getElementsByName("selectedrow");
	var count=0;
	var val="";
	var len=selectedRow.length;
	for (i=0;i<len;i++)
	{			
		if(selectedRow[i].checked)
		{
			if(count==0)
			{
				count = count +1;
				val+=selectedRow[i].value;
			}
			else
			{
				 count = count +1;
				 val+=","+selectedRow[i].value;
			}			 	
		}
	}	
	if(count<=0){
		alert("您还没有选择记录!");
		return "";
	}
	return val;
}
//引用至下级
function pasteToJunior()
{
	var val = judge();
	if(val==""){return ;}
	//alert(val)	;
	getAddressList('<%=OrgType.ORG.orgInt()%>','n','1','orgNames','orgIds');
	var orgIds=document.getElementById("orgIds");
	var orgNames=document.getElementById("orgNames");
	if(orgIds.value==""){
		alert("请选择要引用的组织!");
		return ;
	}
  	if (confirm(orgNames.value+"\n您确认要把所选流程引用至上述组织中去?")) 
  	{ 
  		
		form1.action="${ROOT}/pasteToJunior.do?fids="+val+urlPara;
		form1.method="post";
		form1.submit();
 	}
 	else
 	{
    	return;
    }
}
function ev_designer(){
	var url="<%=PSOConfig.GetDesignerIndexUrl()%>";
	<%
	String userId=CommonLoginUser.getCurrentUserDefaultId();
	%>
	url+="?userId=<%=userId%>";
	window.open(url,"","menubar=no,location=no,scrollbars=yes,resizable=yes");
	//openWin(url,{showCenter:true,width:850,height:500});
}
	</script>
</head>
<body onmousewheel='setScrollzheight();' class="LN_body">
    <form name="form1" method="post" style="margin-top: 0px">
    	<input type="hidden" name="orgId" value="${org.id }"/>
    	<input type="hidden" name="busiId" value="${busiId }"/>
    	<!-- 这里用于引用下级组织的ID -->
    	<input type="hidden" name="orgNames" value=""/>
    	<input type="hidden" name="orgIds" value=""/>
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2><c:if test="${busiId=='YGKH'}">员工</c:if><c:if test="${busiId=='BMKH' }">组织</c:if>流程管理</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<kpi:secure name="新增" onClick="ev_new()" code="${typeCode }101" resourceId="${orgId }" type="link" label="|"/> 
						<!--<kpi:secure name="流程设计器" onClick="ev_designer()" code="${typeCode }106" resourceId="${orgId }" type="link" label="|"/>-->
						<kpi:secure name="删除" onClick="ev_del()" code="${typeCode }102" resourceId="${orgId }" type="link" label="|" />
						<kpi:secure name="复制" onClick="copyData()" code="${typeCode }103" resourceId="${orgId }" type="link" label="|" />
						<kpi:secure name="粘贴" onClick="pasteData()" code="${typeCode }104" resourceId="${orgId }" type="link" label="|" />
						<!--<kpi:secure name="引用至下级" onClick="pasteToJunior()" code="${typeCode }105" resourceId="${orgId }" type="link" />-->
					</td>
				</tr>
  			</tbody>
  		</table>    				
        <div align="left">
        	[<font color="#CC3300">${org.fullPathName }</font>]下的流程列表。
        </div>    
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="50%">名称</td>
				<td class="list-title" width="20%">类别</td>
				<td class="list-title" width="*" colspan="2">操作</td>
			</tr>
		<c:forEach var="flow" items="${flowList}" varStatus="idx">
			<tr class="list-color${idx.index%2==0?'1':'2'}">
				<td class="list-text1"><input type="checkbox" value="${flow.id}" name="selectedrow" class="checkboxInput"/></td>
				<td class="list-text1">
					<kpi:secure name="${flow.flowName}" onClick="ev_edit('${flow.flowCode}');return false;" code="${typeCode }200" resourceId="${orgId }" type="viewLink" title="查看流程定义" />
				</td>
				<td class="list-text1">${flow.commBusi.busiName}</td>
				<c:if test="${flow.commBusi.flgBatch==1}">
					<td class="list-text1" align="right">
					<kpi:secure name="发起" onClick="ev_monitor_start('${flow.monitor.id }');return false;" code="${typeCode }500" resourceId="${orgId }" type="viewLink" title="发起某一批次流程" />
				&nbsp;</td>
				</c:if>
    		    <td class="list-text1" align="left">&nbsp;
    		    	<kpi:secure name="监控" onClick="ev_monitor('${flow.monitor.id }');return false;" code="${typeCode }600" resourceId="${orgId }" type="viewLink" title="查看已发起的流程" />
    		    </td>
			</tr>
		</c:forEach>			
		</table>
		<kpi:page-bar formId="form1" />
	</form>
	
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>