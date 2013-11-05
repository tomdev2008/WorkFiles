<%@ page language="java"
	import="java.util.*,com.shengdai.kpi.common.attach.model.*,com.shengdai.kpi.system.SpringHelper,com.shengdai.kpi.common.attach.service.IAttachService"
	pageEncoding="UTF-8"%>
<%--<jsp:directive.page import="com.shengdai.kpi.system.service.IUserService"/>--%>
<%--<jsp:directive.page import="com.shengdai.kpi.system.valueobject.Station"/>--%>
<%--<jsp:directive.page import="com.shengdai.kpi.system.valueobject.Group"/>--%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/web/pub/head.inc"%>
		<title>附件列表显示</title>
		
	</head>

	<script>
		function attachUpload(){
			var table = Util.$_E("atabPro");
			var returnValue = window.showModalDialog('${ROOT}/web/common/upload/upload.jsp?nodeId=${param.nodeId}&resourceId=${idArray[0]}',table,'dialogHeight:300px;dialogWidth:660px;status=on');
		
		}
		function deleteAttach(id){	
			if (confirm("您确认要删除记录？")) {
				var url = "${ROOT}/deleteAttachFile.do?id="+id;
				LoadAjaxContent(url,callBackMethod);
			}		
		}
		function callBackMethod(){
			//alert(1);
			eval(this.request.responseText);
			if(result!=""){
				var grid = Util.$_E("atabPro");
				for(var i = 0; i < grid.rows.length; i++)
				{
				  	if(grid.rows[i].id == result)
				  	{
				  		grid.deleteRow(i);
				  	}
				}
			}
		}
		/*
		 复制附件ID到session中
		*/
		function attachCopy() {
			if(SelectUtil.checkedCount("selectedrow") == 0) {
				alert("请至少选择一个附件！");				
			} else if (confirm("确认复制选定的附件？")) {
				var idStr = SelectUtil.serialize("selectedrow");
				var url = context+"/copyAttachAjax.do?idStr=" + idStr + "&randomKey=" + Math.random();
				Util.callScript(url);
			}			
		}
		
		/**
		 * 粘贴附件
		 */
		function attachPaste(resourceId) {
			if(StringUtils.isEmpty(resourceId)) {
				alert("您必须选择一个附件列表才能粘贴附件");
			} else {
				var url = context + "/pasteAttachAjax.do?resourceId=" + resourceId + "&randomKey=" + Math.random();
				Util.callScript(url);
			}		
		}
		
	</script>

	<body>
		<form name="form2" method="post" action="">
			<table width="98%" cellspacing="0" cellpadding="0" border="0" class="list-top">
				<tbody>
					<tr>
						<td class="list-caozuo">
							<c:if test="${isupload=='true'}">
								<a onclick="attachUpload()" href="javascript:;">上传附件</a>
								<%--<span onclick="attachPaste('${param.id}')" style="cursor:pointer;text-decoration:underline;">粘贴附件</span> 
							--%></c:if>
							<%--<span onclick="attachCopy();" style="cursor:pointer;text-decoration:underline;">复制附件</span> 
						--%></td>
					</tr>
				</tbody>
			</table>
			<table width="98%" class="list-box" cellspacing="0" border="0" id="atabPro">
				<tr>
					<th class="list-title" nowrap="nowrap">
						序号
					</th>
					<th class="list-title" nowrap="nowrap">
						附件名称
					</th>
					<th class="list-title" nowrap="nowrap">
						上传人
					</th>
					<c:if test="${!empty param.nodeId}">
					<th class="list-title" nowrap="nowrap">
						环节
					</th>
					</c:if>
					<th class="list-title" nowrap="nowrap">
						上传时间
					</th>
					<th class="list-title">
						附件大小
					</th>
					<th class="list-title"">
						操作
					</th>
				</tr>
				<c:forEach var="o" items="${allList}" varStatus="idx">
					<tr class="list-color${idx.index%2==0?'1':'2'}"
<%--						onmouseover='this.style.backgroundColor="#EFEFEF"'--%>
<%--						onmouseout='this.style.backgroundColor="#ffffff"'--%>
						id='${o.id}'>
						<td class="list-text1">
							<input type="checkbox" name="selectedrow" value="${o.id}" />
							${idx.count}							
						</td>
						<td  class="list-text1">
							${o.name}
						</td>
						<td  class="list-text1">
							${o.genPersonName}&nbsp;
						</td>
						<c:if test="${!empty param.nodeId}">
						<td  class="list-text1">
							${o.nodeName}&nbsp;
						</td>
						</c:if>
						<td  class="list-text1">
							<fmt:formatDate value="${o.genDate}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td  class="list-text1">
							${o.fileSize}KB
						</td>
						<td  class="list-text1">
						<c:choose>
							<c:when test="${empty o.parentAttachId }">
								<c:set var="attachId">${o.id}</c:set>
							</c:when>
							<c:otherwise>
								<c:set var="attachId">${o.parentAttachId}</c:set>
							</c:otherwise>
						</c:choose>
							<a href='${ROOT}/downloadFile.do?id=${attachId}'>
								下载 
<%--							 <img src="${ROOT}/img/download.gif" border="0" alt="下载" /> --%>
							</a>
							<c:if test="${delete=='true'}">		
							&nsbp;|&nsbp;				
							<a onclick='deleteAttach("${o.id}");' href="javascript:;">
								删除
<%--							 <img src="${ROOT}/img/delete.gif" border="0" style="CURSOR: hand" alt="删除" /> --%>
							</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>

		</form>
	</body>
</html>
