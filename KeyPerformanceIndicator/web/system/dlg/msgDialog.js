	function $id(id){
		return document.getElementById(id);
	}
	function ShowMsg(){
		document.writeln("<div id=\"msgdiv\" style=\"position:absolute;display:none;border:2px solid #AFCEF9;\"><\/div>");
		document.writeln("<div id=\"overdiv\" style=\"position:absolute;display:none;\">");
		document.writeln("<\/div>");
		this.ok_callback=function(value){};
		this.cancel_callback=function(){};
		this.msgobjname=""
		this.show=function(msgtitle,msgcontent,selecttype){
			var tempobj1=$id("msgdiv");
			var tempobj2=$id("overdiv");
			var msgobj=this.msgobjname;
			tempobj2.style.filter="alpha(opacity=20)";
			tempobj2.style.MozOpacity = 75/100;
			tempobj2.style.backgroundColor = "#ffffff";
			tempobj2.style.display = '';
			tempobj2.style.zIndex= 100;
			tempobj2.style.height= document.documentElement.clientHeight+"px";
			tempobj2.style.width= document.documentElement.clientWidth+"px";
			tempobj2.style.left=0;
			tempobj2.style.top=0;
			tempobj1.style.display="";
			tempobj1.style.left= 100;
			tempobj1.style.top= 100;
			tempobj1.style.display= '';
			tempobj1.style.width=398+"px";
			tempobj1.style.height=180+"px";
			tempobj1.style.zIndex= 200;
			tempobj1.style.backgroundColor = "#CDDAF1";
			var OutStr;
			OutStr="<div style=\"font-weight:bolder;text-align:center;height:20px;font-size:14px;cursor:move\" canmove=\"true\" forid=\"msgdiv\"><span class=MenuWhite>"+msgtitle+"</span></div>"
			OutStr=OutStr+"<div style=\"height:200px;text-align:center;font-size:12px;\"><textarea name=\"comment\" rows=\"10\" cols=\"50\">"+msgcontent+"</textarea></div>"
			if(selecttype==1){
				OutStr=OutStr+"<div style=\"text-align:center;font-size:12px;\"><input type=\"button\" class=\"button2\" value='确 定' onclick=\""+msgobj+".ok()\">    <input type=\"button\" value=\"ȡ��\" onclick=\""+msgobj+".cancel()\"></div>"
			}
			else if(selecttype==2){
				OutStr=OutStr+"<div style=\"text-align:center;font-size:12px;\"><input type=\"button\" class=\"button2\" value='确 定' onclick=\""+msgobj+".ok()\"></div>"
			}
			
			tempobj1.innerHTML=OutStr;
			var md=false,mobj,ox,oy;
			document.onmousedown=function(ev)
			{
				var ev=ev||window.event;
				var evt=ev.srcElement||ev.target;
				if(typeof(evt.getAttribute("canmove"))=="undefined")
				{
					 return;
				}
				if(evt.getAttribute("canmove"))
				{
					md = true;
					mobj = document.getElementById(evt.getAttribute("forid"));
					ox = mobj.offsetLeft - ev.clientX;
					oy = mobj.offsetTop - ev.clientY;
				}
			}
			document.onmouseup= function(){md=false;}
			document.onmousemove= function(ev)
			{
				var ev=ev||window.event;
				if(md)
				{
					mobj.style.left= (ev.clientX + ox)+"px";
					mobj.style.top= (ev.clientY + oy)+"px";
				}
			}
			}
			this.ok = function()
			{
				$id('msgdiv').style.display='none';
				$id('overdiv').style.display='none';
				this.ok_callback(document.getElementById("comment").value);
			}
			this.cancel=function(){
				$id('msgdiv').style.display='none';
				$id('overdiv').style.display='none';
				this.cancel_callback();
			}
	}