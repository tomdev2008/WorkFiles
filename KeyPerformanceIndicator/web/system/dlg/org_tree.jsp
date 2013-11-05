<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils" />
<jsp:directive.page import="java.util.HashMap" />
<jsp:directive.page import="java.util.Map" />
<jsp:directive.page import="com.shengdai.kpi.system.org.OrgHelper"/>
<%
	String type = ParamUtils.getParameter(request, "type", "0"); //数据选择范围
	String manage = ParamUtils.getParameter(request, "manage", "0"); //菜单树显示范围
	String[] tmpManage = manage.split(";");
	Map showMenus = new HashMap();
	for (int i = 0; i < tmpManage.length; i++) {
		showMenus.put(tmpManage[i], tmpManage[i]);
	}
%>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/css/kpi.css" type="text/css" />
		<script language="javascript">
		
			
			// 开关子菜单
			function SwitchSubMenu(oSubMenu){
			  var i
			  for(i=1; i<50; i++){
			    var subid = "menu_" + i + "_sub";
			    if(document.all(subid)){
			      if(subid == oSubMenu.id + "_sub")
			        document.all(subid).style.display = "";
			      else
			        document.all(subid).style.display = "none";
			    }
			  }
			}
		</script>
		<script language="javascript">
			ie4 = (document.all) ? true : false; 
			function keyDown(e){ 

				if(ie4){ 
					var realkey=String.fromCharCode(event.keyCode); 
					if(event.keyCode==27){
						parent.fbody.saveSelectedValue();
					} 
				} 
			} 
			document.onkeydown = keyDown; 
		</script>
		
		
		
		
	</head>
	<body style="margin-top:0px;margin-left: 0px;">
		<input name="rightSelectedData" type="hidden" value="" />
		<!-- 菜单头图片 //-->
		<table width="200px" height="100%" border="0" cellspacing="1"
			cellpadding="1" class="define-right">
			<tr>
				<td valign="top" height="100%" class="address-left">
					<table height="100%" width="100%" border="0" cellspacing="0"
						cellpadding="0" align="right">
						<!-- 菜单头空间 //-->
						<tr>
							<td height="1" colspan="2"></td>
						</tr>
						<%if (showMenus.get("0") != null || showMenus.get("1") != null || showMenus.get("7") != null) { %>
						<!-- 一级菜单 -->
						<!-- 一级菜单 收藏夹 -->
						<tr id="menu_13" onClick="SwitchSubMenu(this);showMyFavorite();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">

								<div class="address-nav">
									<div class="address-navtext">
										我的收藏夹
									</div>
								</div>
							</td>
						</tr>
						<tr id="menu_13_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 99%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%">

										<tr>
											<td id="menu_td" align="center" height=100% width=100%>
												<iframe id=mapFrame13 width=100% height=100% name=mapFrame13></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="10">
							</td>
						</tr>
						<script language="javascript">
							
							//我的收藏夹
							var showFavorite = false;
							function showMyFavorite(){
							    // alert("huhu2");
								if(!showFavorite){
								//    alert("huhu");
									showFavorite = true;
									mapFrame13.location.href="treePersonData.do?jsFunc=list_folder&listType=addr&"+Math.random();
								}
							}
						</script>
						<!-- 一级菜单 收藏夹 -->
						<%
						}
						if (showMenus.get("1") != null) {
						%>


						
						
						
						<tr id="menu_1" onClick="SwitchSubMenu(this);showMyGroup();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">

								<div class="address-nav">
									<div class="address-navtext">
										我的部门
									</div>
								</div>
							</td>
						</tr>
						<tr id="menu_1_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 99%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%">

										<tr>
											<td id="menu_td" align="center" height=100% width=100%>
												<iframe id=mapFrame1 width=100% height=100% name=mapFrame1></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="10">
							</td>
						</tr>
						

						<tr id="menu_3" onClick="SwitchSubMenu(this);showAllOrg();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">

								<div class="address-nav">
									<div class="address-navtext">
										组织架构
									</div>
								</div>
							</td>
						</tr>
						<tr id="menu_3_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 99%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%">

										<tr>
											<td id="menu_td" align="center" height=100% width=100%>
												<iframe id="mapFrame3" width=100% height=100%
													name="mapFrame3"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="10">
							</td>
						</tr>


						<script language="javascript">
							//我的部门
							var loadedMyGroup = false;
							function showMyGroup(){
								if(!loadedMyGroup){
									loadedMyGroup = true;
									mapFrame1.location.href="org_addressTree.do?jsFunc=select_org_by_type&type=<%=type%>&myOrg=1&"+Math.random();
								}
							}
							
							//组织架构
							var allOrg=false;
							function showAllOrg(){
								if(!allOrg){
									allOrg = true;
									<%
										//０、全省；１、省公司本部／市分公司
										int scopeNum=OrgHelper.getCurrentUserAddressScope();
 									%>
									mapFrame3.location.href="<%=request.getContextPath()%>/org_addressTree.do?jsFunc=select_org_by_type<%=scopeNum==1?"&myOrg=2":""%>&type=<%=type%>&"+Math.random();
									
								}
							}
							
							
							
							
							//常用地址本
							//var loadedFavorite = false;
							//function showFavorite(){
							//	if(!loadedFavorite && document.getElementById("favoriteFrm")){
							//		loadedFavorite = true;
							//		favoriteFrm.location.href="org_addressTree.do?jsFunc=select_org_by_type&type=<%=type%>&myOrg=1&"+Math.random();
							//	}
							//}
							
							//window.onload=showAllOrg;
							document.getElementById("menu_3").click();
						</script>

						<%
							}
							if (showMenus.get("0") != null || showMenus.get("3") != null) {
						%>
						<tr id="menu_4" onClick="SwitchSubMenu(this);showMyGroup();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										我的可管理部门
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_4_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame4"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
							//我的可管理部门
							var loadedMyGroup = false;
							function showMyGroup(){
								if(!loadedMyGroup){
									loadedMyGroup = true;
									mapFrame4.location.href="<%=request.getContextPath()%>/web/system/dlg/admin_scope_tree.jsp?jsFunc=openRight&type=<%=type%>&"+Math.random();
								}
							}
							
							//window.onload=showAllOrg;
							document.getElementById("menu_4").click();
						</script>



						<%
							}
							//特定部门
							if (showMenus.get("8") != null) {
						%>
						<tr id="menu_14" onClick="SwitchSubMenu(this);showSpecGroup();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										部门
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_14_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame14"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
							//特定部门
							var specGroup = false;
							function showSpecGroup(){
								if(!specGroup){
									specGroup = true;
									url="org_addressTree.do?jsFunc=select_org_by_type&type=<%=type%>&myOrg=3&oids=<%=ParamUtils.getParameter(request, "oids","0")%>&"+Math.random();
									mapFrame14.location.href=url;
								}
							}
							document.getElementById("menu_14").click();
						</script>
						<% } %>

						<%
							//全省组织架构   ======开始=======
							if (showMenus.get("4") != null) {
						%>


						<tr id="menu_8" onClick="SwitchSubMenu(this);getroleAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										组织架构
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_8_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame8"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//全省组织架构
								var myCompany=false;
								function getroleAddress(){
									<%
										//０、全省；１、省公司本部／市分公司
										int scopeNum=OrgHelper.getCurrentUserAddressScope();
 									%>
									if(!myCompany){
										myCompany = true;
										mapFrame8.location.href="<%=request.getContextPath()%>/org_addressTree.do?jsFunc=select_org_by_type<%=scopeNum==1?"&myOrg=2":""%>&type=<%=type%>&"+Math.random();
									}
								}
								document.getElementById("menu_8").click();
							</script>
						<%
							}
							//全省组织架构   ======结束=======
						%>


						<%
							//我的分公司   ======开始=======
							if (showMenus.get("5") != null) {
						%>


						<tr id="menu_10" onClick="SwitchSubMenu(this);getroleAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										我的分公司
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_10_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame10"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//我的分公司
								var myCompany=false;
								function getroleAddress(){
									if(!myCompany){
										myCompany = true;
										mapFrame10.location.href="org_addressTree.do?jsFunc=select_org_by_type&type=<%=type%>&myOrg=2&"+Math.random();
									}
								}
								document.getElementById("menu_10").click();
							</script>
						<%
							}
							//我的分公司   ======结束=======
						%>

						<%
							//我的部门   ======开始=======
							if (showMenus.get("6") != null) {
						%>


						<tr id="menu_9" onClick="SwitchSubMenu(this);getMyOrgAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										我的部门
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_9_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame9"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//我的部门
								var myGroup_1=false;
								function getMyOrgAddress(){
									if(!myGroup_1){
										myGroup_1 = true;
										mapFrame9.location.href="org_addressTree.do?jsFunc=select_org_by_type&type=<%=type%>&myOrg=1&"+Math.random();
									}
								}
								document.getElementById("menu_9").click();
							</script>
						<%
							}
							//我的部门   ======结束=======
						%>

						<%
							//不做权限校验的全省组织架构  ======开始=======
							if (showMenus.get("9") != null) {
						%>


						<tr id="menu_11" onClick="SwitchSubMenu(this);getAllAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										组织架构
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_11_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe id="mapFrame11" width=100% height=100% name="mapFrame11"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//不做权限校验的全省组织架构
								function getAllAddress(){
									mapFrame11.location.href="org_addressTree.do?jsFunc=select_org_by_type&type=<%=type%>&myOrg=0&"+Math.random();
								}
								document.getElementById("menu_11").click();
							</script>
						<%
							}
							//不做权限校验的全省组织架构   ======结束=======
						%>

						<%
							//角色	======开始=======
							if (showMenus.get("10") != null) {
						%>


						<tr id="menu_7" onClick="SwitchSubMenu(this);getroleAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										角色
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_7_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame7"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//角色
								var roleAddress=false;
								function getroleAddress(){
									if(!roleAddress){
										roleAddress = true;
										mapFrame7.location.href="addressTreeRole.do?jsFunc=listResource&"+Math.random();
									}
								}
								document.getElementById("menu_7").click();
							</script>
						<%
							}
							//角色	======结束=======
						%>


						<%
							//通用岗位	======开始=======
							if (showMenus.get("15") != null) {
						%>



						<tr id="menu_6"
							onClick="SwitchSubMenu(this);getUniformPosTreeForAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										通用岗位
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_6_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame6"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
							//通用岗位
							var uniformPosTreeForAddress=false;
							function getUniformPosTreeForAddress(){
								if(!uniformPosTreeForAddress){
									uniformPosTreeForAddress = true;
									mapFrame6.location.href="uniformPosTreeForAddress.do?jsFunc=list_uniform&"+Math.random();
								}
							}
							//window.onload=getUniformPosTreeForAddress;
							document.getElementById("menu_6").click();
						</script>

						<%
							}
							//通用岗位	======结束=======
						%>




						<%
							//专业线		======开始=======
							if (showMenus.get("20") != null) {
						%>

						<tr id="menu_5"
							onClick="SwitchSubMenu(this);getLineTreeForAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										专业线
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_5_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame5"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//专业线
								var lineTreeForAddress=false;
								function getLineTreeForAddress(){
									if(!lineTreeForAddress){
										lineTreeForAddress = true;
										mapFrame5.location.href="lineTreeForAddress.do?jsFunc=list_uniform&"+Math.random();
									}
								}
								//window.onload=getLineTreeForAddress;
								document.getElementById("menu_5").click();
							</script>
						<%
							}
							//专业线		======结束=======
						%>
						<%
							//考核关系群组		======开始=======
							if (showMenus.get("25") != null) {
						%>

						<tr id="menu_25"
							onClick="SwitchSubMenu(this);getAssRelationTreeForAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										考核关系群组
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_25_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame5"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//考核关系群组
								var relationTreeForAddress=false;
								function getAssRelationTreeForAddress(){
									if(!relationTreeForAddress){
										relationTreeForAddress = true;
										mapFrame5.location.href="<%=request.getContextPath()%>/web/system/dlg/admin_scope_tree.jsp?jsFunc=loadAssRel&type=<%=type%>&"+Math.random();
									}
								}
								//window.onload=getLineTreeForAddress;
								document.getElementById("menu_25").click();
							</script>
						<%
							}
							//考核关系群组		======结束=======
						%>
						<%
							//考核指标类型		======开始=======
							if (showMenus.get("30") != null) {
						%>

						<tr id="menu_30"
							onClick="SwitchSubMenu(this);getIndicatorTypeTreeForAddress();"
							style="CURSOR: hand" align="center">
							<td height="24" width="200" align="center" valign="middle"
								style="background-image:url(<%=request.getContextPath()%>/img/menu3.gif);background-repeat:no-repeat"
								colspan="2">
								<div class="address-nav">
									<div class="address-navtext">
										考核指标类型
									</div>
								</div>

							</td>
						</tr>
						<tr id="menu_30_sub" style="DISPLAY: none">
							<td height="100%" valign="top" align="center" width="100%">
								<div
									style="HEIGHT: 100%; OVERFLOW-X: hidden; OVERFLOW-Y: auto; WIDTH: 100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										height="100%" scrolling="yes">
										<tr>
											<td id="menu_td" align="center" height=100% width="100%">
												<iframe width=100% height=100% name="mapFrame5"></iframe>
											</td>
										</tr>
										<tr>
											<td height="100%">
												<!--为了占用空间，保证其他的正常显示-->
											</td>
										</tr>
									</table>
								</div>
							</td>
							<td valign="top" align="center" width="0">
							</td>
						</tr>

						<script language="javascript">
								//考核指标类型
								var indiTypeTreeForAddress=false;
								function getIndicatorTypeTreeForAddress(){
									if(!indiTypeTreeForAddress){
										indiTypeTreeForAddress = true;
										mapFrame5.location.href="<%=request.getContextPath()%>/indicatorTypeTreeForAddress.do?jsFunc=list_indiType&"+Math.random();
									}
								}
								//window.onload=getLineTreeForAddress;
								document.getElementById("menu_30").click();
							</script>
						<%
							}
							//考核指标类型		======结束=======
						%>
						<tr>
							<td height="100%" colspan="2">
								<!--为了占用空间，保证其他的正常显示-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</body>
</html>
