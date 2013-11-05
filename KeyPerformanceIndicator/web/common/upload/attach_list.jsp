<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/web/pub/head.inc"%>
		<title>附件列表显示</title>
		<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	</head>

	<script>
		function attachUpload(){
			var table = Util.$_E("attachList");
			var returnValue = window.showModalDialog('${ROOT}/web/common/upload/upload.jsp?nodeId=${nodeCode}&resourceId=${resourceId}',table,'dialogHeight:300px;dialogWidth:660px;status=on');
			if(returnValue && returnValue=='ok'){	
				window.location.reload();
			}
		}
		function deleteAttach(id){	
			if (confirm("您确认要删除记录？")) {
				var url = "${ROOT}/deleteAttachFile.do?id="+id;
				LoadAjaxContent(url,callBackMethod);
			}		
		}
		function callBackMethod(){
			eval(this.request.responseText);
			if(result!=""){
				var grid = Util.$_E("attachList");
				for(var i = 0; i < grid.rows.length; i++)
				{
				  	if(grid.rows[i].id == result)
				  	{
				  		grid.deleteRow(i);
				  	}
				}
			}
		}
		
	</script>

<body class="LN_body">
<form name="formAttach" method="post" action="">
<table width="100%" border="0" cellspacing="1" cellpadding="0" >
      <tr>
      <td class="LN_press">
      <c:if test="${isupload=='true'}">
      <div class="LN_inquiry">
      <input name="Submit12" type="button" onclick="attachUpload();return false;" id="Submit12" class="LN_big_button3" value="上传附件" /></div>
      </c:if>
	       <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
	       	<tr>
	       	<td width="5%" class="LN_tableBoxtitle2">序号</td>
	        <td width="32%" class="LN_tableBoxtitle2">附件名称</td>
	        <td width="14%" class="LN_tableBoxtitle2">上传人</td>
	        <td width="19%" class="LN_tableBoxtitle2">上传时间</td>
	        <td width="15%" class="LN_tableBoxtitle2">附件大小</td>
	        <td class="LN_tableBoxtitle2">操作</td>
	       	</tr>
		      <tbody id="attachList">
		      <c:forEach var="o" items="${attachList}" varStatus="idx">
		      <tr class="list-color${idx.index%2==0?'1':'2'}" id="${o.id}">
		        <td class="LN_tableBoxText2">${idx.count}</td>
		        <td class="LN_tableBoxText2"><a href="javascript:window.location='${ROOT}/downloadFile.do?id=${o.id}';" class="LN_BlueLink" >${o.name}&nbsp;</a></td>
		        <td class="LN_tableBoxText2">${o.genPersonName}&nbsp;</td>
		        <td class="LN_tableBoxText2"><fmt:formatDate value="${o.genDate}" pattern="yyyy-MM-dd HH:mm"/>&nbsp;</td>
		        <td class="LN_tableBoxText2">${o.fileSize}KB</td>
		        <td class="LN_tableBoxText2">
		        	<c:if test="${delete}">		
		        		<input name="Submit10" type="button" id="Submit10" class="LN_big_button3" value="删除" 
		        		onclick="deleteAttach('${o.id}');"/>
		        	</c:if>
		            <input name="Submit11" type="button" id="Submit11" class="LN_big_button3" value="下载" 
		            onclick="window.location='${ROOT}/downloadFile.do?id=${o.id}'"/></td>
		      </tr>
		      </c:forEach>
		      </tbody>
	       </table>
      </td>
      </tr>
</table>
</form>
	</body>
</html>
