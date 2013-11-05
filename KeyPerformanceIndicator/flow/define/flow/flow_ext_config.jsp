<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/web/pub/flow.inc"%>

<table id=tabPro height=23 cellSpacing=1 borderColorDark=#f4f5ff align="center" cellPadding=1 width="100%" borderColorLight=#b5caff border=1>
  <tr>
  	<td class="title-header" align="center" width="10%" height="22" >
	序号
	</td>
	<td class="title-header" align="center" width="40%">
	参数名称
	</td>
	<td class="title-header" align="center" width="30%" >
	参数显示名
	</td>
	<td class="title-header" align="center" width="15%" >
	参数值
	</td>
	<td class="title-header" align="center" width="15%" >
	操作
	</td>
  </tr>
  <c:forEach var="o" items="${flowNodeExtList}" varStatus="idx">
  	<tr onmouseover='this.style.backgroundColor="#EFEFEF"' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
  		<td align="center" width="10%" height="20">${idx.count}</td>
  		<td align="center" width="20%" height="20">${o.paraName}</td>
  		<td align="center" width="20%" height="20">${o.paraDisName}</td>
  		<td align="center" width="20%" height="20">${o.paraValue}</td>
  		<td align="center" width="20%" height="20">
		<a href="javascript:editNodeExt('${o.id}');" title="编辑参数">
		<img src="${ROOT}/web/flow/img/edit.gif" border="0"></a>
		 <a href="javascript:deleteNodeExt('${o.id}');" title="删除参数">
		<img src="${ROOT}/web/flow/img/delete_1.gif" border="0"></a>
		</td>
  	</tr>
  </c:forEach>
</table>
<c:if test="${isHandler}">
<input type='button' name='add_attach_button' onclick="javascript:add_para('${flwFlow.flowCode}');" value='新增' class="button">
</c:if>