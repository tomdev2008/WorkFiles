<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<%@ page import="com.shengdai.kpi.system.Globals" %>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwRoute"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwFlow"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwNode"/>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<html> 
<head>
<%
	request.setAttribute("flowNodeExtList2",request.getAttribute("flowNodeExtList"));
	String flowCode = request.getParameter("flowCode");
	String tab = request.getParameter("tab");
	if(tab==null||tab.equals("")){
		tab = "0";
	}
	int size = ((List)request.getAttribute("nodeMineList")).size();
%>
</head>
<script>
<%if("1".equals(request.getParameter("save"))){%>
	parent.parent.topFrame.enableButtons();//将命令按钮重新激活
<%}%>

//新增，编辑业务参数弹出窗口
function add_para(id){
	var returnValue = window.showModalDialog('${ROOT}/flow/flow_busi_param_add.jsp?id='+id,'','dialogHeight:450px;dialogWidth:470px;status=off')
    if(returnValue=="success"){
    	location.href = "${ROOT}/flowEditPage.do?flowCode=<%=request.getParameter("flowCode")%>&tab=2"+urlPara;   
    }
}

function editNodeExt(id){
	var returnValue = window.showModalDialog('${ROOT}/busiParamEditPage.do?busiParamId='+id,'','dialogHeight:380px;dialogWidth:470px;status=off')
    if(returnValue=="success"){
   		location.href = "${ROOT}/flowEditPage.do?flowCode=<%=request.getParameter("flowCode")%>&tab=2"+urlPara; 
    } 
}

function deleteNodeExt(id){
	if (confirm("您确认要删除记录？")) { 
		document.form1.action = "${ROOT}/deleteBusiParam.do?id="+id+"&tab=2&flowCode=<%=request.getParameter("flowCode")%>";
		document.form1.submit();
	}else{
		return;
	}
}

function flowSave(){
	var url = "${ROOT}/editFlow.do?remindIds="+ary+urlPara;
	form1.action = url;
	form1.submit();
}

function checkJs(){
	/*if(checkSelectByName("isFree",1,"是否自由流")&&checkSelectByName("waitMethod",1,"待办方式")){
	return true;
	}*/
	return true;
}

var rowsnum=<%=size%>;<%--记录行数--%>
var rindex="";
var rindex1="";
var tempRowNum = <%=size%>;
var ary = new Array();
<%
	if(size==0){
		out.println("ary[0] = 0;");
	}
	for(int i=0;i<size;i++){
		out.println("ary["+i+"] = "+i+";");
	}
%>
function addRow(){
	rowsnum++;
 	var arow = tbl.insertRow(Number(tempRowNum));
   	var td = arow.insertCell(0);
  	td.innerHTML="<a href='#'><img id='remine' src='${ROOT}/web/flow/img/remine.gif' border='0' value='1'></a>";
  	var td = arow.insertCell(1);
  		td.innerHTML="系统将在时限前<input type='text' name=\"fromHoure"+rowsnum+"\" class=editline size=2 value='' >"+
  		"小时至<INPUT  type='text' name='toHoure"+rowsnum+"' class=editline size=2 value= >小时以"+
  		"<select name='way"+rowsnum+"'><option value='-1'>全部</option><option value='0'>小灵通短信</option><option value='1'>邮件</option></select>"+
  		"方式提醒<select name='reminder"+rowsnum+"'><option value='1'>处理人</option></select>，"+
  		"每<INPUT type='text' name='frequency"+rowsnum+"' class=editline size=2 value= >"+
  		"<select name='frequencyUnit"+rowsnum+"'><option value='0'>分钟</option><option value='1'>小时</option><option value='2'>天</option></select>"+
  		"提醒一次,提醒内容为<INPUT type='text' name='remindContent"+rowsnum+"' class=editline size=40 value= >。";
  	var td = arow.insertCell(2);
  	td.innerHTML="<img src='${ROOT}/web/flow/img/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this)'> ";
  	tempRowNum++;
  	var obj = document.all.rowsnum;
  	obj.value = rowsnum;
  	ary[parseInt(ary.length)]=rowsnum;
}

function deleteCurrentRow(obj,id){
	if(id!=""&&id!=undefined){
		if(confirm("您确认要删除记录？")){
			var nodeMinedeleteurl = "${ROOT}/deleteNodeMine.do?id="+id+"&nodeCode=<%=request.getParameter("nodeCode")%>&tab=1&noCache="+Math.random();
			LoadAjaxContent(nodeMinedeleteurl,deleteNodeMinecallBackMethod);
		}else{
			return;
		}
	}
	var rindex=obj.parentElement.parentElement.rowIndex;
	tbl.deleteRow(rindex);<%--删除当前行--%>
	tempRowNum--;
	remove(ary,rindex)
	//alert(ary);
}

function deleteNodeMinecallBackMethod(){
	eval(this.request.responseText);
}

function remove(array,index){
	if(isNaN(index)||index>array.length){return false;}
    for(var i=0,n=0;i<array.length;i++){
    	if(array[i]!=array[index]){
            array[n++]=array[i]
        }
    }
   	if(array.length!=0){
    	array.length-=1
    }
}

//存放路由信息
function routeInfo(id, relate){
    this.id=id;
    this.relate=relate;
}
var routes = new Array();
<logic:iterate id="route" name="flwFlow" property="nodeSet" indexId="index">
routes[<bean:write name="index" />] = new routeInfo("<bean:write name="route" property="nodeCode" />","<bean:write name="route" property="timelimitRelate" />");
</logic:iterate>

//根据id查找路由信息
function findRouteInfo(id){
	for(var j=0; j<routes.length; j++){
		var route = routes[j];
		if(route.id==id){
			return route;
		}
	}
}

//当选择不同频度的时候页面上变化
function ev_changeFrequency(){
	var frequency = document.all("frequency").value;
	var yearSpan = document.getElementById("yearSpan");
	var quarterSpan = document.getElementById("quarterSpan");
	var monthSpan = document.getElementById("monthSpan");
	if(frequency==4){
		yearSpan.style.display = '';
		quarterSpan.style.display = 'none';
		monthSpan.style.display = 'none';
	}else if(frequency==2){
		yearSpan.style.display = 'none';
		quarterSpan.style.display = '';
		monthSpan.style.display = 'none';
	}else{
		yearSpan.style.display = 'none';
		quarterSpan.style.display = 'none';
		monthSpan.style.display = '';
	}
}
function isTimeNum(tCon,type){
    if(!isFFInt(tCon))
    	return ;
    var num = parseInt(tCon.value);
	if(type==1){//判断每月的天数在1-31
		if(num<1||num>31){
			alert("请输入1-31");
			tCon.focus();
			return false;
		}
	}else if(type==2){//判断小时数在0-23
		if(num<0||num>23){
			alert("请输入0-23");
			tCon.focus();
			return false;
		}
	}else if(type==3){//判断分钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
			tCon.focus();
			return false;
		}
	}else if(type==4){//判断秒钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
			tCon.focus();
			return false;
		}
	}else if(type==5){
		if(num<1||num>3){
			alert("请输入1-3");
			tCon.focus();
			return false;
		}
	}else if(type==6){
		if(num<1||num>12){
			alert("请输入1-12");
			tCon.focus();
			return false;
		}
	}
	return true;
}


function isTimeNum1(tCon,type){
    if(!isFFInt(tCon))
    	return ;
    var num = parseInt(tCon.value);
	if(type==1){//判断每月的天数在1-31
		if(num<0||num>31){
			alert("请输入1-31");
			tCon.focus();
			return false;
		}
	}else if(type==2){//判断小时数在0-23
		if(num<0||num>23){
			alert("请输入0-23");
			tCon.focus();
			return false;
		}
	}else if(type==3){//判断分钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
			tCon.focus();
			return false;
		}
	}else if(type==4){//判断秒钟在0-59
		if(num<0||num>59){
			alert("请输入0-59");
			tCon.focus();
			return false;
		}
	}
	return true;
}
function setCheckValue(id){
	if(document.getElementById(id).checked){
		document.getElementById(id).value=1;
	}else{
		document.getElementById(id).value=0;
	}
}

function FF_ShowJobs(){
	openWin("${ROOT}/listJobFlowByMonitor.do?monitorId=${monitor.id}",{showCenter:true,width:850,height:500});
}
</script>
<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">

	  <form id="form1" name="form1" method="post" action="">     
	  <input type="hidden" name="flgFree" value="${flwFlow.flgFree }"/>
	  <table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
	    <tr>
    	  <td>
    	    <br/>
	        <DIV class=tab-pane id=tabPane1>
              <SCRIPT type=text/javascript>
		        tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
		        tp1.selectedIndex =<%=tab%>;
			  </SCRIPT>
		      <DIV class=tab-page id=tabPage1>
    			<H2 class=tab>基本配置</H2>
			    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
				<!-- 这里嵌套流程基本配置 -->
				<input name="flowCode" type="hidden" value="<bean:write name="flwFlow" property="flowCode"/>""/>
		    	<table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
			  	  <TBODY>
			        <TR>
			          <TD align=right width="28%" height=35><font color="red">*</font>流程名称：</TD>
			          <TD width="72%" height=25><INPUT class=editline size=60 value="<bean:write name="flwFlow" property="flowName"/>" name="flowName"  check="notBlank" showName="流程名称" required="true" maxlength="50" > </TD>
			        </TR>
			  	    <TR>
			          <TD align=right width="28%" height=35>流程说明：</TD>
        			  <TD width="72%" height=25><INPUT class=editline size=60 value="<bean:write name="flwFlow" property="memo"/>" name="memo" maxlength="500"> </TD>
        			</TR>
	  				<TR>
        			  <TD align=right width="28%" height=35><font color="red">*</font>流程类别：</TD>
        			  <TD width="72%" height=25>
        				<INPUT type="hidden" name="busiType" value="<bean:write name="flwFlow" property="commBusi.id"/>">
        				<bean:write name="flwFlow" property="commBusi.busiName"/>
        			  </TD>
        			</TR>
 					<!-- <TR>
        			  <TD align=right width="28%" height=35><font color="red">*</font>流程绑定发起周期：</TD>
        			  <TD width="72%" height=25>
        				<kpi:dictionary-select  name='assessmentType' type='ASS_CYCLE_TYPE' style="width:30px;" selected="${flwFlow.cycleType}" htmlType="radio"/>
        			  </TD>
        			</TR> -->
        			<c:if test="${fn:length(parentFlows)>0}">
        			 <TR>
        			  <TD align=right width="28%" height=35>所属父流程：</TD>
        			  <TD width="72%" height=25>
        			    	<select name="parentFlowId" id="parentFlowId">
        			    		<option value="">--请选择--</option>
        			    		<c:forEach var="o" items="${parentFlows}">
        			    			<option value="${o.flowCode}" ${o.flowCode==flwFlow.parentFlow.flowCode?'selected':''}>${o.flowName}</option>
        			    		</c:forEach>
        			    	</select>
					  </TD>
					</TR>      
					</c:if>			
        			<!-- <TR>
        			  <TD align=right width="28%" height=35>已绑定模板：</TD><bean:size id="length" name="flwFlow" property="templetSet" scope="request"/>
        			  <TD width="72%" height=25>
        			    <textarea class="area" readonly rows="4" cols="50" name="bindtemp"><logic:iterate id="templet" name="flwFlow" property="templetSet" indexId="index"><bean:write name="templet" property="typeName"/><%Integer leng = (Integer)length;Integer intd = (Integer) index;if((leng.intValue()-1)!=intd.intValue()) out.print(",");%></logic:iterate></textarea>
						<INPUT type="hidden" name="dbTemp" value="${flwTempletStrForTempletId}"/>"/>
					    <INPUT type="hidden" name="tempType" value="${flwTempletStrForTempletId}"/>
						<INPUT type="button" name="selectTemp" value="选择模板" onclick="javascript:selectTemp111()" class="button" style="display: none">
					  </TD>
					</TR> -->
	  				<tr>
	  				  <td colspan="2" align="left">
	  				    <font color="#0099FF">说明：红星（</font><font color="red">*</font><font color="#0099FF">）不能为空</font>
	  				  	<br/>
						<c:if test="${flwFlow.commBusi.id=='YGKH' }">
							<font color="#0099FF">
								流程名称格式:
								<br/>
								二级架构+三级架构+部门（可空）+员工+考核频次（月度/季度/年度）+绩效考核流程
								<br/>
								如:广州番禺综合部员工月度绩效考核流程
							</font>
						</c:if>
						<c:if test="${flwFlow.commBusi.id=='BMKH' }">
							<font color="#0099FF">
								流程名称格式:
								<br/>
								二级架构+三级架构+部门（可空）+组织+考核频次（月度/季度/年度）+绩效考核流程
								<br/>
								如:广州番禺XX部门组织年度绩效考核流程
							</font>
						</c:if>
	  				  </td>
	  				</tr>
				  </table>
				</DIV>						
				<DIV class=tab-page id=tabPage6>
			      <H2 class=tab>流程时间频度</H2>
		     	  <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage6" ) );</SCRIPT>
		     	  
	  			  <table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
	     			<TR>
	        		  <TD align=right width="28%" height=35><font color="red">*</font>频度：</TD>
	        		  <TD width="72%" height=25>
	        			<input type="hidden" name="mid" value="<bean:write name="monitor" property="id"/>">
	        			<html:select name="monitor" property="frequency" onchange="ev_changeFrequency();">
					      <html:option value="1">月度</html:option>
					      <html:option value="2">季度</html:option>
					      <html:option value="4">年度</html:option>
					    </html:select>
	        		  </TD>
	        		</TR>
				    <TR>
			          <TD align=right width="28%" height=35>自动发起：</TD>
			          <TD width="72%" height=25>
				        <html:radio name="monitor" property="flgAuto" value="1">是</html:radio>&nbsp;
			       		<html:radio name="monitor" property="flgAuto" value="0">否</html:radio>
			          </TD>	        
			        </TR>
					<TR>
				      <TD align=right width="28%" height=35>自动发起时间：</TD>
				      <TD width="72%" height=25>
				      <html:select name="monitor" property="autoYear" >
						   	<html:option value="0">本</html:option>
						   	<html:option value="1">下</html:option>
					  </html:select>
				        <span id="yearSpan" style="display:'${monitor.frequency==4?'':'none'}'">
				          年度第<input type='text' class='editline' name='autoMonth' size='2' maxlength='2' value='${monitor.autoMonth}' onblur="isTimeNum(this,6)"/>
				        </span>
				          <span id="quarterSpan" style="display:'${monitor.frequency==2?'':'none'}'">
				           季度第<input type='text' class='editline' name='autoMonth' size='2' maxlength='2' value='${monitor.autoMonth}' onblur="isTimeNum(this,5)"/>
				        </span>
				        <span id="monthSpan" style="display:'${monitor.frequency==1?'':'none'}'">月度</span>
				        <input type="text" class="editline" name="autoDate" size="2" maxlength="2" value="${monitor.autoDate}" onblur="isTimeNum(this,1)"/>日&nbsp;
						<input type="text" class="editline" name="autoHour" size="2" maxlength="2" value="${monitor.autoHour}" onblur="isTimeNum(this,2)"/>时&nbsp;
						<input type="text" class="editline" name="autoMinitue" size="2" maxlength="2" value="${monitor.autoMinitue}" onblur="isTimeNum(this,3)"/>分&nbsp;
				      </TD>
				    </TR>
				    <TR>
			          <TD align=right width="28%" height=35>自动发起日志：</TD>
			          <TD width="72%" height=25><a href="#" onclick="FF_ShowJobs();return false;">查看</a></TD>	        
			        </TR>
			        <TR>
			      	  <TD colspan="2">
	      				<font color="red">
							  	发起时间说明 :<br>
							  	本:考核批次与当前考核系统时间在同一周期。 <br>
								下:考核批次为当前考核系统时间的下一个周期。 <br>
								范例： <br>
								当前时间是2008年1月20日 <br>
								2008年1月的考核流程需要在2008年2月3日发起，则应在设定"下月3日0时0分"。 <br>
								2008年1月的考核流程需要在2008年1月28日发起，则应设定"本月28日0时0分"。 
						</font>
	      				</TD>  	
	      			  </TR>
				</table>	  	
			</DIV>
							
				  <DIV class=tab-page id=tabPage5>
				    <H2 class=tab>业务参数管理</H2>
				    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage5" ) );</SCRIPT>
				    <!-- 这里嵌套业务参数配置 -->
				    <table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				      <tr><td width="100%">
				  		<jsp:include flush="true" page="flow_ext_config.jsp" >
				  			<jsp:param name="mainId" value="<%=flowCode%>" />	  	
				  		</jsp:include>
				  	  </td></tr>
				    </table>
				  </DIV>
				<!-- 
				<DIV class=tab-page id=tabPage7 style="display:none">
				    <H2 class=tab>超时处理</H2>
				    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage7" ) );</SCRIPT>
				    <!-- 这里嵌套业务参数配置 -->
				  <!--    <table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				     
				        
				    <tr style="display:none">
				    	<td colspan=2>
				    	<br/>
				     		<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center" bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="90%">
				     			<TR>
						          <TD align="left" colspan="2" height=30><b>流程待办自动提交</b>&nbsp;[流程中所有环节的待办到指定时间后将 自动提交]<br></TD>        
						        </TR>
							    <TR>
						          <TD align="center" width="28%" height=22>是否自动提交：<br></TD>
						          <TD height=25>
							        <html:radio name="flwFlow" property="flg_AutoSubmitTodo" value="1">是</html:radio>&nbsp;
						       		<html:radio name="flwFlow" property="flg_AutoSubmitTodo" value="0">否</html:radio>
						         <br></TD>	        
						        </TR>
								<TR>
							      <TD align="center" width="28%" height=25>自动提交时间：<br></TD>
							      <TD height=25>
							      
							        <div id="autoYear" style="float:left">
							          <html:select name="flwFlow" property="submitTodoMonth" >
							            <html:option value="-1" >到达后</html:option>
									   	<html:option value="0" >本月</html:option>
									   	<html:option value="1" >下月</html:option>
									  </html:select>
							        </div>
							        
							        <input type="text" class="editline" name="submitTodoDate" size="2" maxlength="2" value="<bean:write name="flwFlow" property="submitTodoDate"/>" onblur="isTimeNum1(this,1)"/>日&nbsp;
									<input type="text" class="editline" name="submitTodoHour" size="2" maxlength="2" value="<bean:write name="flwFlow" property="submitTodoHour"/>" onblur="isTimeNum1(this,2)"/>时&nbsp;
									<input type="text" class="editline" name="submitTodoMinute" size="2" maxlength="2" value="<bean:write name="flwFlow" property="submitTodoMinute"/>" onblur="isTimeNum1(this,3)"/>分&nbsp;
							      <br></TD>
							    </TR>
				    		</table><br/>
				    	<br></td>
				    </tr>
				    <tr>
				    	<td colspan=2>&nbsp;
				    	
				    	<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center" bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="90%">
				    		<TR>
						          <TD align="left" colspan="3" height=30><b>环节待办自动提交</b>&nbsp;[指定环节的待办到指定时间后 自动提交]</TD>        
						    </TR>
						    
					  	  <tr>
							<td class=title-header align="center" width="28%" height="22">环节</td>  
							<td class=title-header align="center" >时限</td>
							<td class=title-header align="center" width="20%">是否自动提交</td>
					  	  </tr>
					  	  <%----
					  	  FlwFlow flwFlow = (FlwFlow)request.getAttribute("flwFlow");
					  	  String previousNodeCode = "";
					  	  for(Iterator iterNodes=flwFlow.getNodeSet().iterator(); iterNodes.hasNext(); ){
					  	  	FlwNode flwNode = (FlwNode)iterNodes.next();
					  	  	if(flwNode.getFlgRoot()==1) continue;
					  	  --%>
					  	  <tr>
					  	  	<td align="center" height="22" >
					  	  		<%--=flwNode.getNodeName()%></td>
							<td align="left" >
							
							  <select name="submitType_<%--=flwNode.getNodeCode()%>">
							      <option value="-1" <%=flwNode.getSubmitType()==-1?"selected":"" %> >到达后</option>
								  <option value=0 <%=flwNode.getSubmitType()==0?"selected":"" %> >本月</option>
								  <option value=1 <%=flwNode.getSubmitType()==1?"selected":"" %> >下月</option>
							  </select>
							    
							  <input type=text class=editline size=2 name="submitDate_<%=flwNode.getNodeCode()%>"
									value="<%=flwNode.getSubmitDate()%>" onblur="isTimeNum1(this,1)"/>日的
							  <input type=text class=editline size=2 name="submitHour_<%=flwNode.getNodeCode()%>" 
									maxlength="2" value="<%=flwNode.getSubmitHour()%>" onblur="isTimeNum1(this,2)"/>时
							  <input type=text class=editline size=2 name="submitMinute_<%=flwNode.getNodeCode()%>" 
									maxlength="2"  value="<%=flwNode.getSubmitMinute()%>" onblur="isTimeNum1(this,3)" />分
							</td>
							<td align="center" >
								<input type=checkbox name="flwNodeApply_<%=flwNode.getNodeCode()%>" value=<%=flwNode.getTimelimitFlgApply()%>  <%=flwNode.getTimelimitFlgApply()==1?"checked":"" %> 
								onclick="setCheckValue('flwNodeApply_<%=flwNode.getNodeCode()%>');"
								/>
							</td>
					  	  </tr>
					  	  <%}--%>
		  	 			</table><br/> -->  
				    	</td>
				    	
				    </tr>
				    </table>
				  </DIV>
			</DIV><!-- 	整个TAB结束 -->
		      </td>
			</tr>
		  </table>
		</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>