
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>考核关系配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css"/>
	<script language="javascript" type="text/JavaScript">
		function ev_add() {
			var scopeType = "${relation.scopeType}";
			getAddressList(scopeType,'n','0','dataText','dataValue');

			
			if ($_EV("dataValue").length > 0) {
				var form = $_E("form1");
				form.action = "${ROOT}/addAssessRelationData.do";
				form.submit();
			}
		}
		
		function ev_delete() {
			var number = 0;
			for (var i = 0; i < form1.elements.length; i++) {
				var e = form1.elements[i];
				if (e.name == "selectrow") {
					if (e.checked)
						number = number + 1;
				}
			}
			
			if (number == 0) {
				alert("请选择要删除的配置数据。");
				return;
			}
			if (confirm("确定要删除所选的配置数据吗？")) {
				var form = $_E("form1");
				form.action = "${ROOT}/delAssessRelationData.do";
				form.submit();
			}
		}
		
		function ev_save(flag) {
			var form = $_E("form1");
			if (!CheckForm(form))
				return;
			
			var id = "${relation.id}";
			var url = "";
			if (id == "") {
				url = "${ROOT}/addAssessRelation.do"
					+ "?close_window=" + flag;
			} else {
				url = "${ROOT}/updateAssessRelation.do" + "?id=" + id 
					+ "&close_window=" + flag;
			}
						
			form.action = url;
			form.submit();
		}
		
		function ev_scopeTypeChange() {
			var form = $_E("form1");
			form.action = "${ROOT}/editAssessRelation.do";
			form.submit();
		}
		
		function ev_reset() {
			$_E("userText").value = "";
			$_E("userValue").value = "";
			$_E("orgText").value = "";
			$_E("orgValue").value = "";
		}
		function ev_change(selectDOM){
			var value = selectDOM.value;
			if(value=='2'){
				$_E("bindflow").style.display = '';
			}else{
				$_E("bindflow").style.display = 'none';
			}
			if(value=='4'){
				$_E("groupScale").style.display = '';
			}else{
				$_E("groupScale").style.display = 'none';
			}
			
		}
		
		function ev_select(radioDOM){
			if(!radioDOM.checked && $_EV("relationType")!='2') return;
			var busiId = radioDOM.value=='0'?'BMKH':'YGKH';
			var url = "${ROOT}/listMainFlowByOrgBusiId.do?orgId=${org.id}&busiId="+busiId;
			//AJAX加载月/季/年---员工/组织流程
			LoadAjaxContent(url,function(){
				var retV = this.request.responseText;
				var flowDOM = $_E("flowId");
				flowDOM.options.length = 0;
				var no = new Option("请选择","");
				flowDOM.options.add(no);
				if(retV && retV.length>0){
					var arr = AddressHelper.prase(retV);
					for(var i=0;i<arr.length;i++){
						 no = new Option(arr[i].name,arr[i].id);
						flowDOM.options.add(no);
					}
				}
			});
		}
	</script>
</head>
<body class="LN_body">
<form id="form1" name="form1" method="post" action="${ROOT}/listEditAssessRelation.do">
<input type="hidden" name="resflush_parent" value="1"/>
<input type="hidden" name="id" value="${relation.id}"/>
<input type="hidden" id="orgId" name="orgId" value="${org.id}" />
<input type="hidden" id="dataText" name="dataText" value=""/>
<input type="hidden" id="dataValue" name="dataValue" value=""/>
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
	<div class="LN_popupsSafe-C"><a href="#" onclick="ev_save(1);return false;">保存并关闭</a></div>
	<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
	<c:if test="${relation.id!=null}">
	<div class="LN_popupsDelete80"><a href="#" onclick="ev_delete();return false;">删除对象</a></div>
	<div class="LN_popupsAdd80"><a href="#" onclick="ev_add();return false;">添加对象</a></div>
	</c:if>
</div>
	<div class="LN_formBox">
	<div class="LN_formTitle">考核关系配置信息</div>
		<div class="LN_colorRed">红星*是必填</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
			<tr>
				<td>
					<div class="LN_Append">
						<div class="LN_popupsName">考核关系配置信息</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="LN_press">
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
						<tr>
							<td class="LN_tableBoxtitle" width="10%"><span class="LN_colorRed">*</span>名称</td>
							<td class="LN_tableBoxText" width="35%">
								<input type="text" id="name" name="name" class="LN_Input300" value="${relation.name}" check="notBlank;isString('#',100)" required='true' showName='名称'/>
							</td>
						</tr>
						<tr>
							<td class="LN_tableBoxtitle" width="10%"><span class="LN_colorRed">*</span>适用类型</td>
							<td class="LN_tableBoxText" width="30%">
					        	<input type="radio" name="scopeType" id="scopeType1" value="20" ${relation.scopeType==20?'checked':''}
					        		${relation.id==null?"":"disabled='disabled'"} onclick="ev_select(this);"/>员工
					        	<input type="radio" name="scopeType" id="scopeType2" value="0" ${relation.scopeType==0?'checked':''}
					        		${relation.id==null?"":"disabled='disabled'"} onclick="ev_select(this);"/>组织
							</td>
						</tr>
						<tr>
							<td class="LN_tableBoxtitle" width="10%"><span class="LN_colorRed">*</span>考核周期</td>
							<td class="LN_tableBoxText" width="30%">
								<kpi:dictionary-select name='batchType' type='ASS_CYCLE_TYPE' style="width:30px;" selected="${relation.batchType}" htmlType="radio" />								
							</td>
						</tr>
						<tr>
							<td class="LN_tableBoxtitle" width="10%">所属组织</td>
							<td class="LN_tableBoxText" width="35%">${org.name}
							</td>
						</tr>
						<tr id="bindflow" style="display:${relation.relationType==2?'':'none'}">
							<td class="LN_tableBoxtitle" width="10%">考核流程</td>
							<td class="LN_tableBoxText" width="30%">
								<select id="flowId" name="flowId" >
								<option value="">请选择</option>
									<c:forEach var="o" items="${flowList}">
										<option value="${o.id}" ${o.id==relation.flowId?'selected':''}>${o.flowName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="LN_tableBoxtitle" width="10%"><span class="LN_colorRed">*</span>关系类型</td>
							<td class="LN_tableBoxText" width="35%">
								<kpi:dictionary-select  name='relationType' type='ASS_RELATION_TYPE' style="width:120px;" selected="${relation.relationType}" htmlType="select" jsFunction="ev_change(this);"/>
							</td>
						</tr>
						<tr id="groupScale" style="display:${relation.relationType==4?'':'none'}">
							<td class="LN_tableBoxtitle" width="12%"><span class="LN_colorRed">*</span>评分权重(%)</td>
							<td class="LN_tableBoxText" width="30%">
								<input type="text" id="weight" name="weight" class="LN_Input30" value="${relation.weight}" check="notBlank;isInt()" required='true' showName='评分权重'/>
							</td>		
						</tr>
						<tr>
							<td class="LN_tableBoxtitle" width="10%"><span class="LN_colorRed">*</span>排序</td>
							<td class="LN_tableBoxText" width="10%">
								<input type="text" id="priority" name="priority" class="LN_Input30" value="${relation.priority}" check="notBlank;isInt()" required='true' showName='排序'/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br/>
			<c:if test="${relation.id!=null}">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
					  <tr>
					    <td height="3" bgcolor="#4F81CE"></td>
					  </tr>
					  <tr>
					    <td class="LN_boxtitlebg">群组成员列表</td>
					  </tr>
					  <tr>
					  <td class="LN_press">
					<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
					<tr>
							<td class="LN_tableBoxtitle2" width="10%"><input type="checkbox" id="selectall" name="selectall" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/>序号</td>
							<td class="LN_tableBoxtitle2" width="10%">成员类型</td>
							<td class="LN_tableBoxtitle2" width="40%">成员名称</td>
						</tr>
						<tbody id="itemList">
							<c:forEach var="o" items="${dataList}" varStatus="idx">
								<tr>
									<td class="LN_tableBoxText2"><input type="checkbox" id="selectrow" name="selectrow" class="checkboxInput" value="${o.id}"/>${idx.count}</td>
									<td class="LN_tableBoxText2">${o.scopeTypeDesc}</td>
									<td class="LN_tableBoxText2">${o.orgName}</td>
								</tr>
							</c:forEach>
						</tbody>
					  </table>
					  </td>
					  </tr>
				</table>
		<kpi:page-bar formId="form1"/>
		</c:if>
	</div>
</div>
</form>
</body>
</html>