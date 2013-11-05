<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,com.shengdai.kpi.flow.valueobject.*" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<%@ include file="/flow/secure.inc" %>
<html>
	<head>
		<title>个人考核</title>
		<%request.setAttribute("flowNodeExtList2", request
					.getAttribute("flowNodeExtList"));
			String tab = request.getParameter("tab");
			if (tab == null || tab.equals("")) {
				tab = "0";
			}
			int size = 0;

			%>
	</head>
	<script language="javascript">

//上传附件
function upload(){
	window.open('attachment.htm','','height=300,width=420,top=200, left=200,toolbar =no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')
}

function checkJs(){
/*if(checkSelectByName("flgHead",1,"是否流程发起环节")) { 
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
  td.innerHTML="系统将在时限前<input type='text' name=\"fromHoure"+rowsnum+"\" class=editline size=2 value='' >小时至<INPUT  type='text' name='toHoure"+rowsnum+"' class=editline size=2 value= >小时以<select name='way"+rowsnum+"'><option value='0'>小灵通短信</option><option value='1'>邮件</option><option value='2'>系统短消息</option></select>方式提醒<select name='reminder"+rowsnum+"'><option value='0'>催办人</option><option value='1'>处理人</option></select>，每<INPUT type='text' name='frequency"+rowsnum+"' class=editline size=2 value= >分钟提醒一次,提醒内容为<INPUT type='text' name='remindContent"+rowsnum+"' class=editline size=40 value= >。";
  var td = arow.insertCell(2);
  td.innerHTML="<img src='${ROOT}/web/flow/img/delete_1.gif' border='0' onClick='javascript:deleteCurrentRow(this)'> ";
  tempRowNum++;
  var obj = document.all.rowsnum;
  obj.value = rowsnum;
  ary[parseInt(ary.length)]=rowsnum;
  
}

function deleteCurrentRow(obj)
{
	var rindex=obj.parentElement.parentElement.rowIndex;
	tbl.deleteRow(rindex);<%--删除当前行--%>
	tempRowNum--;
	remove(ary,rindex)
	//alert(ary);
}

function remove(array,index)
{
    if(isNaN(index)||index>array.length){return false;}
    for(var i=0,n=0;i<array.length;i++)
    {
        if(array[i]!=array[index])
        {
            array[n++]=array[i]
        }
    }
   if(array.length!=0){
    array.length-=1
    }
}
/**增加环节*/
function addFlowNode(flowCode){
	var url = "";
	if(${addNodeAuto}==0){
		url = "${ROOT}/addNode.do?flowCode="+flowCode+"&remindIds="+ary+urlPara;
	}else if(confirm("您需要自动添加上一环节的路由吗？")){
		url = "${ROOT}/addNode.do?flowCode="+flowCode+"&remindIds="+ary+"&autoRoute=autoRoute"+urlPara;
	}else{
		url = "${ROOT}/addNode.do?flowCode="+flowCode+"&remindIds="+ary+urlPara;
	}
	form1.action = url;
	form1.submit();
}
/**
function changetState(){
	var value = document.all.handleWay.value;
	if(value==12){
		document.all.methodAlert.innerText="对每个指标设置处理人,在责任书/考核表设置考核关系;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==11){
		document.all.methodAlert.innerText="对所有指标设置评分人,在责任书/考核表设置考核关系;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==13){
		document.all.methodAlert.innerText="";//满意度处理方式;
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==1){
		document.all.methodAlert.innerText="针对设置人按顺序进行处理,第一个人处理后,第二个人才能收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==2){
		document.all.methodAlert.innerText="针对设置处理人,一个人处理后其他人不做处理;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==3){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==7){
		document.all.methodAlert.innerHTML="必须等批次中的所有流程都走到此环节才能提交到下一环节,<br/>一个人处理后其他人不做处理;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==15){
		document.all.methodAlert.innerHTML="问卷中设置处理人(会签方式提交);";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==""){
		document.all.methodAlert.innerText="请选择处理方式;";
		document.all.nodeHandlerTr.style.display = "none";
	}else if(value==16){				//add by dkm 08-03-26
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==17){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==18){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}else if(value==19){
		document.all.methodAlert.innerText="针对设置处理人,必须每个人处理后才能提交到下一环节,同时收到待办;";
		document.all.nodeHandlerTr.style.display = "";
	}
	
    document.all.viewName.value = "";
    document.all.viewId.value = "";
    //document.all.spreadUrl.value = "";
    //document.all.doneUrl.value = "";  
}**/
var ways = new Array();
function way(id, tip, flgNeedHandler){
	this.id = id;
	this.tip = tip;
	this.flgNeedHandler = flgNeedHandler;	
}
<logic:iterate id="way" name="handleTypewayList" indexId="index" >
	var way<%=index%> = new way();
	way<%=index%>.id='<bean:write name="way" property="id" />';
	way<%=index%>.tip='<bean:write name="way" property="pageRemark" />';
	way<%=index%>.flgNeedHandler='<bean:write name="way" property="flgNeedHandler" />';
	ways[<%=index%>]=way<%=index%>;
</logic:iterate>
function changetState(flag){
	var value = document.all.handleWay.value;
	if(value==""){
		document.all.methodAlert.innerText="请选择处理方式;";
		document.all.nodeHandlerTr.style.display = "none";
	}else{
		for(var i=0; i<ways.length; i++){
			var way = ways[i];
			if(way.id==value){
				document.all.methodAlert.innerText=way.tip;
				if(way.flgNeedHandler=='1')
					document.all.nodeHandlerTr.style.display = "";
				else
					document.all.nodeHandlerTr.style.display = "none";
			}
		}
	} 	
	
	if(flag==1){
	    document.all.viewName.value = "";
	    document.all.viewId.value = "";
    }
}
function selectView(){
var handleWay = document.all.handleWay.value;
if(handleWay.length==0){
	alert("请选择处理方式!");
	return ;
}
//alert("handleWay:"+handleWay);
var url = "${ROOT}/selectDefaultViewPage.do?flowCode=<%=request.getParameter("flowCode")%>&nodeCode=<%=request.getParameter("nodeCode")%>&handleWay="+handleWay;
var temps = document.all.viewId.value;
var obj = new Object();
obj.defaultView = temps;
var returnValue = window.showModalDialog(url,obj,"dialogHeight:450px;dialogWidth:700px;status=no");
    if(returnValue!=""&&returnValue!=undefined){
    var returnTemps = returnValue.split(":");
   document.all.viewName.value = returnTemps[0];
   document.all.viewId.value = returnTemps[1];
   }
}

function changetSpreadPersonStatus(flgSpread){
if(flgSpread==1){
document.all.spreadPerson.style.display="";
}
if(flgSpread==0){
document.all.spreadPerson.style.display="none";
}
}
</script>
	<body style="OVERFLOW: auto" text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=3>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">
		<br>
		<form name="form1" method="post" action="" id="form1">
			<table cellSpacing=0 cellPadding=0 width=500 align=center border=0>
				<tr>
					<td>
						<br>
						<DIV class=tab-pane id=tabPane1>
							<SCRIPT type=text/javascript>
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	tp1.selectedIndex =<%=tab%>;
	</SCRIPT>



							<DIV class=tab-page id=tabPage1>
								<H2 class=tab>
									基本配置
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
								<!-- 这里嵌套流程基本配置 -->
								<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
									<TBODY>
										<TR>
											<td width="8%" align="right">
												<font color="red">*</font>
											</td>
											<TD align=left width="20%" height=35>
												环节名称：
											</TD>
											<TD width="72%" height=25>
												<INPUT class=editline size=30 value="" name="nodeName" check="notBlank" showName="环节名称" required="true" maxlength="50"/>
											</TD>
										</TR>
										<TR>
											<td align="right"></td>
											<TD align=left height=35>
												环节说明：
											</TD>
											<TD height=25>
												<INPUT class=editline size=30 value="" name="memo" maxlength="50"/>
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												处理方式：
											</TD>
											<TD height=25 nowrap="nowrap">
											<html:select name="nodeForm" property="handleWay" onchange="changetState(1);">
											<option value="">--请选择--</option>
											<html:optionsCollection name="handleTypewayList" value="id" label="selectLable"/>
											</html:select><br/>
											<font color="red" id="methodAlert">请选择处理方式;</font>
											</TD>
										</TR>
										<TR  id="nodeHandlerTr" style="display:none">
											<td align="right">
												
											</td>
											<TD align=left height=35>
												环节处理人：
											</TD>
											<TD height=25>
											<INPUT type="hidden" name="nodeProcessorValue" />
											<INPUT id="nodeProcessorText" class=editline size=35 readonly="readonly">
											<input type='button' id='b1' value='选择' class="button"
											  onclick="javascript:getAddressList('10;40;20;100','n','1;10;','nodeProcessorText','nodeProcessorValue');" >
											</TD>
										</TR>
										<TR>
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												界面显示方式：
											</TD>
											<TD height=25>
											  <INPUT class=editline size=30 value="" name="viewName" readonly="readonly" check="notBlank" showName="界面显示方式" required="true">
											  <INPUT type="hidden" name="viewId" value="">
											  <INPUT type="button" name="selectTemp" value="选择" onclick="javascript:selectView()" class="button">
											  <br><input type="checkbox" name="flgFullScreen" value="1">全屏打开待办 
											</TD>
										</TR>
										<TR id="spreadMethod">
											<td align="right">
												<font color="red">*</font>
											</td>
											<TD align=left height=35>
												是否抄送
											</TD>
											<TD height=25>
												<input type="radio" name="flgSpread" value="1" onclick="changetSpreadPersonStatus(1)"/>
												是&nbsp;
												<input type="radio" name="flgSpread" value="0" onclick="changetSpreadPersonStatus(0)" checked="checked"/>
												否
											</TD>
										</TR>
										<TR id="spreadPerson" style="display: none;">
											<td align="right">												
											</td>
											<TD align=left height=35>
												抄送人
											</TD>
											<TD align=left height=35 colspan="2">
											<INPUT type="hidden" name="spreadProcessorValue" />
											<INPUT id="spreadProcessorText" class=editline size=35  name="spreadProecessorText" readonly="readonly">
											<input type='button' id='b1' value='选择' class="button"
											  onclick="javascript:getAddressList('0;10;20','n','1','spreadProcessorText','spreadProcessorValue');" >
											</TD>
										</TR>
										<!-- 节点权限,暂时先注释 add by zyf 
										<TR id="nodePermisson" >
											<td align="right"></td>
											<TD align=left height=35>
												节点权限:
											</TD>
											<TD height=25>
												<input type="checkbox" name="flgModify" value="1">
												可修改流程 
											</TD>
										</TR>
										 -->
										<tr>
											<td colspan="3" align="left">
												<font color="#0099FF">说明：红星（</font><font color="red">*</font><font color="#0099FF">）不能为空</font>
											</td>
										</tr>
								</table>
							</DIV>

						</DIV>
						<!-- 	整个TAB结束 -->
					</td>
				</tr>
			</table>
		</form>
</div></td></tr></table>
	</body>
</html>
