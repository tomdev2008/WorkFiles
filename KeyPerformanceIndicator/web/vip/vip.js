function setPHeight1(){
	var min = 400;
	var temp = 0;
	var temp1 = 0;
	var temp2 = 0;
	var mainFrame1 = null;
	if(parent.document.all["mainFrame1"]!=undefined&&parent.upFrame!=null){
	  mainFrame1 = parent.document.all["mainFrame1"];
	  if(parent.upFrame.fbody!=null)
		  temp1 = parent.upFrame.fbody.document.body.scrollHeight+60;
	  temp2 = document.body.scrollHeight;
	  mainFrame1.rows=temp1+",*";
	  //alert(temp1+"  "+temp2);
	  //alert(temp);
	  temp = temp1 + temp2;
	  //alert(temp);
	}else if(parent.parent.document.all["mainFrame1"]!=undefined&&parent.parent.downFrame){
	  mainFrame1 = parent.parent.document.all["mainFrame1"];
	  temp1 = document.body.scrollHeight+60;
	  temp2 = parent.parent.downFrame.document.body.scrollHeight;
	  temp = temp1 + temp2;
	  mainFrame1.rows=temp1+",*";
	  //mainFrame1 = parent.parent.document.all["mainFrame1"];
	}else{
		temp = this.document.body.scrollHeight;
	}
	
	if(parent.parent.parent.document.all["fraOAContent"]!=undefined){
		if(temp<min) temp = min;
		//alert("temp1:"+temp);
		parent.parent.parent.document.all["fraOAContent"].height=temp+60;
	}else if(parent.parent.parent.parent.document.all["fraOAContent"]!=undefined){
		if(temp<min) temp = min;
		//alert("temp2:"+temp);
		parent.parent.parent.parent.document.all["fraOAContent"].height=temp+60;
	}
}



function setPHeight2(){
	var min = 400;
	var temp = 0;
	var temp1 = 0;
	var temp2 = 0;
	var mainFrame1 = null;
	if(parent.document.all["mainFrame1"]!=undefined&&parent.upFrame!=null){
	  mainFrame1 = parent.document.all["mainFrame1"];
	  if(parent.upFrame.fbody!=null)
		  temp1 = parent.upFrame.fbody.document.body.scrollHeight+60;
	  temp2 = document.body.scrollHeight;
	  mainFrame1.rows=temp1+",*";
	  //alert(temp1+"  "+temp2);
	  //alert(temp);
	  temp = temp1 + temp2;
	  //alert(temp);
	}else if(parent.parent.document.all["mainFrame1"]!=undefined&&parent.parent.downFrame){
	  mainFrame1 = parent.parent.document.all["mainFrame1"];
	  temp1 = document.body.scrollHeight+60;
	  temp2 = parent.parent.downFrame.document.body.scrollHeight;
	  temp = temp1 + temp2;
	  mainFrame1.rows=temp1+",*";
	  //mainFrame1 = parent.parent.document.all["mainFrame1"];
	}else{
		temp = this.document.body.scrollHeight;
	}
	
	if(parent.parent.parent.document.all["fraOAContent"]!=undefined){
		if(temp<min) temp = min;
		//alert("temp1:"+temp);
		parent.parent.parent.document.all["fraOAContent"].height=temp+60;
	}else if(parent.parent.parent.parent.document.all["fraOAContent"]!=undefined){
		if(temp<min) temp = min;
		//alert("temp2:"+temp);
		parent.parent.parent.parent.document.all["fraOAContent"].height=temp+60;
	}
}