<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="com.shengdai.kpi.common.valueobject.Busi,com.shengdai.kpi.flow.valueobject.*"%>
<%@ include file="/web/pub/flow.inc"%>


<%Busi busi = (Busi) request.getAttribute("busi");
			String method = (String) request.getAttribute("method");
			String busiName = "";
			String remark = "";
			String busiId = "";

			if (busi != null) {
				busiId = busi.getId();
				busiName = busi.getBusiName();
				remark = busi.getRemark() == null ? "" : busi.getRemark();
			}

			request.setAttribute("flwExtList2", request
					.getAttribute("flwExtList"));
			String tab = request.getParameter("tab");
			if (tab == null || tab.equals("")) {
				tab = "0";
			}
%>
<script language="javascript">
function add_para(id){
	var returnValue = window.showModalDialog('${ROOT}/system/common/busi_param_add.jsp?id='+id,'','dialogHeight:340px;dialogWidth:500px;status=off')
    if(returnValue=="success"){
    location.href = "${ROOT}/viewBusi.do?method=update&busiID=<%=request.getParameter("busiID")%>&tab=2";   
    }
    }
    
   function editNodeExt(id){
	var returnValue = window.showModalDialog('${ROOT}/busiParamEditPage.do?busiParamId='+id,'','dialogHeight:340px;dialogWidth:500px;status=off')
    if(returnValue=="success"){
    location.href = "${ROOT}/viewBusi.do?method=update&busiID=<%=request.getParameter("busiID")%>&tab=2"; 
   }
}

function deleteNodeExt(id){
if (confirm("您确认要删除记录？")) { 
document.busiForm.action = "${ROOT}/deleteBusiParamForType.do?type=<%=request.getParameter("busiID")%>&id="+id;
document.busiForm.submit();
}else{
return;
}
}

function synchronize(){
	var ids = getAllChecked("paraid");
	var url ="${ROOT}/busiParamOfFlow.do?busiCode=<logic:notEmpty name="commBusi"><bean:write name="commBusi" property="id"/></logic:notEmpty>&flgTempletSyc=1";
	//window.showModalDialog(url,ids,"dialogHeight:700px;dialogWidth:1000px;status=no")
	window.open(url,'','left=0, top=0, width=1000, height=700, resizable=0,scrollbars=1');
}

function selectTemp111(){
var url = "${ROOT}/listTempletForFlow.do";
var temps = document.all.templetCode.value;
var obj = new Object();
if(temps!=""){
obj.ids = temps;
}
var returnValue = window.showModalDialog(url,obj,'dialogHeight:300px,dialogWidth:750px,status=off,scrollbars=no');

    if(returnValue!=""&&returnValue!=undefined){
 var returnTemps = returnValue.split(";");
    var templetValue = "";
    var templetText = "";
    for(var i=0;i<returnTemps.length;i++){
    var t = returnTemps[i].split(":")[0];
    var v = returnTemps[i].split(":")[1];
    if(templetText==""){
	   templetText=t;
	   }else {
		templetText = templetText+";"+t;
		}
		 if(templetValue==""){
	   templetValue=v;
	   }else {
		templetValue = templetValue+";"+v;
		}
    }
   document.all.templetText.value = templetText;
   document.all.templetCode.value = templetValue;
}
}

</script>
<html>
	<head>
		<title>业务类型</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	</head>

	<body bgColor=#f0f0f0 leftMargin=0 topMargin=3>
		<br>
		<form method="post" action="" name="busiForm" onsubmit="return validateBusiForm(this);">


			<center>
				<font size="3pt" color="#666666"><b><u> <%if (method != null && method.equals("add")) {

			%> 增加业务类型 <%} else {

			%> 修改业务类型 <%}

			%> </u></b></font>
			</center>

			<!-- table width="80%" border="0" align="center" cellspacing="0" cellpadding="0"-->
			<table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
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
									业务类型
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
								<table width="100%" class=box style='font-size:9pt' border="0" cellspacing="1" cellpadding="5" align="center">
									<tr>
										<td height="22" valign=top colspan="2" nowrap class="tdbulef">
											请完成下面的<b>业务类型</b>表后保存。红星（<font color="#FF0000">*</font>）是必填项。
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" height="25">
											<font color="red" size="2">*</font><FONT size="2">业务类型ID: 
										</td>
										<td width="72%" height="25">
											<%if (method != null && method.equals("add")) {

			%>
											<input type="text" name="id" value="<logic:notEmpty name="commBusi"><bean:write name="commBusi" property="id"/></logic:notEmpty>" size="10" maxlength="4" />
											<%} else {%>
											<input type="text" name="id" class="editline" readOnly="true" value="<logic:notEmpty name="commBusi"><bean:write name="commBusi" property="id"/></logic:notEmpty>" size="10" maxlength="4" />
											<%}%>
										</td>
									</tr>
									<tr>

										<td width="28%" align="right" height="25">
											<font color="red" size="2">*</font><FONT size="2">业务类型名称: 
										</td>
										<td width="72%" height="25">
											<input type="text" class=editline name="busiName" value="<logic:notEmpty name="commBusi"><bean:write name="commBusi" property="busiName"/></logic:notEmpty>" size="30" maxlength="40">
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" height="25">
											<FONT size="2">模板选择: 
										</td>
										<td width="72%" height="25">
											<input type="text"  class=editline name="templetText" value="<logic:notEmpty name="TempletText"><bean:write name="TempletText"/></logic:notEmpty>" size="30" readonly="readonly">		
		<INPUT type="hidden" name="templetCode" value=""/>
		<INPUT type="button" name="selectTemp" value="选择模板" onclick="javascript:selectTemp111()" class="button">
										<input type="checkbox" name="flgTempletSyc" value="1" >模板是否同步(保存不起作用)
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" height="25">
											备 注:
										</td>
										<td height="22" valign=top width="427">
											<textarea name="remark" rows="4" cols="70" style="background:#FFFFFF" styleClass="editTxt">
												<logic:notEmpty name="commBusi">
													<bean:write name="commBusi" property="remark" />
												</logic:notEmpty>
											</textarea>
										</td>
									</tr>

								</table>
							</DIV>
							<%if (method.equals("update")) {

				%>
							<DIV class=tab-page id=tabPage4>
								<H2 class=tab>
									业务参数配置
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage4" ) );</SCRIPT>
								<!-- 这里嵌套业务参数配置 -->
								<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
									<TBODY>
										<logic:iterate id="flowNodeExtList" name="flwExtList">
											<logic:equal name="flowNodeExtList" property="paraType" value="text">
												<TR>
													<TD align=right width="13%" height=35 nowrap="nowrap">
														<bean:write name="flowNodeExtList" property="paraDisName" />
														:
													</TD>
													<TD width="87%" height=25>
														<input name="<bean:write name="flowNodeExtList" property="paraName"/>" type="text" value="<bean:write name="flowNodeExtList" property="paraValue"/>" />
													</TD>
												</TR>
											</logic:equal>
											<logic:equal name="flowNodeExtList" property="paraType" value="select">
												<TR>
													<TD align=right width="13%" height=35 nowrap="nowrap">
														<bean:write name="flowNodeExtList" property="paraDisName" />
														:
													</TD>
													<TD width="87%" height=25>
														<%FlwNodeExt flwNodeExt = (FlwNodeExt) flowNodeExtList;
				String values = flwNodeExt.getListValues();
				String[] valueArray = values.split(";");

				%>
														<select name="<bean:write name="flowNodeExtList" property="paraName"/>">
															<%for (int i = 0; i < valueArray.length; i++) {
					String[] eleArray = valueArray[i].split(",");

					%>
															<option value="<%=eleArray[1]%>" <%if(eleArray[2].equals("true")){out.print("selected=\"selected\"");}%>>
																<%=eleArray[0]%>
															</option>
															<%}

				%>
														</select>
													</TD>
												</TR>
											</logic:equal>
											<logic:equal name="flowNodeExtList" property="paraType" value="check">
												<TR>
													<TD align=right width="13%" height=35 nowrap="nowrap">
														<bean:write name="flowNodeExtList" property="paraDisName" />
														:
													</TD>
													<TD width="81%" height=25>
														<%FlwNodeExt flwNodeExt2 = (FlwNodeExt) flowNodeExtList;
				String values2 = flwNodeExt2.getListValues();
				String[] valueArray2 = values2.split(";");

				%>
														<%for (int i = 0; i < valueArray2.length; i++) {
					String[] eleArray2 = valueArray2[i].split(",");

					%>
														<input name="<bean:write name="flowNodeExtList" property="paraName"/>" type="checkbox" value="<%=eleArray2[1]%>" <%if(eleArray2[2].equals("true")) out.print("checked=\"checked\"");%> />
														<%=eleArray2[0]%>
														<%}

				%>
													</TD>
												</TR>
											</logic:equal>

											<logic:equal name="flowNodeExtList" property="paraType" value="radion">
												<TR>
													<TD align=right width="13%" height=35 nowrap="nowrap">
														<bean:write name="flowNodeExtList" property="paraDisName" />
														:
													</TD>
													<TD width="87%" height=25>
														<%FlwNodeExt flwNodeExt3 = (FlwNodeExt) flowNodeExtList;
				String values3 = flwNodeExt3.getListValues();
				String[] valueArray3 = values3.split(";");

				%>
														<%for (int i = 0; i < valueArray3.length; i++) {
					String[] eleArray3 = valueArray3[i].split(",");

					%>
														<input name="<bean:write name="flowNodeExtList" property="paraName"/>" type="radio" value="<%=eleArray3[1]%>" <%if(eleArray3[2].equals("true")) out.print("checked=\"checked\"");%> />
														<%=eleArray3[0]%>
														<%}

				%>
													</TD>
												</TR>
											</logic:equal>
										</logic:iterate>
								</table>
							</DIV>

							<DIV class=tab-page id=tabPage5>
								<H2 class=tab>
									业务参数管理
								</H2>
								<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage5" ) );</SCRIPT>
								<!-- 这里嵌套业务参数配置 -->
								<table id=tabPro height=23 cellSpacing=1 borderColorDark=#f4f5ff align="center" cellPadding=1 width="100%" borderColorLight=#b5caff border=1>
									<tr>
										<td class=header align="center" width="10%" height="22" nowrap="nowrap">
											<input id='chkCtl' type="checkbox" onclick="javascript:checkAll(this.id, 'paraid');">选择</td>
										</td>
										<td class=header align="center" width="30%" height="22" nowrap="nowrap">
											参数名称
										</td>
										<td class=header align="center" width="30%" nowrap="nowrap">
											参数显示名
										</td>
										<td class=header align="center" width="15%" nowrap="nowrap">
											参数值
										</td>
										<td class=header align="center" width="15%" nowrap="nowrap">
											操作
										</td>
									</tr>
									<logic:iterate id="flowNodeExtList2" name="flwExtList2">
										<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
											<td align="center" width="10%" height="20">
												<input type="checkbox" name="paraid" 
												value="<bean:write name="flowNodeExtList2" property="id"/>" /></td>
											</td>
											<td align="center" width="30%" height="20">
												<bean:write name="flowNodeExtList2" property="paraName" />
											</td>
											<td align="center" width="30%">
												<bean:write name="flowNodeExtList2" property="paraDisName" />

											</td>
											<td align="center" width="15%">
												<bean:write name="flowNodeExtList2" property="paraValue" />
											</td>
											<td align="center" width="15%">
												<a href="javascript:editNodeExt('<bean:write name="flowNodeExtList2" property="id"/>');" title="编辑参数"><img src="${ROOT}/images/edit.gif" border="0"></a> <a
													href="javascript:deleteNodeExt('<bean:write name="flowNodeExtList2" property="id"/>');"><img src="${ROOT}/images/delete_1.gif" border="0"></a>
											</td>
										</tr>
									</logic:iterate>
								</table>
								<input type='button' name='add_attach_button' onclick="javascript:add_para('<%=request.getParameter("busiID")%>');" value='新增' class="button">
							</DIV>

							<%}

		%>
						</DIV>
						<!-- 	整个TAB结束 -->
					</td>
				</tr>
			</table>
		</form>
		<html:javascript formName="busiForm" />
	</body>
</html>

