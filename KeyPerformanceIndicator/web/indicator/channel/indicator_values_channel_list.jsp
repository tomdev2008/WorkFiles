<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>指标取值方式</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>
			function FF_Edit(id){
				window.location = "${ROOT}/editIndicatorValuesChannel.do?id="+id;
			}
			
			function FF_Delete(){
				if(SelectUtil.checkedCount('channelId')>0){
					$_E("form1").action = "${ROOT}/deleteIndicatorValuesChannel.do";
					$_E("form1").submit();
				}else{
					alert("请先选择要删除的模板项！");
				}
			}
		</script>
		
		
	</head>
<body class="LN_body">
<form action="" name="form1" method="post" id="form1">
<div class="LN_popupsBox">
	<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
	<div class="LN_popupsDelete60"><a href="#" onclick="FF_Delete();return false;">删除</a></div>
	<div class="LN_popupsEdit60"><a href="#" onclick="FF_Edit('');return false;">新增</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">指标取值方式</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td>
    <div class="LN_Append">
		<div class="LN_popupsName">指标取值方式列表</div>
	</div>
</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="8%" class="LN_tableBoxtitle2">序号<input type="checkbox" id="selectAllHandler" onclick="SelectUtil.checkAll(this,'templateId');"/></td>
            <td width="15%" class="LN_tableBoxtitle2">名称</td>
            <td width="15%" class="LN_tableBoxtitle2">实现BEAN</td>
            <td width="20%" class="LN_tableBoxtitle2">实现类</td>
            <td width="15%" class="LN_tableBoxtitle2">是否启用</td>
            <td width="10%" class="LN_tableBoxtitle2">排序</td>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${channleList}" varStatus="idx">
            <tr id="itemTr${idx.count}">
            <td  class="LN_tableBoxText2">${idx.count}
			<input type="checkbox" value="${o.id}" name="channelId" /></td>
			<td class="LN_tableBoxText2"><a href="#" class="LN_BlueLink" onclick="FF_Edit('${o.id }');return false;">${o.name }</a>
			&nbsp;</td>
			<td class="LN_tableBoxText2">${o.beanName}
			&nbsp;</td>
			<td class="LN_tableBoxText2">${o.relaClassName}&nbsp;</td>
			<td class="LN_tableBoxText2">${o.flgStatus==1?'启用':'未启用'}&nbsp;</td>
			<td class="LN_tableBoxText2">${o.priority}&nbsp; </td>
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