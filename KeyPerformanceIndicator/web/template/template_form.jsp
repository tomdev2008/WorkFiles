<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>模板设置</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>
			function ev_deleteIndi(){
				if(SelectUtil.checkedCount("priorityCBX")>0){
					if(window.confirm("你确认删除指标?")){
						$_E("form1").action = "${ROOT}/deleteTemplateIndicator.do"
						$_E("resflush_parent").value = 0;
						$_E("form1").submit();
					}
				}else{
					alert("请先选择要删除的指标项！");
				}
			}
			
			function ev_deleteType(){
				if(SelectUtil.checkedCount("indiTypeName")>0){
					if(window.confirm("你确认删除指标类型?")){
						$_E("form1").action = "${ROOT}/deleteTemplateIndicatorType.do"
						$_E("resflush_parent").value = 0;
						$_E("form1").submit();
					}
				}else{
					alert("请先选择要删除的指标类型项！");
				}
			}
			
			function ev_save(flag){
				var form = $_E("form1");
				if(SelectUtil.checkedCount("attribute")<=0 && $_EV("templateId").length>0){
					alert("必须至少剩下一个属性！");
					return;
				}
				if (CheckForm(form)) {
					form.close_window.value = flag;
					form.submit();
				}
			}
			
			function ev_addType(){
				getAddressList('60','n','30','indicatorTypeNames','indicatorTypeValues');
				var names = $_EV("indicatorTypeValues");
				 
				if(names && names.length>0){
					$_E("form1").action = "${ROOT}/addTemplateIndicatorType.do"
					$_E("resflush_parent").value = 0;
					$_E("form1").submit();
				}
			}

			function ev_addIndi(id){
				if(${fn:length(template.templateIndicatorTypes)<1}){
					alert("请先添加指标类型!");
					return false;
				}
				var url = "${ROOT}/editTemplateIndicator.do?id="+id+"&templateId=${template.id}";
				var retV = window.showModalDialog(url,window,"dialogWidth:900px;dialogHeight:750px;status=no;");
				if(retV=='ok'){
					try{window.location.reload();}catch(e){}
				}
			}
			
			function ev_getAddress(){
				var type = '${template.scopeType}';
				var radioDom = $_EN("scopeType");
				if(radioDom){
					for(var i=0;i<radioDom.length;i++){
						if(radioDom[i].checked) type = radioDom[i].value;
					}
				}
				if(type=='20')
					type = "0;20;10;";
				else type = "0;";
				getAddressList(type,'n','0;10;','scopeObjectNames','scopeObjectValues');
			}
			
	//计算权重
	function ev_cal(){
		var scaleControl = $_EN("scale");
		if(scaleControl && scaleControl.length>0){
			var scaleTotal = 0;
			for(var i=0;i<scaleControl.length;i++){
				scaleTotal += parseInt(scaleControl[i].value);
			}
			$_E("scaleTotal").value = scaleTotal;
			
		}
	}
	/**
	  * 设置处理人
	  **/
	function ev_Handler(indiId, nodeId){
		var returnValue = window.showModalDialog("${ROOT}/editTemplateHandler.do?id=${template.id}&nodeId="
		+ nodeId +"&indiId="+indiId,window,"dialogHeight:500px;dialogWidth:550px;status=no;scroll=yes;");
		if(returnValue && returnValue=='ok'){//如果有返回值,刷新页面
			window.location.reload();
			//var handlerValue = $("handlerValue").value;
			//new Ajax.Request("${ROOT}/saveTemplateIndicatorNodeHandler.do?nodeId="+nodeId+"&priorityCBX1="+indiId, {
			//			onSuccess:function(response){
			//				var result = response.responseText;
			//				if(result=="ok"){
			//					var handlerName = $("handlerName").value;
			//					$("handler_"+indiId+nodeId).innerHTML = handlerName;
			//				}else{
			//					alert(result);
			//				}
			//			},
			//			parameters: $('form1').serialize(true),
			//			asynchronous:false
			//});
		}
	}
	 
	/**
	  * 设置处理人
	  **/
	function ev_AllHandler(){
		if(SelectUtil.checkedCount("selectNodeHandler")==1){
			var nodeId = SelectUtil.getFirstChecked("selectNodeHandler").value;
			var indiIds = SelectUtil.serialize("priorityCBX");
			if(indiIds && indiIds.length>0){
				var returnValue = window.showModalDialog("${ROOT}/editTemplateHandler.do?id=${template.id}&nodeId="
					+ nodeId +"&indiId="+indiIds,window,"dialogHeight:500px;dialogWidth:550px;status=no;scroll=yes;");
				if(returnValue && returnValue=='ok'){//如果有返回值,刷新页面
					window.location.reload();
					//new Ajax.Request("${ROOT}/saveTemplateIndicatorNodeHandler.do?nodeId="+nodeId, {
					//	onSuccess:function(response){
					//		var result = response.responseText;
					//		if(result=="ok"){
					//			var indicator_ids = $_EN("priorityCBX");
					//			var handlerName = $("handlerName").value;
					//			for(var i=0;i<indicator_ids.length;i++){
					//				if(indicator_ids[i].checked)
					//					$("handler_"+indicator_ids[i].value+nodeId).innerHTML = handlerName;
					//			}
					//			ev_clearAllChecked();
					//		}else{
					//			alert(result);
					//		}
					//	},
					//	parameters: $('form1').serialize(true),
					//	asynchronous:false
					//});
				}
			}else{
				alert("请选择需要设置处理人的指标序号！");
			}
		}else if(SelectUtil.checkedCount("selectNodeHandler")<=0){
			alert("请先选择环节！");
			return false;
		}else{
			alert("一次只可设置一个环节！");
			return false;
		}
	}
	
	function ev_clearAllChecked(){
		var indicators = $_EN("priorityCBX");
		var nodes = $_EN("selectNodeHandler");
		for(var i=0;i<indicators.length;i++){
			indicators[i].checked = false;
		}
		for(var i=0;i<nodes.length;i++){
			nodes[i].checked = false;
		}
	}
	
	//调用绑定/解绑完成后的事件
	function afterBindFlow(){
		window.location.reload();
	}
	
	//重新排序
	function AA_Resort(){
		var priority = document.getElementsByName("priority");
		if(priority && priority.length>0){
			for(var i=0;i<priority.length;i++){
				priority[i].value = i+1;
			}
		}
	}
		</script>
	</head>
<body class="LN_body">
<form action="${ROOT }/saveTemplate.do" name="form1" method="post" id="form1">
<input type="hidden" name="orgId" id="orgId" value="${org.id}"/>
<input type="hidden" name="handlerName" id="handlerName" value=""/>
<input type="hidden" name="handlerValue" id="handlerValue" value=""/>
<input type="hidden" name="indicatorTypeNames" id="indicatorTypeNames" value=""/>
<input type="hidden" name="indicatorTypeValues" id="indicatorTypeValues" value=""/>
<input type="hidden" name="templateId" id="templateId" value="${template.id}"/>
<input type="hidden" name="flowId" value="${template.flowId}"/>
<input type="hidden" name="close_window" value="0"/>
<input type="hidden" name="resflush_parent" value="1"/>
<div class="LN_popupsBox">
	<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
	<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
	<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">模板配置</div>
<div class="LN_colorRed">说明：1、红星*是必填，2、模板适用范围为:员工(当适用类型为员工时)、组织(不递归)、考核等级群组、角色等，被考核对象发起考核时模板筛选顺序按以上顺序；
3、模板绑定流程时如有已绑定流程，则需要先解除绑定，再进行绑定新的流程；4、指标属性控制，一般需要在模板添加指标类型/指标之前进行选择并保存方可生效。</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border" >
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr onclick="Util.toggle('LN_tableBox1');">
    <td class="LN_boxtitlebg" >模板基本信息</td>
  </tr>
  <tr>
      <td class="LN_press" id="LN_tableBox1">
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" >
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>模板名称</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="templateName" id="templateName" value="${template.name}" style="width:300px;" 
        	check="notBlank;isString('#',100)" required='true' showName='模板名称' class="LN_Input" />
		</td>
		<td width="35%" class="LN_tableBoxtitle">考核流程</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">所属组织</td>
        <td width="50%" class="LN_tableBoxText">
        	${org.name}
		</td>
		 <td width="35%" align="left" class="LN_tableBoxText" rowspan="7" valign="top" style="display:${template.id==null?'none':''}">
		 	<IFRAME name="ftree"  src="${ROOT}/flowTreeShow.do?templateId=${param.templateId}&orgId=${param.orgId}&templateType=1" frameborder="0" width="100%" height="400" scrolling="auto"></IFRAME>
		 </td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>适用对象类型</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="radio" name="scopeType" id="scopeType1" value="20" ${template.scopeType==20?'checked':''}/>员工
        	<input type="radio" name="scopeType" id="scopeType2" value="0" ${template.scopeType==0?'checked':''}/>组织
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>适用考核周期</td>
        <td width="50%" class="LN_tableBoxText">
        	<kpi:dictionary-select  name='scopeAssCycle' type='ASS_CYCLE_TYPE' style="width:30px;" selected="${template.scopeAssCycle}" htmlType="radio"/>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">已绑定流程</td>
        <td width="50%" class="LN_tableBoxText">${flow==null?'模板未绑定流程':flow.flowName}</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>适用范围(不递归)</td>
        <td width="50%" class="LN_tableBoxText">
        <textarea name="scopeObjectNames" id="scopeObjectNames" readOnly="true" style="width: 80%"
        check="notBlank;isString('#',500)" required='true' showName='适用范围'>${template.scopeObjectNames}</textarea>
        <input type="hidden" name="scopeObjectValues" id="scopeObjectValues" class="LN_Input" value="${template.scopeObjectText}"/>
			<span class="LN_tableBoxText2">
			<input name="Submit7" type="button" id="Submit7" class="LN_big_button3" value="选择" onclick="ev_getAddress();return false;" />
			</span>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">排序</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="tpriority" id="tpriority" style="width:30px;" 
        check="notBlank;isInt()" required='true' showName='排序' class="LN_InputBorder" value="${template.priority}"/>
		</td>
      </tr>
        <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText">
          <textarea name="remark" id="remark" rows="13" style="font-size:12px;width: 96%" >${template.remark}</textarea></td>
          </tr>
   </table>
     <br />
      </td>
  </tr>
</table>
<br/>
<c:if test="${template.id!=null}">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border" id="LN_boxtitlebg2">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr onclick="Util.toggle('LN_tableBox2');">
    <td class="LN_boxtitlebg" >模板指标配置列表</td>
  </tr>
  <tr>
    <td class="LN_press" id="LN_tableBox2">
    <div class="LN_inquiry">
     <input name="Submit1" type="button" onclick="ev_addType();return false;" id="Submit1" class="LN_big_button3" value="添加类型" />
      <input name="Submit2" type="button" onclick="ev_deleteType();return false;" id="Submit2" class="LN_big_button3" value="删除类型" />
      <input name="Submit3" type="button" onclick="ev_addIndi('');return false;" id="Submit3" class="LN_big_button3" value="添加指标" />
      <input name="Submit4" type="button" onclick="ev_deleteIndi();return false;" id="Submit4" class="LN_big_button3" value="删除指标" />
      <input name="Submit5" type="button" onclick="ev_AllHandler();return false;" id="Submit5" class="LN_big_button3" value="设置处理人" />
    </div>
    <c:set var="columnLenth" value="1"/>
     <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_infbox-all-border">
     <tr>
     	<td class="LN_boxtitlebg-all"><span style="font-weight:bold;">指标字段控制:</span>
     	<c:forEach var="o" items="${template.pageTemplateIndiAttributes}" >
     		  <c:set var="columnLenth" value="${o.show?columnLenth+1:columnLenth}"/>
     		<input type="checkbox" id="attribute" name="attribute" value="${o.code}" ${o.show?'checked':''} onclick="configTable('configIndiTable','${o.code}');"/>${o.name}
     	</c:forEach>
     	</td>
     </tr>
     </table>
     
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2" id="configIndiTable">
            <tr>
	          <c:forEach var="o" items="${template.pageTemplateIndiAttributes}">
	          <c:set var="showNone" value="${o.show?'':'none'}"/>
	          	<c:choose>
	            			<c:when test="${o.showExtType==5}">
		            			<td class="LN_tableBoxText2" style="display:none;text-align: center;"></td>
	            			</c:when>	
	            			<c:when test="${o.showExtType==1}">
		            			 <td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};text-align: center;"
	          						onclick="AA_Resort();">${o.name}
	          					<input type="checkbox" id="selectAllHandler1" onclick="SelectUtil.checkAll(this,'priorityCBX');"/>	
	          					</td>
	            			</c:when>
	            			<c:when test="${o.showExtType==4}">
		            			<td class="LN_tableBoxText2" style="display:none;text-align: center;">
		            			<td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" 
		            			style="display:${showNone};text-align: center;text-align: center;">
	          					<input type="checkbox" id="selectAllHandler2" onclick="SelectUtil.checkAll(this,'indiTypeName');"/>
		            			${o.name}
		            			</td>
	            			</c:when>		
	            			<c:when test="${o.showExtType==2}">
		            			<td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone}; text-align: center;">${o.name}</td>
	            			</c:when>		
	            			<c:when test="${o.showExtType==3}">
		            			<td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone}; text-align: center;">${o.name}</td>
	            			</c:when>		
	            			<c:otherwise>
	            				 <td width="${o.showWidth}%" class="LN_tableBoxtitle2" colIndex="${o.code}" style="display:${showNone};text-align: center;">${o.name}</td>
	            			</c:otherwise>  
	            </c:choose>
	          </c:forEach>
	          <!-- 如果所绑流程不为空,显示指标评分环节处理人 -->
	          <c:if test="${flow!=null}">
	          	<c:forEach var="p" items="${flow.nodeSet}">
	          		    <c:if test="${p.IVGradeNode}">
	          		    <td width="10%" class="LN_tableBoxtitle2">
	          		    ${p.nodeName}<input type="checkbox" id="selectNodeHandler" value="${p.id}"/>
	          		    </td></c:if>
	          	</c:forEach>
	          </c:if>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${template.templateIndicatorTypes}" varStatus="idx">
            	<c:if test="${fn:length(o.templateIndicators)==0}"><!-- 补空行 -->
            		<tr>
            		<c:forEach var="o2" items="${template.pageTemplateIndiAttributes}">
            		 <c:set var="showNone" value="${o2.show?'':'none'}"/>
            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
		             			<td class="LN_tableBoxText2" colIndex="${o2.code}" style="display:${showNone};text-align: center;">
				            		<input type="checkbox" value="${o.id}" name="indiTypeName" />${o.name}
				            	</td>           			
	            			</c:when>
	            			<c:when test="${o2.showExtType==5}">
		            			<td class="LN_tableBoxText2" style="display:none;"></td>
	            			</c:when>	  
	            			<c:when test="${o2.showExtType==2}">
		            			<td class="LN_tableBoxText2" title="" colIndex="${o2.code}" style="display:${showNone}; text-align: center;">
	            				&nbsp;</td>	   
	            			</c:when>	  
	            			<c:when test="${o2.showExtType==3}">
		            			<td class="LN_tableBoxText2" title="" colIndex="${o2.code}" style="display:${showNone}; text-align: center;">
	            				&nbsp;</td>	   
	            			</c:when>	  
	            			<c:otherwise>
            					<td class="LN_tableBoxText2" title="" colIndex="${o2.code}" style="display:${showNone};">
	            				&nbsp;</td>	            			
	            			</c:otherwise>
	            	</c:choose>
            		</c:forEach>
            		<c:if test="${flow!=null}">
			          	<c:forEach var="p" items="${flow.nodeSet}">
			          		    <c:if test="${p.IVGradeNode}">
			          		    <td width="10%" class="LN_tableBoxText2">
			          		    &nbsp;</td></c:if>
			          	</c:forEach>
			        </c:if>
            		</tr>
            	</c:if>
            	<c:if test="${fn:length(o.templateIndicators)>0}">
	            <c:forEach var="o1" items="${o.templateIndicators}" varStatus="idx1">
	            <input type="hidden" name="indicatorId" value="${o1.id}"/>
	            	<tr>
	            		<c:forEach var="o2" items="${template.pageTemplateIndiAttributes}">
	            		<c:set var="showNone" value="${o2.show?'':'none'}"/>
	            		<c:choose>
	            			<c:when test="${o2.showExtType==4}">
	            				<c:if test="${idx1.count==1}">
		             			<td class="LN_tableBoxText2" rowspan="${fn:length(o.templateIndicators)}" colIndex="${o2.code}" style="display:${showNone};text-align:center;">
				            		<input type="checkbox" value="${o.id}" name="indiTypeName" />${o1.attributeValues[o2.code]}
				            	</td></c:if>           			
	            			</c:when>
	            			<c:when test="${o2.showExtType==2}">
	            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone}; text-align: center;">
	            				<a href="javascript:void(0);" class="LN_BlueLink" onclick="ev_addIndi('${o1.id }');return false;">
	            				<kpi:escapeHtmlTag length="100" ellipsis="..." content="${o1.attributeValues[o2.code]}"/></a></td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==3}">
	            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};text-align: center;">
	            				<c:set var="scaleShow" value="${showNone}"/>
	            				<c:choose>
	            					<c:when test="${o1.attributeValues['refResourceId']=='DIRECTVALUE'}">--
	            					<input type="hidden" name="scale" value="0"/></c:when>
	            					<c:otherwise><input type="text" style="text-align: center;" class="LN_Input50" name="scale" value="${o1.attributeValues[o2.code]}" onblur="ev_cal();"
	            				check="notBlank;setNumber(0,100)" showName='${o2.name}'/>%</c:otherwise>
	            				</c:choose>
	            			</td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==1}">
	            			<td class="LN_tableBoxText2" title="取值渠道:${o1.refResourceId}" colIndex="${o2.code}" style="display:${showNone};">
	            				<input type="checkbox" value="${o1.id}" name="priorityCBX" />
	            				<input type="text" class="LN_Input20" name="priority" value="${o1.attributeValues[o2.code]}"/></td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==6}">
		            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
		            				${o1.attributeValues[o2.code]==1?'是':'否'}
		            			</td>
	            			</c:when>
	            			<c:when test="${o2.showExtType==5}">
		            			<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}"  style="display:none;">
		            				${o1.attributeValues[o2.code]}
		            			</td>
	            			</c:when>	            			
	            			<c:otherwise>
	            				<td class="LN_tableBoxText2" title="${o1.attributeValues[o2.code]}" colIndex="${o2.code}" style="display:${showNone};">
	            				<kpi:escapeHtmlTag length="1500" ellipsis="..." content="${o1.attributeValues[o2.code]}"/>
	            				</td>
	            			</c:otherwise>
	            		</c:choose>
	            		</c:forEach>
	            		<c:if test="${flow!=null}">
				          	<c:forEach var="p" items="${flow.nodeSet}">
				          		    <c:if test="${p.IVGradeNode}">
				          		     <td width="10%" class="LN_tableBoxText2">
				          		     <span class="LN_colorOrange" id="handler_${o1.id}${p.id}">
				          		    <c:forEach var="p1" items="${o1.indicatorHandlers}">
				          		    	<c:if test="${p.id==p1.nodeId}">${p1.handlerText}</c:if>
				          		    </c:forEach>
				          		    </span>
				          		    &nbsp;<input name="Submit9" id="handler${p.id}${o1.id}" type="button" class="LN_big_button3"
							 				value="设置处理人" onclick="ev_Handler('${o1.id}','${p.id}');" />
							 	   </td></c:if>
				          	</c:forEach>
				        </c:if>
	            	</tr>
	            </c:forEach>   
	            </c:if>
            </c:forEach>
         </tbody>
         <tr >
         	<c:forEach var="o" items="${template.pageTemplateIndiAttributes}">
	            		<c:set var="showNone" value="${o.show?'':'none'}"/>
	           <c:choose>
	            	<c:when test="${o.showExtType==3}">
	            		<td align="right" class="LN_tableBoxText22" colIndex="${o.code}" style="display:${showNone};text-align:center;"><strong>汇总：</strong>
				            <input name="scaleTotal" type="text" class="LN_Input50" readOnly="true" style="color:red;text-align:center;" id="scaleTotal" value="" />％
				        </td>
	            	</c:when>
				<c:when test="${o.showExtType==5}">
		            	<td class="LN_tableBoxText22" style="display:none;"></td>
	            </c:when>	  
	               <c:otherwise><td align="right" class="LN_tableBoxText22" colIndex="${o.code}" style="display:${showNone};"></td></c:otherwise>
	          </c:choose>
         	</c:forEach>
         </tr>
         </table>
      </td>
  </tr>
</table>
</c:if>
</form>
<script type="text/javascript">
	window.onload = function(){
		ev_cal();
	}
</script>
</body>
</html>