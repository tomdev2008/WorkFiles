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
	<script><!--
	
function ev_showFlow(){
	var flow = document.getElementById("flows");
	var flowId = document.getElementById("flowId");
	var batchDetail = document.getElementById("batchDetail");
	if(flow.value==null)return;
	flowId.value = flow.value; 
	batchDetail.value = null;
	form1.action="${ROOT}/viewFlowByOrg.do";
 	form1.submit();
	
	
}

function autoResize(){
try{document.all["iframe2"].style.height=iframe2.document.body.scrollHeight}
catch(e){}
}

function setSelectUser(url){
	var iframe2=document.getElementById("iframe2");
	iframe2.src = url;
	try{document.all["iframe2"].style.height=iframe2.document.body.scrollHeight}
	catch(e){}
}

function activeFlow(){

	var docm= document.frames["iframe"].document; 
	if(docm.getElementById("monitorList").value!=""){
		window.frames["iframe2"].ev_ok("");
		

		//document.URL="${ROOT}/viewFlowByOrg.do?&nocache="+Math.random();
		//docm.execCommand('Refresh');

		var confirmContent = "发起年度计划成功";
	
		 	form1.action="${ROOT}/viewFlowByOrg.do";
		 	form1.submit();
	}
	else alert("请先选择要发起修改的批次（周期）！");
}

function ev_showFlowBatch(obj){
	var batchDetail = document.getElementById("batchDetail");
	batchDetail.value = obj.value;
	form1.action="${ROOT}/viewFlowByOrg.do";
 	form1.submit();
}

function ev_checkAll(control){
	var isChecked = control.checked;
	var c = document.getElementsByName("delegateOrg");
	if(c && c.length>0){
	  	for(i=0;i<c.length;i++){
	    	if(c[i].type=="checkbox"){
				if(isChecked) c[i].checked = true;
				else c[i].checked = false;
			}
	  	}
	} 
}

function ev_ok(){
  	var value = "";
  	var c = document.getElementsByName("delegateOrg");
  	if(c && c.length>0){
	  	for(i=0;i<c.length;i++){
	    	if(c[i].checked){
		  		if(value=="") value = c[i].value;
		  		else value +=  ";"+c[i].value;
			}
	  	}
	} 
	var batchStatus = document.getElementById("batchStatus");
	//alert(batchStatus.value);
	
	if(value!=""){
		var delegates = document.getElementById("delegates");
	 	delegates.value = value;
		url= "${ROOT}/planRecBatchStart.do?batchDate=${batchDate}&nocache="+Math.random();
		//如果尚未归档，则单独发起
		if(batchStatus.value!=2){
			url="${ROOT}/startPlanFlowSingleByOrgVo.do?&nocache="+Math.random();
		}
		form1.action = url;
		showProcessor();
		form1.submit();
	}
	else if(${!flag}){
		alert("没有可发起修改的流程");
		return;
	}
	else if(${!batchFlag}){
		alert("没有可发起的批次");
		return;
	}
	else if(value==""&&${totalDelegateNumber}==${alreadyNumber}){
		alert("全部人员正在考核，请在考核批次结束后再发起修改!");
		return;
	}
	
	else alert("没有选择发起批次或对象！");
}
	--></script>
</head>
<body onmousewheel='setScrollzheight();' class="LN_body">
    <form name="form1" method="post" action="" target="_self" style="margin-top: 0px">
    	<input type="hidden" name="flowId" value="${flowId }" />
    	<input type="hidden" name="orgId" value="${org.id }"/>
    	<input type="hidden" name="busiId" value="${busiId }"/>
    	<input type="hidden" name="monitorId" value="${monitorId }"/>
    	<input type="hidden" name="batchId" value="${batchId }"/>
    	<input type="hidden" name="batchDetail" id="batchDetail" value="${batchDetail }"/>
    	<input type="hidden"" id="batchDate" name="batchDate" value="${batchDate}" />
    	<input type="hidden"" name="batchStatus" id="batchStatus" value="${batchStatus }"/>
    	<input type="hidden"" name="delegates" id="delegates" />
    	<!-- 这里用于引用下级组织的ID -->
    	<input type="hidden" name="orgNames" value=""/>
    	<input type="hidden" name="orgIds" value=""/>
	<div class="LN_formTitle">
		年度工作计划修改
	</div>
		<table class="list-box" cellspacing="0" height="35" border="0" width="100%" >
			<%--<tr align="left">
    			<td height="3" bgcolor="#4F81CE" width="100%"></td>
 			 </tr>
 			 --%><tr>
 			 <div class="LN_Append">
				<div class="LN_popupsRouteSubmit" style="width:192px;"><a href="#" onclick="ev_ok();return false" >发起年度工作计划修改</a></div>
  			</div>
  			</tr>
			<tr>
			<br/>
			<c:if test="${flag}">
				<td align="left">
				<div><b>&nbsp;&nbsp;&nbsp;年度工作计划流程 </b>  
					<select id="flows" onchange="ev_showFlow()">
						<c:forEach var="flows" items="${flowList}" varStatus="idx">
							<option value="${flows.monitor.id}" ${flowId==flows.id?'selected':'' }>${flows.flowName}</option>
						</c:forEach>
					</select>
					</div>
				</td>
				<td nowrap="nowrap" align="left">
					<div><b>&nbsp;&nbsp;&nbsp;考核周期（批次）:</b>
					<c:if test="${batchFlag}">
						<select id="batchList" name="batchList" onchange="ev_showFlowBatch(this)">
							<c:forEach items="${batchList}" var="o" varStatus="idx">
								<option value="${o.id}<%=Globals.INFOS_SPLITOR_SM%>${o.freqYear}<%=Globals.INFOS_SPLITOR_SM%>${o.status }" ${o.id==batchId?'selected':'' } label="${o.batchName}">${o.batchName}</option>
							</c:forEach>
						</select>
						</c:if>	
						<c:if test="${!batchFlag}"> 没有可以发起修改的批次！ </c:if>
					</div>								
				</td>
				</c:if>
				<c:if test="${!flag}"><td align="center"">
				<br />
					<div><b id="flows">&nbsp;&nbsp;&nbsp;没有可以发起的年度工作计划修改流程！ </b>  
					</div>
				</td></c:if>
				<td>
				
<%--		<iframe align="top" name="iframe" id="iframe" width="100%" frameborder="0" scrolling="no" height="35" src=""></iframe>--%>
				</td>
			</tr>
		</table>
			<table border="0" cellpadding="0" cellspacing="0" class="dialog-box" style="width:100%;">
        <tr>
          <td><br />
          <div align="left" >&nbsp;&nbsp;&nbsp;发起年度计划修改对象选择</div></td> 
        </tr>
        <tr>
          <td height="100%" valign="top" class="dialog-text-bg"><div align="left">
           <input type="checkbox" onclick="ev_checkAll(this);" checked/>
           	全选(共计应考核数量：${totalDelegateNumber}个) 
           </div>
           <div align="left">
	           	 正在考核的数量：${alreadyNumber}个) &nbsp;&nbsp;&nbsp;&nbsp; 提示：正在考核的对象不能选中！
	       </div>
           
	     
	        	<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
	           <tr>
						<td align="left" id="delegateTd">
						<c:forEach var="oo" items="${userList}" varStatus="indx">
						<c:if test="${oo.flgActive!=5}">
						<input type="checkbox"  name="delegateOrg" checked="checked"  value="${oo.id}"/>&nbsp;
							${indx.count}&nbsp; ${oo.name}&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${oo.flgActive==5}">
						<input type="checkbox"  name="delegateOrgs" readonly="readonly" disabled="disabled" value="${oo.id}"/>&nbsp;
							${indx.count}&nbsp; ${oo.name}&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${indx.count%10==0}"><br/></c:if>
						</c:forEach>
						</td>
					</tr>
				</table>
			   </td>
        </tr>


      </table>


		<%--<iframe align="top" name="iframe2" id="iframe2" width="100%" frameborder="0" scrolling="auto" onload="autoResize()" src=""></iframe>--%>

		</form>
	
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();
	//ev_showFlowBatch();
	}
//-->
</script>