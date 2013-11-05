
/*
==================================================================
LTrim(string):??????????????
==================================================================
*/
function LTrim(str){
    var whitespace = new String(" \t\n\r");
    var s = new String(str);
    if (whitespace.indexOf(s.charAt(0)) != -1){
        var j=0, i = s.length;
        while (j < i && whitespace.indexOf(s.charAt(j)) != -1){
            j++;
        }
        s = s.substring(j, i);
    }
    return s;
}

/*
==================================================================
RTrim(string):??????????????
==================================================================
*/
function RTrim(str){
    var whitespace = new String(" \t\n\r");
    var s = new String(str);
    if (whitespace.indexOf(s.charAt(s.length-1)) != -1){
        var i = s.length - 1;
        while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1){
            i--;
        }
        s = s.substring(0, i+1);
    }
    return s;
}

/*
==================================================================
Trim(string):????????????
==================================================================
*/

function Trim(str){
    return RTrim(LTrim(str));
}

/*
================================================================================
XMLEncode(string):????????????XML????
================================================================================
*/
function XMLEncode(str){
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
??????????
================================================================================
*/
function IsEmpty(obj){
    obj=document.getElementsByName(obj).item(0);
    if(Trim(obj.value)==""){
        alert("??????????????"); 
		if(obj.disabled==false && obj.readOnly==false){
            obj.focus();
        }
    }
}

/*
IsInt(string,string,int or string):(??????????,+ or - or empty,empty or 0)
????????????????????????????????????????????+0????????+0
*/
function IsInt(objStr,sign,zero){
    var reg;    
    var bolzero;
    if(Trim(objStr)==""){
        return false;
    }else{
        objStr=objStr.toString();
    } 
    if((sign==null)||(Trim(sign)=="")){
        sign="+-";
    }
	if((zero==null)||(Trim(zero)=="")){
        bolzero=false;
    }else{
        zero=zero.toString();
        if(zero=="0"){
            bolzero=true;
        }else{
            alert("????????????0????????????(????0)");
        }
    }
    switch(sign){
        case "+-":
            //????
            reg=/(^-?|^\+?)\d+$/;
            break;
        case "+": 
            if(!bolzero){
                //??????
                reg=/^\+?[0-9]*[1-9][0-9]*$/;
            }else{
                //??????+0
                //reg=/^\+?\d+$/;
                reg=/^\+?[0-9]*[0-9][0-9]*$/;
            }
            break;
        case "-":
            if(!bolzero){
                //??????
                reg=/^-[0-9]*[1-9][0-9]*$/;
            }else{
                //??????+0
                //reg=/^-\d+$/;
                reg=/^-[0-9]*[0-9][0-9]*$/;
            } 
            break;
        default:
            alert("????????????????????(????+??-)");
            return false;
            break;
    }
    var r=objStr.match(reg);
    if(r==null){
        return false;
    }else{ 
        return true; 
    }
}

 

/*

IsFloat(string,string,int or string):(??????????,+ or - or empty,empty or 0)

????????????????????????????????????????????????????+0??????????+0

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

            alert("????????????0????????????(????0)");

        }

    }

    

    switch(sign)

    {

        case "+-":

            //??????

            reg=/^((-?|\+?)\d+)(\.\d+)?$/;

            break;

        case "+": 

            if(!bolzero)           

            {

                //????????

                reg=/^\+?(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;

            }

            else

            {

                //????????+0

                reg=/^\+?\d+(\.\d+)?$/;

            }

            break;

        case "-":

            if(!bolzero)

            {

                //????????

                reg=/^-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;

            }

            else

            {

                //????????+0

                reg=/^((-\d+(\.\d+)?)|(0+(\.0+)?))$/;

            }            

            break;

        default:

            alert("????????????????????(????+??-)");

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

IsEnLetter(string,string):??????????????????(UL,U,L or ul,u,l)

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

            //??????

            reg=/^[A-Za-z]+$/;

            break;

        case "U": 

            //????

            reg=/^[A-Z]+$/;

            break;

        case "L":

            //????

            reg=/^[a-z]+$/;

            break;

        default:

            alert("??????????????????????(????UL??U??L)");

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

//????????????????????
var LabelFontFace="????,arial,Verdana";
var LabelFontColor="#000000";
var LabelFontSize="9pt";
var LabelFontStyle="Font.PLAIN";
var LabelBorderColor="#000000";
var LabelBackColor="#FFFFE1";
 

//????????????

function SetLabelFontFace(obj){
       obj=Trim(obj);
       if(obj==null || obj==""){
              obj="????,arial,Verdana";
       }
       LabelFontFace=obj;
}

 

function SetLabelFontColor(obj){
    obj=Trim(obj);
    if(obj==null || obj==""){
           obj="#000000";
    }
    LabelFontColor=obj;
}

 

function SetLabelFontSize(obj){
    obj=Trim(obj);
    if(obj==null || obj==""){
           obj="9pt";
    }
    LabelFontSize=obj;
}

 

function SetLabelFontStyle(obj){
    obj=Trim(obj);
    if(obj==null || obj==""){
        obj="Font.PLAIN";
    }
    LabelFontStyle=obj;
}

 

function SetLabelBorderColor(obj){
    obj=Trim(obj);
    if(obj==null || obj==""){
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

 

//????????????

function SetTextStyle(str){
    var strRet="";
    var strStyle="";
    strStyle="font-family:"+LabelFontFace+";";
    strStyle+="color:"+LabelFontColor+";";
    strStyle+="font-size:"+LabelFontSize+";";

    switch(LabelFontStyle.toLowerCase()){
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
        	break;
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

 

//????????????

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

 

//????????

function ShowNote(str)

{

       var strHtml;

       

       strHtml="";

       strHtml+="<table height=1px width=1px border='0'cellspacing='0' cellpadding='0' style='" + SetTableStyle() + "'>";

       strHtml+="<tr>";

       strHtml+="<td>"+SetTextStyle(str)+"</td>";

       strHtml+="</tr>";

       strHtml+="</table>";                           

       

       if (document.all&&document.readyState=="complete")

       {                                        

              document.all.div_Note.innerHTML=strHtml;

              document.all.div_Note.style.pixelLeft=event.clientX+document.body.scrollLeft+10

              document.all.div_Note.style.pixelTop=event.clientY+document.body.scrollTop+10

              document.all.div_Note.style.visibility="visible"

       }     

}

 

//????????

function HideNote()

{

       if (document.all)

       {

              document.all.div_Note.style.visibility="hidden";

       }

       else

       {

              if (document.layers)

              {

                     clearInterval(currentscroll)

                     document.div_Note.visibility="hidden";

              }

       }                                 

}

 

//??????

function Init()

{

    window.document.write("<div id=\"div_Note\" style=\"VISIBILITY:hidden; POSITION:absolute; HEIGHT:13px;z-index:1\"></div>");

}

Init();

 

//????????????

function ShowLabel(text,note,bclick)

{

       if(bclick!=null)

       {

              return "<a href=\"#\" onMouseOver=\"ShowNote('" + note + "')\" onMouseOut=\"HideNote()\" onClick=\"JavaScript:DoSomeThing(this);\">" + text + "</a>";

       }

       else

       {

           return "<a href=\"#\" onMouseOver=\"ShowNote('" + note + "')\" onMouseOut=\"HideNote()\">" + text + "</a>";

       }

}

//????????????????
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
function view_form(url){
	window.open(url, "_blank", "width=800,height=600,left=0,right=0,resizable=no,status=no,scrollbars=1");
}

function body_init(){
	window.moveTo(0,0);
	window.resizeTo(screen.availWidth, screen.availHeight);
}
