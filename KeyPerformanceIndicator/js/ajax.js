
/**
 使用范例说明
function loadPending(){    
    var url = "<%=request.getContextPath()%>/listUndoWorklistAjax.do";
    LoadAjaxContent(url,callBack);    
}
function callBack(){
	var info=this.request.responseText;	
	alert(info);
}
 **/
 
READY_STATE_UNINITIALIZED = 0;
READY_STATE_LOADING = 1;
READY_STATE_LOADED = 2;
READY_STATE_INTERACTIVE = 3;
READY_STATE_COMPLETE = 4;

function LoadAjaxContent(url, onload, onerror,method){
new AjaxLoadContent(url, onload, onerror,method);
}

function LoadAjaxContentSyn(url, onload, onerror,method){
new AjaxLoadContentSyn(url, onload, onerror,method);
}


AjaxLoadContent = function(url, onload, onerror,method){
	this.url = url.indexOf('?')>0?url+"&isAjax=true":url+"?isAjax=true";
	this.method = "POST"
	if(method) this.method = method;
	this.request = null;
	this.onload = onload;
	this.onerror = (onerror) ? onerror : this.defaultError;
	this.loadActionsForAsynchronism(this.url);
}

AjaxLoadContentSyn = function(url, onload, onerror,method){
	this.url = url.indexOf('?')>0?url+"&isAjax=true":url+"?isAjax=true";
	this.method = "GET"
	if(method) this.method = method;
	this.request = null;
	this.onload = onload;
	this.onerror = (onerror) ? onerror : this.defaultError;
	this.loadActionsForSynchronization(this.url);
}

AjaxLoadContentSyn.prototype = {
	loadActionsForSynchronization: function(url){
		if (window.XMLHttpRequest){
			this.request = new XMLHttpRequest();
		}
		else if (window.ActiveXObject){
			this.request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (this.request){
			try{
				var loader = this;
				this.request.onreadystatechange = function(){
					loader.onReadyState.call(loader);
				}
				this.request.open(this.method, url, false);
				this.request.send(null);
			}
			catch (err){
				this.onerror.call(this);
			}
		}
	},
	onReadyState: function(){
		var request = this.request;
		var ready = request.readyState;
		if (ready == READY_STATE_COMPLETE){
			var httpStatus = request.status;
			if (httpStatus == 200 || httpStatus == 0){
				this.onload.call(this);
			}
			else{
				this.onerror.call(this);
			}
		}
	},
	defaultError: function(){
		/*alert("error!"
		+ "\n\nreadyState:"
		+ this.request.readyState 
		+ "\nstatus: "
		+ this.request.status
		+ "\nheaders: "
		+ this.request.getAllResponseHeaders());*/
	}
}



AjaxLoadContent.prototype = {
  loadActionsForAsynchronism: function(url){
		if (window.XMLHttpRequest){
			this.request = new XMLHttpRequest();
		}
		else if (window.ActiveXObject){
			this.request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (this.request){
			try{
				//the parameters in url should be spread in the case of post way
				var newUrl = url.split("?")[0];
				var paras = "";
				if(url.split("?").length>1){
					paras = url.split("?")[1];
				}
				
				var loader = this;
				this.request.onreadystatechange = function(){
					loader.onReadyState.call(loader);
				}		
				this.request.open(this.method, newUrl, true);
				this.request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      			//this.request.setRequestHeader("Content-length", parameters.length);
      			//this.request.setRequestHeader("Connection", "close");
				this.request.send(paras);
			}
			catch (err){
				this.onerror.call(this);
			}
		}
	},
	onReadyState: function(){
		var request = this.request;
		var ready = request.readyState;
		if (ready == READY_STATE_COMPLETE){
			var httpStatus = request.status;
			if (httpStatus == 200 || httpStatus == 0){
				this.onload.call(this);
			}
			else{
				this.onerror.call(this);
			}
		}
	},
	defaultError: function(){
		/*alert("error!"
		+ "\n\nreadyState:"
		+ this.request.readyState 
		+ "\nstatus: "
		+ this.request.status
		+ "\nheaders: "
		+ this.request.getAllResponseHeaders());*/
	}
}
