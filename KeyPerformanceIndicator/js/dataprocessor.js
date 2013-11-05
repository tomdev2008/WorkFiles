////////////////////////////////////////////////////////////////////////////////
   /*
	*--------------- 页面提示框-----------------
	* 功能:页面弹出提示消息，同时屏蔽整个页面,只是简单的屏蔽层，页面上出现正在处理样式文字
	* 使用:
	*/
///////////////////////////////////////////////////////////////////////////////////
 var ifm=null; 
 var win=null; 
 var processor_title = "正在处理数据，请稍侯......";
function showProcessor(title){
	if(title) processor_title = title;
	initFrame();
}
function initFrame(title){
 	if(ifm==null){
   		ifm=document.createElement("<iframe allowTransparency='true' id='popframe' frameborder=0 marginheight=0 src='about:blank' marginwidth=0 hspace=0 vspace=0 scrolling=no></iframe>")
  		//iframe边界不能做修改，否则会使页面上半部分不能屏蔽
   		ifm.style.width=document.body.scrollWidth;
   		ifm.style.height=document.body.scrollHeight;
   		ifm.style.position="absolute";
   		ifm.style.left=0;
   		ifm.style.top=document.body.scrollTop;
   		ifm.name=ifm.uniqueID;
   		document.body.appendChild(ifm);
  	}else{
   		ifm.style.top=document.body.scrollTop;
   		ifm.style.visibility="visible";
  	}
  	win=window.frames[ifm.name];
  	win.document.write("<body leftmargin=0 topmargin=0 oncontextmenu='self.event.returnValue=false'>"+
  	"<div id=popbg></div><div id=popbody style='margin-top:50px;'>"+
  	"<center><img src='"+context+"/images/loading.gif'/>"+processor_title+"</center></div></body>");
 	win.document.body.style.backgroundColor="transparent";
  	
  	document.body.style.overflow="hidden";
  
  	var pBody=win.document.body.children[1];
  	var pBg=win.document.body.children[0];
  	hideAllSelect();
  	with(pBg.style){
	   position="absolute";   
	   left="0";
	   top="0";
	   width="100%";
	   height="100%";
	   visibility="hidden";
	   backgroundColor="#ffffff";
	   filter="blendTrans(duration=1) alpha(opacity=60)";
  	}
  	pBg.style.visibility="visible";
  	 with(pBody.style){
	   position="absolute";
	   left = parseFloat(ifm.style.width)/2-100;
	   top = parseFloat(ifm.style.height)/2-100;
	   backgroundColor="#ffffff";
	   filter="blendTrans(duration=1) alpha(opacity=60)";
	  }
  	return pBody;
 }
  /**
  * 描述：隐藏所有选择的
  * 参数： 无 
  * 返回： 无
  */
 function hideAllSelect(){
	  var obj;
	  obj=document.getElementsByTagName("SELECT");
	  var i;
	  for(i=0;i<obj.length;i++)
	   obj[i].style.visibility="hidden";
	  
	  //隐藏控件 
	  if(document.all.SimpleWebOfficeCtrl!=null) document.all.SimpleWebOfficeCtrl.style.visibility="hidden";
	  if(document.all.upfile!=null) document.all.upfile.style.visibility="hidden";
 }
 
  /**
  * 描述：显示所有选择的
  * 参数： 无 
  * 返回： 无
  */    
 function showAllSelect(){
	  var obj;
	  obj=document.getElementsByTagName("SELECT");
	  var i;
	  for(i=0;i<obj.length;i++)
	   obj[i].style.visibility="visible";
	   
	  //显示控件
	  if(document.all.SimpleWebOfficeCtrl!=null) document.all.SimpleWebOfficeCtrl.style.visibility="visible";
	  if(document.all.upfile!=null) document.all.upfile.style.visibility="visible";
 }