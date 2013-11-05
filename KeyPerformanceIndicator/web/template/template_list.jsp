<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>模板设置</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>
			function ev_edit(id){
				var orgid = '${org.id}';
				if(orgid==''){
					alert("请选择组织！");
					return ;
				}
				if(id && id.length>0)
					openFullScreenWin("${ROOT}/editTemplate.do?orgId=${org.id}&templateId="+id);
				else
					openFullScreenWin("${ROOT}/addTemplate.do?orgId=${org.id}&isInit=true");
			}
			
			function ev_delete(){
				if(SelectUtil.checkedCount('templateId')>0){
					$_E("form1").action = "${ROOT}/deleteTemplate.do";
					$_E("form1").submit();
				}else{
					alert("请先选择要删除的模板项！");
				}
			}
			
			function ev_remove(){
				if(SelectUtil.checkedCount('templateId')>0){
					var valueIds = SelectUtil.checkedValues('templateId');
					var retV = window.showModalDialog("${ROOT}/web/template/dlg/template_remove_select_form.jsp?ids="+valueIds,window,"dialogWidth:400px;dialogHeight:300px;status=no;");
					if(retV=='ok'){
						try{window.location.reload();}catch(e){}
					}
				}else{
					alert("请先选择要移动的模板项！");
				}
			}
			
			function ev_copy(){
				if(SelectUtil.checkedCount('templateId')>0){
					var id = getAllChecked('templateId');
					var url = "${ROOT}/copyTemplate.do?templateIds="+id+"&nocache="+Math.random();
					LoadAjaxContent(url,copyCallBackMethod);
				}else{
					alert("请选择复制的项！");
				}
			}
			
			function copyCallBackMethod(){
				alert(this.request.responseText+"\n请选择目标组织进行粘贴。");
			}
			
			function ev_paste(){
				window.location.href = "${ROOT}/pasteTemplate.do?orgId=${org.id}";
			}
		</script>
		
		
	</head>
<body class="LN_body">
<form action="" name="form1" method="post" id="form1">
<input type="hidden" name="orgId" value="${org.id}"/>
<div class="LN_popupsBox">
<div class="LN_formBox">
<div class="LN_formTitle">模板配置</div>
 <div align="left">
       [<font color="#CC3300" >${org.fullName }</font>]下的考核关系配置。
</div> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td>
    <div class="LN_Append">
<div class="LN_popupsName">模板列表</div>
	<div class="LN_popupsReset60"><a href="#" onclick="ev_remove();return false;">移动</a></div>
	<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
	<div class="LN_popupsPaste60"><a href="#" onclick="ev_paste();return false;">粘贴</a></div>
	<div class="LN_popupsCopy60"><a href="#" onclick="ev_copy();return false;">复制</a></div>
  <div class="LN_popupsAdd60"><a href="#" onclick="ev_edit('');return false;">新增</a></div>
</div>
</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="8%" class="LN_tableBoxtitle2">序号<input type="checkbox" id="selectAllHandler" onclick="SelectUtil.checkAll(this,'templateId');"/></td>
            <td width="25%" class="LN_tableBoxtitle2">模板名称</td>
            <td width="15%" class="LN_tableBoxtitle2">修改时间</td>
            <td width="10%" class="LN_tableBoxtitle2">修改人</td>
            <td width="10%" class="LN_tableBoxtitle2">适用类型</td>
            <td width="25%" class="LN_tableBoxtitle2">适用对象</td>
            <td width="10%" class="LN_tableBoxtitle2">排序</td>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${templateList}" varStatus="idx">
            <tr id="itemTr${idx.count}">
            <td  class="LN_tableBoxText2">${idx.count}
			<input type="checkbox" value="${o.id}" name="templateId" /></td>
			<td class="LN_tableBoxText2"><a href="#" class="LN_BlueLink" onclick="ev_edit('${o.id }');return false;">${o.name }</a>
			&nbsp;</td>
			<td class="LN_tableBoxText2"><fmt:formatDate value="${o.lastModifyDate}" pattern="yyyy-MM-dd HH:mm"/>
			&nbsp;</td>
			<td class="LN_tableBoxText2">${o.lastModifyName}&nbsp;</td>
			<td class="LN_tableBoxText2">${o.scopeType==20?'员工':'组织'}&nbsp;</td>
			<td class="LN_tableBoxText2" title="${o.scopeObjectNames}">
			<kpi:escapeHtmlTag length="15" ellipsis="..." content="${o.scopeObjectNames}"/>
			&nbsp;</td>
			<td class="LN_tableBoxText2">${o.priority}&nbsp;</td>
            </tr>
            </c:forEach>
            </tbody>
          </table>
      </td>
  </tr>
</table>
</div>
</div>
<kpi:page-bar formId="form1" />
</form>
<script>
	window.onload = function(){ setPHeight3();}
</script>
</body>
</html>