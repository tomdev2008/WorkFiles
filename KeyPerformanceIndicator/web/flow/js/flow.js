/*
	获得BOID对象
*/
function FF_getSubmitBO(checkname){
	var allcheck=document.getElementsByName(checkname);
	var ids="";
	  for(i=0;i<allcheck.length;i++){
		if(allcheck[i].checked==true){
		  	if(ids==""){
		   		ids=allcheck[i].boId;
		   	}else {
				ids = ids+","+allcheck[i].boId;
			}
		}
	 }
  return ids;
}
/*
	提交下一步
*/
function FF_submitRout(routeId){
	if(!checkView(routeId)){
		return ;
	}
	//以页面上的待办树ID来判断是列表还是表单
	var wid = document.all["wid"];
	var ids = null;
	if(wid)
		//在列表页面以勾选为主
		 ids = getAllChecked('id');
	else
		//在表单页面以hidden为主
		ids = document.all['workitemId'].value;
	if(ids=="") {alert("请您选择要提交的记录!");return;}

  	var url = context+"/submitOptionsPage.do?routeId="+routeId+"&worklistItemId="+ids;
  	
  	var value = window.showModalDialog(url,window,"dialogHeight:700px;dialogWidth:850px;status=1");
  	if(value=="success"){//提交成功后，直接返回到待办列表页面
  		if(wid)
  			location.href = context+"/listUndoWorklist.do";
  		else{
  			window.close();
  			window.opener.location.href = context+"/listUndoWorklist.do";
  		}
  	}
}


/**
  * 提交自由流，也叫非批次业务类流程
  * 如果是初始化业务对象提交，则没有待办ID，需要创建新的待办
  * 如果有待办ID，则直接提交
  **/
function FF_submitFreeRoute(routeId){
	if(!checkView(routeId)){
		return ;
	}
	var wvalue = document.getElementById("worklistItemId")?document.getElementById("worklistItemId").value:"";
	var rvalue = document.getElementById("resourceId")?document.getElementById("resourceId").value:"";
	var value = window.showModalDialog(context+"/submitOptionsPage.do?routeId="+routeId+"&worklistItemId="+wvalue+"&resourceId="+rvalue
			,window,"dialogHeight:700px;dialogWidth:850px;status=off");
  	if(value=="success"){//提交成功后，直接返回到待办列表页面
		if(wvalue!="")
			location.href = context+"/listUndoWorklist.do";
		else FF_ControlArea();
	}
}
/*
	传阅
*/
function FF_Spread(){
	var ids = getAllChecked('id');
	if(ids=="") {alert("请选择传阅记录！");return;}
	getAddressList('20','n','1','spreadHandlerName','spreadUserId');
	
	var spreadUserId = document.getElementById("spreadUserId");
	if(spreadUserId!=null&&spreadUserId.value.length>0){
		var url = context+"/spread.do?ids="+ids+"&spreadUserId="+spreadUserId.value;
		LoadAjaxContent(url,function(){
			var spreadUserId = document.getElementById("spreadUserId");
			var spreadHandlerName = document.getElementById("spreadHandlerName");
			spreadUserId.value = "";
			spreadHandlerName.value = "";
			alert(Trim(this.request.responseText));
		});
	}
}
/**
	转办
*/
function FF_TurningItem(){
	var ids = getAllChecked('id');
	if(ids=="") {alert("请选择转办记录！");return;}
  	var	url = context+"/flow/bo_options_transfer.jsp?nodeCode="+nodeCode+"&worlistItem="+ids;
  	var value = window.showModalDialog(url,obj,"dialogHeight:500px;dialogWidth:720px;status=off");
	if(value=="success"){
  		location.reload();
  	}
}
/**
	视图验证方法
*/
function checkView(){return true;}
/**
  * 控制域
  **/
function FF_ControlArea(){
  var area = document.getElementById("controlArea");
  if(area){
  	area.style.display = area.style.display == "none"?"block":"none";
  } 
  
  var SELECTs=document.getElementsByTagName("SELECT");
  var INPUTs=document.getElementsByTagName("INPUT");
  var TEXTAREAs=document.getElementsByTagName("TEXTAREA");
  
  for(var i=0;i<SELECTs.length;i++)
   	SELECTs[i].disabled = SELECTs[i].disabled=='true'?"false":"true";
  for(var i=0;i<INPUTs.length;i++)
   	INPUTs[i].disabled = INPUTs[i].disabled=='true'?"false":"true";
  for(var i=0;i<TEXTAREAs.length;i++)
   	TEXTAREAs[i].disabled = TEXTAREAs[i].disabled=='true'?"false":"true";
}
/**
  * 控制域
  **/
function FF_ControlAreaReadOnly(){
  var area = document.getElementById("controlArea");
  if(area){
  	area.style.display = area.style.display == "none"?"block":"none";
  } 
  
  var SELECTs=document.getElementsByTagName("SELECT");
  var INPUTs=document.getElementsByTagName("INPUT");
  var TEXTAREAs=document.getElementsByTagName("TEXTAREA");
  
  for(var i=0;i<SELECTs.length;i++)
   	SELECTs[i].readOnly = SELECTs[i].readOnly=='true'?"false":"true";
  for(var i=0;i<INPUTs.length;i++)
   	INPUTs[i].readOnly = INPUTs[i].readOnly=='true'?"false":"true";
  for(var i=0;i<TEXTAREAs.length;i++)
   	TEXTAREAs[i].readOnly = TEXTAREAs[i].readOnly=='true'?"false":"true";
}