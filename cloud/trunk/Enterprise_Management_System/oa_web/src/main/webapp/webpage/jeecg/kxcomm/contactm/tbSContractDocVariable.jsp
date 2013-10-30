<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
var tbContractTemplatesDocVariableList='${tbContractTemplatesDocVariableList}';
var templeDocId='${templeDocId}';

    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
		
    });
	//关闭按钮
	 function btnClose()
	 {
		 frameElement.api.close();
	 }
	function xxx()
	{
		alert("adf");
	}
</script>
 <head>
  <title>合同模板文件变量</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbContractController.do?saveContractDocVariable" >
		<div style="width: 600px;height: 200px;">
				<%-- 增加一个div，用于调节页面大小，否则默认太小 --%>
<table border="0" cellpadding="2" cellspacing="0">
	<tr bgcolor="#E6E6E6">
	    <td align="center" bgcolor="#EEEEEE"></td>
	   <td align="center" bgcolor="#EEEEEE"></td> 
		<td align="center" bgcolor="#EEEEEE">变量名</td>
		<td align="center" bgcolor="#EEEEEE">内容</td>
	</tr>
	<c:if test="${fn:length(tbContractDocVariableList)  <= 0 }">
	</c:if>
	<c:if test="${fn:length(tbContractDocVariableList)  > 0 }">
		<c:forEach items="${tbContractDocVariableList}" var="poVal" varStatus="stuts">
		 	<tr>
			   <td align="center"><input name="tbContractDocVariableList[${stuts.index }].id" maxlength="50" type="hidden" style="width:200px;" value="${poVal.id}"></td>
			    <td align="left"><input name="tbContractDocVariableList[${stuts.index }].docId.id" maxlength="50" type="hidden" style="width:200px;" value="${poVal.docId.id}"></td> 
			   <td align="left"><input name="tbContractDocVariableList[${stuts.index }].variablename" maxlength="50" type="text" style="width:200px;" readonly="readonly" value="${poVal.variablename}"></td>
   			   <td align="left"><input name="tbContractDocVariableList[${stuts.index }].content" maxlength="50" type="text" style="width:200px;" value=""></td>
   			</tr> 
   	   </c:forEach>
   	</c:if>
</table>
</div>
		 	<div align="right"><button class="Validform_label" onclick="xxx">确定</button><button class="Validform_label" onclick="btnClose();">取消</button></div> 
	</t:formvalid>
</body>
