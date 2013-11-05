<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@ page import="java.util.*,com.shengdai.kpi.common.SpringHelper,com.shengdai.kpi.assess.service.*,com.shengdai.kpi.assess.valueobject.*"%>
<%@ include file="/web/pub/flow.inc"%>
<script src="${ROOT}/common/common.js" type="text/javascript" />
<script type="text/javascript">
function selectDoc()
{
var ids = getAllChecked("selectedRow");
window.returnValue = getAllChecked("selectedRow");
   window.close();
}	

function test(){
alert(22);
}
</script>
<html>
<head>
<title>监控管理</title>

</head>
	<body class="list_body">

		<FORM method="post" name="form1" action="">
		
			<INPUT type="hidden" name="groupId" value="<%=request.getParameter("groupId")%>" />
			<table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
				<tr>
					<td class="title-header" align="left" width="10%">
						<span class="style32">选择</span>
					</td>
					<page:tabTitle title="模板名称" column="templetName" downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="25%" align="left" isSort="false"/>
					<td class="title-header" align="left" width="35%">
						<span class="style32"> <font size="2" width="94%">模板类型</font></span>
					</td>
				</tr>
				<logic:iterate id="templet" name="templetList">
					<tr>
						<td align="center">
							<input type="checkbox" name="selectedRow" value="<bean:write name="templet" property="id"/>" />
						</td>
						<td align="left">
							<bean:write name="templet" property="templetName" />
						</td>
						<td>
							<bean:write name="templet" property="templetType" />
						</td>
					</tr>
				</logic:iterate>
			</table>
			<input type="button" name="bb" value="提 交" onclick="window.returnValue = getAllChecked('selectedRow');window.close();"/>
			
		</FORM>

	</body>
</html>