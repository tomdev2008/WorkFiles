
var jstools={afocus:function(selecter){$(selecter).attr("hideFocus","true");},hover:function(objs,config){if(typeof config==="string")
{var classname=config;addclass();}else if(typeof config==="object"){try{if(typeof config.classname==="string"){var classname=config.classname;addclass();return false;};if(typeof config.html==="string"){var text_html=$(objs).html();$(objs).hover(function(){$(this).html(config.html)},function(){$(this).html(text_html)})}
if(typeof config.style1==="object"){$(objs).bind("mouseenter",function(){$(this).css(config.style1)});}
if(typeof config.style2==="object"){$(objs).bind("mouseleave",function(){$(this).css(config.style2)});}
if(typeof config.fun==="function"){$(objs).bind("mousemove",function(){config.fun($(this))})}
if(typeof config.fun2==="function"){$(objs).bind("mouseleave",function(){config.fun2($(this))})}}catch(e){throw e;}}
return $(objs);function addclass(){$(objs).live("mousemove",function(event){if(!$(this).hasClass(classname)){$(this).addClass(classname);}});$(objs).live("mouseleave",function(event){if($(this).hasClass(classname)){$(this).removeClass(classname);}});}},hoverother:function(selecter1,selecter2,classname,style){var style;if(style==null)
style=1;$(selecter1).live("mousemove",function(event){if(!$(selecter2).hasClass(classname)){$(selecter2).addClass(classname);}});switch(style)
{case 1:$(selecter1).live("mouseleave",function(event){if($(selecter2).hasClass(classname)){$(selecter2).removeClass(classname);}});break;case 2:$(selecter2).live("mouseleave",function(event){if($(selecter2).hasClass(classname)){$(selecter2).removeClass(classname);}});break;}},onfocus:function(objs,classname){$(objs).live("focus",function(event){if(!$(this).hasClass(classname)){$(this).addClass(classname);}});$(objs).live("blur",function(event){if($(this).hasClass(classname)){$(this).removeClass(classname);}});},inputblur:function(x){var inputstr;if(x!=null)
{inputstr=x;}else
{inputstr="input[type='text'],textarea";}
var defcolor="#333";var input=$(inputstr);input.each(function(index,element){$(this).attr("defval",$(this).attr("value"));$(this).attr("defcol",$(this).css("color"));});input.live("focus",function(){if($(this).val()==$(this).attr("defval"))
{$(this).attr("value","");}
$(this).css("color",defcolor);}).live("blur",function(){if($(this).val()=="")
{$(this).val($(this).attr("defval"));}
$(this).css("color",$(this).attr("defcol"));});},sidebar:function(selecter,topPadding){var $sidebar=$(selecter),$window=$(window),offset=$sidebar.offset(),topPadding;if(topPadding==null)
topPadding=200;$window.scroll(function(){if($window.scrollTop()>offset.top){$sidebar.stop().animate({marginTop:$window.scrollTop()-offset.top+topPadding});}else{$sidebar.stop().animate({marginTop:0});}});},gundong:function(outside,inside,time,point,steep){var ins=$(outside).find(inside)
var num=$(ins).length;var ih=0;var oh=$(outside).height();var steep;if(steep==null)
steep=1;if(point=="up"||point=="down")
{for(var i=0;i<num;i++)
{ih+=$(ins[i]).height();}
if(ih>oh)
{gun();}}
function gun(){var m=0;window.setInterval(function(){$(ins).fadeOut(500).slideUp(300);for(var i=0;i<steep;i++){$(ins).eq(m).fadeIn(800);m=(m+1)%num;}},time);}},imgtobig:function(selecter,todiv){$(selecter).mouseover(function(){var $oimg=$(this)
var imgstr="<img src=\""+$oimg.attr("src")+"\" alt=\""+$oimg.attr("alt")+"\"/>";$(todiv).html(imgstr);$(todiv).show();});$(todiv).mouseout(function(){$(this).hide();});},textgun:function(selecter,steepheight,time,style){var style;var truning;if(style==null)
style=0;$(selecter).after($(selecter).clone());$(selecter).eq(0).attr("id","tgun0");$(selecter).eq(1).attr("id","tgun1");var objheight=$(selecter).height();tgun();$(selecter).hover(function(){clearInterval(truning);},function(){tgun();});var m=n=0;function tgun(){truning=window.setInterval(function(){switch(style){case 0:$(selecter+"#tgun0").css({"margin-top":m+"px"});$(selecter+"#tgun1").css({"margin-top":n+"px"});break;case 1:$(selecter+"#tgun0").animate({"margin-top":m+"px"});$(selecter+"#tgun1").animate({"margin-top":n+"px"});break;};if(m<-objheight)
{m=m+objheight;n=n-2*objheight;}
if(m>0)
{n=n-steepheight;}
else
{n=0;}
m=m-steepheight;},time);}},tab:function(tabt,tabt_c,tabb,tabb_c,even){var even;var index=0;if(even==null)
even="mouseenter";$(tabt).live(even,function(){$(tabt).removeClass(tabt_c);$(this).addClass(tabt_c);index=$(tabt).index(this);$(tabb).removeClass(tabb_c);$(tabb).eq(index).addClass(tabb_c);return false;});},tab2:function(tabt,tabb,even,config){var _this=this;var even;if(even==null)
even="mouseenter";$(tabt).live(even,function(){$(this).addClass("on").siblings().removeClass("on");index=$(tabt).index(this);$(tabb).hide();$(tabb).eq(index).show();return false;});this.openli=function(s){$(tabt).removeClass("on");$(tabt).eq(s).addClass("on");$(tabb).hide();$(tabb).eq(s).show();}
_this.openli(0);if(typeof config==="function"){config(_this)}},toggle:function(selecter,classname,even){var even,classname;if(even==null)even="click";if(classname==null)classname="on";$(selecter).bind(even,function(){if($(this).hasClass(classname))
$(this).removeClass(classname);else
$(this).addClass(classname);});},toggleother:function(selecter1,selecter2,config){var classname=(typeof config==="string")?config:(config!=null)?config.classname||"on":"on";var events=(config!=null)?config.even||"click":"click";var chtml=(config!=null)?config.html:null;var html1=$(selecter2).html();$(selecter1).bind(events,function(){var $s2=$(selecter2);if($s2.hasClass(classname))
$s2.removeClass(classname);else
$s2.addClass(classname);if(chtml!=null)
{if($s2.html()!=chtml)
{$s2.html(chtml);}else
{$s2.html(html1);}}});},even:function(selecter,classname){$(selecter+":even").addClass(classname);},odd:function(selecter,classname){$(selecter+":odd").addClass(classname);},gotop:function(obj,config){var $gobox=$(obj);var $goa=$(obj);var hide=true;if(typeof config==="string")
$goa=$(config);else if(typeof config==="object")
{$goa=(typeof config.inbox==="string")?$(obj).find(config.inbox):$(obj);if(typeof(config.hide)==="boolean"&&config.hide===false)
hide=false;}
if(hide==true){$gobox.stop().fadeOut(0);$(window).scroll(function(){if($(window).scrollTop()>0)
$gobox.fadeIn("fast");else
$gobox.fadeOut("fast");});}
$goa.click(function(){$(window).scrollTop(0)});}}
function iframeheight(obj){var win=obj;if(document.getElementById){if(win&&!window.opera){if(win.contentDocument&&win.contentDocument.body.offsetHeight)
win.height=win.contentDocument.body.offsetHeight+0+"px";else if(win.Document&&win.Document.body.scrollHeight)
win.height=win.Document.body.scrollHeight+0+"px";}}}
$(document).ready(function(e){jstools.afocus("a");});