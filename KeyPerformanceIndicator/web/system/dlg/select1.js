// JavaScript Document
// 模拟下拉
// Author:Daviv
// Date 2007-8-29
	var isSelectShow=false;
	var arrTime = new Array();
	var arrWhere = new Array();
	var arrType = new Array();
	var arrBoss = new Array();
	arrTime=["1:00","1:30","2:00","2:30","3:00","3:30","4:00","4:30","5:00","5:30","6:00","6:30","7:00"];
	arrWhere=["12楼会议室","大礼堂","广州电信15楼办公室楼办公室","待定"];
	arrType=["会议","外出","其他"];
	arrBoss=["陈德兴","梁锋","赵奇禄","姚木青","孙粤江"];

	var iDiv = document.createElement("div");
		iDiv.id="divForSelect";
		iDiv.style.position = "absolute";
		iDiv.style.background="white";
		iDiv.style.border="1px solid gray";
		iDiv.style.fontSize="12px";
		iDiv.style.textIndent="4px";
		iDiv.style.display="none";
	document.body.appendChild(iDiv);


function createSelect(obj,isadd){
				if (iDiv.getElementsByTagName("ul").length>0)
			{
				iDiv.removeChild(iDiv.getElementsByTagName("ul")[0]);
			}
	var offset=Offset(obj);
	iDiv.style.top=(offset.top+offset.height) + "px";
	iDiv.style.left=offset.left + "px";
	iDiv.style.width=(offset.width-2) + "px";
	iDiv.style.display="";
	isSelectShow=true;

	var uUl = document.createElement("ul");
			uUl.id="uUlchild" + obj.name;
			uUl.style.listStyle="none";
			uUl.style.margin="0";
			uUl.style.padding="0";
			uUl.style.fontSize="12px";
			iDiv.appendChild(uUl);
			LoadLiValue(obj.name)
			var liObj=document.getElementById("uUlchild" + obj.name).getElementsByTagName("li");
			for (var j=0;j<liObj.length;j++){
				//为li标签添加鼠标事件
				liObj[j].onmouseover=function(){					
					this.style.background="#626F77";
					this.style.color="white";
					this.style.textIndent="5px";
					this.style.fontWeight="bold";
				}
				liObj[j].onmouseout=function(){
					this.style.background="#8D9FAB";
					this.style.color="white";
					this.style.textIndent="3px";
					this.style.fontWeight="normal";
				}
				liObj[j].onclick=function(){
					this.style.background="#626F77";
					this.style.color="yellow";
					setInputValue(obj,this.innerHTML,isadd);
					deleteSelect();
				}
			}
}

function deleteSelect(){
	if (document.getElementById("divForSelect")){
		var obj=document.getElementById("divForSelect");
			if (obj.getElementsByTagName("ul").length>0)
			{
				obj.removeChild(obj.getElementsByTagName("ul")[0]);
			}
			
			obj.style.display="none";
	}
}
function setInputValue(tObj,tTxt,tAdd){
	if (tAdd)
	{
		if (tObj.value=="")
		{
			tObj.value=tTxt;
		}else{
			var t=new Array();
			var tflag=false;
			t=tObj.value.split(",");
			for (var i=0;i<t.length ;i++ )
			{
				if (t[i]==tTxt)
				{
					tflag=true;
				}
			}
			if (!tflag)
			{
				tObj.value+="," + tTxt;
			}
			
		}
	}else{
		tObj.value=tTxt;
	}

}
function LoadLiValue(tag){
	var arr=new Array();
	switch(tag.toUpperCase())
		{
			case "btime".toUpperCase() :
				arr=arrTime;
				break;
			case "etime".toUpperCase() :
				arr=arrTime;
				break;
			case "ewhere".toUpperCase() :
				arr=arrWhere;
				break;
			case "enote".toUpperCase() :
				arr=arrType;
				break;
			case "epeople".toUpperCase():
				arr=arrBoss;
				break;
			default:
		
		}

	for (var i=0;i<arr.length;i++){
		var lLi=document.createElement("li");
		lLi.id="aa" + i;
		lLi.style.textIndent="4px";
		lLi.style.height="20px";
		lLi.style.lineHeight="20px";
		lLi.style.cursor="pointer";
		lLi.style.background="#8D9FAB";
		lLi.style.color="white";
		lLi.style.textAlign="left";
		lLi.style.textIndent="3px";
		lLi.innerHTML=arr[i];
		document.getElementById("uUlchild" + tag).appendChild(lLi);
	}
}