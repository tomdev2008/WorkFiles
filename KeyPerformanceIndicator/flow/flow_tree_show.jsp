<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>绩效管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>
			var flowNode = '${flowCode}';
			// 根据下拉菜单的显示流程
			function loadFlow(select) {		
				var option = flowSelect.options[flowSelect.selectedIndex];				
				if(StringUtils.isNotEmpty(option.value)) {
					Util.show('bind');
					document.frames['flowFrame'].document.location.href = "${ROOT}/listFlowTreeForTemplate.do?flowCode="+option.value;
				} else {
					Util.hide('bind');
					document.frames['flowFrame'].document.location.href = "about:blank";
				}			
			}
			
			/*解除或绑定流程*/
			function bindFlow() {
				var option = flowSelect.options[flowSelect.selectedIndex].value;
				var desc = $_E("bind").value;
				if(option && option.length>0){
					if(confirm(desc+'后已设定的考核关系会被删除，再次绑定需重新设置考核关系，你确定继续？')) {
						Util.disable('bind');
						Util.toggle('ajax_loader');
						var url = '${ROOT}/bindFlowTemplate.do?templateId=${param.templateId}&flowId='+option+'&templateType=${param.templateType}';
						LoadAjaxContent(url,bindFlowCB);
					}
				}else {
					alert('请先选择流程!');
				}					
			}
			/*解除或绑定流程之后的回调函数*/
			function bindFlowCB() {
				var info=this.request.responseText;	
				if(info && info=='ok'){
					parent.afterBindFlow();
				}
				Util.toggle('ajax_loader');	
			}
		</script>
		
	</head>
	<body class="LN_body">
	<div class="LN_popupsBox">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  	<td class="LN_tableBoxText">
  				<select id="flowId" name="flowSelect" onChange="loadFlow(this)" >
					<option  value="">--请选择--</option>
					<c:forEach var="o" items="${flwFlowList}" varStatus="idx">											
						<option value="${o.id}" ${flowCode==o.id?'selected':'' }>
							${o.flowName}
						</option>
					</c:forEach>
				</select><br/>
		 	<input type="button" id="bind" class="button4" value="${flowCode!=null?'解除绑定':'绑定流程'}" onclick="bindFlow(1);" style="display:${flowCode!=null?'':'none'}"/>
				<span style="display:none;" id="ajax_loader" >
					<img src='${ROOT}/img/ajax-loader.gif' />
				</span>
  	</td>
  </tr>
  <tr>
  	<td class="LN_tableBoxText">
  	<iframe id="flowFrame" src="${ROOT}/listFlowTreeForTemplate.do?flowCode=${flowCode}" width="100%" height="300px" frameborder="0"></iframe>
  	</td>
  </tr>
  </table>
  </div>
</body>
</html>