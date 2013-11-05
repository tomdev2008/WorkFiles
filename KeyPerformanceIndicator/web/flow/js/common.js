/*

       名字：Common.js

       功能：通用JavaScript脚本函数库

       包括：

                     1.Trim(str)－－去除字符串两边的空格

                     2.XMLEncode(str)－－对字符串进行XML编码

            		 3.ShowLabel(str,str)－－鼠标提示功能（显示字符，提示字符）

                     4.IsEmpty(obj)－－验证输入框是否为空

                     5.IsInt(objStr,sign,zero)－－验证是否为整数

                     6.IsFloat(objStr,sign,zero)－－验证是否为浮点数

                     7.IsEnLetter(objStr,size)－－验证是否为26个字母

 

    作者：申旺

    日期：2004/04/14

*/

 

/*

==================================================================

字符串操作

Trim(string):去除字符串两边的空格

==================================================================

*/

 

/*

==================================================================

LTrim(string):去除左边的空格

==================================================================

*/

function LTrim(str)

{

    var whitespace = new String(" \t\n\r");

    var s = new String(str);

    

    if (whitespace.indexOf(s.charAt(0)) != -1)

    {

        var j=0, i = s.length;

        while (j < i && whitespace.indexOf(s.charAt(j)) != -1)

        {

            j++;

        }

        s = s.substring(j, i);

    }

    return s;

}

 

/*

==================================================================

RTrim(string):去除右边的空格

==================================================================

*/

function RTrim(str)

{

    var whitespace = new String(" \t\n\r");

    var s = new String(str);

 

    if (whitespace.indexOf(s.charAt(s.length-1)) != -1)

    {

        var i = s.length - 1;

        while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)

        {

            i--;

        }

        s = s.substring(0, i+1);

    }

    return s;

}

 

/*

==================================================================

Trim(string):去除前后空格

==================================================================

*/

function Trim(str)

{

    return RTrim(LTrim(str));

}

 

 

 

/*

================================================================================

XMLEncode(string):对字符串进行XML编码

================================================================================

*/

function XMLEncode(str)

{

       str=Trim(str);

       str=str.replace("&","&amp;");

       str=str.replace("<","&lt;");

       str=str.replace(">","&gt;");

       str=str.replace("'","&apos;");

       str=str.replace("\"","&quot;");

       return str;

}

 

/*

================================================================================

验证类函数

================================================================================

*/

 

function IsEmpty(obj)

{

    obj=document.getElementsByName(obj).item(0);

    if(Trim(obj.value)=="")

    {

        alert("字段不能为空。");        

        if(obj.disabled==false && obj.readOnly==false)

        {

            obj.focus();

        }

    }

}



/*

IsInt(string,string,int or string):(测试字符串,+ or - or empty,empty or 0)

功能：判断是否为整数、正整数、负整数、正整数+0、负整数+0

*/

function IsInt(objStr,sign,zero)

{

    var reg;    

    var bolzero;    

    

    if(Trim(objStr)=="")

    {

        return false;

    }

    else

    {

        objStr=objStr.toString();

    }    

    

    if((sign==null)||(Trim(sign)==""))

    {

        sign="+-";

    }

    

    if((zero==null)||(Trim(zero)==""))

    {

        bolzero=false;

    }

    else

    {

        zero=zero.toString();

        if(zero=="0")

        {

            bolzero=true;

        }

        else

        {

            alert("检查是否包含0参数，只可为(空、0)");

        }

    }

    

    switch(sign)

    {

        case "+-":

            //整数

            reg=/(^-?|^\+?)\d+$/;            

            break;

        case "+": 

            if(!bolzero)           

            {

                //正整数

                reg=/^\+?[0-9]*[1-9][0-9]*$/;

            }

            else

            {

                //正整数+0

                //reg=/^\+?\d+$/;

                reg=/^\+?[0-9]*[0-9][0-9]*$/;

            }

            break;

        case "-":

            if(!bolzero)

            {

                //负整数

                reg=/^-[0-9]*[1-9][0-9]*$/;

            }

            else

            {

                //负整数+0

                //reg=/^-\d+$/;

                reg=/^-[0-9]*[0-9][0-9]*$/;

            }            

            break;

        default:

            alert("检查符号参数，只可为(空、+、-)");

            return false;

            break;

    }

    

    var r=objStr.match(reg);

    if(r==null)

    {

        return false;

    }

    else

    {        

        return true;     

    }

}

 

/*

IsFloat(string,string,int or string):(测试字符串,+ or - or empty,empty or 0)

功能：判断是否为浮点数、正浮点数、负浮点数、正浮点数+0、负浮点数+0

*/

function IsFloat(objStr,sign,zero)

{

    var reg;    

    var bolzero;    

    

    if(Trim(objStr)=="")

    {

        return false;

    }

    else

    {

        objStr=objStr.toString();

    }    

    

    if((sign==null)||(Trim(sign)==""))

    {

        sign="+-";

    }

    

    if((zero==null)||(Trim(zero)==""))

    {

        bolzero=false;

    }

    else

    {

        zero=zero.toString();

        if(zero=="0")

        {

            bolzero=true;

        }

        else

        {

            alert("检查是否包含0参数，只可为(空、0)");

        }

    }

    

    switch(sign)

    {

        case "+-":

            //浮点数

            reg=/^((-?|\+?)\d+)(\.\d+)?$/;

            break;

        case "+": 

            if(!bolzero)           

            {

                //正浮点数

                reg=/^\+?(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;

            }

            else

            {

                //正浮点数+0

                reg=/^\+?\d+(\.\d+)?$/;

            }

            break;

        case "-":

            if(!bolzero)

            {

                //负浮点数

                reg=/^-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;

            }

            else

            {

                //负浮点数+0

                reg=/^((-\d+(\.\d+)?)|(0+(\.0+)?))$/;

            }            

            break;

        default:

            alert("检查符号参数，只可为(空、+、-)");

            return false;

            break;

    }

    

    var r=objStr.match(reg);

    if(r==null)

    {

        return false;

    }

    else

    {        

        return true;     

    }

}

/*

IsEnLetter(string,string):测试字符串，大小写(UL,U,L or ul,u,l)

*/

function IsEnLetter(objStr,size)

{

    var reg;

    

    if(Trim(objStr)=="")

    {

        return false;

    }

    else

    {

        objStr=objStr.toString();

    }    

    

    if((size==null)||(Trim(size)==""))

    {

        size="UL";

    }

    else

    {

        size=size.toUpperCase();

    }

    

    switch(size)

    {

        case "UL":

            //大小写

            reg=/^[A-Za-z]+$/;

            break;

        case "U": 

            //大写

            reg=/^[A-Z]+$/;

            break;

        case "L":

            //小写

            reg=/^[a-z]+$/;

            break;

        default:

            alert("检查大小写参数，只可为(空、UL、U、L)");

            return false;

            break;

    }

    

    var r=objStr.match(reg);

    if(r==null)

    {

        return false;

    }

    else

    {        

        return true;     

    }

}

 

 

/*

================================================================================

功能：鼠标小提示

作者：申旺

日期：2004/04/15

================================================================================

*/

 

//定义变量、设置默认值

var LabelFontFace="宋体,arial,Verdana";

var LabelFontColor="#000000";

var LabelFontSize="9pt";

var LabelFontStyle="Font.PLAIN";

var LabelBorderColor="#000000";

var LabelBackColor="#FFFFE1";

 

//设置各个属性

function SetLabelFontFace(obj)

{

       obj=Trim(obj);

       if(obj==null || obj=="")

       {

              obj="宋体,arial,Verdana";

       }

       LabelFontFace=obj;

}

 

function SetLabelFontColor(obj)

{

    obj=Trim(obj);

       if(obj==null || obj=="")

       {

              obj="#000000";

       }

       LabelFontColor=obj;

}

 

function SetLabelFontSize(obj)

{

    obj=Trim(obj);

       if(obj==null || obj=="")

       {

              obj="9pt";

       }

       LabelFontSize=obj;

}

 

function SetLabelFontStyle(obj)

{

    obj=Trim(obj);

       if(obj==null || obj=="")

       {

              obj="Font.PLAIN";

       }

       LabelFontStyle=obj;

}

 

function SetLabelBorderColor(obj)

{

    obj=Trim(obj);

    if(obj==null || obj=="")

    {

        obj="#000000";

    }

    LabelBorderColor=obj;

}

 

function SetLabelBackColor(obj)

{

    obj=Trim(obj);

    if(obj==null || obj=="")

    {

        obj="#FFFFE1";

    }

    LabelBackColor=obj;

}

 

//合成文字样式

function SetTextStyle(str)

{

    var strRet="";

    

    var strStyle="";

    

    strStyle="font-family:"+LabelFontFace+";";

    strStyle+="color:"+LabelFontColor+";";

    strStyle+="font-size:"+LabelFontSize+";";

    

    switch(LabelFontStyle.toLowerCase())

    {

        case "font.plain":

            strStyle+="font-weight: normal;";

            strStyle+="font-style: normal;";

            break;

        case "font.bold":

            strStyle+="font-weight: bold;";

            strStyle+="font-style: normal;";

            break;

        case "font.italic":

            strStyle+="font-weight: normal;";

            strStyle+="font-style: italic;";

            break;

        case "font.italicbold":

        case "font.bolditalic":

            strStyle+="font-weight: bold;";

            strStyle+="font-style: italic;";

            break;

        default:

            strStyle+="font-weight: bold;";

            strStyle+="font-style: italic;";

            break;

    }

    

    strRet="<font style='"+strStyle+"'>";

    strRet+="&nbsp;"+str+"&nbsp;";

    strRet+="</font>";

    

    return strRet;

}

 

//合成表格样式

function SetTableStyle()

{

    var strRet="";

    

    strRet+="border-right: "+LabelBorderColor+" 1px solid;";

    strRet+="border-top: "+LabelBorderColor+" 1px solid;";

    strRet+="border-left: "+LabelBorderColor+" 1px solid;";

    strRet+="border-bottom: "+LabelBorderColor+" 1px solid;";

    strRet+="background-color:"+LabelBackColor;    

    

    return strRet;

}



//设置checkbox全选的动作
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

function getAllChecked(checkname){
var allcheck=document.getElementsByName(checkname);
var ids="";
  for(i=0;i<allcheck.length;i++){
	  if(allcheck[i].checked==true){
	  if(ids==""){
	   ids=allcheck[i].value;
	   }
		else {
		ids = ids+","+allcheck[i].value;
		}
		}
  }
  return ids;
}

function getAllCheckedSplit(checkname, spliter){

var allcheck=document.getElementsByName(checkname);
var ids="";
  for(i=0;i<allcheck.length;i++){
	  if(allcheck[i].checked==true){
	 
	  if(ids==""){
	   ids=allcheck[i].value;
	   }
		else {
		ids = ids+spliter+allcheck[i].value;
		}
		}
  }
 
  return ids;
}

function disableButton(frame){
	controlButton(frame, true);
}

function enableButton(frame){
	controlButton(frame, false)
}

function controlButton(frame, enable){
	if(frame=="parent" || frame=="all"){
		if(parent){
			var buttons = parent.document.getElementsByTagName("input");
			for(var i=0; i<buttons.length; i++){
				if(buttons[i].type=="button")
					buttons[i].disabled=enable;
			}		
		}
	} else if (frame=="this" || frame=="all"){
		var buttons = document.getElementsByTagName("input");
		for(var i=0; i<buttons.length; i++){
			if(buttons[i].type=="button"){
				buttons[i].disabled=enable;
			}
		}		
	} else if(frame=="all"){//指定所有的情况下将当前window下面的iframe的所有button也disable掉
		var iframes = document.getElementsByTagName("iframe");
		for(var i=0; i<iframes.length; i++){
			if(subframe){
				var buttons = iframes[i].document.getElementsByTagName("input");
				for(var j=0; j<buttons.length; i++){
					if(buttons[j].type=="button")
						buttons[j].disabled=enable;
				}
			}
		}
	} else if(frame.indexOf("parent.")>=0) {
		var otherframe = parent.document.getElementsByName(frame.split(".")[1]);
		if(otherframe){
			for(var j=0; j<otherframe.length; j++){
				var buttons = otherframe[j].document.getElementsByTagName("input");
				for(var i=0; i<buttons.length; i++){
					if(buttons[i].type=="button")
						buttons[i].disabled=enable;
				}
			}
			if(otherframe.document){
				var buttons = otherframe.document.getElementsByTagName("input");
				for(var i=0; i<buttons.length; i++){
					if(buttons[i].type=="button")
						buttons[i].disabled=enable;
				}
			}
		}
	} else if(frame!="") {
		var subframe = document.all(frame);
		if(subframe){
			var buttons = subframe.document.getElementsByTagName("input");
			for(var i=0; i<buttons.length; i++){
				if(buttons[i].type=="button")
					buttons[i].disabled=enable;
			}
		}
	}
}

