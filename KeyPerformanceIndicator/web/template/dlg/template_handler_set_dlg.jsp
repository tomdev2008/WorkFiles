<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>环节指标设置处理人</title>
<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.name = "DialogWin";
	var NumberRows = parseInt("${fn:length(detail.handler.instancesSet)}")+1;
	function ev_submit(){
		var form = $_E('form1');
		var parentWin = window.dialogArguments;
		if(CheckForm(form)){
					new Ajax.Request("${ROOT}/saveTemplateIndicatorNodeHandler.do", {
						onSuccess:function(response){
							var result = response.responseText;
							if(result=="ok"){
								window.returnValue = "ok";
								window.close();
							}else{
								alert(result);
							}
						},
						parameters: $('form1').serialize(true),
						asynchronous:false
			});
//			parentWin.document.getElementById("handlerValue").value = $_EV("handlerValue");;
//			parentWin.document.getElementById("handlerName").value = $_EV("handlerText");
		}
	}
	
	function FF_Address(){
		form1.handlerText.value = "";
		form1.handlerValue.value = "";
		getAddressList('20;','n','0','handlerText','handlerValue');
		var handlerValues = document.getElementById("handlerValue").value;
		if(StringUtils.isEmpty(handlerValues)) return;
		var handlerVos = AddressHelper.prase(handlerValues);
		for(var i=0;i<handlerVos.length;i++){
			if(FF_Filter(handlerVos[i]))
				FF_CompTD(handlerVos[i]);
		}
	}
	function FF_Filter(vo){
		var handlers = document.getElementsByName("instanceHandler");
		if(handlers && handlers.length>0){
			for(var i=0;i<handlers.length;i++){
				if(AddressHelper.praseVo(Trim(handlers[i].value)).id==vo.id){
					return false;
				}
			}
		}
		return true;
	}
	function FF_CompTD(orgVo){
		var control = document.getElementById("hanlderItem");
		var tr = control.insertRow(-1);
		var td = tr.insertCell();
			td.className = "LN_tableBoxText";
			td.innerHTML = "<input type=\"hidden\" name=\"instanceHandlerId\" id=\"instanceHandlerId"+NumberRows+"\" value=\"\"/> "+
		        "<input type=\"hidden\" name=\"instanceHandler\" id=\"instanceHandler"+NumberRows+"\" value=\""+AddressHelper.reverse(orgVo)+"\"/> "+
		        "<input type=\"hidden\" name=\"scale\" id=\"instanceHandlerId"+NumberRows+"\"  value=\"1\"/>"+
		        "<input type=\"hidden\" name=\"referHandlerValue\" id=\"referHandlerValue"+NumberRows+"\" value=\"\"/>"+
				"<img src=\"${ROOT}/web/flow/img/delete_1.gif\" border=\"0\" title=\"点击删除处理人\" onClick=\"FF_DeleteRow(this);\">";
			td = tr.insertCell();
			td.className = "LN_tableBoxText";
			td.innerHTML = "<input type=\"text\" name=\"priority\" required=\"true\" check=\"notBlank;isInt();\" id=\"priority"+NumberRows+"\" value=\""+NumberRows+"\" class=\"LN_Input\" style=\"width:30px;\"/>";
			td = tr.insertCell();
			td.className = "LN_tableBoxText";
			td.innerHTML = orgVo.name;
			<c:if test="${multi}">
			td = tr.insertCell();
			td.className = "LN_tableBoxText";
			td.innerHTML = "<input type=\"text\" style=\"width:130px;\" readOnly=\"true\" id=\"referHandlerName"+NumberRows+"\" name=\"referHandlerName\" class=\"LN_Input\" value=\"\"/>"+
        		"<input name=\"button1\" id=\"button"+NumberRows+"\" type=\"button\" class=\"LN_button\" value=\"选择\" onclick=\"FF_RefHandler(this,"+NumberRows+");\" />";	
        	</c:if>
        	
        	NumberRows++;		
	}
	
	function FF_RefHandler(control,index){
		var selectedId = document.getElementById("referHandlerValue"+index).value;
		var returnValue = window.showModalDialog("${ROOT}/showTemplateIndicatorPreviousNodeHandler.do?id=${param.id}&nodeId=${currentNode.id}"
				+ "&indiId=${param.indiId}&selectedId="+selectedId,window,"dialogHeight:500px;dialogWidth:400px;status=no;scroll=yes;");
		if(returnValue){
			var referName = document.getElementById("referHandlerName"+index);
			var referId = document.getElementById("referHandlerValue"+index);

			if(referName && referId){ referName.value = returnValue.name; referId.value=returnValue.id}
		}
	}
	
	function FF_DeleteRow(control){
		if(control){
			var tr = control.parentNode;
			while(tr && tr.tagName!='TR'){
				tr = tr.parentNode;
			}
			if(tr) tr.removeNode(true);
		}
	}
	
	function FF_Resort(){
		var priority = document.getElementsByName("priority");
		if(priority && priority.length>0){
			for(var i=0;i<priority.length;i++){
				priority[i].value = i+1;
			}
		}
	}
</script>
</head>

<body  class="LN_body">
<form name="form1" method="post" action="${ROOT }/saveTemplateIndicatorNodeHandler.do" target="DialogWin">
<input type="hidden" name="id" value="${param.id}"/>
<input type="hidden" name="nodeId" value="${currentNode.id}"/>
<input type="hidden" name="indiId" value="${param.indiId}"/>
<input type="hidden" name="close_window" value="1"/>	
<input type="hidden" name="resflush_parent" value="1"/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
<div class="LN_popupsSubmit"><a href="#" onclick="ev_submit();return false;">确认</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">环节指标设置处理人</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press">
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="configTable">
      <tr>
        <td width="15%" class="LN_tableBoxtitle">环节名称</td>
        <td width="90%" class="LN_tableBoxText">
       		${currentNode.nodeName}
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">指标名称</td>
        <td width="90%" class="LN_tableBoxText">
        	<c:forEach var="o" items="${indiList}" varStatus="idx">
        	<input type="hidden" name="indicatorId" id="indicatorId${idx.count}" value="${o.id}"/> 
        	${idx.count}、${o.name }<br/>
        	</c:forEach>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">设置处理人
        <br/><input name="setButton" id="setButton" type="button" class="LN_big_button2"
							 				value="添加" onclick="FF_Address();return false;" />
        </td>
        <td width="90%" class="LN_tableBoxText">
        <input type="hidden" name="handlerValue" id="handlerValue"  value="${detail.handlerValue}"/> 
        <input type="hidden" name="handlerText" id="handlerText"  value="${detail.handlerText}"/> 
        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" id="configTable">
        	<tr>
        		<td width="6%" class="LN_tableBoxtitle2">&nbsp;</td>
        		<td width="10%" class="LN_tableBoxtitle2" title="点击按1-N自动设置序号" onclick="FF_Resort();">序号</td>
        		<td width="35%" class="LN_tableBoxtitle2">处理人</td>
        		<c:if test="${multi}"><td width="35%" class="LN_tableBoxtitle2">继承关系映射</td></c:if>
        	</tr>
        	<tbody id="hanlderItem">
        	<c:forEach var="o" items="${detail.handler.instancesSet}" varStatus="idx">
        	<tr>
        		<td class="LN_tableBoxText">
        		<input type="hidden" name="instanceHandlerId" id="instanceHandlerId${idx.count}" value="${o.id}"/> 
		        <input type="hidden" name="instanceHandler" id="instanceHandler${idx.count}" value="${o.handlerValue}"/> 
		        <input type="hidden" name="scale" id="scale" id="scale${idx.count}"  value="${o.scale}"/>      
		        <input type="hidden" name="referHandlerValue" id="referHandlerValue${idx.count}" value="${o.referHandlerInstance.id}"/>
				<img src="${ROOT}/web/flow/img/delete_1.gif" border="0" title="点击删除处理人" onClick="FF_DeleteRow(this);"></td>
        		<td class="LN_tableBoxText">
        		<input type="text" name="priority" value="${o.priority}" required="true" check="notBlank;isInt();" class="LN_Input" style="width:30px;"/></td>
        		<td class="LN_tableBoxText">${o.handlerName}</td>
        		<c:if test="${multi}"><td class="LN_tableBoxText">
        		<input type="text" style="width:130px;" name="referHandlerName" readOnly="true" id="referHandlerName${idx.count}" class="LN_Input" value="${o.referHandlerInstance.handlerName}"/>
        		<input name="button" id="button${idx.count}" type="button" class="LN_button" 
							 				value="选择" onclick="FF_RefHandler(this,${idx.count});" /></td></c:if>
        	</tr>
    		</c:forEach>
    		</tbody>
        </table>
        <br/>
		</td>
      </tr>
      </table>
    </td>
  </tr>
</table>
</div>
</div></form>
</body>
</html>


