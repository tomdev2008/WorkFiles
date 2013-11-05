

function initTables(){
	var trs = document.getElementsByTagName("tr");
	
	for(var i=0; i<trs.length; i++){
		var tr = trs[i];
		
		if(tr.tableClass == "KPITableHeader"){
			var tds = tr.children;
			for(var j=0; j<tr.children.length; j++){alert(j)
				var td = tr.children[j];
				td.ondblclick = setMinWidthForTd;
				td.onmousedown = new Function("MouseDownResizeTd(this)");
			}
			
		}
	}
	
	//设置表格的间隔行颜色
	var tables = document.getElementsByTagName("table");
	for(var i=0; i<tables.length; i++){
		var table = tables[i];
		if(table.tableClass == "KPITable"){
			for(var j=1; j<table.rows.length; ){
				var tr = table.rows[j];
				tr.className="trclass";
				j = j+2;
			}

		}
	}
}

/**
* 动态改变列宽度的代码
* 作者：黑旋风（QQ：23929003 EMAIL:lewclear97@163.com）
* 版权没有，随便拷贝、修改，不过希望大家能把改后的代码发给我一份，互相学习，谢谢
*/
var ListTitleTdStartX=null;//记录鼠标按下时的X坐标
var ListTitleTdStartWidth=0;//记录所在td在鼠标按下时的宽度
var ListTableStartWidth=0;//记录整个table的宽度
var MouseIsDown=false;//表示是否处于鼠标按下状态
var ListTableResizeTd=null;//记录所操作的td对象
var ListResizeLine=null;
/**
*鼠标按下时触发的事件
*其作用主要是记录所需部件的初始值
*/
function MouseDownResizeTd(obj){
  if(event.srcElement.id!="resizehead"){
   return;
  }
  allleft=event.srcElement.offsetLeft+obj.parentElement.parentElement.parentElement.offsetLeft;
  if(setOperatorTd(obj,allleft)){//设置操作的td
   ListResizeDiv=ListTableResizeTd.parentElement.parentElement.parentElement;//外层div
   ListTitleTdStartX=event.x;  //记录初始值
   ListTitleTdStartWidth=parseInt(obj.clientWidth);
   ListTableStartWidth=parseInt(ListTableResizeTd.parentElement.parentElement.parentElement.clientWidth)
   MouseIsDown=true; 
   ListResizeLine=document.createElement("div");
   ListResizeLine.className='aline';
   document.body.appendChild(ListResizeLine);
   ListResizeLine.style.height=ListResizeDiv.offsetHeight
   ListResizeLine.style.left=document.body.scrollLeft+event.x-2;
   ListResizeLine.style.top=ListResizeDiv.offsetTop;
   ListTableResizeTd.setCapture();
  }
}
/**
* 判断哪个才是所要操作的td
* 成功获得返回true，否则返回false
*/
function setOperatorTd(obj,allleft){
 if(event.x-allleft<3){//如果按到的是下一个td
    tableobj=obj.parentElement.parentElement.parentElement;
    for(var i=0;i<tableobj.rows.length;i++){     
     if(tableobj.rows[0].cells[i]==obj){
      if(i==0)return false;
      ListTableResizeTd=tableobj.rows[0].cells[i-1];
      return true;
     }
    }
  }else{
   ListTableResizeTd=obj;
   return true;
  }
}
/**
*双击设置最合适宽度
*/
function setMinWidthForTd(){
 ListTableResizeTd.style.width='20px'
}
/**
*鼠标松开将一切参数还原
*/
function document.onmouseup(){
  if(MouseIsDown){
  width=event.x-ListTitleTdStartX;
  if(Math.abs(width)>2&&width+ListTitleTdStartWidth>0){
   ListTableResizeTd.style.width=ListTitleTdStartWidth+width;
   ListTableResizeTd.parentElement.parentElement.parentElement.style.width=ListTableStartWidth+width;
  }
  //参数全部还原
  ListTitleTdStartX=null;
  ListTitleTdStartWidth=0;
  ListTableStartWidth=0;
   MouseIsDown=false;
   document.body.removeChild(ListResizeLine);
 }
 if(ListTableResizeTd!=null){
   ListTableResizeTd.releaseCapture();
 }
}
/*
*鼠标移动时改变td及所在table的宽度
*/
function document.onmousemove(){
 if(MouseIsDown){
  ListResizeLine.style.left=document.body.scrollLeft+event.x-2;
 }
}

