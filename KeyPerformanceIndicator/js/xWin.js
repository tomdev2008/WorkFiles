/**
 * 原作者是 51windows.net的某位不认识的人
 */
var x0=0,y0=0,x1=0,y1=0;
var offx=0,offy=0;
var dragable=true, moveable=false;
var hover='orange',normal='#336699';//color;
var index=10000;//z-index;
//开始拖动;
function startDrag(obj)
{
	if(dragable && event.button==1)
	{
		//锁定标题栏;
		obj.setCapture();
		//定义对象;
		var win = obj.parentNode;
		var sha = win.nextSibling;
		//记录鼠标和层位置;
		x0 = event.clientX;
		y0 = event.clientY;
		x1 = parseInt(win.style.left);
		y1 = parseInt(win.style.top);
		//记录颜色;
		normal = obj.style.backgroundColor;
		//改变风格;
		obj.style.backgroundColor = hover;
		win.style.borderColor = hover;
		obj.nextSibling.style.color = hover;
		sha.style.left = x1 + offx;
		sha.style.top  = y1 + offy;
		moveable = true;
	}
}
//拖动;
function drag(obj)
{
	if(dragable && moveable)
	{
		var win = obj.parentNode;
		var sha = win.nextSibling;
		win.style.left = x1 + event.clientX - x0;
		win.style.top  = y1 + event.clientY - y0;
		sha.style.left = parseInt(win.style.left) + offx;
		sha.style.top  = parseInt(win.style.top) + offy;
	}
}


//停止拖动;
function stopDrag(obj)
{
	if(dragable && moveable)
	{
		var win = obj.parentNode;
		var sha = win.nextSibling;
		var msg = obj.nextSibling;
		win.style.borderColor     = normal;
		obj.style.backgroundColor = normal;
		msg.style.color           = normal;
		sha.style.left = obj.parentNode.style.left;
		sha.style.top  = obj.parentNode.style.top;
		obj.releaseCapture();
		moveable = false;
	}
}
//获得焦点;
function getFocus(obj)
{
	if(dragable && obj.style.zIndex!=index)
	{
		index = index + 2;
		var idx = index;
		obj.style.zIndex=idx;
		obj.nextSibling.style.zIndex=idx-1;
	}
}
//最小化;
function min(obj)
{
	var win = obj.parentNode.parentNode;
	var sha = win.nextSibling;
	var tit = obj.parentNode;
	var msg = tit.nextSibling;
	var flg = msg.style.display=="none";
	if(flg)
	{
		win.style.height  = parseInt(msg.style.height) + parseInt(tit.style.height) + 2*2;
		sha.style.height  = win.style.height;
		msg.style.display = "block";
		obj.innerHTML = "0";
	}
	else
	{
		win.style.height  = parseInt(tit.style.height) + 2*2;
		sha.style.height  = win.style.height;
		obj.innerHTML = "2";
		msg.style.display = "none";
	}
}
//创建一个对象;
function xWin(id,w,h,l,t,tit,msg,formid)
{
	index = index+2;
	this.id      = id;
	this.width   = w;
	this.height  = h;
	this.left    = l;
	this.top     = t;
	this.zIndex  = index;
	this.title   = tit;
	this.message = msg;
	this.obj     = null;
	this.formid  = formid;
	this.bulid   = bulid;
	this.bulid();
}
//初始化;
function bulid()
{
	var str = ""
		+ "<div id=xMsg" + this.id + " "
		+ "style='"
		+ "text-align:left;"
		+ "z-index:" + this.zIndex + ";"
		+ "width:" + this.width + ";"
		+ "height:" + this.height + ";"
		+ "left:" + this.left + ";"
		+ "top:" + this.top + ";"
		+ "background-color:" + normal + ";"
		+ "color:" + normal + ";"
		+ "font-size:8pt;"
		+ "font-family:Tahoma;"
		+ "position:absolute;"
		+ "display:none;"
		+ "cursor:default;"
		+ "border:2px solid " + normal + ";"
		+ "' "
		+ "onmousedown='getFocus(this)'>"
			+ "<div "
			+ "style='"
			+ "background-color:" + normal + ";"
			+ "width:" + (this.width-2*2) + ";"
			+ "height:20;"
			+ "color:white;"
			+ "' "
			+ "onmousedown='startDrag(this)' "
			+ "onmouseup='stopDrag(this)' "
			+ "onmousemove='drag(this)' "
			//+ "ondblclick='min(this.childNodes[1])'"
			+ ">"
				+ "<span style='width:" + (this.width-36) + ";padding-left:3px;float:left;'>" + this.title + "</span>"
				//+ "<span style='width:12;border-width:0px;color:white;font-family:webdings;' onclick='min(this)'>0</span>"
				+ "<span style='width:24;border-width:0px;color:yellow;float:right;cursor:hand;' title='点击关闭提示窗口' onclick='ShowHide(\""+this.id+"\",null)'>确定</span>"
			+ "</div>"
				+ "<div style='"
				+ "width:100%;"
				+ "height:" + (this.height-20-4) + ";"
				+ "background-color:white;"
				+ "line-height:14px;"
				+ "word-break:break-all;"
				+ "padding:3px;"
				+ "'>" + this.message + "</div>"
		+ "</div>"
		+ "<div id=xMsg" + this.id + "bg style='"
		+ "width:" + this.width + ";"
		+ "height:" + this.height + ";"
		+ "top:" + this.top + ";"
		+ "left:" + this.left + ";"
		+ "z-index:" + (this.zIndex-1) + ";"
		+ "position:absolute;"
		+ "display:none;"
		+ "background-color:black;"
		+ "filter:alpha(opacity=40);"
		+ "'></div>";
	document.getElementById(this.formid).insertAdjacentHTML("beforeEnd",str);
}
//显示隐藏窗口
function ShowHide(id,dis){
	var bdisplay = (dis==null)?((document.getElementById("xMsg"+id).style.display=="")?"none":""):dis
	document.getElementById("xMsg"+id).style.display = bdisplay;
	document.getElementById("xMsg"+id+"bg").style.display = bdisplay;
}

function Show(id,dis){
	var bdisplay = (dis==null)?((document.getElementById("xMsg"+id).style.display=="")?"none":""):dis;
	document.getElementById("xMsg"+id).style.display = bdisplay;
	document.getElementById("xMsg"+id+"bg").style.display = bdisplay;
	var win = document.getElementById("xMsg"+id);
	var sha = win.nextSibling;
	win.style.left = event.clientX - 10;
	win.style.top  = event.clientY + 10;
	sha.style.left = parseInt(win.style.left) + offx;
	sha.style.top  = parseInt(win.style.top) + offy;
}

function ShowBeside(id,dis){
	var bdisplay = (dis==null)?((document.getElementById("xMsg"+id).style.display=="")?"none":""):dis
	document.getElementById("xMsg"+id).style.display = bdisplay;
	document.getElementById("xMsg"+id+"bg").style.display = bdisplay;
	var win = document.getElementById("xMsg"+id);
	var sha = win.nextSibling;
	win.style.left = event.clientX - 10;
	win.style.top  = event.clientY + 10;
	sha.style.left = parseInt(win.style.left) + offx;
	sha.style.top  = parseInt(win.style.top) + offy;
}

//modify by haiwa @ 2005-7-14 
//http://www.51windows.Net