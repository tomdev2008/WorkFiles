/**
 @description 	JS 工具包
 @Verson 		0.02
 @author		mbb
 @description   此工具包目前只适用于ＩＥ浏览器
**/
var Util = {
	$_E:function() {
		// 这个方法是从prototype.js取来的,可以取一个或多个元素
		// 例子:Util.$_E('id');  返回id dom对象
		// Util.$_E('id1','id2','id3'); 返回一个包含了id1,id2,id3 dom对象的Array
		var results = [], element;
		for (var i = 0; i < arguments.length; i++) {
			element = arguments[i];
			if (typeof element == 'string')
				element = document.getElementById(element)?document.getElementById(element):document.all[element];
			results.push(element);
		}
		return results.length > 1 ? results : results[0];	
	},
	$_EN:function(name) {
		// 取得相应ＤＯＭ
		return document.getElementsByName(name);
	},
	$_EV:function(id) {
		// 取得相应ＤＯＭ对象的value值
		var value = null;
		if(Util.$_E(id) != null) {
			value = document.getElementById(id).value;
		} 
		return value;
	},
	$_ECss:function(oElm, strTagName, strClassName){
		// 根据标签名和CSS查找对象,例子:Util.$_ECss(document,"TABEL","list-box"),查找document对象下,样式名为"list-box"的表格
		var arrElements = (strTagName == "*" && document.all)? document.all : oElm.getElementsByTagName(strTagName);
	    var arrReturnElements = new Array();
	    strClassName = strClassName.replace(/\-/g, "\\-");
	    var oRegExp = new RegExp("(^|\\s)" + strClassName + "(\\s|$)");
	    var oElement;
	    for(var i=0; i<arrElements.length; i++){
	        oElement = arrElements[i];
	        if(oRegExp.test(oElement.className)){
	            arrReturnElements.push(oElement);
	        }
	    }
	    return (arrReturnElements)
	},	
	$_ETag:function(node,tagName) {
		/*取得node结点下标签名为tagName的HTML元素*/
		tagName=tagName.toUpperCase();
		var els = [];
		
			if (node.elements) {
	    		node = node.elements;
		  	}
			for (var i=0;i<node.length;i++) {
			  if (node[i] && tagName == node[i].tagName) {
			    els.push(node[i]);
			    if (node[i].id) {
			      els[node[i].id] = node[i];
			    }
			  }		
			}
			  	
		return els; 
	},
	$_ETagName:function(node,tagName,name) {
		/*取得node结点下标签名为tagName的HTML元素*/
		tagName=tagName.toUpperCase();
		var els = [];
		
			if (node.elements) {
	    		node = node.elements;
		  	}
			for (var i=0;i<node.length;i++) {
			  if (node[i] && tagName == node[i].tagName && name == node[i].name) {
			    els.push(node[i]);
			    if (node[i].id) {
			      els[node[i].id] = node[i];
			    }
			  }		
			}
			  	
		return els; 
	},
	srcElement:function(theEvent) {
		// 取得触发事件的DOM对象
		var srcElement = theEvent.srcElement;
		if (!srcElement)
		{
		    srcElement = theEvent.target;
		}
		return srcElement;
	},
	toggle:function(id) {
		// 切换隐藏和显示
		var dom = Util.$_E(id);
		if(dom.style.display != 'inline') {
			dom.style.display = 'inline';
		} else {
			dom.style.display = 'none';
		}
	},
	show:function(id) {
		var dom = Util.$_E(id);
		if(dom) dom.style.display = 'inline';
	},
	hide:function(id) {
		var dom = Util.$_E(id);
		if(dom) dom.style.display = 'none';
	},
	disable:function(id) {
		var dom = Util.$_E(id);
		if(dom) dom.disabled = true;
	},
	enable:function(id) {
		var dom = Util.$_E(id);
		if(dom) dom.disabled = false;
	},
	formatNumber:function(number,pattern) {
	// 格式化化数字
	/*
	alert(Util.formatNumber(0,''));
	alert(Util.formatNumber(12432.21,'#,###'));
	alert(Util.formatNumber(12432.21,'#,###.000#'));
	alert(Util.formatNumber(12432,'#,###.00'));
	alert(Util.formatNumber('12432.415','#,###.0#'));
	*/	
		var str = number.toString();
	    var strInt;
	    var strFloat;
	    var formatInt;
	    var formatFloat;
	    if(/\./g.test(pattern)){
	        formatInt = pattern.split('.')[0];
	        formatFloat = pattern.split('.')[1];
	    }else{
	        formatInt = pattern;
	        formatFloat = null;
	    }
		
	    if(/\./g.test(str)){
	        if(formatFloat!=null){
	            var tempFloat = Math.round(parseFloat('0.'+str.split('.')[1])*Math.pow(10,formatFloat.length))/Math.pow(10,formatFloat.length);
	            strInt = (Math.floor(number)+Math.floor(tempFloat)).toString();                
	            strFloat = /\./g.test(tempFloat.toString())?tempFloat.toString().split('.')[1]:'0';            
	        }else{
	            strInt = Math.round(number).toString();
	            strFloat = '0';
	        }
	    }else{
	        strInt = str;
	        strFloat = '0';
	    }
	    if(formatInt!=null){
	        var outputInt = '';
	        var zero = formatInt.match(/0*$/)[0].length;
	        var comma = null;
	        if(/,/g.test(formatInt)){
	            comma = formatInt.match(/,[^,]*/)[0].length-1;
	        }
	        var newReg = new RegExp('(\\d{'+comma+'})','g');
	
	        if(strInt.length<zero){
	            outputInt = new Array(zero+1).join('0')+strInt;
	            outputInt = outputInt.substr(outputInt.length-zero,zero)
	        }else{
	            outputInt = strInt;
	        }
	
	        var outputInt = outputInt.substr(0,outputInt.length%comma)+outputInt.substring(outputInt.length%comma).replace(newReg,(comma!=null?',':'')+'$1')
	        outputInt = outputInt.replace(/^,/,'');
	        strInt = outputInt;
	    }
	
	    if(formatFloat!=null){
	        var outputFloat = '';
	        var zero = formatFloat.match(/^0*/)[0].length;
	
	        if(strFloat.length<zero){
	            outputFloat = strFloat+new Array(zero+1).join('0');
	            var outputFloat1 = outputFloat.substring(0,zero);
	            var outputFloat2 = outputFloat.substring(zero,formatFloat.length);
	            outputFloat = outputFloat1+outputFloat2.replace(/0*$/,'');
	        }else{
	            outputFloat = strFloat.substring(0,formatFloat.length);
	        }
	
	        strFloat = outputFloat;
	    }else{
	        if(pattern!='' || (pattern=='' && strFloat=='0')){
	            strFloat  = '';
	        }
	    }
		return strInt+(strFloat==''?'':'.'+strFloat);
	},	
	callScript:function (url) {
		/**
		 * 仿Ajax的工具方法
		 * 通过get的方式访问一个服务，服务返回的内容必须是javascript
		 */
		document.body.insertBefore(document.createElement('script'),document.body.firstChild).src=url;
		return false;
	},
	isNum:function(str){
		//如果为空，则通过校验
		if(str == "")
			return true;
		if(/^(\-?)(\d+)$/.test(str)) {
           return true;
		}else{
           return false;
		}
	}
}
/*快捷方法*/
/*根据id属性查找相关元素*/
function $_E(id) {
	return Util.$_E(id);
}
/*根据name属性查找相关元素*/
function $_EN(name) {
	return Util.$_EN(name);
}
/*取得相关输入元素的值*/
function $_EV(id) {
	return Util.$_EV(id);
}
/*根据CSS查找相关元素*/
function $_ECss(oElm, strTagName, strClassName) {
	return Util.$_ECss(oElm, strTagName, strClassName);
}
/*根据标签名查找相关元素*/
function $_ETag(node,tagName) {
	return Util.$_ETag(node,tagName);
}
/*把px的转换为数字*/
function pxToNum(px) {
	var num = 0;
	if(px!=null) {
		num = StringUtils.replace(px,"px","")*1;
	}
	return num;
}

function $_EAddClass(ele,className) {
}

function $_ERemoveClass(ele,className) {
}
/*快捷方法 END*/

/*
 继承:直接把基类的属性复制到子类中
 destination: 子类
 source: 基类
*/
function $_extend(destination, source){
	for(var property in source)	{
		destination[property] = source[property];
	}
	return destination;
} 

/**
  *	缓存工具类
  * 此工具类只是简单地以key,value的方式对对象进行了缓存
 **/
var CacheUtil = {
	cacheContainer : {},
	set:function(key,cacheObject) {
		CacheUtil.cacheContainer[key] = cacheObject;
		return cacheObject;	
	},
	get:function(key) {
		return CacheUtil.cacheContainer[key];	
	},
	remove:function(key) {
		CacheUtil.cacheContainer[key] = null;
	},
	contains:function(key) {
		return CacheUtil.get(key) != null;
	}
}

/**
 * 模式对话框工具类
 **/
var DialogUtil = {
	/**
	 *   该方法多用于选择窗口,如指标类型选择窗口,指标选择窗口
	 *   只适合传递操作两个dom对象的情况
	 *   例子:
	 *	 <div style="float:left;margin-right:5px;" id="targetTypeText"></div>
     *   <a class="choose" href="#" id="choseType" dlgurl="/web/indicator/dlg/indicator_select_dlg.jsp?multi=1" textID="targetTypeText" valueID="targetTypeID" dialogConfig="dialogWidth:800px;dialogHeight:600px" onclick="DialogUtil.openSelectWin(this);">选择</a>	
	 *   <input type="hidden1" value="" name="targetTypeID" id="targetTypeID"/>	
	**/
	returnValue:null,
	options:{},
	openSelectWin:function(handler,extOptions) {
		// 取得保存类型中文名称和ID的dom对象
		var targetTypeText = Util.$_E(handler.textID);
		var targetTypeID = Util.$_E(handler.valueID);
		// 设置附加参数
		DialogUtil.setOptions(extOptions);		
		// 加上DOM对象检测
		if(targetTypeText==null) {
			alert('没有设置textID');
			return;
		}
		if(targetTypeID==null) {
			alert('没有设置valueID');
			return;
		}
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
		DialogUtil.returnValue = DialogUtil.modalDialog(handler.dlgurl,dialogArguments,handler.dialogConfig );
		// 当窗口关闭时执行onReturn的回调函数
		if(DialogUtil.options.onReturn) {
			DialogUtil.options.onReturn(DialogUtil.returnValue);
		}
		if(DialogUtil.returnValue == null) {
			return;
		}
		// 原因同<ps>
		if(targetTypeText.value != null) {
			targetTypeText.value = DialogUtil.returnValue.outputText;
		} else {
			targetTypeText.innerHTML = DialogUtil.returnValue.outputText;
		}	
		targetTypeID.value = DialogUtil.returnValue.outputValue;			
	},
	modalDialog:function(url,dialogArguments,dialogConfig ) {	
		return window.showModalDialog(url,dialogArguments,dialogConfig);
	},
	setOptions:function(extOptions) {
		// 设置附加属性
		DialogUtil.options = extOptions==null?{}:extOptions;
		//DialogUtil.options = extOptions==null?{}:$_extend(DialogUtil.options,extOptions);		
	},
	exit:function() {
		// 关闭模式窗口
		window.opener = null;
		window.close();
	},
	// 比较简单的打开模式窗口的方法,支持回调函数
	open:function(url,options) {
		var arguments = options.arguments;
		var config = options.config;
		var returnValue = window.showModalDialog(url,arguments,config);
		if(options.onReturn) {
			options.onReturn(returnValue);
		}
		return returnValue;
	}	
}

/**
 * 此工具类多在选择窗口中使用
**/
// select工具类
var SelectUtil = {
	initSelecteDOM:function (selectDOM) {
		// 初始化类型已选列表;该方法要配合DialogUtil.openSelectWin方法一起使用
		// 取得从父窗口传来的参数
		var dialogArguments = window.dialogArguments;
		// 如果targetTypeValue为空,则不进行初始化
		var text = dialogArguments.targetTypeText.trim();
		var value = dialogArguments.targetTypeValue.trim();
		if(StringUtils.isNotEmpty(value)) {
			var textArray;
			// 判分隔符类型
			if(text.indexOf(',')!=-1) {
				textArray = text.split(',');		
			} else {
				textArray = text.split(' ');
			}
			var valueArray = value.split(',');
			// 为selectDOM添加option对象
			for(var i=0;i<valueArray.length;i++) {
				if(StringUtils.isNotEmpty(textArray[i]) && StringUtils.isNotEmpty(valueArray[i])){
					selectDOM.options[selectDOM.options.length]=new Option(textArray[i],valueArray[i]);	
					//alert(valueArray[i]);
				}				
			}
		}		
	},
	save:function(selectDOM,defaultText) {
		// 保存已选中的类型,并将值回传到父窗口,此方法只适合在模式窗口中使用
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
			window.returnValue = {outputText:defaultText,outputValue:''};
		}	
		window.close();	
	},		
	addOptions:function(selectDOM,text,value) {
		// 添加option
		// 相同option标志位
		var hasOptions = false;
		// 判断是否已经有相同的option,有则跳出循环
		for(var i=0;i<selectDOM.options.length;i++) {		
			//alert(selectDOM.options[i].value + "---" + value);								
			if(selectDOM.options[i].value == value) {
				hasOptions = true;
				break;
			} 							
		}	
		// 判断是否要添加option
		if(!hasOptions) {
			selectDOM.options.add(new Option(text,value));	
		}		
	},
	removeOption:function (selectDOM) {
		// 删除所有选中的类型
		//for(var i=0;i<selectDOM.options.length;i++) {
		//	alert(selectDOM.options[i].text);
		//	if(selectDOM.options[i].selected) {
		//		selectDOM.options.remove(i);
		//	}
		//}
		
		//modify by zzm 2008.3.3 针对不能全部删除所选项的问题，采用另一种算法进行删除
		var length = selectDOM.options.length;
		while(length != 0){
			for(var i=0;i<length;i++){
				if(selectDOM.options[i]!=undefined&&selectDOM.options[i].selected)
					selectDOM.options.remove(i);
			}		
			length = length/2;
		}
	},
	removeAllOption:function (selectDOM) {
		// 删除所有类型
		selectDOM.innerHTML = '';
		
	},
	copySelected:function (from,to) {
		// 把from<select>中选择的<option>复制一份到to<select>中去
		if(from.options.length > 0) {
			for(var i=0;i<from.options.length;i++) {
				if(from.options[i].selected) {
					SelectUtil.addOptions(to,from.options[i].text,from.options[i].value);
				}						
			}
		}
	},
	copyAll:function (from,to) {
		// 把from<select>所有的<option>复制一份到to<select>中去
		if(from.options.length > 0) {
			for(var i=0;i<from.options.length;i++) {
				SelectUtil.addOptions(to,from.options[i].text,from.options[i].value);					
			}
		}
	},
	checkAll:function (handler,checkname){
	/**
	 *列表全选
	 *handler:控制全选的checkBox
	 *checkname:待被控制的checkBox的name
	 *author:zhu xinhui
	 */
	  var allcheck = Util.$_EN(checkname);
	  for(i=0;i<allcheck.length;i++){
		if(handler.checked){
		  if(!allcheck[i].disabled) {
		  	allcheck[i].checked=true;
		  	// 触发checkbox的onclick事件
		  	allcheck[i].fireEvent("onclick");
		  }
			
		}else{
		  if(!allcheck[i].disabled)
			allcheck[i].checked=false;
			// 触发checkbox的onclick事件
			allcheck[i].fireEvent("onclick");
		}
	  }
	  return;
	},
	uncheckAll:function (checkname){
	/**
	 *撤消列表全选
	 *checkname:待被控制的checkBox的name
	 *author:mbb
	 */
	  var allcheck = Util.$_EN(checkname);
	  for(i=0;i<allcheck.length;i++){
		allcheck[i].checked=false;
	  }
	  return;
	},
	getSelectedValue:function(selectDOM) {
		// 取得已经选择的option的值
		var returnValue = '';
		var option = selectDOM.options[selectDOM.selectedIndex];
		if(option) {
			returnValue = option.value;
		}
		return returnValue;
	},
	serialize:function(cbName) {
		// 把name属性等cbName的dom对象的值序列化成以下的字符串
		// value1,value2,value3
		var cbs = Util.$_EN(cbName);
		var values = '';
		if(cbs!=null) {
			for(i=0;i<cbs.length;i++) {
				if(cbs[i].checked) {
					values = values + cbs[i].value + ' ';
				}
			}
		}
		return values.trim().replaceAll(' ',',');
	},
	checkedCount:function(cbName) {
		var cbs = $_EN(cbName);
		var count = 0;
		if(cbs!=null) {
			for(i=0;i<cbs.length;i++) {
				if(cbs[i].checked) {
					count = count + 1;
				}
			}
		}
		return count;
	},
	checkedValues:function(cbName) {
		var cbs = $_EN(cbName);
		var values = "";
		if(cbs!=null) {
			for(i=0;i<cbs.length;i++) {
				if(cbs[i].checked) {
					values += values.length<=0?cbs[i].value:";"+cbs[i].value;
				}
			}
		}
		return values;
	},
	getFirstChecked:function(cbName) {
		var cbs = $_EN(cbName);
		var count = 0;
		var checkbox = null;
		if(cbs!=null) {
			for(i=0;i<cbs.length;i++) {
				if(cbs[i].checked) {
					checkbox = cbs[i];
					break;
				}
			}
		}
		return checkbox;
	},
	isAllChecked:function(cbName) {
		var cbs = $_EN(cbName);
		var allChecked = true;
		if(cbs!=null) {
			for(i=0;i<cbs.length;i++) {
				if(!cbs[i].checked) {
					allChecked = false;
					break;
				}
			}
		}
		return allChecked;
	},
	containsValue:function(cbName,value) {
		// 判断相应的checkbox组里有没有要查找的值
		// 只当checkbox是选中的才进行匹配
		var cbs = $_EN(cbName);
		if(cbs!=null) {
			for(i=0;i<cbs.length;i++) {
				if(cbs[i].checked && cbs[i].value == value) {
					return true;
				}
			}
		} else {
			return false;
		}
	},
	removeErrorCbs:function (cbs) {
		for(var i=0;i<cbs.length;i++) {
			cbs[i].className = "checkboxInput";
		}
	},
	/**
     * 根据页面提交过来的参数，重选复选框。
     * @param cbName 需要重选的复选框组的名字
     * @param values 一个需要重选的复选框的值（字符串）的数组
     */
	recheckbox:function(cbName, values) {
		if (values == undefined || values.length == 0)
			return;
		var uss = $_EN(cbName);
		for (var i = 0; i < values.length; i++) {
			var tmp = values[i];
			for (var j = 0; j < uss.length; j++) {
				if (tmp == uss[j].value) {
					uss[j].checked = true;
					break;
				}
			}
		}
	}
	
}

/**
	字符串工具类
**/
var StringUtils = {
	// 判断是否不为空
	isNotEmpty:function(str) {
		if(str != null && str.trim() != '') {
			return true;
		} 
		return false;
	},
	// 判断是否为空
	isEmpty:function(str) {
		return !StringUtils.isNotEmpty(str);
	},
	removeLastDelim:function(str,delim) {
		if(StringUtils.isNotEmpty(str)) {
			if(str.endWith(delim)) {
				str = str.substring(0,str.lastIndexOf(delim));
			}
		}
		return str;
	},
	filterMoreAndLess:function(srcStr,newStr) {
		// srcStr:字符串,newStr:新的字符串
		var result = new Array(2);
		result[0] = '';
		result[1] = '';
		var delStr = '';
		var addStr = '';			
		
		//alert("srcStr:"+srcStr);
		//alert("newStr:"+newStr);
		// 1,如果新的字符串不为空,而源字符串为空,则为全加操作
		// 2,如果新的字符串为空,而源字符串不为空,则为全删操作
		// 3,如果新的字符串不为空和源字符串都不为空,则要进行筛选
		if(StringUtils.isEmpty(srcStr) && StringUtils.isNotEmpty(newStr)) {
			// 条件1
			addStr = newStr;
		} else if(StringUtils.isNotEmpty(srcStr) && StringUtils.isEmpty(newStr)) {
			// 条件2
			delStr = srcStr;			
		} else {
			// 条件3
			var preIndicatorsArray = srcStr.split(',');
			var indicatorArray = newStr.split(',');
			// 筛选要删除的指标
			for(i=0;i<preIndicatorsArray.length;i++) {
				if(newStr.indexOf(preIndicatorsArray[i])==-1) {
					delStr = preIndicatorsArray[i] + "," + delStr ;
				}
			}
			delStr = StringUtils.removeLastDelim(delStr,',');
			// 筛选要添加的指标
			for(i=0;i<indicatorArray.length;i++) {
				if(srcStr.indexOf(indicatorArray[i])==-1) {
					addStr = indicatorArray[i] + "," + addStr ;
				}
			}
			addStr = StringUtils.removeLastDelim(addStr,',');
		}
		
		result[0] = addStr;	// 多出的字符
		result[1] = delStr;	// 删除的字符
		return result;
	},
	// 裁剪字符串
	trunc:function(str,length) {
		var tmpStr = ''
		if(StringUtils.isNotEmpty(str)) {
			if(str.length > length) {
				tmpStr = str.substring(0,length) + '…';
			} else {
				tmpStr = str;
			}
		}
		return tmpStr;
	},
	// 替换字符串
	replace:function(srcStr,oldStr,newStr) {
		var tmpStr = '';
		if(StringUtils.isNotEmpty(srcStr)) {
			tmpStr = srcStr.replaceAll(oldStr,newStr);
		} 
		return tmpStr;
	}
}
/**
	扩展Javascript 原生String对象
**/
//判断当前串是否已制定的串结尾
String.prototype.endWith=function(str){
	if("string"!=typeof(str))
		throw new Error(-1,"\""+str+"\" 不是一个字符串。");
	return (this.substring(this.length-str.length,this.length)==str);
}

//判断当前串是否已制定的串开头
String.prototype.startWith=function(str){
	if("string"!=typeof(str))
		throw new Error(-1,"\""+str+"\" 不是一个字符串。");
	return (this.substring(0,str.length)==str);
}
// 移除字符串左边空格
String.prototype.lTrim = function() {
	var re = /\s*((\S+\s*)*)/;
	return this.replace(re, "$1");
}

// 移除字符串右边空格
String.prototype.rTrim = function() {
	var re = /((\s*\S+)*)\s*/;
	return this.replace(re, "$1");
}

// 移除字符串空格
String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g, '');
}

String.prototype.replaceAll = function(strTarget, strSubString ){
 	var strText = this;
	var intIndexOfMatch = strText.indexOf( strTarget );
  
 	// Keep looping while an instance of the target string
 	// still exists in the string.
 	while (intIndexOfMatch != -1){
 	// Relace out the current instance.
 		strText = strText.replace( strTarget, strSubString )
 		// Get the index of any next matching substring.
 		intIndexOfMatch = strText.indexOf( strTarget );
 	}
  
 	// Return the updated string with ALL the target strings
 	// replaced out with the new substring.
 	return( strText );
}

/*删除数组元素的方法*/
Array.prototype.remove=function(dx)
  {
    if(isNaN(dx)||dx>this.length){return false;}
    for(var i=0,n=0;i<this.length;i++)
    {
        if(this[i]!=this[dx])
        {
            this[n++]=this[i]
        }
    }
    this.length-=1
  }
  
/*
 * 弹出地址本页面
 * type:orgType(0;10;20)	待选列表，数据显示范围
 * multi:0,i,n	已选列表是否可多选
 * manage:0,1	是否完整显示地址本菜单树（现默认1）
 * targetTextId:页面显示地址数据的ELEMENT_ID
 * targetValueId：页面储存地址数据的ELEMENT_ID
 * onReturn:回调函数（直接调用的方法）
 * orgids:指定的部门id,有多个部门ID则需要用";"分隔 "id1;id2"
 *manage:
 *0：我的可管理部门；1:默认地址本（我的部门，我的常用地址本，组织架构）10:角色；15：通用岗位 ；20：专业线
 *
 * */

function getAddressList(type,multi,manage,targetTextId,targetValueId,onReturn,orgids){
	var addressUrl=context+"/web/system/dlg/org_select_dlgPage.jsps?type="+type+"&manage="+manage+"&multi="+multi+"&oids="+orgids;
	var handler = {dlgurl:addressUrl,textID:targetTextId,valueID:targetValueId,dialogConfig:'dialogWidth:900px;dialogHeight:560px'};
	
	DialogUtil.openSelectWin(handler,{onReturn:onReturn});
}

/*
  table工具类
*/
var TableUtil = {
	/*高亮颜色*/
	highlightColor:'#bed7f4',
	/*前TR原来的背景颜色*/
	trOriginallyColor:'',
	deleteAllRows:function(tId) {
		// 删除所有的行
		var t = Util.$_E(tId);
		for(var i=t.rows.length-1;i >=0;i--)
	    {
	        t.deleteRow(i);
	    } 
		return t;
	},
	getParentTR:function(srcElement) {
		try {
			if(!srcElement.parentNode) return null;
		} catch (e) {
			return null;
		}
		/*寻找指定DOM对象的父节点，直到找到tr*/
		var o = srcElement.parentNode;
		while(o.parentNode&&o.tagName!="TR")
		{
		    if(o.tagName=="TABLE") break;
		    else o=o.parentNode;
		}
		return o;
	},
	enableHighlightTr:function(t) {
		var table = $_E(t);
		if(table!=null) {
			table.attachEvent("onmouseover",TableUtil.highlightTr);
			table.attachEvent("onmouseout",TableUtil.highlightTr);
			// 添加选中checkbox时高亮tr的功能
			var cbs = $_ECss(table,"INPUT","checkboxInput");
			if(cbs !=null && cbs.length>0) {
				for(var i=0;i<cbs.length;i++) {
					cbs[i].attachEvent("onclick",TableUtil.hightlightSelectedTR);
				}
			}
		}	
	},
	
	/*高亮checkbox选中的表格行*/
	hightlightSelectedTR:function() {
		//alert(22);
		/*1、处理事件，获得触发javascript事件的页面元素。*/
		var srcElement = Util.srcElement(window.event||arguments.callee.caller.arguments[0]);	
				
		/*2、寻找它的父节点，直到找到tr。*/
		var o=TableUtil.getParentTR(srcElement);
		
		/*有可能会找到非html标签的object,所以要先判断一下*/
		if(o != null && o.tagName) {
		/*3、进行样式处理，如要修改高亮的颜色，则要修改/kpiWeb/WebRoot/css/kpi.css中的trSelected。*/
			var regStr=/\b\s*trSelected\b/g;
			/*追加高亮样式*/
			if(srcElement.type == "checkbox") {
				if(srcElement.checked && o.className.indexOf('trSelected')==-1) {
				   o.className+=" trSelected";
				} else if(!srcElement.checked){ /*删除高亮样式*/
				    o.className=o.className.replace(regStr,""); 
				}
			} else {
				 o.className=o.className.replace(regStr,""); 
			}			
		}
	},
	/*高亮鼠标选中的表格行*/
	highlightTr:function() {
		/*1、处理事件，获得触发javascript事件的页面元素。*/
		var srcElement = Util.srcElement(window.event||arguments.callee.caller.arguments[0]);	
				
		/*2、寻找它的父节点，直到找到tr。*/
		var o=TableUtil.getParentTR(srcElement);
		/*有可能会找到非html标签的object,所以要先判断一下*/
		if(o != null && o.tagName) {
		/*3、进行样式处理，如要修改高亮的颜色，则要修改/kpiWeb/WebRoot/css/kpi.css中的trHover。*/
			var regStr=/\b\s*trHover\b/g;
			/*追加高亮样式*/
			if(o.className.indexOf('trHover')==-1) {
			   o.className+=" trHover";
			} else { /*删除高亮样式*/
			    o.className=o.className.replace(regStr,""); 
			}
		}
	}
}


var AddressHelper = {
	OBJECTS_SPLITOR:',',
	INFOS_SPLITOR:'!@!',
	prase:function(handlersValue) {
		// 字符串解析成orgVo对象
		var handlerArray = handlersValue.split(AddressHelper.OBJECTS_SPLITOR);
		var orgVoArray = new Array();
		var id,name,type;
		
		for(var i=0;i<handlerArray.length;i++) {
			
			id = handlerArray[i].split(AddressHelper.INFOS_SPLITOR)[2];
			name = handlerArray[i].split(AddressHelper.INFOS_SPLITOR)[1];
			type = handlerArray[i].split(AddressHelper.INFOS_SPLITOR)[0];
			var orgVo = {id:id,name:name,type:type,value:handlerArray[i]};
			//alert(orgVo.type + "_" + orgVo.id + "_" + orgVo.name);
			orgVoArray[i] = orgVo;
		}
		return orgVoArray;
	},
	reverse:function(orgVo) {
		/*反向解析*/
		var valueStr = '';
		if(orgVo!=null) {
			valueStr = orgVo.type + AddressHelper.INFOS_SPLITOR + orgVo.name + AddressHelper.INFOS_SPLITOR + orgVo.id;
		}
		return valueStr;
	},
	praseName:function(handlersValue) {
		var orgVos = AddressHelper.prase(handlersValue);
		var	nameStr = '';
		if(orgVos.length>0) {
			for(var i=0;i<orgVos.length;i++) {
				nameStr += orgVos[i].name + ","
			}
		}
		return StringUtils.removeLastDelim(nameStr,',');;
	},
	praseVo:function(value){
		id = value.split(AddressHelper.INFOS_SPLITOR)[2];
		name = value.split(AddressHelper.INFOS_SPLITOR)[1];
		type = value.split(AddressHelper.INFOS_SPLITOR)[0];
		var orgVo = {id:id,name:name,type:type,value:value};
		return orgVo;
	}
}

/*模板帮助类*/
var TemplateHelper = {
	// 解析指标信息
	praseIndicatorValue:function(indicatorValue) {
		var values = indicatorValue.split(',');
		var indicators = new Array();
		var indicator = null;
		for(i=0;i<values.length;i++) {
			indicator = {code:values[i].split('~')[0]};
			indicators[i] = indicator;
		}
		return indicators;
	}
}
/**/
var FormUtil = {
	// 是否已经提交
	doubleSubmitAlert:'请求已经提交,请稍候!',
	submited:false,
	submit:function() {
		FormUtil.submited = true;	
	},
	isSubmited:function() {
		return FormUtil.submited == true;
	},
	
	reset:function() {
		// 重置提交标志位
		FormUtil.submited = false;
	},
	enableHighlightInput:function(f) {
		// 高亮正在编辑的输入框
		var sfInputs = $_ETag(f,"input");
		var sfFilterInputs = [];
		var inputType;
		var className;
		for(var i=0;i<sfInputs.length;i++) {
			inputType = sfInputs[i].type.toLowerCase();		
			className = sfInputs[i].className;
			if(inputType == "text" || inputType == "password") {
				if(className != "input-textline")
					sfFilterInputs.push(sfInputs[i]);
			}
		}
		
		//alert(sfInputs);
		var sftextareas = $_ETag(f,"textarea");
		/*合并输入元素数组*/
		var sfEls = sftextareas.concat(sfFilterInputs);
		//alert(sfEls.length);
		for (var i=0; i<sfEls.length; i++) {
			sfEls[i].attachEvent("onfocus",function() {
				var srcEle = Util.srcElement(window.event||arguments.callee.caller.arguments[0]);
				srcEle.className += " sffocus";
			});
			sfEls[i].attachEvent("onblur",function() {
				var srcEle = Util.srcElement(window.event||arguments.callee.caller.arguments[0]);
				srcEle.className=srcEle.className.replace(new RegExp(" sffocus\\b"), "");
			});	
		}
	}
}

var FileUtil = {
     // 取得文件大小
	getFileSize:function(fileName) {  
      if(document.layers){  
          if(navigator.javaEnabled()){  
              var file = new java.io.File(fileName);  
              if(location.protocol.toLowerCase() != 'file:')  
                  netscape.security.PrivilegeManager.enablePrivilege(  
                  'UniversalFileRead'  
                  );  
              return file.length();  
          }  
          else return -1;  
      }  
      else if (document.all) {  
          window.oldOnError = window.onerror;  
          window.onerror = function (err){  
              if (err.indexOf('utomation') != -1) {  
                  alert('file access not possible');  
                  return  true;  
              }  
              else    
                  return false;  
          };  
          var fso = new ActiveXObject('Scripting.FileSystemObject');  
          var file = fso.GetFile(fileName);  
          window.onerror = window.oldOnError;  
          return file.Size;  
      }  
  }

}

// 自动改变frame的大小
function autoResize(frameDOM) {
	try {					
		frameDOM.style.height = frameDOM.document.body.scrollHeight;
	} catch(e){}
} 

/*排序table*/
//addEvent(window, "load", sortables_init);

var SORT_COLUMN_INDEX;

function sortables_init() {
    // Find all tables with class sortable and make them sortable
    if (!document.getElementsByTagName) return;
    tbls = document.getElementsByTagName("table");
    
    for (ti=0;ti<tbls.length;ti++) {
        thisTbl = tbls[ti];
        if (((' '+thisTbl.className+' ').indexOf("sortable") != -1) && (thisTbl.id)) {
            //initTable(thisTbl.id);
            ts_makeSortable(thisTbl);
        }
    }/**/
}

function ts_makeSortable(table) {
    if (table.rows && table.rows.length > 0) {
        var firstRow = table.rows[0];
    }
    if (!firstRow) return;
    
    // We have a first row: assume it's the header, and make its contents clickable links
    for (var i=0;i<firstRow.cells.length;i++) {
        var cell = firstRow.cells[i];
        var txt = ts_getInnerText(cell);
        cell.innerHTML = '<a href="#" class="sortheader" '+ 
        'onclick="ts_resortTable(this, '+i+');return false;">' + 
        txt+'<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>';
    }
}

function ts_getInnerText(el) {
	if (typeof el == "string") return el;
	if (typeof el == "undefined") { return el };
	
	if (el.innerText) return el.innerText;	//Not needed but it is faster
	var str = "";
	
	var cs = el.childNodes;
	var l = cs.length;
	for (var i = 0; i < l; i++) {
		switch (cs[i].nodeType) {
			case 1: //ELEMENT_NODE
				str += ts_getInnerText(cs[i]);
				break;
			case 3:	//TEXT_NODE
				str += cs[i].nodeValue;
				break;
		}
	}
	return str.trim();
}

function ts_resortTable(lnk,clid) {
    // get the span
    var span;
    for (var ci=0;ci<lnk.childNodes.length;ci++) {
        if (lnk.childNodes[ci].tagName && lnk.childNodes[ci].tagName.toLowerCase() == 'span') span = lnk.childNodes[ci];
    }
    var spantext = ts_getInnerText(span);
    var td = lnk.parentNode;
    var column = clid || td.cellIndex;
    var table = getParent(td,'TABLE');
    
    // Work out a type for the column
    if (table.rows.length <= 1) return;
    var itm = ts_getInnerText(table.rows[1].cells[column]);
  
  	//alert(itm);
    sortfn = ts_sort_caseinsensitive;
   
    if (itm.match(/^\d\d[\/-]\d\d[\/-]\d\d\d\d$/)) sortfn = ts_sort_date;
    if (itm.match(/^\d\d[\/-]\d\d[\/-]\d\d$/)) sortfn = ts_sort_date;
    if (itm.match(/^[?]/)) sortfn = ts_sort_currency;
    if (itm.match(/^(-?\d+)(\.\d+)?$/)) sortfn = ts_sort_numeric;
	
    
    SORT_COLUMN_INDEX = column;
    var firstRow = new Array();
    var newRows = new Array();
    for (i=0;i<table.rows[0].length;i++) { firstRow[i] = table.rows[0][i]; }
    for (j=1;j<table.rows.length;j++) { newRows[j-1] = table.rows[j]; }

    newRows.sort(sortfn);

    if (span.getAttribute("sortdir") == 'down') {
        ARROW = '&nbsp;&nbsp;&uarr;';
        newRows.reverse();
        span.setAttribute('sortdir','up');
    } else {
        ARROW = '&nbsp;&nbsp;&darr;';
        span.setAttribute('sortdir','down');
    }
    
    // We appendChild rows that already exist to the tbody, so it moves them rather than creating new ones
    // don't do sortbottom rows
    for (i=0;i<newRows.length;i++) { if (!newRows[i].className || (newRows[i].className && (newRows[i].className.indexOf('sortbottom') == -1))) table.tBodies[0].appendChild(newRows[i]);}
    // do sortbottom rows only
    for (i=0;i<newRows.length;i++) { if (newRows[i].className && (newRows[i].className.indexOf('sortbottom') != -1)) table.tBodies[0].appendChild(newRows[i]);}
    
    // Delete any other arrows there may be showing
    var allspans = document.getElementsByTagName("span");
    for (var ci=0;ci<allspans.length;ci++) {
        if (allspans[ci].className == 'sortarrow') {
            if (getParent(allspans[ci],"table") == getParent(lnk,"table")) { // in the same table as us?
                allspans[ci].innerHTML = '&nbsp;&nbsp;&nbsp;';
            }
        }
    }
        
    span.innerHTML = ARROW;
}

function getParent(el, pTagName) {
	if (el == null) return null;
	else if (el.nodeType == 1 && el.tagName.toLowerCase() == pTagName.toLowerCase())	// Gecko bug, supposed to be uppercase
		return el;
	else
		return getParent(el.parentNode, pTagName);
}
function ts_sort_date(a,b) {
    // y2k notes: two digit years less than 50 are treated as 20XX, greater than 50 are treated as 19XX
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]);
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]);
    if (aa.length == 10) {
        dt1 = aa.substr(6,4)+aa.substr(3,2)+aa.substr(0,2);
    } else {
        yr = aa.substr(6,2);
        if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
        dt1 = yr+aa.substr(3,2)+aa.substr(0,2);                                   
    }
    if (bb.length == 10) {
        dt2 = bb.substr(6,4)+bb.substr(3,2)+bb.substr(0,2);
    } else {
        yr = bb.substr(6,2);
        if (parseInt(yr) < 50) { yr = '20'+yr; } else { yr = '19'+yr; }
        dt2 = yr+bb.substr(3,2)+bb.substr(0,2);
    }
    if (dt1==dt2) return 0;
    if (dt1<dt2) return -1;
    return 1;
}

function ts_sort_currency(a,b) { 
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,'');
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,'');
    return parseFloat(aa) - parseFloat(bb);
}

function ts_sort_numeric(a,b) { 
    aa = parseFloat(ts_getInnerText(a.cells[SORT_COLUMN_INDEX]));
    if (isNaN(aa)) aa = 0;
    bb = parseFloat(ts_getInnerText(b.cells[SORT_COLUMN_INDEX])); 
    if (isNaN(bb)) bb = 0;
    return aa-bb;
}

function ts_sort_caseinsensitive(a,b) {
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]).toLowerCase();
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]).toLowerCase();
    return aa.localeCompare(bb);
}

function ts_sort_default(a,b) {
    aa = ts_getInnerText(a.cells[SORT_COLUMN_INDEX]);
    bb = ts_getInnerText(b.cells[SORT_COLUMN_INDEX]);
    if (aa==bb) return 0;
    if (aa<bb) return -1;
    return 1;
}


function addEvent(elm, evType, fn, useCapture)
// addEvent and removeEvent
// cross-browser event handling for IE5+,  NS6 and Mozilla
// By Scott Andrew
{
  if (elm.addEventListener){
    elm.addEventListener(evType, fn, useCapture);
    return true;
  } else if (elm.attachEvent){
    var r = elm.attachEvent("on"+evType, fn);
    return r;
  } else {
    alert("Handler could not be removed");
  }
} 
/*排序table END*/


