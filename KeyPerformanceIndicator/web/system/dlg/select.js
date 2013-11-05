/*********************************************/
/* 以下方法在树型页面中使用，如org_tree.jsp	 */
/*********************************************/
var appcontext = "";
// 当前树的状态
var treeState = {multi:'<%=multi%>',selectedCount:0};
function reloadView(url){
	parent.fbody.location.href = url;
}

//组织列表
function list_org(id) {
	var targetTypeID = "0"
	if(id != 'root') {
		targetTypeID = id;
	}
	parent.fbody.location.href='${ROOT}/listOrg.do?id='+targetTypeID;
}



//岗位列表
function list_position(id){
	var targetTypeID = "0"
	if(id != 'root') {
		targetTypeID = id;
	}
	parent.fbody.location.href='${ROOT}/listPosition.do?id='+targetTypeID;
}

//员工列表
function list_user(id){
	var targetTypeID = "0"
	if(id != 'root') {
		targetTypeID = id;
	}
	parent.fbody.location.href='${ROOT}/listUserByOrg.do?orgId='+targetTypeID;
}

//群组列表
function list_group(id){
	var targetTypeID = "0";
	if(id != 'root') {
		targetTypeID = id;
	}
	parent.fbody.location.href='${ROOT}/listGroup.do?orgId='+targetTypeID;
}


function select_type(id,name) {
	if(id != 'root') {
		// 取得已选取的类型列表<select></select>
		var selectDOM = parent.document.getElementById('selectedObject');
		// 取得类型列表长度
		var optionsLength = selectDOM.options.length;		
		// 如果类型列表长度为0,则直接添加一个新的option到类型列表中,否则则判断是否已经有相同的option,没有则添加
		if(optionsLength == 0) {
			//添加option	
			selectDOM.options[selectDOM.options.length]=new Option(name,id);	
			treeState.selectedCount++;
		} else {
			treeState.selectedCount = optionsLength;
			if(treeState.multi == 'n') {
				addOptions(selectDOM,name,id);								
			} else {
				if(treeState.multi == '1') {	
					removeAllOption(selectDOM);
					addOptions(selectDOM,name,id);
				}else if(treeState.selectedCount < treeState.multi*1) {
					addOptions(selectDOM,name,id);
				}
			}						
		}
	}							
}

// 添加option	
function addOptions(selectDOM,name,id) {
	// 相同option标志位
	var hasOptions = false;
	// 判断是否已经有相同的option,有则跳出循环
	for(var i=0;i<selectDOM.options.length;i++) {										
		if(selectDOM.options[i].value == id) {
			hasOptions = true;
			break;
		} 							
	}	
	// 判断是否要添加option
	if(!hasOptions) {
		selectDOM.options[selectDOM.options.length]=new Option(name,id);	
	}		
}

// 根据类型ID查找指标
function list_inicator_by_type(id,name) {
	var targetTypeID = ""
	if(id != 'root') {
		targetTypeID = id;
	}
	parent.fbody.location.href='/listIndicator.do?typeId='+targetTypeID;
}

/*********************************************/
/*                  END	                     */
/*********************************************/
/*********************************************************/
/* 以下方法在选择对话框中使用,如org_select_dlg.jsp	 */
/*********************************************************/
/**
 *	保存已选中的类型,并将值回传到父窗口
**/
function save() {
	var selectDOM = document.getElementById('selectedObject');
	var outputText = '';
	var outputValue = '';
	
	var optionsLength = selectDOM.options.length;
	// 将已选中的类型的值组装成以下的格式
	// 类型中文名　－－　outputText : 类型名１,类型名2,类型名3
	// 类型ID　   －－　outputValue : 类型Id1,类型Id2,类型Id3
	if(optionsLength > 0) {
		outputText =  selectDOM.options[0].text;
		outputValue = selectDOM.options[0].value;
		for(var i=1;i<selectDOM.options.length;i++) {
			outputText = outputText + "," + selectDOM.options[i].text;
			outputValue = outputValue + "," + selectDOM.options[i].value;
		}
		// 向父窗口传递参数
		window.returnValue = {outputText:outputText,outputValue:outputValue};
	} else {
		// 向父窗口传递参数
		window.returnValue = {outputText:'无上级类型',outputValue:''};
	}	
	window.close();	
}
/**
 * 关闭窗口
**/
function exit() {
	window.close();
}
/**
 * 删除所有选中的类型
**/
function removeOption(selectDOM) {
	for(var i=0;i<selectDOM.options.length;i++) {
		if(selectDOM.options[i].selected) {
			selectDOM.options.remove(i);
		}
	}
}
/**
 * 删除所有类型
**/
function removeAllOption(selectDOM) {
	for(var i=0;i<selectDOM.options.length;i++) {
		selectDOM.options.remove(i);
	}
}
/**
 * 初始化类型已选列表
   **/
function initSelectedType() {
	// 取得从父窗口传来的参数
	var dialogArguments = window.dialogArguments;
	// 如果targetTypeValue为空,则不进行初始化
	if(dialogArguments.targetTypeValue!=null && Trim(dialogArguments.targetTypeValue) != '' ) {
		var textArray = Trim(dialogArguments.targetTypeText).split(',');
		var valueArray = Trim(dialogArguments.targetTypeValue).split(',');
		var selectDOM = document.getElementById('selectedObject');
		// 为selectDOM添加option对象
		for(var i=0;i<valueArray.length;i++) {
			selectDOM.options[selectDOM.options.length]=new Option(textArray[i],valueArray[i]);	
		}
	}
}



function getUniformType(url,multi,targetTypeTextId,targetTypeValueId) {
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
	var returnValue = modalDialog1(url,multi,dialogArguments )
	// window.showModalDialog(context+"/web/indicator/dlg/indicator_type_select_form.jsp?multi="+multi,dialogArguments,"dialogWidth:800px;dialogHeight:510px");
	// 原因同<ps>
	if(targetTypeText.value != null) {
		targetTypeText.value = returnValue.outputText;
	} else {
		targetTypeText.innerHTML = returnValue.outputText;
	}	
	targetTypeID.value = returnValue.outputValue;				
}

function modalDialog1(url,multi,dialogArguments ) {
	return window.showModalDialog(url+"&multi="+multi,dialogArguments,"dialogWidth:800px;dialogHeight:510px");
}
/*********************************************/
/*                  END	                     */
/*********************************************/
