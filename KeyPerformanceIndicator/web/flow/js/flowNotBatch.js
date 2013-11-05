/**
	主要用于完整考核表视图,checkBox的boId属性
*/
function ev_boId(chkId){
	var chkId = document.getElementsByName(chkId);
	var ids="";
	for(i=0;i<chkId.length;i++){
		if(chkId[i].checked==true){
	    	if(ids==""){
	   			ids=chkId[i].boId;
	   		}else {
				ids = ids+","+chkId[i].boId;
			}
		}
  	}
   	return ids;
}
/*
	提交下一步
*/
function ev_submitRout(routeId){
	//alert(0);
	if(!checkView())
		return ;
	//alert(1);
	var id = document.getElementById("id").value;
	var obj = new Object();
	obj.ids = id;
	var url = "";
	//if(ids=="") {alert("请您选择要复评的记录!");return;}
	var boIds = document.getElementById("boId").value;
	obj.boIds = boIds;
	//alert(2);
	var flowCode = getColVal('flowCode');
	var nodeCode = getColVal('nodeCode');
	var flgFullScreen = getColVal('flgFullScreen');
	//alert("flowCode:"+flowCode+"--nodeCode:"+nodeCode+"--flgFullScreen:"+flgFullScreen);
	if(flowCode==""||nodeCode==""||flgFullScreen==""){
		return ;
	}
		
	url = context+"/submitOptionsPage.do?routeId="+routeId+"&nodeCode="+nodeCode+"&isAll=0";

  	var value = window.showModalDialog(url,obj,"dialogHeight:500px;dialogWidth:700px;status=off");
  	if(value=="success"){
  		location.href = context+"/listUndoWorklist.do?";
  	}
}

/*
	流程提交归档
*/
function ev_archiveTask(routeId){
	//alert(0);
	if(!checkView())
		return ;
	//alert(1);
	var id = document.getElementById("id").value;
	var obj = new Object();
	obj.ids = id;
	var url = "";
	//if(ids=="") {alert("请您选择要复评的记录!");return;}
	var boIds = document.getElementById("boId").value;
	obj.boIds = boIds;
	//alert(2);
	var flowCode = getColVal('flowCode');
	var nodeCode = getColVal('nodeCode');
	var flgFullScreen = getColVal('flgFullScreen');
	//alert("flowCode:"+flowCode+"--nodeCode:"+nodeCode+"--flgFullScreen:"+flgFullScreen);
	if(flowCode==""||nodeCode==""||flgFullScreen==""){
		return ;
	}
	
  	url = context+"/submitOptionsPage.do?routeId="+routeId+"&nodeCode="+nodeCode+"&type=archive&isAll=0";
  	
  	var value = window.showModalDialog(url,obj,"dialogHeight:500px;dialogWidth:720px;status=off");
  	if(value=="success"){
  		location.href = context+"/listUndoWorklist.do?";
  	}
}
/*
	传阅
*/
function spread(){
	var id = document.getElementById("id").value;
	getAddressList('20','n','1','spreadHandlerName','spreadUserId');
	
	var spreadUserId = document.getElementById("spreadUserId");
	if(spreadUserId!=null&&spreadUserId.value.length>0){
		var url = context+"/spread.do?ids="+id+"&spreadUserId="+spreadUserId.value;
		LoadAjaxContent(url,spreadMethod);
	}
}
/**
	传阅的回调方法
*/
function spreadMethod(){
	var spreadUserId = document.getElementById("spreadUserId");
	var spreadHandlerName = document.getElementById("spreadHandlerName");
	spreadUserId.value = "";
	spreadHandlerName.value = "";
	alert(Trim(this.request.responseText));
}
/**
	根据页面控件的name,获得控件的value
*/
function getColVal(cName){
	var c = document.getElementsByName(cName);
	if(c==null||c.length==0){
		alert(cName+"不能为空!");
		return "";
	}else{
		return c[0].value;
	}
}
/**
	转办
*/
function turningItem(){
	//alert();
	var id = document.getElementById("id").value;
	var obj = new Object();
  	obj.ids = id;
  	var boId = document.getElementById("boId").value;
  	obj.boIds = boId;
  	var nodeCode = getColVal('nodeCode');
  	var url = "";
  	
  	url = context+"/flow/bo_options_transfer.jsp?nodeCode="+nodeCode+"&isAll=0";
  	
  	var value = window.showModalDialog(url,obj,"dialogHeight:500px;dialogWidth:720px;status=off");
	if(value=="success"){
  		location.reload();
  	}
}
/**
	视图验证方法
*/
function checkView(){return true;}