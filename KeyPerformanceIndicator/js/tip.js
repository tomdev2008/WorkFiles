////////////////////////////////////////////////////////////////////////////////
   /*
	*--------------- 页面提示框-----------------
	* 功能:页面弹出提示消息，同时屏蔽整个页面
	* 使用:
	*　
	*
	* @src author:wang guyin
	* @mod author:zhu xinhui
	*--------------- 页面提示框 -----------------
	*/
///////////////////////////////////////////////////////////////////////////////////
var Tips = {
	options:{title:'处理意见',fieldTitle:'处理意见'}
}
 var ifm=null; 
 var win=null; 
 /**
  * @para title:    标题
  * @para content:  要显示的内容
  * @para type:对话框类型 
  *          0：表示没有任何的按钮，只有一个进度条图案，一般在页面提交的时候显示
  *          1：页面有一个关闭按钮，点击触发关闭事件
  *          2：表示没有任何的按钮，按钮由开发人员在content中指定
  *			 3：页面有一个意见框，有“确定”和“关闭”两个按钮，确定将
  */
 function showPop(type, title, content){
  	var pBody = initFrame();
  	showTigBody(pBody, type, title, content); 
 }
 
 var options=null;
 /**
  * 弹出页面让用户输入意见框，同时将页面其它元素锁定
  * @para msgId:	在原页面上提供的保存意见的隐藏域
  * @para options:	回调函数信息 
  *       格式 onOk:callBackFunctionName			点击ok时候的回调函数名
  *       格式 onOkParas:callBackFunctionParas   点击ok时候的回调函数的参数
  */
 function tipWriteOpinion(msgId, s){
 	if(s) {
 		Tips.options = s;
 		//再次确认
 		if(s.title != null) {
	 		Tips.options.title = s.title;
	 	} 
	 	if(s.fieldTitle!=null) {
	 		Tips.options.fieldTitle = s.fieldTitle;
	 	} 
 	}
 	
 	var pBody = initFrame();  	 
  	showOpinionBody(pBody, msgId); 
  		
 }
 
 function initFrame(){
 	if(ifm==null){
   		ifm=document.createElement("<iframe allowTransparency='true' id='popframe' frameborder=0 marginheight=0 src='about:blank' marginwidth=0 hspace=0 vspace=0 scrolling=no></iframe>")
  		//iframe边界不能做修改，否则会使页面上半部分不能屏蔽
   		ifm.style.width=screen.availWidth;
   		ifm.style.height=screen.availHeight;
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
  	win.document.write("<body leftmargin=0 topmargin=0 oncontextmenu='self.event.returnValue=false'><div id=popbg></div><div id=popbody style='margin-top:50px;'></div></body>");
 	win.document.body.style.backgroundColor="transparent";
    //加入css样式
  	win.document.write("<LINK rel='stylesheet' type='text/css' href='"+context+"/css/kpi.css' />"); 
  	
  	document.body.style.overflow="hidden";
  
  	var pBody=win.document.body.children[1];
  	var pBg=win.document.body.children[0];
  	hideAllSelect();
  	initBg(pBg);
  	return pBody;
 }
 
 /**
  * 描述：初始化背景层
  */
 function initBg(obj){
  with(obj.style){
   position="absolute";   
   left="0";
   top="0";
   width="100%";
   height="100%";
   visibility="hidden";
   backgroundColor="#ffffff";
   filter="blendTrans(duration=1) alpha(opacity=60)";
  }
  
  obj.style.visibility="visible";
 }
 
 function showOpinionBody(obj,msgId){
 	with(obj.style){
   		position="absolute";
   		width="450";
   		height="150";
   		backgroundColor="#ffffff";   
  	}  	
  	obj.style.left=window.document.body.clientWidth/2-200;
  	obj.style.top=window.document.body.clientHeight/3;
  	var str="";
  	var msg = document.getElementById(msgId).value;
  	
  	str+="<table width='450' height='150' border='0' cellpadding='0' cellspacing='0' class='define-box'>";
    str+="	<tr>";
    str+="		<td class='dialog-titlebg'><div  class='dialog-title'>"+Tips.options.title+"</div></td>";
    str+="	</tr>";
    str+="	<tr>";
    str+="		<td align='center' valign='top' class='address-text-bg'>";
	str+="		<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
    str+="			<tr>";
    str+="				<td width='20%'>"+Tips.options.fieldTitle+"：</td>";
    str+="				<td width='80%' colspan='2' rowspan='2' align='left' valign='top'><textarea id='msg' cols='45' rows='8'>"+msg+"</textarea></td>";
    str+="			</tr>";
    str+="			<tr>";
   	str+="				<td>&nbsp;</td>";
    str+="			</tr>";
    str+="		</table><br />";
	str+="		<div><input type='button' onclick=\"javascript:writeBack(this,'"+msgId+"');\" class='dialog-button2' value='确 定' />";
	str+="			<input type='button' onclick=\"javascript:parent.closeWin();\" class='dialog-button2' value='关 闭' /></div>";
	str+="		</td></tr></table>";
  	/**
  	str="<table border=0 cellpadding=0 cellspacing=1 bgcolor=#000000 width=100% ><tr height=20>";
  	str+="<td align=center style='color:#000000;font-size:14px;font-weight:bold' bgcolor=#9999ff>...::: 处理意见 :::...</td></tr>";
  	str+="<tr><td align=center bgcolor=#efefff style='font-size:12px;color:#000000;vertical-align: bottom;'>";
  	
  	str+="<textarea rows='3' cols='60' id='msg' >"+msg+"</textarea><br>";
  	str+="<a href=\"javascript:writeBack(this,'"+msgId+"');\">确定</a>";
  	str+="&nbsp;<a href=\"javascript:parent.closeWin();\">关闭</a>";
  	
  	str+="</td></tr></table>";**/
  	obj.innerHTML=str;
  	
  	//将意见显示到弹出层的文本框中
  	var script = "";
  	script+="<script>";
  	script+="function writeBack(a,msgId){";  
  	script+="document.getElementById('msg').blur();";	
  	script+="a.focus();";  
  	script+="parent.closeWin();";
  	script+="parent.document.getElementById(msgId).value=document.getElementById('msg').value;";   
  	
  	//调用回调函数
  	if(Tips.options){
 		onOk = Tips.options.onOk;
  		onOkParas = Tips.options.onOkParas; 
  		 
  		if(onOk){
  			if(onOkParas){
  				//script+="parent."+onOk+"(\""+onOkParas+"\");"; 
  				//alert(onOkParas);
  				script+="parent."+onOk+"(parent.Tips.options.onOkParas,document.getElementById('msg').value);";
  				
  			} else {
  				script+="parent."+onOk+"();"; 
  			}
  		}
  	}
  		
  	script+="}";
  	script+="</script>";
  	win.document.write(script); 	
  	
 }
 
 /**
  * 描述：初始化提示的显示层
  * @para obj:		显示图层
  * @para title:    标题
  * @para content:  要显示的内容
  * @para type:对话框类型 
  *          0：表示没有任何的按钮，只有一个进度条图案，一般在页面提交的时候显示
  *          1：页面有一个关闭按钮，点击触发关闭事件
  *          2：表示没有任何的按钮，按钮由开发人员在content中指定
  *    
  * 返回： 无
  */
 function showTigBody(obj, type, title, content){
  with(obj.style){
   position="absolute";
   width="350";
   height="120";
   backgroundColor="#ffffff";   
  }
  obj.style.left=window.document.body.clientWidth/2-200;
  obj.style.top=window.document.body.clientHeight/3;
  var str;
  
  if(type==0){
  	str="<table border=0 cellpadding=0 cellspacing=1 bgcolor=#000000 width=100% ><tr height=20>";
    str+="<td align=center style='color:#000000;font-size:14px;font-weight:bold' bgcolor=#9999ff>...:::"+title+":::...</td></tr>";
  	str+="<tr><td align=center bgcolor=#efefff style='font-size:12px;color:#000000;vertical-align: bottom;'><br>&nbsp;<div align='center'>"
  	str+="<img src='"+context+"/img/ajax-loader.gif'></div><br><br><br></td></tr>";  	
  	
  } else if(type==1){
  	str="<table width='350' height='100' border='0' cellpadding='0' cellspacing='0' class='define-box'><tr>";
    str+="<td class='dialog-titlebg'><div  class='dialog-title'>系统提示</div></td></tr>";
    str+="<tr><td align='center' valign='top' width='100%' >";
	str+="<div class='hint-bg'><div class='hint-text'>"+content+"</div></div>";
	str+="<div><input type='button' onclick=\"javascript:parent.closeWin();\" class='dialog-button2' value='关 闭' /></div><br></td></tr></table>";
  	
  } else if(type==2){
  	str="<table border=0 cellpadding=0 cellspacing=1 bgcolor=#000000 width=100% ><tr height=20>";
    str+="<td align=center style='color:#000000;font-size:14px;font-weight:bold' bgcolor=#9999ff>...:::"+title+":::...</td></tr>";
  	str+="<tr><td align=center bgcolor=#efefff style='font-size:12px;color:#000000;vertical-align: bottom;'><br>&nbsp;<div align='left'>";
  	str+=content+"</div><br></td></tr>";
  }
  
  str+="</table>";
  obj.innerHTML=str;
 }
 
 /**
  * 描述：关闭一切(隐藏层)
  * 参数： obj :the iframe 's name 
  * 返回： 无
  */
 function closeWin(){
  ifm.style.visibility="hidden";    
  showAllSelect();
  document.body.style.overflow="auto";   
  document.body.focus();
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

