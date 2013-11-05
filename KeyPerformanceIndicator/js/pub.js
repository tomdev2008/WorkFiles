/**
 * 该js文件提供通用方法的调用
 *
 * 1、打开一个全屏的非模态对话框,此方法基于openWin(url,options)方法
 * 2、根据所给的参数打开一个窗口
 * 3、折叠显示相应的DOM对象
 * 4、设置内嵌页面的body的高度自动撑开
 * 5、设置滚轮事件
 * 6、弹出一个非全屏自定义大小对话框
 * 7、列表的全选
 * 8、类型选择窗口
 * 9、验证字符串为非负整数（正整数 + 0）,isFFInt(txt),参数txt为控件对象
 * 13、iframe自动适应页面
 * 
**/

/**
 * 1、打开一个全屏的非模态对话框,此方法基于openWin(url,options)方法
 * author:miaobb
 */
function openFullScreenWin(url,options){
	//alert(navigator.appName);
	openWin(url);
}

/**
 * 2、根据所给的参数打开一个窗口
 * options:{showCenter:true/false,height:111,width:222}
 * author:miaobb
 * window.open参数
 * 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'
 * 例子:openWin('indicator_show.htm',{showCenter:true,width:800,height:500});
**/
function openWin(url,options) {
	
	var strOptions = "";	
	if(options == null) {
		if (document.all){
			strOptions += ",height="+(screen.height-60)+", width=" + screen.width;
			strOptions += ",top=0, left=0" ;
			strOptions += ",scrollbars=yes,status=yes,resize=yes";
		}
	} else if(options.showCenter == true) {
		var h = options.height;
	    var w = options.width;
	   
	    if(document.all)
	    {
			strOptions += "scrollbars";
	        strOptions += ",height="+h+", width=" + w;
			strOptions += ",top="+(screen.height-h)/2+", left=" +  (screen.width-w)/2;
	    }
	}
	window.open(url,"",strOptions);
}

/**
 * 3、折叠显示相应的DOM对象
 * handler: 调用此方法的DOM对象
 * target_id: 要折叠显示的DOM对象的ID
 * optionsis:{switchClass : boolean,是否要切换handler的className,hideClass:target隐藏时handler的class,showClass:target显示时handler的class
 * 例子:<td colspan="24" class="iconDown" onclick="toggle(this,'personal_indicators',{switchClass:true});">
**/
function toggleTarget(handler,target_id,options){		
	var target = document.getElementById(target_id);
	// 初始化options	
	if(options.switchClass==null) options.switchClass = false;
	// 定义默认切换时用的class
	if(options.showClass==null || options.showClass == '') options.showClass = "right-name";		
	if(options.hideClass==null || options.hideClass == '') options.hideClass = "right-name1";
	// 进行折叠显示处理
	if(target!=null) {
		if(target.style.display != "none") {
			target.style.display = "none";
			if(options.switchClass) {
				handler.className = options.hideClass;
			}
		} else  {
			target.style.display = "inline";
			if(options.switchClass) {
				handler.className = options.showClass;
			}				
		}				
	}		
}
/**
 * 此方法会和table.js冲突,不建议使用
**/
function toggle(handler,target_id,options){		
	toggleTarget(handler,target_id,options);
}

/**
 *4、设置内嵌页面的body的高度自动撑开
 *用法:加在列表页的body的onload事件和列表页面里能让页面撑开的一些
**/

function setPHeight(){
   
	var min = 450;
	var  temp = this.document.body.scrollHeight;
	
	//var menuHeight = parent.parent.document.all["leftFrame"].height;
	//if(min<menuHeight)
		//min = menuHeight;
	
	if(parent.parent.document.all["leftFrame"]!=undefined){
		if(min<parent.parent.document.all["leftFrame"].scrollHeight)
			min = parent.parent.document.all["leftFrame"].scrollHeight;
	}
	if(parent.document.all["leftFrame"]!=undefined){
		if(min<parent.document.all["leftFrame"].scrollHeight)
			min = parent.document.all["leftFrame"].scrollHeight;
	}
	
	if(temp<min)
		temp = min;
	if(parent.parent.document.all["fraOAContent"]!=undefined){
		parent.parent.document.all["fraOAContent"].height=temp+60;	
	}else if(parent.parent.parent.document.all["fraOAContent"]!=undefined){
		parent.parent.parent.document.all["fraOAContent"].height=temp+60;	
	}else if(parent.parent.parent.parent.document.all["fraOAContent"]!=undefined){
		parent.parent.parent.parent.document.all["fraOAContent"].height=temp+60;
	}
	try{
	if(parent.document.all["divTree"] != undefined){
		parent.document.all["divTree"].style.height = temp-50;
		parent.document.all["ftree"].style.height = temp-50;
	}
	if(parent.document.all["fbody"] != undefined && parent.document.all["divList"].style.height<10){
		parent.document.all["divList"].style.height = temp-40;
		parent.document.all["fbody"].style.height = temp-40;
	}else if(parent.document.all["fform"] != undefined ){
		parent.document.all["divForm"].style.height = temp-40;
		parent.document.all["fform"].style.height = temp-40;
	}}catch(e){}
}



function setPHeight2(){
	var  temp = this.document.body.scrollHeight;
	if(temp<450) temp = 450;
	if(parent.document.all["workspace"]){
		parent.document.all["workspace"].height = temp+100;
	}else if(parent.parent.document.all["workspace"]){
		parent.parent.document.all["workspace"].height = temp+100;
	}
	if(parent.document.all["rightspace"]){
		parent.document.all["rightspace"].height = temp+100;
	}else if(parent.parent.document.all["rightspace"]){
		parent.parent.document.all["rightspace"].height = temp+100;
	}
}

function setPHeight3(){
	var  temp = this.document.body.scrollHeight;
	if(temp<450) temp = 450;
	if(parent.document.all["workspace"]){
		parent.document.all["workspace"].height = temp+200;
	}else if(parent.parent.document.all["workspace"]){
		parent.parent.document.all["workspace"].height = temp+200;
	}
	try{
	if(parent.document.all["divTree"] != undefined){
		parent.document.all["divTree"].style.height = temp+50;
		parent.document.all["ftree"].style.height = temp+50;
	}
	if(parent.document.all["fbody"] != undefined && parent.document.all["divList"].style.height<50){
		parent.document.all["divList"].style.height = temp+50;
		parent.document.all["fbody"].style.height = temp+50;
	}else if(parent.document.all["fform"] != undefined ){
		parent.document.all["divForm"].style.height = temp+50;
		parent.document.all["fform"].style.height = temp+50;
	}}catch(e){}
}
/**
 *5、设置滚轮事件(列表面的滚轮事件影响首页的滚动)
 *用法:加在列表页的body的onmousewheel事件
**/
var sc1=1,sc2=10;
function setScrollzheight(){
	if(event.wheelDelta>0){
		sc2-=30;
		sc1-=4;
	}else{
		sc2+=30;
		sc1+=4;
	}
	if(parent.parent.parent.parent!=null)
		parent.parent.parent.parent.scrollTo(sc1, sc2);
	else if(parent.parent.parent!=null)
		parent.parent.parent.scrollTo(sc1, sc2);
	else if(parent.parent!=null)
		parent.parent.scrollTo(sc1, sc2);

}

function configTable(tableId, colIndex) {
	var tt = document.getElementById(tableId);
	
	for (var i = 0; i < tt.rows.length; i++) {
		var aRow = tt.rows[i];
		for (var j = 0; j < aRow.cells.length; j++) {
			var aCell = aRow.cells[j];
			try {
				
			if (aCell.colIndex == colIndex) {
				
				if (aCell.style.display == "") {
					aCell.style.display = "none";
				} else {
					aCell.style.display = "";
				}
				continue;
			}
			} catch (e) {}
		}		
	}
	if (colIndex == "1") {
		if (tt.rows[0].cells[0].colSpan == "1") {
			tt.rows[0].cells[0].colSpan = "2";
		} else {
			tt.rows[0].cells[0].colSpan = "1";
		}
	}
	
}

function hideTableCell(tableId, colIndexs) {
	var tt = document.getElementById(tableId);
	var arr = new Array();
	if(typeof colIndexs == 'Array'){
		arr = colIndexs;
	}else{
		var cols = colIndexs.split(';');
		for(var i =0;i<cols.length;i++){
			arr.push(cols[i]);
		}
	}
	for (var i = 0; i < tt.rows.length; i++) {
		var aRow = tt.rows[i];
		for (var j = 0; j < aRow.cells.length; j++) {
			var aCell = aRow.cells[j];
			for(var k=0;k<arr.length;k++){
				try {
				if (aCell.colIndex == arr[k]) {
					aCell.style.display = "none";
					continue;
				}
				} catch (e) {}
			}		
		}		
	}
}

function removeTableRow(tableId, rowIndexs) {
	var tt = document.getElementById(tableId);
	var arr = new Array();
	if(typeof rowIndexs == 'Array'){
		arr = rowIndexs;
	}else{
		var rs = rowIndexs.split(';');
		for(var i =0;i<rs.length;i++){
			arr.push(rs[i]);
		}
	}
	var removeArr = new Array();
	for (var i = 0; i < tt.rows.length; i++) {
		var aRow = tt.rows[i];
		for(var k=0;k<arr.length;k++){
		
			//try {
				if (aRow.rowIndex == arr[k]) {
					removeArr.push(aRow);
					continue;
				}
			//} catch (e) {}
		}				
	}
	if(removeArr.length>0){
		for (var i = 0; i < removeArr.length; i++) {
			removeArr[i].removeNode(true);
		}
	}
}
/**
*6、弹出一个自定义大小窗口居中显示
*width:弹出窗口的宽度
*height:弹出窗口的高度
*/
function openWindow(url,width,height){
  	var iTop = (window.screen.availHeight-30-height)/2;       //获得窗口的垂直位置;
  	var iLeft = (window.screen.availWidth-10-width)/2;      //获得窗口的水平位置;
  	window.open(url,'','height='+height+',width='+width+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
	
}

/**
 *7、列表全选
 *ctrlcheck:控制全选的checkBox的id
 *checkname:待被控制的checkBox的name
 *author:zhu xinhui
 */
function checkAll(ctrlcheck,checkname){
  var ctrlcheck=document.getElementById(ctrlcheck);
  var allcheck=document.getElementsByName(checkname);
  for(i=0;i<allcheck.length;i++){
	if(ctrlcheck.checked){
	  if(!allcheck[i].disabled)
		allcheck[i].checked=true;
	}else{
	  if(!allcheck[i].disabled)
		allcheck[i].checked=false;
	}
  }
  return;
}

/**
 * 8、类型选择
 * @param multi 结点选择设置,1:单选,n:多选,i(数字):选i个
 * @param targetTypeTextId 在表单中显示的类型中文名称
 * @param targetTypeValueId 在表单中隐藏的的类型ID
**/
function getType(multi,targetTypeTextId,targetTypeValueId) {
	// 取得保存类型中文名称和ID的dom对象
	var targetTypeText = document.getElementById(targetTypeTextId);
	var targetTypeID = document.getElementById(targetTypeValueId);
	//<ps>: 因不清楚targetTypeText对象是div还是input,所以在这里做一下判断
    // targetTypeValueId保存的是最终被使用的类型ID，使用的是input或textarea标签，因此不需要判断
	var typeText = targetTypeText.value;
	// 如果从value中取不到值,则从innerHTML中取值
	if(typeText == null) {
		typeText = targetTypeText.innerHTML;
	}
	// 传给模式窗口的参数
	var dialogArguments = {targetTypeText:typeText,targetTypeValue:targetTypeID.value};
	// 打开类型选择窗口，在操作完成后取得返回值,返回值可以为空字符串
	// 类型中文名　－－　outputText : 类型名１,类型名2,类型名3
	// 类型ID　   －－　outputValue : 类型Id1,类型Id2,类型Id3
	var returnValue = selectTypeWin(multi,dialogArguments )
	// window.showModalDialog(context+"/web/indicator/dlg/indicator_type_select_form.jsp?multi="+multi,dialogArguments,"dialogWidth:800px;dialogHeight:510px");
	// 原因同<ps>
	//alert("returnValue:"+returnValue);
	//alert("returnValue.outputText:"+returnValue.outputText);
	// returnValue=="false" 时，表示用户取消操作
	if(returnValue.outputText==undefined &&returnValue=="false")
	{
	   
	}
	else
	{
	   if(targetTypeText.value != null) {
		targetTypeText.value = returnValue.outputText;
	   } else {
		targetTypeText.innerHTML = returnValue.outputText;
	   }	
	   targetTypeID.value = returnValue.outputValue;	
	}
				
}

/**
 * 9、类型选择窗口
 * @param multi 结点选择设置,1:单选,n:多选,i(数字):选i个
 * @param dialogArguments 传递给选择窗口的参数
 * dialogArguments = {targetTypeText:typeText,targetTypeValue:targetTypeID};
**/
function selectTypeWin(multi,dialogArguments ) {
	return window.showModalDialog(context+"/web/indicator/dlg/type_select_dlg.jsp?multi="+multi,dialogArguments,"dialogWidth:800px;dialogHeight:520px");
}

function getValueFromURL(url,multi,targetTypeTextId,targetTypeValueId) {
	// 取得保存类型中文名称和ID的dom对象
	var targetTypeText = document.getElementById(targetTypeTextId);
	var targetTypeID = document.getElementById(targetTypeValueId);
	//<ps>: 因不清楚targetTypeText对象是div还是input,所以在这里做一下判断
    // targetTypeValueId保存的是最终被使用的类型ID，使用的是input或textarea标签，因此不需要判断
	var typeText = targetTypeText.value;
	// 如果从value中取不到值,则从innerHTML中取值
	if(typeText == null) {
		typeText = targetTypeText.innerHTML;
	}
	
	// 传给模式窗口的参数
	var dialogArguments = {targetTypeText:typeText,targetTypeValue:targetTypeID.value};
	// 打开类型选择窗口，在操作完成后取得返回值,返回值可以为空字符串
	// 类型中文名　－－　outputText : 类型名１,类型名2,类型名3
	// 类型ID　   －－　outputValue : 类型Id1,类型Id2,类型Id3
	var returnValue = modalDialog(url,multi,dialogArguments )
	// window.showModalDialog(context+"/web/indicator/dlg/indicator_type_select_form.jsp?multi="+multi,dialogArguments,"dialogWidth:800px;dialogHeight:510px");
	// 原因同<ps>
	if(targetTypeText.value != null) {
		targetTypeText.value = returnValue.outputText;
	} else {
		targetTypeText.innerHTML = returnValue.outputText;
	}	
	targetTypeID.value = returnValue.outputValue;				
}

/**
 * 什么也不做
 * 缪斌斌 2007-11-16
**/
function doNothing(){};

/**
 * 10、验证字符串为非负整数（正整数 + 0）
 * isFFInt(txt),txt为控件对象
 * 朱毅夫 2007-12-15
 */
function isFFInt(txt){
	if(!/^[0-9]{1,20}$/.test(txt.value)){
		alert("请输入非负整数!");
		txt.select();
		return false;
	}
	return true;
}

/**
 * 11、在点了页面上的action后，屏蔽其他的按钮和URL，防止重复提交
 * 使用说明：
 * 在点击了按钮或者URL与后台进行交互的时候，调用此函数即可将屏幕Shield
 * zhu xinhui 2007-12-15
 */
function pageShield(){
	showPop(0,"处理中，请稍候......");
}

/**
 * 11.1、在表单form的页面返回列表页面，同时将自身页面清空，防止闪屏
 * 使用说明：
 * 在点击form的返回按钮时候调用此函数，在form页面调用
 * zhu xinhui 2007-12-25
 */
function pageShowList(url){
	parent.document.getElementById("divList").style.width="79%";
	parent.document.getElementById("divForm").style.width="0";
	if(url){//说明是列表调用的
		parent.document.getElementById("fbody").src=url;
	} 
	parent.document.getElementById("fform").src="about:blank";
}
/**
 * 11.2、在表单form的页面保存更新以后刷新list页面
 * 使用说明：
 * 在点击form的页面保存更新以后调用此函数
 * zhu xinhui 2007-12-25
 */
function pageBack2List(){
	parent.fbody.refresh();
	parent.document.getElementById("fform").src="about:blank";
}
/**
 * 11.3、在列表list的页面点击form的url进入form的编辑页面
 * 使用说明：
 * 在list页面直接调用，url是form要指向的页面的url
 * zhu xinhui 2007-12-25
 */
function pageShowForm(url){
	parent.document.getElementById("fform").src=url;
	parent.document.getElementById("divList").style.width="0";
	parent.document.getElementById("divForm").style.width="79%";	
	
}

/**
*判断结束时间是否大于开始时间
*beginDate、endDate：属性名
*zzm 2008-01-09
*/

function checkTime(beginDate,endDate){
	

	var beginValue = document.getElementById(beginDate).value;
	var endValue = document.getElementById(endDate).value;
	
	if(beginValue!=""){
	  var begin=new Array();
      var end=new Array();
      begin=beginValue.split("-");
      end=endValue.split("-");
      var beginnum=begin[0]+begin[1]+begin[2];
      var endnum=end[0]+end[1]+end[2];

      if(endnum<beginnum){
       alert("对不起，结束时间必须大于开始时间");
       endValue.value="";
       return false;
      }
		
	}
	return true;
}

//** iframe自动适应页面 **// 
/*13.1 下面两个js变量需要在使用的页面定义
//输入你希望根据页面高度自动调整高度的iframe的名称的列表 
//用逗号把每个iframe的ID分隔. 例如: ["myframe1", "myframe2"]，可以只有一个窗体，则不用逗号。 
//定义iframe的ID 
var iframeids=["fbody"] 
//如果用户的浏览器不支持iframe是否将iframe隐藏 yes 表示隐藏，no表示不隐藏 
var iframehide="yes" 
*/
function dyniframesize(){ 
	var dyniframe=new Array();
	for (i=0; i<iframeids.length; i++){ 
		if (document.getElementById){ 
			//自动调整iframe高度 
			dyniframe[dyniframe.length] = document.getElementById(iframeids[i]); 
			if (dyniframe[i] && !window.opera){ 
				dyniframe[i].style.display="block";
				if (dyniframe[i].contentDocument && dyniframe[i].contentDocument.body.offsetHeight) //如果用户的浏览器是NetScape 
					dyniframe[i].height = dyniframe[i].contentDocument.body.offsetHeight; 
				else if (dyniframe[i].Document && dyniframe[i].Document.body.scrollHeight) //如果用户的浏览器是IE 
					dyniframe[i].height = dyniframe[i].Document.body.scrollHeight+20; 
			}
		} 
		//根据设定的参数来处理不支持iframe的浏览器的显示问题 
		if ((document.all || document.getElementById) && iframehide=="no"){ 
			var tempobj=document.all? document.all[iframeids[i]] : document.getElementById(iframeids[i]);
			tempobj.style.display="block";
		}
	} 
}
/**
 * 13.2、iframe自动适应页面
 * 需要在页面定义两个js全局变量iframeids,iframehide,上面有详细描述
 * zyf 2008-01-29
*/
function registerDyniframesize(){
	if (window.addEventListener) 
		window.addEventListener("load", dyniframesize, false); 
	else if (window.attachEvent) 
		window.attachEvent("onload", dyniframesize); 
	else 
		window.onload=dyniframesize; 
}

/**
 * 返回以指定字符串开始的input对象，还可以指定tagName
 * @param formId 表单id
 * @param startsWith 表单元素名称开始串
 * @param tagName 标签名称，如果没有就不检查
 * @return 对象数组。如果找不到，返回空数组
 */
function getInputStartsWith(formId, startsWith, tagName) {
	var fm = document.getElementById(formId);
	var inputs = new Array();
	for (var i = 0; i < fm.length; i++) {
		var input = fm[i];
		if (!StringUtils.isEmpty(tagName) && input.tagName != tagName
			|| input.name.indexOf(startsWith) != 0) {
			continue;
		}
		inputs[inputs.length] = input;
	}
	return inputs;
}