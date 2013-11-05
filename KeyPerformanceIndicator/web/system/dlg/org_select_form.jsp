<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils" />
<%
	String multi = ParamUtils.getParameter(request, "multi", "1");
	String manage = ParamUtils.getParameter(request, "manage", "1");
	String type = ParamUtils.getParameter(request, "type", "1");

	String[] allManages = manage.split(";");
	boolean flag = false;
	boolean myGroup = false;
	String i = "";
	for (int j = 0; j < allManages.length; j++) {
		i = allManages[j];
		if ("0".equals(i) || "1".equals(i) || "4".equals(i)
		|| "5".equals(i) || "6".equals(i))
			flag = true;
		if ("0".equals(i)) {
			myGroup = true;
		}
	}
%>




<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>数据选择页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link rel="stylesheet" href="${ROOT}/css/kpi.css" type="text/css" />

		<script src="org_select.js"></script>
		<script>		
			var selectedOrg = null;
			var tmpMulti="<%=multi%>";
			function initSelectedOrg() {
				selectedOrg = Util.$_E("selectedOrg");
				SelectUtil.initSelecteDOM(selectedOrg);
			}
			
			/*
			*添加单条数据
			*/
			function addSelectedOrgs(to) {
				if(tmpMulti!="n"){
					if(selectedOrg.options.length+1>tmpMulti){
						alert("提示：数据只可选择【"+tmpMulti+"】个");
						return;
					}
				}
				
				var from=document.frames["fbody"].document.getElementById("orgOptions");
				if(from.options.length > 0) {
					for(var i=0;i<from.options.length;i++) {
						
						if(from.options[i].selected==true){
							if(tmpMulti!="n"){			//选择范围不为n个的时候，需要判断但钱选择个数
								if(selectedOrg.options.length >= tmpMulti){
									alert("提示：数据只可选择【"+tmpMulti+"】个");
									return;
								}
							}
							SelectUtil.addOptions(to,from.options[i].text,from.options[i].value);
						}
					}
				}
				
			}
			
			/*
			*从收藏夹添加单条数据
			*/
			function addSelectedOrgsByFavorite(name,nameInfo)
			{
				if(tmpMulti!="n"){
					if(selectedOrg.options.length+1>tmpMulti){
						alert("提示：数据只可选择【"+tmpMulti+"】个");
						return;
					}
				}
				SelectUtil.addOptions(selectedOrg,name,nameInfo);
			}
			
			/*
			*全部添加数据
			*/
			function addAllOrgs(to) {
				
				if(tmpMulti!="n"){
					if(selectedOrg.options.length+1>tmpMulti){
						alert("提示：数据只可选择【"+tmpMulti+"】个");
						return;
					}
				}
				
				// 把from<select>所有的<option>复制一份到to<select>中去,实现批量添加
				var from=document.frames("fbody").document.getElementById("orgOptions");
				if(from.options.length > 0) {
					for(var i=0;i<from.options.length;i++) {
						if(tmpMulti!="n"){			//选择范围不为n个的时候，需要判断但钱选择个数
							if(selectedOrg.options.length >= tmpMulti){
								alert("提示：数据只可选择【"+tmpMulti+"】个");
								return;
							}
						}
						SelectUtil.addOptions(to,from.options[i].text,from.options[i].value);
					}
				}			
				
			}			
			
			/*
			*查询数据
			*/
			function searchOrg() {
				var keyWord = Util.$_EV('keyWord');
				if(keyWord != null && Trim(keyWord) != '') {
				
				document.frames("fbody").document.getElementById("keyWord").value=keyWord;		//关键字
				document.frames("fbody").document.getElementById("type").value="<%=type%>";		//查询类型
				document.frames("fbody").document.getElementById("manage").value="<%=manage%>";		//查询权限

				document.frames("fbody").optionAction.action="${ROOT}/addressSearch.do";
				
				<%
					if(flag){
						if(myGroup){
							out.print("var tmpScope=parent.ftree.frames('mapFrame4').document.getElementById('scope').value;");
						}
					%>
					var tmpUrl="${ROOT}/addressSearch.do?type=<%=type%>&manage=<%=manage%>&keyWord="+keyWord;
					
					<%
					if(myGroup){
						//查询范围
						out.print("document.frames('fbody').document.getElementById('scope').value=tmpScope");
					}
					
					%> 
					
					
					document.getElementById("searchTr").style.display="none";			//屏蔽搜索栏
					document.getElementById("searchMsgTr").style.display="";			//显示提示信息
					document.getElementById("searchTdMsg").innerHTML="提示信息:&nbsp;查询关键字 ["+keyWord+"] ,开始进行数据查询分析,请稍候...";			//显示提示信息
					
					document.frames("fbody").document.getElementById("searchFlag").value=1;		//查询标记
					document.frames("fbody").optionAction.submit();		//查询
				<% 
				
				
				}else{
				
				%>		
						//document.frames("fbody").location.href = '${ROOT}/addressSearch.do';
					return ;
				<% 	}
				%>
				}
			}
			
			/*
			*显示查询栏
			*/
			function showSearchInfo(){
				document.getElementById("searchTr").style.display="";			//屏蔽搜索栏
				document.getElementById("searchMsgTr").style.display="none";			//显示提示信息
				document.getElementById("searchTdMsg").innerHTML="";			//显示提示信息
					
			}
			
			/*
			*回车查询数据
			*/
			function enterSearchOrg(){
				if(ie4){ 
					if(event.keyCode==13){searchOrg();} 
				}
			}
			
			/*
			*双击选择待选数据
			*/
			function addSelectedItem(){
				addSelectedOrgs(selectedOrg);
			}
			
			/*
			*保存数据
			*/
			function saveSelectedValue(){
				SelectUtil.save(selectedOrg,'');
			}
			
			var favoriteFlag = "false";
			function callback(){
				favoriteFlag = Trim(this.request.responseText);
				parent.ftree.document.getElementById("mapFrame13").src="<%=request.getContextPath()%>/treePersonData.do?jsFunc=list_folder&listType=addr&"+Math.random();
			    return;
			}
			
			function favorite()
			{
			    ///onClick="SelectUtil.save(selectedOrg,'');"
			    var favoriteObj = new Object();
			    var outputText = "";
		        var outputValue = "";
				var optionsLength = selectedOrg.options.length;
				if(optionsLength > 0) {
				  for(var i=0;i<optionsLength;i++){
				      if(i==0)
				      {
				        outputText = selectedOrg.options[i].text;
				        outputValue = selectedOrg.options[i].value;
				      }
				      else
				      {
				        outputText = outputText + "," + selectedOrg.options[i].text;
				        outputValue = outputValue + "," + selectedOrg.options[i].value;
				      }
				  }
				}
				favoriteObj.name = outputText;
			    var retValue = window.showModalDialog('<%=context%>/web/system/favorite/favorite.jsp', favoriteObj, 'dialogHeight:315px;dialogWidth:400px;scroll=no;resizable=yes;status=no');
			    //alert("retValue:"+retValue);
			    if(retValue!=""&&retValue.length>2)
			    {
			       var retArray = retValue.split(";");
			      // if(retArray[0]=="addFolder")
			      // {
			          //parent.ftree.document.getElementById("mapFrame13").src="<%=request.getContextPath()%>/treePersonFolder.do?jsFunc=list_folder&listType=addr&"+Math.random();
			       //alert("mapFrame7:"+parent.ftree.document.getElementById("mapFrame7"));
			     //  }
			        
			       //alert(retArray.length);
			       var url = "<%=request.getContextPath()%>/createFavorite.do?favoriteInfo="+encodeURI(outputValue)+"&parentId="+retArray[1];
				   LoadAjaxContentSyn(url,callback); 
			    }
			    
			    
			}
		</script>
			
		
		
			
			
		<script language="javascript">
			ie4 = (document.all) ? true : false; 
			function keyDown(e){ 

				if(ie4){ 
					var realkey=String.fromCharCode(event.keyCode); 
					if(event.keyCode==27){
						saveSelectedValue();
						//window.close();
					} 
				} 
			} 
			document.onkeydown = keyDown; 
		</script>



	</head>


	<body style="background-color:#eff0f4">

		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="address-box" height="508px">
			<tr>
				<td class="dialog-titlebg">
					<div class="define-title">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr id="searchTr" name="searchTr">
								<td width="8%">搜索:</td>
								<td width="21%">
									<input type="text" id="keyWord" name="keyWord" size="50" onkeydown="enterSearchOrg();" title="温馨提示：输入查询条件后，可直接敲回车进行搜索"/>
								</td>
								<td>
									&nbsp;&nbsp;
									<input name="submit" type="button" onclick="searchOrg()"
										class="button2" value="搜 索" title="温馨提示：输入查询条件后，可直接敲回车进行搜索" />
								</td>
							</tr>
							<tr id="searchMsgTr" name="searchMsgTr" style="display:none">
								<td colspan="3" id="searchTdMsg" name="searchTdMsg">数据查询分析中，请稍候...</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>



			<tr>
				<td class="address-text-bg" valign="top">
					<table width="93%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td colspan="2" class="color-explain" >


								<%
								if ("1".equals(manage) || "0".equals(manage)) {
								%>
								颜色说明：
								<span class="fontcolor1">部门</span> |
								<span class="fontcolor3">员工</span> |
								<span class="fontcolor4">角色</span> |
								<%
								}
								%>


								<%--<span class="fontcolor5">岗位</span> |
								<span class="fontcolor6">群组</span> | 专业线 | 通用岗位
							--%>
							</td>
							
							<td class="color-explain2" >
							<a href="#" onclick="favorite()"><img src="<%=request.getContextPath() %>/img/correct.gif" border="0">
										</a>
							<a href="#" onclick="favorite()"><font color="#ff6600">添加已选列表到我的收藏夹</font>
										</a>
							</td>
						</tr>

						<tr>
							<!-- 待选列表 -->
							<td align="center">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="0">

									<tr>
										<td class="address-title">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="address-text">
											<iframe id="fbody" src="${ROOT}/orgOptions.do" scrolling="no"
												frameborder="0" name="fbody" width="238" height="320"></iframe>
										</td>
									</tr>
									<tr class="address-bottom">
										<td></td>
									</tr>
								</table>
							</td>

							<!-- 按钮 -->
							<td align="center">
								<table width="100%" border="0">
									<tr>
										<td height="28" align="center" style="table-layout:fixed;">
											<input type="button" class="button4" 
												onClick="addSelectedOrgs(selectedOrg)" value="添    加">
										</td>
									</tr>
									<tr>
										<td height="28" align="center" style="table-layout:fixed;">
											<input type="button" class="button4"
												onclick="SelectUtil.removeOption(selectedOrg)"
												value="删    除">
										</td>
									</tr>
									<tr>
										<td height="28" align="center" style="table-layout:fixed;">
											<input type="button" class="button4"
												onClick="addAllOrgs(selectedOrg)" value="全部添加">
										</td>
									</tr>
									<tr>
										<td height="28" align="center" style="table-layout:fixed;">
											<input type="button" class="button4"
												onClick="SelectUtil.removeAllOption(selectedOrg)"
												value="全部删除">
										</td>
									</tr>
									
								</table>
							</td>
							<!-- 按钮 -->

							<!-- 已选列表 -->
							<td align="center">
								<table width="250" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="address-title1">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="address-text">
											<select name="selStyle"
												onDblclick="SelectUtil.removeOption(this)"
												name="selectedOrg" id="selectedOrg" multiple size="16"
												style="width:240px;height:100%;margin:-2px;"></select>
										</td>
									</tr>
									<tr class="address-bottom">
										<td></td>
									</tr>
								</table>
							</td>
							<!-- 已选列表 -->
						</tr>

						<tr>
							<td colspan="3" width="80%" class="address-depict" valign="top">
								描述：&nbsp;&nbsp;
								<span name="addressRemark" id="addressRemark"></span>
							</td>
						</tr>
						


						<tr>
							<td colspan="3">
								<div class="address-line"></div>
								<table width="98%" border="0" align="center" cellspacing="0"
									height="100%">

									<tr>
										<td width="100%" align="center">
											<input type="button" name="button4" class="dialog-button2"
												value="确定" onClick="SelectUtil.save(selectedOrg,'');" title="温馨提示：可直接敲Esc键确定并关闭窗口" />
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="button" name="button4" class="dialog-button2"
												value="关闭" onClick="javascript:window.close();"  />
											
										<td>
									</tr>
									<tr>
										<td width="100%" align="center">
										<td>
									</tr>
								</table>
								<script>
									initSelectedOrg();
								</script>
							</td>
						</tr>
						
					</table>
				</td>
			</tr>
		</table>
		<script language="javascript">
			document.getElementById('keyWord').focus();
		</script>
	</body>
</html>
