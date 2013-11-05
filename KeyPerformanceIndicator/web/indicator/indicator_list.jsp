<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>指标管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>
			function FF_Value(){
				openWin("${ROOT}/listIndicatorValuesChannel.do",{showCenter:true,width:800,height:600});
			}
		</script>
		
		
	</head>
<body class="LN_body">
<form action="" name="form1" method="post" id="form1">
<input type="hidden" name="typeId" value="${indiType.id}"/>
<div class="LN_popupsBox">
<div class="LN_formBox">
<div class="LN_formTitle">指标管理</div>
 <div align="left">
       [<font color="#CC3300" >${indiType.fullName }</font>]下的指标。
</div> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td>
    <div class="LN_Append">
<div class="LN_popupsName">指标列表</div>
<!-- 	<div class="LN_popupsReset60"><a href="#" onclick="ev_remove();return false;">移动</a></div>
	<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
	<div class="LN_popupsPaste60"><a href="#" onclick="ev_paste();return false;">粘贴</a></div>
	<div class="LN_popupsCopy60"><a href="#" onclick="ev_copy();return false;">复制</a></div>
  <div class="LN_popupsAdd60"><a href="#" onclick="ev_edit('');return false;">新增</a></div> -->
  <div class="LN_popupstransmit100"><a href="#" onclick="FF_Value();return false;">取值方式</a></div>
</div>
</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="8%" class="LN_tableBoxtitle2">序号<input type="checkbox" id="selectAllHandler" onclick="SelectUtil.checkAll(this,'templateId');"/></td>
            <td width="25%" class="LN_tableBoxtitle2">指标名称</td>
            <td width="15%" class="LN_tableBoxtitle2">修改时间</td>
            <td width="10%" class="LN_tableBoxtitle2">修改人</td>
            <td width="15%" class="LN_tableBoxtitle2">取值方式</td>
            <td width="10%" class="LN_tableBoxtitle2">排序</td>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${indicators}" varStatus="idx">
            <tr id="itemTr${idx.count}">
            <td  class="LN_tableBoxText2">${idx.count}
			<input type="checkbox" value="${o.id}" name="indicatorId" /></td>
			<td class="LN_tableBoxText2"><a href="#" class="LN_BlueLink" onclick="ev_edit('${o.id }');return false;">${o.name }</a>
			&nbsp;</td>
			<td class="LN_tableBoxText2"><fmt:formatDate value="${o.lastModifyDate}" pattern="yyyy-MM-dd HH:mm"/>
			&nbsp;</td>
			<td class="LN_tableBoxText2">${o.lastModifyName}&nbsp;</td>
			<td class="LN_tableBoxText2">${o.refResourceName}&nbsp;</td>
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