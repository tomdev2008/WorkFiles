function openurl(url){
	clearDivSch();
	window.open(url,"new","width=600,hotkeys=0,menubar=0,resizable=1,scrollbars=1");
}
function gotourl(url){
	window.location.href=url;	
}
function showObj(objId){

	var treeObj=document.getElementById("conmenu").getElementsByTagName("dt");
	
	for(var i=0;i<treeObj.length;i++){
		document.getElementById("conmenu").getElementsByTagName("dd")[i].className="";
	}
	document.getElementById("conmenu").getElementsByTagName("dd")[objId].className="h";
}
function showObj2(objId){
	clearDivSch();
	var treeObj=document.getElementById("tblsch").getElementsByTagName("dt");
	
	for(var i=0;i<treeObj.length;i++){
		document.getElementById("tblsch").getElementsByTagName("dd")[i].className="";
		document.getElementById("tblsch").getElementsByTagName("dt")[i].className="";
	}
	document.getElementById("tblsch").getElementsByTagName("dd")[objId].className="h";
	document.getElementById("tblsch").getElementsByTagName("dt")[objId].className="h";
}

function showObj3(objId){
	var iLeft,iTop;
	var obj=document.getElementById("divAddSch");
	var pObj=document.getElementById(objId);
	var offset=Offset(pObj);
	obj.style.display="block";
	
	if ((offset.left+300) > 980){
		iLeft=offset.left-295;
	}else{
		iLeft=offset.left+5;
	}
	if (offset.top+200 > document.body.clientHeight){
		iTop=offset.top - 195;
	}else{
		iTop=offset.top + 5;
	}
	obj.style.left=iLeft + "px";
	obj.style.top=iTop + "px";
	obj.innerHTML="<h6><span>锟斤拷锟斤拷</span><img src='../img/iconClose.gif' alt='' onclick='clearDivSch();' /></h6><div>" + objId + "锟斤拷锟秸程帮拷锟斤拷锟斤拷息锟斤拷锟轿硷拷锟斤拷锟斤拷摹ay锟斤拷锟斤拷锟介。</div><div class='c'><input type='button' value='锟睫革拷' class='edit' onclick=openurl('editsch.html'); /><input type='button' value='删锟斤拷' class='del' onclick=openurl('delsch.html'); /><input type='button' value='锟斤拷锟斤拷' class='add' onclick=openurl('addsch.html'); /></div>";

}
function clearDivSch(){
if (document.getElementById("divAddSch")){
			var obj=document.getElementById("divAddSch");
			obj.style.display="none";
			//document.body.removeChild(obj);
	}
}
function Offset(e)
//取锟斤拷签锟侥撅拷锟轿伙拷锟�
{
	var t = e.offsetTop;
	var l = e.offsetLeft;
	var w = e.offsetWidth;
	var h = e.offsetHeight-2;

	while(e=e.offsetParent)
	{
		t+=e.offsetTop;
		l+=e.offsetLeft;
	}
	return {
		top : t,
		left : l,
		width : w,
		height : h
	}
}

window.onload=function init(){
//锟斤拷锟�800锟斤拷锟铰分憋拷锟绞帮拷式锟斤拷锟斤拷

//OA系统锟斤拷锟剿碉拷锟脚憋拷
	if (document.getElementById("conmenu"))
	{
		var treeObj=document.getElementById("conmenu").getElementsByTagName("dt");
		for(var i=0;i<treeObj.length;i++){
			//treeObj[i].setAttribute('onclick','showObj(' + i + ');');
			treeObj[i].id=i;
		}
		//锟铰边碉拷锟斤拷锟窖拷锟斤拷歉锟絀E锟矫碉拷
		for(var i=0;i<treeObj.length;i++){
			treeObj[i].onclick=function(){
				showObj(this.id);
			}
		}
	}

	if (document.getElementById("tblsch"))
	{
		//锟秸程帮拷锟脚碉拷锟桔碉拷效锟斤拷
		var treeObj=document.getElementById("tblsch").getElementsByTagName("dt");
		for(var i=0;i<treeObj.length;i++){
			//treeObj[i].setAttribute('onclick','showObj2(' + i + ');');
			treeObj[i].id=i;
		}
		for(var i=0;i<treeObj.length;i++){
			treeObj[i].onclick=function(){
				showObj2(this.id);
			}
		}

		var iDiv=document.createElement("div");
		iDiv.setAttribute("id","divAddSch");
		iDiv.innerHTML="锟斤拷锟节硷拷锟斤拷锟斤拷细锟斤拷息...";
		document.body.appendChild(iDiv);
		//锟铰斤拷Div锟斤拷示锟斤拷细锟斤拷锟斤拷
		var tdObj=document.getElementById("tblsch").getElementsByTagName("td");
		for(var i=0;i<tdObj.length;i++){
			//tdObj[i].setAttribute('onmouseover','showObj3(td + ' + i + ');');
			tdObj[i].id="td" + i;
		}
		//锟铰边碉拷锟斤拷锟窖拷锟斤拷歉锟絀E锟矫碉拷
		for(var i=0;i<tdObj.length;i++){
			tdObj[i].onmouseover=function(){
				if(this.className=="tdclass2"){
					return false;
				}else{
					tId=this.id;
					waitInterval=window.setTimeout("showObj3(tId);",500);
				}
			}
			tdObj[i].onmouseout=function(){
				if (waitInterval) {
					clearTimeout(waitInterval);
					}
				
			}
		}		
	}



}

	document.onclick = function hidecal2 () { 	
		if (typeof(bShow)!="undefined")
		{
			if (!bShow)
			{
				hideCalendar();
			}
			bShow = false;
		}
		if (typeof(isSelectShow)!="undefined")
		{
			if (!isSelectShow)
			{
				deleteSelect();
			}
			isSelectShow=false;
		}
		if (typeof(isDownListShow)!="undefined")
		{
		    if (!isDownListShow){
		        deleteDownList();
		    }
		    isDownListShow=false;
		}
	}
	//锟斤拷锟斤拷页锟斤拷锟叫★拷锟接frame
	function bodyResize(){
		window.parent.document.getElementById("f").getElementsByTagName("iframe")[0].style.height=document.body.offsetHeight;
	}

	function showChildTd(obj){
					var b,e;
					for (var i=0;i<obj.parentNode.parentNode.getElementsByTagName("tr").length;i++){
						if (obj.parentNode.parentNode.getElementsByTagName("tr")[i]==obj.parentNode){
							b=i;
						}
					}
					for (var i=b+1;i<obj.parentNode.parentNode.getElementsByTagName("tr").length;i++){
						if (obj.parentNode.parentNode.getElementsByTagName("tr")[i].className=="menuTitle"){
							e=i-1;
						}
					}
					if (typeof(e)=="undefined"){
						e=obj.parentNode.parentNode.getElementsByTagName("tr").length-1;
					}
					
					if (obj.parentNode.parentNode.getElementsByTagName("tr")[b+1].className=="hidden"){
						//obj.style.backgroundImage="url(../img/iconDown.gif)";
						obj.className="iconDown";
						setControl(obj.nextSibling,true);
						for (var i=b;i<e;i++){
							obj.parentNode.parentNode.getElementsByTagName("tr")[i+1].className="";
						}
					}else{
						setControl(obj.nextSibling,false);
						//obj.style.backgroundImage="url(../img/iconRight.gif)";
						obj.className="iconRight";
						for (var i=b;i<e;i++){
								obj.parentNode.parentNode.getElementsByTagName("tr")[i+1].className="hidden";
							}
					}
					//锟斤拷锟铰碉拷锟斤拷页锟斤拷
					//bodyResize();
					setPHeight();
				}
				function loadSelectAction(tblName){
					var tbl=document.getElementById(tblName);
					var chk = tbl.getElementsByTagName("input");
					for (var i=0;i<chk.length;i++){
						if (chk[i].type=="checkbox"){
							chk[i].onclick=function(){
								if(this.checked){
									this.parentNode.parentNode.style.background="#FFC";	
								}else{
									this.parentNode.parentNode.style.background="white";
								}
							}
						}
					}
				}
				function selectAll(obj){
					var b,e;
					b=tdOffset(obj).begin;
					e=tdOffset(obj).end;

					var tblObj=obj.parentNode.parentNode.parentNode.parentNode;
					var chkObj=tblObj.getElementsByTagName("input");
					var tdObj=tblObj.getElementsByTagName("td");

					for (var i=b;i<e;i++){
						tblObj.getElementsByTagName("tr")[i].style.background="#FFC";
						tblObj.getElementsByTagName("tr")[i].getElementsByTagName("input")[0].checked=true;
					}
				}
				function unSelectAll(obj){
					var b,e;
					b=tdOffset(obj).begin;
					e=tdOffset(obj).end;

					var tblObj=obj.parentNode.parentNode.parentNode.parentNode;
					var chkObj=tblObj.getElementsByTagName("input");
					var tdObj=tblObj.getElementsByTagName("td");

					for (var i=b;i<e;i++){
						tblObj.getElementsByTagName("tr")[i].style.background="white";
						tblObj.getElementsByTagName("tr")[i].getElementsByTagName("input")[0].checked=false;
					}
				}
				function selectOther(obj){
					var b,e;
					b=tdOffset(obj).begin;
					e=tdOffset(obj).end;

					var tblObj=obj.parentNode.parentNode.parentNode.parentNode;
					var chkObj=tblObj.getElementsByTagName("input");
					var tdObj=tblObj.getElementsByTagName("td");

					for (var i=b;i<e;i++){
					
						if(tblObj.getElementsByTagName("tr")[i].getElementsByTagName("input")[0].checked==false){
							tblObj.getElementsByTagName("tr")[i].getElementsByTagName("input")[0].checked=true;
							tblObj.getElementsByTagName("tr")[i].style.background="#FFC";
						}else{
							tblObj.getElementsByTagName("tr")[i].getElementsByTagName("input")[0].checked=false;
							tblObj.getElementsByTagName("tr")[i].style.background="white";
						}
					}
				}
				//锟斤拷锟饺★拷锟斤拷锟窖★拷裙锟斤拷锟�
				function setControl(obj,flag){
					if(obj && obj.className == 'c') {
						if (flag){
						obj.innerHTML='閫夋嫨锛�<a href="javascript:void(0);" onclick="selectAll(this);">鍏ㄩ儴</a> <a href="javascript:void(0);" onclick="selectOther(this);">鍙嶉��</a> <a href="javascript:void(0);" onclick="unSelectAll(this);">涓嶉��</a>';
						}else{
							obj.innerHTML="";
						}
					}					
				}
				function tdOffset(obj)
				//OA锟斤拷页选锟斤拷位锟斤拷
				{
					var b,e;
					for (var i=0;i<obj.parentNode.parentNode.parentNode.getElementsByTagName("tr").length;i++){
					
						if (obj.parentNode.parentNode.parentNode.getElementsByTagName("tr")[i]==obj.parentNode.parentNode){
							b=i;
						}
					}
					for (var i=b+1;i<obj.parentNode.parentNode.parentNode.getElementsByTagName("tr").length;i++){
						if (obj.parentNode.parentNode.parentNode.getElementsByTagName("tr")[i].className=="menuTitle"){
							e=i-1;
						}
					}
					if (typeof(e)=="undefined"){
						e=obj.parentNode.parentNode.parentNode.getElementsByTagName("tr").length-1;
					}
					return {
						begin : b+1,
						end:	e+1
					}
				}
				//前锟斤拷锟斤拷锟斤拷
				function tblWordSort(obj){

				}
function TblColor(tblId,cssClass){
	var classArrye = new Array();
	var tblObj=document.getElementById(tblId);
	var trObj=tblObj.getElementsByTagName("tr");
	for (var i=0;i<trObj.length;i++){
		trObj[i].id=i;
		classArrye[i]=trObj[i].className;
	}
	var tdObj=tblObj.getElementsByTagName("td");
	for (var i=0;i<tdObj.length;i++){
		tdObj[i].onmouseover=function(){
			this.parentNode.className=cssClass;

		}
		tdObj[i].onmouseout=function(){
			this.parentNode.className=classArrye[this.parentNode.id];
		}
	}

}

function SelectAllCheckboxes(spanChk){
  // Added as ASPX uses SPAN for checkbox

  var oItem = spanChk.children;
  var theBox= (spanChk.type=="checkbox") ? spanChk : spanChk.children.item[0];
  xState=theBox.checked;
  elm=theBox.form.elements;

  for(i=0;i<elm.length;i++)
    if(elm[i].type=="checkbox" && elm[i].id!=theBox.id){
       //elm[i].click();
       if(elm[i].checked!=xState)
         elm[i].click();
       //elm[i].checked=xState;
    }
}
