
function dialog(type){
	var titile = '';
	var width = 398;
	var height = 180;
	var src = "";
	var path = context+"/img/dialog/";
	//var imgPath = '';	
	var sFunc = '<input id="dialogOk" type="button" value="确 认" class="button2"  onclick="dg.ok();" />'+
	' <input id="dialogCancel" type="button" value="取 消" class="button2" onclick="dg.reset();" />';
	var sClose = '<input type="image" id="dialogBoxClose" onclick="new dialog().reset();" src="' + path + 'dialogClose0.gif" border="0" width="17" height="17" align="absmiddle" />';
	var sBody;
	var msg;
	var paras;	
	
	<!-- 考虑到对话框的多种样式 -->
	if(type=='optioin'){
		<!-- 可进行文字交互的样式，将主页面的input的值写入弹出页面编辑域中，更新后点击确定可将值回写回去 -->
		sBody = '\
		<table id="dialogBodyBox" border="0" align="center" cellpadding="0" cellspacing="0">\
			<tr height="10"><td colspan="4"></td></tr>\
			<tr height="10"><td colspan="4" align="center">\
			<textarea id="msgid" cols="45" rows="8" maxlength="1000" onpropertychange=\"if(value.length>100) value=value.substr(0,100)\"></textarea>\
			</td></tr>\
			<tr><td id="dialogFunc" colspan="4" align="center">' + sFunc + '</td></tr>\
			<tr height="10"><td colspan="4" align="center"></td></tr>\
		</table>\
		';
	} else if(type=='progress') { 
		
		sBody = '\
		<table id="dialogBodyBox" border="0" align="center" cellpadding="0" cellspacing="0">\
			<tr height="10"><td colspan="4"></td></tr>\
			<tr>\
				<td width="10"></td>\
				<td width="10" align="center" valign="absmiddle"><img id="dialogBoxFace" border="0" src=""/></td>\
				<td id="dialogMsg" style="color:#315100;font-size:14px;font-weight:bold;line-height:125%;"></td>\
				<td width="10"></td>\
			</tr>\
			<tr height="10"><td colspan="4" align="center"></td></tr>\
			<tr height="10"><td colspan="4" align="center"></td></tr>\
		</table>\
		';
	} else {
		sBody = '\
		<table id="dialogBodyBox" border="0" align="center" cellpadding="0" cellspacing="0">\
			<tr height="10"><td colspan="4"></td></tr>\
			<tr>\
				<td width="10"></td>\
				<td width="10" align="center" valign="absmiddle"><img id="dialogBoxFace" border="0" src=""/></td>\
				<td id="dialogMsg" style="color:#315100;font-size:14px;font-weight:bold;line-height:125%;"></td>\
				<td width="10"></td>\
			</tr>\
			<tr height="10"><td colspan="4" align="center"></td></tr>\
			<tr><td id="dialogFunc" colspan="4" align="center">' + sFunc + '</td></tr>\
			<tr height="10"><td colspan="4" align="center"></td></tr>\
		</table>\
		';
	}

	var sBox = '\
		<table id="dialogBox" width="' + width + '" border="0" cellpadding="0" cellspacing="0" style="border:1px solid #000;display:none;z-index:10;">\
			<tr height="26">\
				<td style="background:url('+context+'/img/dialog/tit_dialog.gif)">\
					<table onselectstart="return false;" style="-moz-user-select:none;" width="100%" border="0" cellpadding="0" cellspacing="0">\
						<tr>\
							<td width="6"></td>\
							<td id="dialogBoxTitle" onmousedown="new dialog().moveStart(event, \'dialogBox\')" style="color:#2B4801;cursor:move;font-size:12px;font-weight:bold;text-align:left;">&nbsp;</td>\
							<td id="dialogClose" width="27" align="right" valign="middle">\
								' + sClose + '\
							</td>\
							<td width="6"></td>\
						</tr>\
					</table>\
				</td>\
			</tr>\
			<tr id="dialogHeight" style="height:' + height + '">\
				<td id="dialogBody" style="background:url('+context+'/img/dialog/bg_dialog.gif) left top repeat-x #FFF;">' + sBody + '</td>\
			</tr>\
		</table>\
		<div id="dialogBoxShadow" style="display:none;z-index:9;"></div>\
	';
	var sBG = '\
		<div id="dialogBoxBG" style="position:absolute;top:0px;left:0px;width:100%;height:100%;background:url('+context+'/img/blank.gif);"></div>\
	';
	function $(_sId){return document.getElementById(_sId)}
	this.show = function(){
		//this.middle('dialogBox');
		this.shadow();
		//$("dialogBoxBG").style.width = document.body.scrollWidth;
		//$("dialogBoxBG").style.height = document.body.scrollHeight;
	}
	this.reset = function(){$('dialogBox').style.display='none';$('dialogBoxBG').style.display='none';$('dialogBoxShadow').style.display = "none";$('dialogBody').innerHTML = sBody;}	
	this.ok = function(){
		this.msg=$('msgid')?$('msgid').value:'';
		this.reset();
	}
	this.html = function(_sHtml){$("dialogBody").innerHTML = _sHtml;this.show();}
	this.init = function(){
		$('dialogCase') ? $('dialogCase').parentNode.removeChild($('dialogCase')) : function(){};
		var oDiv = document.createElement('span');
		oDiv.id = "dialogCase";
		oDiv.innerHTML = sBG + sBox;
		document.body.appendChild(oDiv);
		//$('dialogMsg') ? $('dialogMsg').innerHTML = this.paras.info  : function(){};
		//alert($('dialogBoxBG').style.height);
		$('dialogBoxBG').style.height = document.body.scrollHeight;
	}
	this.button = function(_sId, _sFuc){
		if($(_sId)){
			$(_sId).style.display = '';
			if($(_sId).addEventListener){
				if($(_sId).act){$(_sId).removeEventListener('click', function(){eval($(_sId).act)}, false);}
				$(_sId).act = _sFuc;
				$(_sId).addEventListener('click', function(){eval(_sFuc)}, false);
			}else{
				if($(_sId).act){$(_sId).detachEvent('onclick', function(){eval($(_sId).act)});}
				$(_sId).act = _sFuc;
				$(_sId).attachEvent('onclick', function(){eval(_sFuc)});
			}
		}
	}
	this.shadow = function(){
		var oShadow = $('dialogBoxShadow');
		var oDialog = $('dialogBox');
		oShadow['style']['position'] = "absolute";
		oShadow['style']['background']	= "#000";
		oShadow['style']['display']	= "";
		oShadow['style']['opacity']	= "0.2";
		oShadow['style']['filter'] = "alpha(opacity=20)";		
		oShadow['style']['top'] = oDialog.offsetTop + 6;
		oShadow['style']['left'] = oDialog.offsetLeft + 6;
		oShadow['style']['width'] = oDialog.offsetWidth;
		oShadow['style']['height'] = oDialog.offsetHeight;
	}
	this.open = function(_sUrl, _sMode){
		this.show();
		if(!_sMode || _sMode == "no" || _sMode == "yes"){
			$("dialogBody").innerHTML = "<iframe width='100%' height='100%' src='" + _sUrl + "' frameborder='0' scrolling='" + _sMode + "'></iframe>";
		}
	}
	this.showWindow = function(_sUrl, _iWidth, _iHeight, _sMode, _sTitle){
		var oWindow;
		var sLeft = (screen.width) ? (screen.width - _iWidth)/2 : 0;
		
		var iTop = -40 + (document.documentElement.scrollTop + document.documentElement.clientHeight - _iHeight)/2;
		
		iTop = iTop > 0 ? iTop : (document.documentElement.scrollTop + document.documentElement.clientHeight - _iHeight)/2;
		var sTop = (document.documentElement.scrollTop + document.documentElement.clientHeight) ? iTop : 0;
		
		
		if(window.showModalDialog && _sMode == "m"){
			oWindow = window.showModalDialog(_sUrl,_sTitle,"dialogWidth:" + _iWidth + "px;dialogheight:" + _iHeight + "px");
		} else {
			oWindow = window.open(_sUrl, _sTitle, 'height=' + _iHeight + ', width=' + _iWidth + ', top=' + sTop + ', left=' + sLeft + ', toolbar=no, menubar=no, scrollbars=' + _sMode + ', resizable=no,location=no, status=no');
			this.reset();
		}
	}
	this.event = function(_sMsg, _sOk, _sCancel, _sClose){
		$('dialogFunc').innerHTML = sFunc;
		$('dialogClose').innerHTML = sClose;
		$('dialogBodyBox') == null ? $('dialogBody').innerHTML = sBody : function(){};
		
		$('dialogMsg') ? $('dialogMsg').innerHTML = _sMsg  : function(){};
		_sOk && _sOk != "" ? this.button('dialogOk', _sOk) : $('dialogOk').style.display = 'none';
		_sCancel && _sCancel != "5" ? this.button('dialogCancel', _sCancel) : $('dialogCancel').style.display = 'none';
		////_sOk ? this.button('dialogOk', _sOk) : _sOk == "" ? function(){} : $('dialogCancel').style.display = 'none';
		////_sCancel ? this.button('dialogCancel', _sCancel) : _sCancel == "" ? function(){} : $('dialogCancel').style.display = 'none';
		_sClose ? this.button('dialogBoxClose', _sClose) : function(){};
		this.show();
	}
	this.set = function(_oAttr, _sVal){
		var oShadow = $('dialogBoxShadow');
		var oDialog = $('dialogBox');
		var oHeight = $('dialogHeight');

		if(_sVal != ''){
			switch(_oAttr){
				case 'title':
					$('dialogBoxTitle').innerHTML = _sVal;
					title = _sVal;
					break;
				case 'width':
					oDialog['style']['width'] = _sVal;
					width = _sVal;
					break;
				case 'height':
					oHeight['style']['height'] = _sVal;
					height = _sVal;
					break;
				case 'src':
					if(parseInt(_sVal) > 0){
						$('dialogBoxFace') ? $('dialogBoxFace').src = path +_sVal + '.gif' : function(){};					
					}else{
						$('dialogBoxFace') ? $('dialogBoxFace').src = _sVal : function(){};
						
					}	
					src = _sVal;
					break;
				case 'msgid':
					$('msgid') ? $('msgid').value = _sVal : function(){};
					break;
				case 'readonly':
					$('msgid') ? $('msgid').readonly = _sVal : function(){};
					break;
				case 'dialogMsg':
					$('dialogMsg') ? $('dialogMsg').innerHTML = _sVal : function(){};
					break;
					
			}
		}
		this.middle('dialogBox');
		//alert(oDialog.offsetTop);
		oShadow['style']['top'] = oDialog.offsetTop + 6;
		oShadow['style']['left'] = oDialog.offsetLeft + 6;
		oShadow['style']['width'] = oDialog.offsetWidth;
		oShadow['style']['height'] = oDialog.offsetHeight;
	}
	this.get = function(_oAttr){
		var _sVal = '';
		if(_oAttr != ''){
			switch(_oAttr){
				case 'msgid':
					//alert(_oAttr);
					_sVal = document.getElementById('msgid').value;
					break;
			}
		} 
		return _sVal;
	}
	this.moveStart = function (event, _sId){
		var oObj = $(_sId);
		oObj.onmousemove = mousemove;
		oObj.onmouseup = mouseup;
		oObj.setCapture ? oObj.setCapture() : function(){};
		oEvent = window.event ? window.event : event;
		var dragData = {x : oEvent.clientX, y : oEvent.clientY};
		var backData = {x : parseInt(oObj.style.top), y : parseInt(oObj.style.left)};
		function mousemove(){
			var oEvent = window.event ? window.event : event;
			var iLeft = oEvent.clientX - dragData["x"] + parseInt(oObj.style.left);
			var iTop = oEvent.clientY - dragData["y"] + parseInt(oObj.style.top);
			oObj.style.left = iLeft;
			oObj.style.top = iTop;
			$('dialogBoxShadow').style.left = iLeft + 6;
			$('dialogBoxShadow').style.top = iTop + 6;
			dragData = {x: oEvent.clientX, y: oEvent.clientY};
			
		}
		function mouseup(){
			var oEvent = window.event ? window.event : event;
			oObj.onmousemove = null;
			oObj.onmouseup = null;
			if(oEvent.clientX < 1 || oEvent.clientY < 1 || oEvent.clientX > document.body.clientWidth || oEvent.clientY > document.body.clientHeight){
				oObj.style.left = backData.y;
				oObj.style.top = backData.x;
				$('dialogBoxShadow').style.left = backData.y + 6;
				$('dialogBoxShadow').style.top = backData.x + 6;
			}
			oObj.releaseCapture ? oObj.releaseCapture() : function(){};
		}
	}
	this.hideModule = function(_sType, _sDisplay){
		var aIframe = parent.document.getElementsByTagName("iframe");aIframe=0;
		var aType = document.getElementsByTagName(_sType);
		var iChildObj, iChildLen;
		for (var i = 0; i < aType.length; i++){
			aType[i].style.display	= _sDisplay;
		}
		for (var j = 0; j < aIframe.length; j++){
			iChildObj = document.frames ? document.frames[j] : aIframe[j].contentWindow;
			iChildLen = iChildObj.document.body.getElementsByTagName(_sType).length;
			for (var k = 0; k < iChildLen; k++){
				iChildObj.document.body.getElementsByTagName(_sType)[k].style.display = _sDisplay;
			}
		}
	}
	
	//将窗口固定在中间
	this.middle = function(_sId){
		/*
		var sClientWidth = parent ? parent.document.documentElement.clientWidth : document.documentElement.clientWidth;
		var sClientHeight = parent ? parent.document.documentElement.clientHeight : document.documentElement.clientHeight;
		var sScrollTop = parent ? parent.document.documentElement.scrollTop : document.documentElement.scrollTop;
		*/
		var sClientWidth = document.documentElement.clientWidth;
		var sClientHeight = document.documentElement.clientHeight;
		var sScrollTop =  document.documentElement.scrollTop;
		$(_sId)['style']['display'] = '';
		$(_sId)['style']['position'] = "absolute";
		$(_sId)['style']['left'] = (document.documentElement.clientWidth / 2) - ($(_sId).offsetWidth / 2);
		var sTop = -40 + (sClientHeight / 2 + sScrollTop) - ($(_sId).offsetHeight / 2);	
		
		//sTop = sTop > 0 ? sTop : (sClientHeight / 2 + sScrollTop) - ($(_sId).offsetHeight / 2);	
		
		$(_sId)['style']['top'] = (sTop < 200 ? 200 : sTop);
		
	}
}

function _error_msg_show(msg, click, icon, title)
{
    click = click ? click : ' ';
    icon = icon ? icon : '';
    title = title ? title : '【系统提示信息】';
    
    switch (icon)
    {
    case 'forbid':
        icon = 1;
        break;

    case 'succ':
        icon = 2;
        break;

    case 'smile':
        icon = 3;
        break;

    case 'forget':
        icon = 4;
        break;

    case 'sorry':
        icon = 5;
        break;

    case 'care':
        icon = 6;
        break;

    case '':
        icon = 5;
        break;
    }
    title = '<span class=MenuWhite>'+title+'</span>';
    dg=new dialog();
    dg.init();
    dg.set('src', icon);
    dg.set('title', title);
    dg.event(msg, click, icon, click);
}

function _win_error_msg_show(msg, click, icon, top, left, width, height)
{
    click = click ? click : ' ';
    icon = icon ? icon : '';
    title = '【系统提示信息】';
    top = top ? top : 40;
    switch (icon)
    {
    case 'forbid':
        icon = 1;
        break;

    case 'succ':
        icon = 2;
        break;

    case 'smile':
        icon = 3;
        break;

    case 'forget':
        icon = 4;
        break;

    case 'sorry':
        icon = 5;
        break;

    case 'care':
        icon = 6;
        break;

    case '':
        icon = 5;
        break;
    }
    title = '<span class=MenuWhite>'+title+'</span>';
    dg=new dialog();
    dg.init();

    dg.set('src', icon);

    dg.set('title', title);
	
    if (width)
    {
        dg.set('width', width);
    }
    if (height)
    {
        dg.set('height', height);
    }

    dg.event(msg, click, icon, click);

	
    if (left)
    {
         document.getElementById('dialogBox')['style']['left'] = left;
         document.getElementById('dialogBoxShadow')['style']['left'] = left;
    }
    if (top)
    {
	 document.getElementById('dialogBox')['style']['top'] = top;
	 document.getElementById('dialogBoxShadow')['style']['top'] = top;
    }

}

function _confirm_msg_show(msg, click_ok, click_no, title)
{
    click_ok = click_ok ? click_ok : ' ';
    click_no = click_no ? click_no : ' ';
    title = title ? title : '【系统提示信息】';

    title = '<span class=MenuWhite>'+title+'</span>';
    dg=new dialog("progress");
    dg.init();
    dg.set('src', 6);	// smile
    dg.set('title', title);
    
}

function _win_confirm_msg_show(msg, click_ok, click_no, top, left, width, height)
{
    click_ok = click_ok ? click_ok : ' ';
    click_no = click_no ? click_no : ' ';
    title = '【系统提示信息】';
    top = top ? top : 40;
    title = '<span class=MenuWhite>'+title+'</span>';
    
    dg=new dialog();
    dg.init();
    dg.set('src', 6);   // smile
    dg.set('title', title);

    if (width)
    {
        dg.set('width', width);
    }
    if (height)
    {
        dg.set('height', height);
    }

    //dg.event(msg, click_ok, click_no, click_no);

    if (left)
    {
         document.getElementById('dialogBox')['style']['left'] = left;
         document.getElementById('dialogBoxShadow')['style']['left'] = left;
    }
    if (top)
    {
         document.getElementById('dialogBox')['style']['top'] = top;
         document.getElementById('dialogBoxShadow')['style']['top'] = top;
    }
}

var dg;

function _edit_msg_show(title, parentMsgTextId, readonly, click_ok)
{
    click_ok = click_ok ? click_ok : '_edit_msg_show_ok()';
    click_no = ' ';
    click_oktitle : '【系统提示信息】';

    title = '<span class=MenuWhite>'+title+'</span>';
    dg=new dialog("optioin");
    dg.init();
    dg.set('src', 6);	// smile
    dg.set('title', title);	
	dg.set('msgid', document.getElementById(parentMsgTextId).value);
	dg.set('readonly', readonly);
	dg.paras = parentMsgTextId;
	
    dg.event(document.getElementById(parentMsgTextId).value, click_ok, click_no, click_no);   
   // alert("dg.paras:" + dg.paras); 
}

function _edit_msg_show_ok(){
	//alert(dg.paras);
	document.getElementById(dg.paras).value = dg.msg;
}

function _show_msg_ok(title,content,readonly,click_ok){

	click_ok = click_ok ? click_ok : '_edit_msg_show_ok()';
    click_no = ' ';
    click_oktitle : '【系统提示信息】';

    title = '<span class=MenuWhite>'+title+'</span>';
    dg=new dialog("optioin");
    dg.init();
    dg.set('src', 6);	// smile
    dg.set('title', title);	
	dg.set('msgid', content);
	dg.set('readonly', readonly);
	dg.event(content, click_ok, click_no, click_no);    
    
}

