<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/web/pub/head.inc"%>
<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
	<script>
		function ev_edit(id){
			openWin("${ROOT}/editIndicatorType.do?id=" + id+"&parentId=${indicatorType.id}",{showCenter:true,width:600,height:500});
		}
		
		function ev_delete(){
			if(SelectUtil.checkedCount("selectRow")>0){
				if(window.confirm("您确定要删除所选的指标类型吗？")){
					$_E('form1').action = "${ROOT}/deleteIndicatorType.do";
					$_E('form1').submit();
				}
			}else{
				alert("请先选择要删除的类型项！");
			}
		}
	</script>
</head>
<body class="LN_body">
<form action="${ROOT }/*.do" name="form1" method="post">
<input type="hidden" name="parentId" value="${indicatorType.id}"/>
<div class="LN_popupsBox">
<div class="LN_formBox">
<div class="LN_formTitle">指标类型</div>

<div align="left">[<font color="#CC3300">${indicatorType.fullName }</font>]下的指标类型列表。</div> 
<br/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td>
    <div class="LN_Append">
						<div class="LN_popupsName">指标类型列表</div>
						<div class="LN_popupsDelete60"><a href="#" onclick="ev_delete();return false;">删除</a></div>
						<div class="LN_popupsAdd60"><a href="#" onclick="ev_edit('');return false;">新增</a></div>
	</div>
    </td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="10%" class="LN_tableBoxtitle2">序号<input type="checkbox" id="selectedHandler"  onclick="SelectUtil.checkAll(this,'selectRow');"/></td>
            <td width="8%" class="LN_tableBoxtitle2">编码</td>
            <td width="20%" class="LN_tableBoxtitle2">名称</td>
            <td width="20%" class="LN_tableBoxtitle2">最后修改日期</td>
            <td width="12%" class="LN_tableBoxtitle2">修改人</td>
             <td width="*" class="LN_tableBoxtitle2">说明</td>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${indicatorTypes}" varStatus="idx">
            <tr>
            <td  class="LN_tableBoxText2">
            <input type="checkbox" value="${o.id}" name="selectRow" />${idx.count}
            <td class="LN_tableBoxText2">${o.code}&nbsp;</td>
            <td class="LN_tableBoxText2">
            <a href="#" class="LN_BlueLink" onclick="ev_edit('${o.id }');return false;">${o.name }</a>&nbsp;</td>
            <td class="LN_tableBoxText2">&nbsp;<fmt:formatDate value="${o.lastModifyDate}" pattern="yyyy-MM-dd HH:mm"/>
            </td>
            <td class="LN_tableBoxText2">&nbsp;${o.lastModifyName }
			</td>
            <td class="LN_tableBoxText2">&nbsp;${o.description}
          	 </td>
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
</body>
</html>
