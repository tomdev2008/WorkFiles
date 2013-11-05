<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<jsp:directive.page import="com.shengdai.kpi.system.CommonLoginUser" />
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.User" />
<%@ page import="java.util.List"%>
<jsp:directive.page import="com.shengdai.kpi.system.favorite.vo.PersonQuery" />
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils" />
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%
			List queryList = (List) request.getAttribute("queryList");
			User user = CommonLoginUser.getCurrentDefaultUserHolder();
		%>

		<script language="javascript">
		function changeState(currLiStr,queryId){
		   // alert(currLiStr);
			var li = document.getElementsByTagName("li");
			var fbody = document.getElementById("fbody");
			for(var i=0;i<li.length;i++){//清空样式
				li[i].className = "";
			}
			var currLi = document.getElementById(currLiStr);
			currLi.className = "c";
			//currLiStr.className = "c";
			fbody.src = "${ROOT}/viewPersonQuery.do?id="+queryId;
			/*
			if(currLiStr!="li1"){
				fbody.src = "temp.jsp";
			}
			else{
				fbody.src = "main.jsp";
			}
			*/
		}
		//** iframe自动适应页面 **// 
		
		//输入你希望根据页面高度自动调整高度的iframe的名称的列表 
		//用逗号把每个iframe的ID分隔. 例如: ["myframe1", "myframe2"]，可以只有一个窗体，则不用逗号。 
		
		//定义iframe的ID 
		var iframeids=["fbody"] 
		
		//如果用户的浏览器不支持iframe是否将iframe隐藏 yes 表示隐藏，no表示不隐藏 
		var iframehide="yes" 
		
		function dyniframesize() 
		{ 
		var dyniframe=new Array() 
		for (i=0; i<iframeids.length; i++) 
		{ 
		if (document.getElementById) 
		{ 
		//自动调整iframe高度 
		dyniframe[dyniframe.length] = document.getElementById(iframeids[i]); 
		if (dyniframe[i] && !window.opera) 
		{ 
		dyniframe[i].style.display="block" 
		if (dyniframe[i].contentDocument && dyniframe[i].contentDocument.body.offsetHeight) //如果用户的浏览器是NetScape 
		dyniframe[i].height = dyniframe[i].contentDocument.body.offsetHeight; 
		else if (dyniframe[i].Document && dyniframe[i].Document.body.scrollHeight) //如果用户的浏览器是IE 
		dyniframe[i].height = dyniframe[i].Document.body.scrollHeight+20; 
		} 
		} 
		//根据设定的参数来处理不支持iframe的浏览器的显示问题 
		if ((document.all || document.getElementById) && iframehide=="no") 
		{ 
		var tempobj=document.all? document.all[iframeids[i]] : document.getElementById(iframeids[i]) 
		tempobj.style.display="block" 
		} 
		} 
		} 
		
		
	</script>


		<script language="javascript">
		function hiddenControl(hiddenControl,clickControl){
			//alert(control);
			clickControl = document.getElementById(clickControl);
			var hiddenControl = document.getElementById(hiddenControl);
			if(hiddenControl.style.display == "none"){
				hiddenControl.style.display = "";
				clickControl.className = "right-name";	
			}else{
				hiddenControl.style.display = "none";
				clickControl.className = "right-name1";	
			}
			setPHeight3();
		}
		function toOpenMsg(batchId,flowCode,nodeCode,busiId){
			var url = "${ROOT}/findWorklistInfoAjax.do?batchId="+
				batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&busiId="+busiId;
		    LoadAjaxContent(url,openMsg); 
		}
		function openMsg(){
			//alert();
			var back = this.request.responseText;
			var flgFullScreen = back.split(";")[0];
			var paras = back.split(";")[1]; 
			var url = "${ROOT}/openUndoWorklist.do?" + paras;
			if(flgFullScreen=="1"<%if(user.isVIP()) out.println("||true");%>){
				var fwidth=screen.width-10; //屏幕的宽
		    	var fheight=screen.height-50; //屏幕的高
		    	//alert("fheight:"+fheight+"--screen.height:"+screen.height);
		    	url +=  "&flgFullScreen="+1+"&close_window="+1;
				new_window = window.open(url,'msgWin','left=2,top=2,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
			} else {
				url +=  "&flgFullScreen="+0;
				location.href = url;
			}
		}
		
		//装载待办信息
		var tdId;
		function loadPending(tdStr,busiId){
			tdId = document.getElementById(tdStr);
			if(tdId.innerHTML == null || tdId.innerHTML.length>0){
				return ;
			}
			tdId.innerHTML = "loading...";
		    var url = "${ROOT}/getUndoForBusiAjax.do?busiId="+busiId+"&rkey="+Math.random();
		    LoadAjaxContent(url,writePending);    
		}
		function writePending(){
			//alert(this.request.responseText);
			tdId.innerHTML = this.request.responseText;
			//alert(tdId.innerHTML);
			//TableUtil.enableHighlightTr($_E('pendinghtml'));
			setPHeight3();
		}
		function loadSpreading(tdStr,busiId){
			tdId = document.getElementById(tdStr);
			if(tdId.innerHTML == null || tdId.innerHTML.length>0){
				return ;
			}
			tdId.innerHTML = "loading...";
		    var url = "${ROOT}/getSpreadForBusiAjax.do?busiId="+busiId;
		    LoadAjaxContent(url,writeSpreading);    
		}
		function writeSpreading(){
			//alert(this.request.responseText);
			tdId.innerHTML = this.request.responseText;
			setPHeight3();
		}
		
		function toOpenSpread(wid,status){
			var getview = "${ROOT}/changeSpreadStatus.do?wid="+wid+"&status="+status;
			var url = LoadAjaxContentSyn(getview,openSpread);
			if(status=='<%=com.shengdai.kpi.flow.valueobject.WorklistItem.STATUS_UNREAD%>'){
				window.location.reload();		
			}
		}
		function openWin(boId,handlerId,nodeCode){
			var url="${ROOT}/openDoneWorklist.do?boId="+boId+"&handlerId="+handlerId+"&nodeCode="+nodeCode;
			var fwidth=screen.width; //屏幕的宽
		   	var fheight=screen.height; //屏幕的高
			new_window = window.open(url,'_blank','left=0,top=0,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
		}
		function openSpread(){
			var temp = Trim(this.request.responseText);
			var arr = temp.split(";");
			openWin(arr[0],arr[1],arr[2]);
		}
		
		
		function setPHeight3(){
			var min = 400;
			var temp = 0;
			var temp1 = 0;
			var temp2 = 0;
			var mainFrame1 = null;
			
			if(parent.document.all["mainFrame1"]!=undefined&&parent.upFrame!=null){
//			  mainFrame1 = parent.document.all["mainFrame1"];
              //alert("1");
			  temp = document.body.scrollHeight;

			  temp+=30;
			  parent.upFrame.height=temp;

			}else if(parent.parent.document.all["mainFrame1"]!=undefined&&parent.parent.downFrame){	
			//alert("2");
			  mainFrame1 = parent.parent.document.all["mainFrame1"];
			  temp1 = document.body.scrollHeight+60;
			  temp2 = parent.parent.downFrame.document.body.scrollHeight;
			  temp = temp1 + temp2;
			  mainFrame1.rows=temp1+",*";

			}else{ //alert("3");
				temp = this.document.body.scrollHeight;	
			}
			
			if(parent.parent.parent.document.all["fraOAContent"]!=undefined){
			   // alert("4");
				if(temp<min) temp = min;
					parent.parent.parent.document.all["fraOAContent"].height=temp+10;
			}else if(parent.parent.parent.parent.document.all["fraOAContent"]!=undefined){
			   // alert("5");
				if(temp<min) temp = min;

				parent.parent.parent.parent.document.all["fraOAContent"].height=temp+10;
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
				form2.action="${ROOT}/changeSpread.do?";
				form2.submit();
			}else{
				alert("请选择相应的文后再点[已阅]按钮！");
			}
			
		}
		/*
		if (window.addEventListener) 
			window.addEventListener("load", dyniframesize, false) 
			else if (window.attachEvent) 
			window.attachEvent("onload", dyniframesize) 
			else 
			window.onload=dyniframesize;
			*/
		</script>
	</head>

	<body class="main-body" onmousewheel='setScrollzheight();'>

		<table class="mainright" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="4" class="right-title">
					待办
				</td>
			</tr>
			<tr>
				<td width="70%" class="right-field">
					<a href="javascript:hiddenControl('undo',this);">任务描述</a>
				</td>
				<td width="30%" class="right-field">
					<a href="javascript:hiddenControl('undo',this);">到达时间</a>
				</td>
			</tr>
			<tbody id="undo">
				<tr>
					<td colspan="2">
						${undoStr }
					</td>
				</tr>
			</tbody>
		</table>
		<br />
		<form name="form2">
			<table class="mainright" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td colspan="4" class="right-title">
						待阅
						<span class="tblOaList"> <input type="hidden" name="wids" /> <input type="hidden" name="flgReloadPage" value="1"/>
							<input name="button2" type="button" class="btnClass" value="已阅"
								onclick="changeRead();" /> </span>
					</td>
				</tr>
				<tr>
					<td width="70%" class="right-field">
						<a href="javascript:hiddenControl('spread',this);">任务描述</a>
					</td>
					<td width="30%" class="right-field">
						<a href="javascript:hiddenControl('spread',this);">到达时间</a>
					</td>
				</tr>
				<tbody id="spread">
					<tr>
						<td colspan="2">
							${spreadStr }
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	
		<div class="listinfor"></div>
        <div class="report-navdown" style="width:97%">报表正文</div>
		<form name="form1">

			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="3" class="assess-TLeftBg">
						&nbsp;
					</td>
					<td class="assess-TMidBg">
						<div class="assess">
							<ul id="ul">

								<c:forEach var="o" items="${queryList}" varStatus="idx">
									<li class="${idx.first?" c":""}" id="li${idx.count}">
										<a hidefocus=""
											href="javascript:changeState('li${idx.count}','${o.id}');"><span>${o.queryName}</span>
										</a>
									</li>
								</c:forEach>

							</ul>

						</div>
					</td>
					<td class="assess-TRightBg">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="3" height="">
						<%
								if (queryList != null && queryList.size() > 0) {
								PersonQuery query = (PersonQuery) queryList.get(0);
								String url = request.getContextPath()
								+ "/viewPersonQuery.do?id=" + query.getId();
						%>
						<iframe src="<%=url%>" id="fbody" frameborder="0" name="fbody"
							width="100%" height="10" scrolling="no" onload="setPHeight3();"></iframe>
						<%
						} else {
						%>
						<iframe src="${ROOT}/web/vip/main.jsp" id="fbody" frameborder="0"
							name="fbody" width="100%" height="240" scrolling="no" onload="setPHeight3();"></iframe>
						<%
						}
						%>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
