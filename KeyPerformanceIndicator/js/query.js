<!--
/*---------------------------------------------------------------------------*\
|  Subject:       记录查询条件的对象                                                    |
|  Version:       1.0                                                         |
|  Author:        zhu xinhui                                				  |
|  FileName:      query.js                                              	  |
\*---------------------------------------------------------------------------*/



function Query(url){
	this.url = url;
	this.conditions = new Array();
	
}

/*
 * conditionDesc: 页面的条件描述
 * 范例： {"name":"张三，李四","code":"org_id","value":"id001,d002"}
 
 */
Query.prototype.addCondition = function(conditionDesc){
    
	var length = this.conditions.length;
	this.conditions[length] = conditionDesc;
}

Query.prototype.alert = function(){
	for(var i=0; i<this.conditions.length; i++){
		var condition = this.conditions[i];
		alert("paraName:"+condition.paraName+"\n"+"paraCode:"+condition.paraCode+"\n"+"showValue:"+condition.showValue+"\n"+"inputValue:"+condition.inputValue);
	}
}


/*
String paraName = paraNameMap.get("paraName"+index).toString();
			String paraCode = paraCodeMap.get("paraCode"+index).toString();
			String showValue = paraCodeMap.get("showValue"+index).toString();
			String inputValue = paraCodeMap.get("inputValue"+index).toString();
*/
Query.prototype.compUrl = function(){
    var outUrl ="";
    //alert("this.conditions.length:"+this.conditions.length);
	for(var i=0; i<this.conditions.length; i++){
		var condition = this.conditions[i];
		//alert("i:"+i);
		if(i>0)
		{
		  outUrl=outUrl+"$$";
		}
		
		
		outUrl=outUrl+condition.paraName+":"+condition.paraCode
		          +":"+condition.showValue+":"+condition.inputValue;
	}
	//outUrl="paraUrl="+ this.url+outUrl;
  //  alert("outUrl:"+outUrl);
	return outUrl;
}


