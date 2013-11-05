	var	fixedX = -1			// x position (-1 if to appear below control)
	var	fixedY = -1 		// y position (-1 if to appear below control)
	var startAt = 1			// 0 - sunday ; 1 - monday
	var showWeekNumber = 1	// 0 - don't show; 1 - show
	var showToday = 1		// 0 - don't show; 1 - show
	var imgDir = "../img/dateimg/"			// directory for /innofund/images ... e.g. var imgDir="//test/images/"

	var gotoString = "选择当前日期"
	var todayString = ""
	var weekString = "周"
	var scrollLeftMessage = "选择上一个月份。"
	var scrollRightMessage = "选择下一个月份。"
	var selectMonthMessage = "在下拉菜单选择月份"
	var selectYearMessage = "在下拉菜单选择年."
	var selectDateMessage = "你选择了 [date] 为选定日期。" // do not replace [date], it will be replaced by date.

	var	crossobj, crossMonthObj, crossYearObj, monthSelected, yearSelected, dateSelected, omonthSelected, oyearSelected, odateSelected, monthConstructed, yearConstructed, intervalID1, intervalID2, timeoutID1, timeoutID2, ctlToPlaceValue, ctlNow, dateFormat, nStartingYear

	var	bPageLoaded=false
	var	ie=document.all
	var	dom=document.getElementById

	var	ns4=document.layers
	var	today =	new	Date()
	var	dateNow	 = today.getDate()
	var	monthNow = today.getMonth()
	var	yearNow	 = today.getYear()
	var	imgsrc = new Array("time_left.jpg","time_right.jpg","time_down.jpg","time_close.jpg","time_top_bg.jpg","time_month_bg.jpg","time_year_up.jpg","time_year_down.jpg","time_year_bg.jpg")
	var	img	= new Array()

	var bShow = false;

    /* hides <select> and <applet> objects (for IE only) */
    function hideElement( elmID, overDiv )
    {
      if( ie )
      {
        for( i = 0; i < document.all.tags( elmID ).length; i++ )
        {
          obj = document.all.tags( elmID )[i];
          if( !obj || !obj.offsetParent )
          {
            continue;
          }
      
          // Find the element's offsetTop and offsetLeft relative to the BODY tag.
          objLeft   = obj.offsetLeft;
          objTop    = obj.offsetTop;
          objParent = obj.offsetParent;
          
          while( objParent.tagName.toUpperCase() != "BODY" )
          {
            objLeft  += objParent.offsetLeft;
            objTop   += objParent.offsetTop;
            objParent = objParent.offsetParent;
          }
      
          objHeight = obj.offsetHeight;
          objWidth = obj.offsetWidth;
      
          if(( overDiv.offsetLeft + overDiv.offsetWidth ) <= objLeft );
          else if(( overDiv.offsetTop + overDiv.offsetHeight ) <= objTop );
          else if( overDiv.offsetTop >= ( objTop + objHeight ));
          else if( overDiv.offsetLeft >= ( objLeft + objWidth ));
          else
          {
            obj.style.visibility = "hidden";
          }
        }
      }
    }
     
    /*
    * unhides <select> and <applet> objects (for IE only)
    */
    function showElement( elmID )
    {
      if( ie )
      {
        for( i = 0; i < document.all.tags( elmID ).length; i++ )
        {
          obj = document.all.tags( elmID )[i];
          
          if( !obj || !obj.offsetParent )
          {
            continue;
          }
        
          obj.style.visibility = "";
        }
      }
    }

	function HolidayRec (d, m, y, desc)
	{
		this.d = d
		this.m = m
		this.y = y
		this.desc = desc
	}

	var HolidaysCounter = 0
	var Holidays = new Array()

	function addHoliday (d, m, y, desc)
	{
		Holidays[HolidaysCounter++] = new HolidayRec ( d, m, y, desc )
	}

	if (dom)
	{
		for	(i=0;i<imgsrc.length;i++)
		{
			img[i] = new Image
			img[i].src = imgDir + imgsrc[i]
		}
		document.write ("<div onclick='bShow=true' id='calendar' style='z-index:+999;text-align:left;width:186px;position:absolute;visibility:hidden;'><table width=186 border=0 align=center cellpadding=0 cellspacing=1 bgcolor=#A5B5BE><tr><td width=184><table width=184 border=0 align=center cellpadding=0 cellspacing=0><tr><td height=23 bgcolor=#A5B5BE><table width=184 height=17 border=0 cellpadding=0 cellspacing=0><tr><td width=160 style='background-image: url(" + imgDir + "/time_top_bg.jpg);background-repeat: no-repeat;background-position: left center;'><span id='caption'></span></td><td width=5><img src=" + imgDir + "/1-1.gif width=5 height=1></td><td width=12><a href='javascript:hideCalendar()'><img src=" + imgDir + "/time_close.jpg width=12 height=12 border=0 alt='关闭'></a></td><td width=5><img src=" + imgDir + "/1-1.gif width=4 height=1></td></tr></table></td></tr><tr><td style='padding:5px' bgcolor=#EDF0F2 style='font-family: Verdana;font-size: 11px;color: #8097A4;text-decoration: none;'><span id='content'></span></td></tr>")
			
		if (showToday==1)
		{
			document.write ("<tr><td height=22 align=center bgcolor=#D2DADE style='font-family: Verdana;font-size: 12px;color: #626F77;text-decoration: none;'><span id='lblToday'></span></td></tr>")
		}
			
		document.write ("</table></td></tr></table></div><div id='selectMonth' style='z-index:+999;position:absolute;visibility:hidden;'></div><div id='selectYear' style='z-index:+999;position:absolute;visibility:hidden;'></div>");
	}

	var	monthName =	new	Array("01月","02月","03月","04月","05月","06月","07月","08月","09月","10月","11月","12月")
	var	monthName2 = new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC")
	if (startAt==0)
	{
		dayName = new Array	("日","一","二","三","四","五","六")
	}
	else
	{
		dayName = new Array	("一","二","三","四","五","六","日")
	}
	var	styleAnchor="text-decoration:none;color:black;"
	var	styleLightBorder="border-style:solid;border-width:1px;border-color:#a0a0a0;"

	function swapImage(srcImg, destImg){
		if (ie)	{ document.getElementById(srcImg).setAttribute("src",imgDir + destImg) }
	}

	function init()	{
		if (!ns4)
		{
			if (!ie) { yearNow += 1900	}

			crossobj=(dom)?document.getElementById("calendar").style : ie? document.all.calendar : document.calendar
			hideCalendar()

			crossMonthObj=(dom)?document.getElementById("selectMonth").style : ie? document.all.selectMonth	: document.selectMonth

			crossYearObj=(dom)?document.getElementById("selectYear").style : ie? document.all.selectYear : document.selectYear

			monthConstructed=false;
			yearConstructed=false;

			if (showToday==1)
			{
				var lblTodayString = todayString + "" +	yearNow	+ " 年" + monthName[monthNow].substring(0,3)	+ "" + dateNow + "日";
				// 不显示星期
				//lblTodayString =lblTodayString + " 星期"+ dayName[(today.getDay()-startAt==-1)?6:(today.getDay()-startAt)]+ "";
				
				// 显示清除命令
				lblTodayString = lblTodayString + "&nbsp;&nbsp;&nbsp;&nbsp;<A href='javascript:;' onclick='dateSelected=-1;closeCalendar();'>清除</A>"
				document.getElementById("lblToday").innerHTML =	lblTodayString;
			}

			sHTML1="<span id='spanLeft'	style='cursor:pointer' onmouseover='swapImage(\"changeLeft\",\"time_left.jpg\");window.status=\""+scrollLeftMessage+"\"' onclick='javascript:decMonth()' onmouseout='clearInterval(intervalID1);swapImage(\"changeLeft\",\"time_left.jpg\");window.status=\"\"' onmousedown='clearTimeout(timeoutID1);timeoutID1=setTimeout(\"StartDecMonth()\",500)'	onmouseup='clearTimeout(timeoutID1);clearInterval(intervalID1)'><img src=" + imgDir + "/1-1.gif width=5 height=17 align=absmiddle><IMG id='changeLeft' SRC='"+imgDir+"time_left.jpg' width=12 height=12 BORDER=0><img src=" + imgDir + "/1-1.gif width=5 height=17 align=absmiddle></span>"
			sHTML1+="<span id='spanRight' style='cursor:pointer'	onmouseover='swapImage(\"changeRight\",\"time_right.jpg\");window.status=\""+scrollRightMessage+"\"' onmouseout='clearInterval(intervalID1);swapImage(\"changeRight\",\"time_right.jpg\");window.status=\"\"' onclick='incMonth()' onmousedown='clearTimeout(timeoutID1);timeoutID1=setTimeout(\"StartIncMonth()\",500)'	onmouseup='clearTimeout(timeoutID1);clearInterval(intervalID1)'><IMG id='changeRight' SRC='"+imgDir+"time_right.jpg'	width=12 height=12 BORDER=0><img src=" + imgDir + "/1-1.gif width=5 height=17 align=absmiddle></span>"
			sHTML1+="<span id='spanMonth' style='font-family: Verdana;font-size: 11px;color: #FFFFFF;text-decoration: none;line-height: 16px;cursor:pointer' onmouseover='window.status=\""+selectMonthMessage+"\"' onmouseout='window.status=\"\"' onclick='popUpMonth()'></span><img src=" + imgDir + "/1-1.gif width=8 height=17 align=absmiddle>"
			sHTML1+="<span id='spanYear' style='font-family: Verdana;font-size: 11px;color: #FFFFFF;text-decoration: none;line-height: 16px;cursor:pointer' onmouseover='window.status=\""+selectYearMessage+"\"'	onmouseout='window.status=\"\"'	onclick='popUpYear()'></span>"
			
			document.getElementById("caption").innerHTML  =	sHTML1

			bPageLoaded=true
		}
	}

	function hideCalendar()	{
		crossobj.visibility="hidden"
		if (crossMonthObj != null){crossMonthObj.visibility="hidden"}
		if (crossYearObj !=	null){crossYearObj.visibility="hidden"}

	    showElement( 'SELECT' );
		showElement( 'APPLET' );
	}

	function padZero(num) {
		return (num	< 10)? '0' + num : num ;
	}

	function constructDate(d,m,y)
	{
		sTmp = dateFormat
		sTmp = sTmp.replace	("dd","<e>")
		sTmp = sTmp.replace	("d","<d>")
		sTmp = sTmp.replace	("<e>",padZero(d))
		sTmp = sTmp.replace	("<d>",d)
		sTmp = sTmp.replace	("mmmm","<p>")
		sTmp = sTmp.replace	("mmm","<o>")
		sTmp = sTmp.replace	("mm","<n>")
		sTmp = sTmp.replace	("m","<m>")
		sTmp = sTmp.replace	("<m>",m+1)
		sTmp = sTmp.replace	("<n>",padZero(m+1))
		sTmp = sTmp.replace	("<o>",monthName[m])
		sTmp = sTmp.replace	("<p>",monthName2[m])
		sTmp = sTmp.replace	("yyyy",y)
		return sTmp.replace ("yy",padZero(y%100))
	}

	function closeCalendar() {
		var	sTmp

		hideCalendar();
		if (dateSelected != -1){
			ctlToPlaceValue.value =	constructDate(dateSelected,monthSelected,yearSelected);
		}else{
			ctlToPlaceValue.value = "";
		}
	}
	

	/*** Month Pulldown	***/

	function StartDecMonth()
	{
		intervalID1=setInterval("decMonth()",80)
	}

	function StartIncMonth()
	{
		intervalID1=setInterval("incMonth()",80)
	}

	function incMonth () {
		monthSelected++
		if (monthSelected>11) {
			monthSelected=0
			yearSelected++
		}
		constructCalendar()
	}

	function decMonth () {
		monthSelected--
		if (monthSelected<0) {
			monthSelected=11
			yearSelected--
		}
		constructCalendar()
	}

	function constructMonth() {
		popDownYear()
		if (!monthConstructed) {
			sHTML =	""
			for	(i=0; i<12;	i++) {
				sName =	monthName[i];
				if (i==monthSelected){
					sName =	"<font color=#ED0000>" +	sName +	"</font>"
				}
				sHTML += "<tr><td id='m" + i + "' onmouseover='this.style.backgroundColor=\"#626F77\"' onmouseout='this.style.backgroundColor=\"\"' style='cursor:pointer' onclick='monthConstructed=false;monthSelected=" + i + ";constructCalendar();popDownMonth();event.cancelBubble=true'>&nbsp;" + sName + "&nbsp;</td></tr>"
			}

			document.getElementById("selectMonth").innerHTML = "<table width=52 border=0 cellspacing=2 cellpadding=0 style='background-image: url(" + imgDir + "/time_month_bg.jpg);background-repeat: repeat-y;background-color: #8C9FAA;font-family: Verdana;font-size: 11px;color: #FFFFFF;text-decoration: none;line-height: 18px;' onmouseover='clearTimeout(timeoutID1)' onmouseout='clearTimeout(timeoutID1);timeoutID1=setTimeout(\"popDownMonth()\",100);event.cancelBubble=true'>" +	sHTML +	"</table>"

			monthConstructed=true
		}
	}

	function popUpMonth() {
		constructMonth()
		crossMonthObj.visibility = (dom||ie)? "visible"	: "show"
		crossMonthObj.left = parseInt(crossobj.left) + 40
		crossMonthObj.top =	parseInt(crossobj.top) + 24

		hideElement( 'SELECT', document.getElementById("selectMonth") );
		hideElement( 'APPLET', document.getElementById("selectMonth") );			
	}

	function popDownMonth()	{
		crossMonthObj.visibility= "hidden"
	}

	/*** Year Pulldown ***/

	function incYear() {
		for	(i=0; i<7; i++){
			newYear	= (i+nStartingYear)+1
			if (newYear==yearSelected)
			{ txtYear =	"<font color=#ED0000>"	+ newYear +	"</font>" }
			else
			{ txtYear =	"" + newYear + "" }
			document.getElementById("y"+i).innerHTML = txtYear
		}
		nStartingYear ++;
		bShow=true
	}

	function decYear() {
		for	(i=0; i<7; i++){
			newYear	= (i+nStartingYear)-1
			if (newYear==yearSelected)
			{ txtYear =	"<font color=#ED0000>"	+ newYear +	"</font>" }
			else
			{ txtYear =	"" + newYear + "" }
			document.getElementById("y"+i).innerHTML = txtYear
		}
		nStartingYear --;
		bShow=true
	}

	function selectYear(nYear) {
		yearSelected=parseInt(nYear+nStartingYear);
		yearConstructed=false;
		constructCalendar();
		popDownYear();
	}

	function constructYear() {
		popDownMonth()
		sHTML =	""
		if (!yearConstructed) {

			sHTML =	"<tr><td align='center' onmouseout='clearInterval(intervalID1)' style='cursor:pointer'	onmousedown='clearInterval(intervalID1);intervalID1=setInterval(\"decYear()\",30)' onmouseup='clearInterval(intervalID1)'><img src=" + imgDir + "/time_year_up.jpg width=66 height=13 border=0></td></tr>"

			j =	0
			nStartingYear =	yearSelected-3
			for	(i=(yearSelected-3); i<=(yearSelected+3); i++) {
				sName =	i;
				if (i==yearSelected){
					sName =	"<font color=#ED0000>" +	sName +"</font>"
				}

				sHTML += "<tr><td><table width=52 border=0 cellspacing=0 cellpadding=0 style='font-family: Verdana;font-size: 11px;color: #FFFFFF;text-decoration: none;line-height: 18px;cursor:pointer;'><tr><td align=center id='y" + j + "' onclick='selectYear("+j+");event.cancelBubble=true' onmouseover='this.style.backgroundColor=\"#626F77\"' onmouseout='this.style.backgroundColor=\"\"'>" + sName + "</td></tr></table></td></tr>"
				j ++;
			}

			sHTML += "<tr><td align='center' onmouseout='clearInterval(intervalID2);' style='cursor:pointer' onmousedown='clearInterval(intervalID2);intervalID2=setInterval(\"incYear()\",30)'	onmouseup='clearInterval(intervalID2)'><img src=" + imgDir + "/time_year_down.jpg width=66 height=13 border=0></td></tr>"

			document.getElementById("selectYear").innerHTML	= "<table width=66 border=0 cellspacing=0 cellpadding=0 style='background-image: url(" + imgDir + "/time_year_bg.jpg); background-repeat:repeat-y' onmouseover='clearTimeout(timeoutID2)' onmouseout='clearTimeout(timeoutID2);timeoutID2=setTimeout(\"popDownYear()\",100)' cellspacing=0>"	+ sHTML	+ "</table>"

			yearConstructed	= true
		}
	}

	function popDownYear() {
		clearInterval(intervalID1)
		clearTimeout(timeoutID1)
		clearInterval(intervalID2)
		clearTimeout(timeoutID2)
		crossYearObj.visibility= "hidden"
	}

	function popUpYear() {
		var	leftOffset

		constructYear()
		crossYearObj.visibility	= (dom||ie)? "visible" : "show"
		leftOffset = parseInt(crossobj.left) + document.getElementById("spanYear").offsetLeft
		if (ie)
		{
			leftOffset += -4
		}
		crossYearObj.left =	leftOffset
		crossYearObj.top = parseInt(crossobj.top) +	24
	}

	/*** calendar ***/
   function WeekNbr(n) {
      // Algorithm used:
      // From Klaus Tondering's Calendar document (The Authority/Guru)
      // hhtp://www.tondering.dk/claus/calendar.html
      // a = (14-month) / 12
      // y = year + 4800 - a
      // m = month + 12a - 3
      // J = day + (153m + 2) / 5 + 365y + y / 4 - y / 100 + y / 400 - 32045
      // d4 = (J + 31741 - (J mod 7)) mod 146097 mod 36524 mod 1461
      // L = d4 / 1460
      // d1 = ((d4 - L) mod 365) + L
      // WeekNumber = d1 / 7 + 1
 
      year = n.getFullYear();
      month = n.getMonth() + 1;
      if (startAt == 0) {
         day = n.getDate() + 1;
      }
      else {
         day = n.getDate();
      }
 
      a = Math.floor((14-month) / 12);
      y = year + 4800 - a;
      m = month + 12 * a - 3;
      b = Math.floor(y/4) - Math.floor(y/100) + Math.floor(y/400);
      J = day + Math.floor((153 * m + 2) / 5) + 365 * y + b - 32045;
      d4 = (((J + 31741 - (J % 7)) % 146097) % 36524) % 1461;
      L = Math.floor(d4 / 1460);
      d1 = ((d4 - L) % 365) + L;
      week = Math.floor(d1/7) + 1;
 
      return week;
   }

	function constructCalendar () {
		var aNumDays = Array (31,0,31,30,31,30,31,31,30,31,30,31)

		var dateMessage
		var	startDate =	new	Date (yearSelected,monthSelected,1)
		var endDate

		if (monthSelected==1)
		{
			endDate	= new Date (yearSelected,monthSelected+1,1);
			endDate	= new Date (endDate	- (24*60*60*1000));
			numDaysInMonth = endDate.getDate()
		}
		else
		{
			numDaysInMonth = aNumDays[monthSelected];
		}

		datePointer	= 0
		dayPointer = startDate.getDay() - startAt
		
		if (dayPointer<0)
		{
			dayPointer = 6
		}

		sHTML =	"<table width=100% border=0 cellspacing=0 cellpadding=0 style='font-family: Verdana;font-size: 11px;color: #626F77;text-decoration: none;line-height: 18px;'><tr>"

		if (showWeekNumber==1)
		{
			sHTML += ""
		}

		for	(i=0; i<7; i++)	{
			sHTML += "<td align='right'><b>"+ dayName[i]+"</b>&nbsp;</td>"
		}
		sHTML +="</tr><tr>"
		
		if (showWeekNumber==1)
		{
			sHTML += ""
		}

		for	( var i=1; i<=dayPointer;i++ )
		{
			sHTML += "<td>&nbsp;</td>"
		}
	
		for	( datePointer=1; datePointer<=numDaysInMonth; datePointer++ )
		{
			dayPointer++;
			sHTML += "<td align=right>"
			sStyle=styleAnchor
			if ((datePointer==odateSelected) &&	(monthSelected==omonthSelected)	&& (yearSelected==oyearSelected))
			{ sStyle+=styleLightBorder }

			sHint = ""
			for (k=0;k<HolidaysCounter;k++)
			{
				if ((parseInt(Holidays[k].d)==datePointer)&&(parseInt(Holidays[k].m)==(monthSelected+1)))
				{
					if ((parseInt(Holidays[k].y)==0)||((parseInt(Holidays[k].y)==yearSelected)&&(parseInt(Holidays[k].y)!=0)))
					{
						sStyle+="background-color:#A5B5BE;"
						sHint+=sHint==""?Holidays[k].desc:"\n"+Holidays[k].desc
					}
				}
			}

			var regexp= /\"/g
			sHint=sHint.replace(regexp,"&quot;")

			dateMessage = "onmousemove='window.status=\""+selectDateMessage.replace("[date]",constructDate(datePointer,monthSelected,yearSelected))+"\"' onmouseout='window.status=\"\"' "

			if ((datePointer==dateNow)&&(monthSelected==monthNow)&&(yearSelected==yearNow))
			{ sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' href='javascript:dateSelected="+datePointer+";closeCalendar();'><font color=#FF6600>&nbsp;" + datePointer + "</font>&nbsp;</a>"}
			else if	(dayPointer % 7 == (startAt * -1)+1)
			{ sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' href='javascript:dateSelected="+datePointer + ";closeCalendar();'>&nbsp;<font color=#ED0000>" + datePointer + "</font>&nbsp;</a>" }
			else
			{ sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' href='javascript:dateSelected="+datePointer + ";closeCalendar();'>&nbsp;" + datePointer + "&nbsp;</a>" }

			sHTML += ""
			if ((dayPointer+startAt) % 7 == startAt) { 
				sHTML += "</tr><tr>" 
				if ((showWeekNumber==1)&&(datePointer<numDaysInMonth))
				{
					sHTML += ""
				}
			}
		}

		document.getElementById("content").innerHTML   = sHTML
		document.getElementById("spanMonth").innerHTML = "<img src=" + imgDir + "/1-1.gif width=7 height=17 align=absmiddle>" +	monthName[monthSelected] + "<img src=" + imgDir + "/1-1.gif width=5 height=17 align=absmiddle><img id=changeMonth src=" + imgDir + "/time_down.jpg width=14 height=17 border=0 align=absmiddle>"
		document.getElementById("spanYear").innerHTML =	"<img src=" + imgDir + "/1-1.gif width=2 height=17 align=absmiddle>" + yearSelected	+ "年<img src=" + imgDir + "/1-1.gif width=5 height=17 align=absmiddle><img id=changeYear src=" + imgDir + "/time_down.jpg width=14 height=17 border=0 align=absmiddle>"
	}

	function popUpCalendar(ctl) {
		var ctl2=ctl;
		var format="yyyy-mm-dd";
		var	leftpos=0
		var	toppos=0

		if (bPageLoaded)
		{
			if ( crossobj.visibility ==	"hidden" ) {
				ctlToPlaceValue	= ctl2
				dateFormat=format;

				formatChar = " "
				aFormat	= dateFormat.split(formatChar)
				if (aFormat.length<3)
				{
					formatChar = "/"
					aFormat	= dateFormat.split(formatChar)
					if (aFormat.length<3)
					{
						formatChar = "."
						aFormat	= dateFormat.split(formatChar)
						if (aFormat.length<3)
						{
							formatChar = "-"
							aFormat	= dateFormat.split(formatChar)
							if (aFormat.length<3)
							{
								// invalid date	format
								formatChar=""
							}
						}
					}
				}

				tokensChanged =	0
				if ( formatChar	!= "" )
				{
					// use user's date
					aData =	ctl2.value.split(formatChar)

					for	(i=0;i<3;i++)
					{
						if ((aFormat[i]=="d") || (aFormat[i]=="dd"))
						{
							dateSelected = parseInt(aData[i], 10)
							tokensChanged ++
						}
						else if	((aFormat[i]=="m") || (aFormat[i]=="mm"))
						{
							monthSelected =	parseInt(aData[i], 10) - 1
							tokensChanged ++
						}
						else if	(aFormat[i]=="yyyy")
						{
							yearSelected = parseInt(aData[i], 10)
							tokensChanged ++
						}
						else if	(aFormat[i]=="mmm")
						{
							for	(j=0; j<12;	j++)
							{
								if (aData[i]==monthName[j])
								{
									monthSelected=j
									tokensChanged ++
								}
							}
						}
						else if	(aFormat[i]=="mmmm")
						{
							for	(j=0; j<12;	j++)
							{
								if (aData[i]==monthName2[j])
								{
									monthSelected=j
									tokensChanged ++
								}
							}
						}
					}
				}

				if ((tokensChanged!=3)||isNaN(dateSelected)||isNaN(monthSelected)||isNaN(yearSelected))
				{
					dateSelected = dateNow
					monthSelected =	monthNow
					yearSelected = yearNow
				}

				odateSelected=dateSelected
				omonthSelected=monthSelected
				oyearSelected=yearSelected

				aTag = ctl
				do {
					aTag = aTag.offsetParent;
					leftpos	+= aTag.offsetLeft;
					toppos += aTag.offsetTop;
				} while(aTag.tagName!="BODY");
				var offset2=Offset(ctl);
				//crossobj.left =	fixedX==-1 ? ctl.offsetLeft	+ leftpos :	fixedX
				crossobj.left=offset2.left + "px";
				//crossobj.top = fixedY==-1 ?	ctl.offsetTop +	toppos + ctl.offsetHeight +	2 :	fixedY
				crossobj.top=(offset2.top + 20) + "px";
				constructCalendar (1, monthSelected, yearSelected);
				crossobj.visibility=(dom||ie)? "visible" : "show"

				hideElement( 'SELECT', document.getElementById("calendar") );
				hideElement( 'APPLET', document.getElementById("calendar") );			

				bShow = true;
			}
			else
			{
				hideCalendar()
				if (ctlNow!=ctl) {popUpCalendar(ctl, ctl2, format)}
			}
			ctlNow = ctl
		}
	}

	document.onkeypress = function hidecal1 () { 
		if (event.keyCode==27) 
		{
			hideCalendar()
		}
	}


	if(ie)
	{
		init()
	}
	else
	{
		window.onload=init
	}


function T1_onkeyup() {
  if(document.aa.EPR_FAREN_CODE_FORE.value.length==8){
     document.aa.EPR_FAREN_CODE_BACK.focus();
   }
} 
function T1_onkeyupold() {
  if(document.aa.EPR_FAREN_CODE_FORE_OLD.value.length==8){
     document.aa.EPR_FAREN_CODE_BACK_OLD.focus();
   }
} 
function resetTime() {
	document.aa.EPR_REG_ENDTIME.value="";
} 
