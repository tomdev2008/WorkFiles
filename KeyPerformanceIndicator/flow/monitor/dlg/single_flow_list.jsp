<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*,com.shengdai.kpi.system.*" errorPage=""%>
<jsp:directive.page import="com.shengdai.kpi.flow.ITemplate"/>
<jsp:directive.page import="com.shengdai.kpi.flow.FlowContext"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>单独发起流程列表</title>
	<%@ include file="/web/pub/flow.inc"%>
	<%@ include file="/flow/secure.inc" %>
</head>
<script language="JavaScript" type="text/javascript">
function startSingelFlow(btn){
	if(!checkForm())
		return ;
	form1.action = "${ROOT}/startFlowSingle.do?";
	btn.disabled=true;
	pageShield();
	form1.submit();
}
function checkForm(){
	var delegate = document.getElementsByName("delegate");
	if(delegate!=null){
		for(var i=0;i<delegate.length;i++){
			if(delegate[i].checked){
				return true;
			}
		}
	}
	alert('请选择要发起的项!');
	return false;
}
</script>
	<%
		Map delegateMap = (Map) request.getAttribute("delegateMap");
		List templetList = (List) request.getAttribute("templetList");
	%>
	<body>
	<html:base target="_self"/> 
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
          	<kpi:secure name="发 起" onClick="startSingelFlow(this)" code="${typeCode }607" resourceId="${orgId }" type="button" className="button4"/>
          </div></td>
        </tr>
        <tr>
          <td height="560" valign="top" class="address-text-bg"><div class="address-depict1">	
	
		<form id="form1" name="form1" method="post" action="">
		<input type="hidden" name="monitorId" value="<bean:write name="monitorId"/>"/>
		<input type="hidden" name="batchId" value="<bean:write name="recBatch" property="id"/>"/>
<center class="title"><bean:write name="recBatch" property="batchName"/></center>
			<%
					RecBatch recBatch = (RecBatch)request.getAttribute("recBatch");
					FlowContext.addVariable(FlowContext.FLOW_BATCH_DATE,""+recBatch.getFreqYear()+recBatch.getFreqMoq());
					for (int i = 0; i < templetList.size(); i++) {
					FlowTemplet flowTemplet = (FlowTemplet) templetList.get(i);	
					ITemplate templet = flowTemplet.buildTemplate();
					if(templet.getFlgUse()==ITemplate.STATUS_UNUSE)	continue;//暂停使用的模板就略过				
			%>
			<table  width="85%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" scope="col" align="left">
						模版名称：<%=flowTemplet.getTypeName()%>
					</td>
				</tr>
				<%		List list = new ArrayList();
						//更新：如果模板是公用模板(即一个业务类型只有一个公用模板，在不同的组织下建流程)，则根据流程所属组织获取被考核对象
						if(templet.getTemplateType()==1){
							list.addAll(templet.getScope(request.getParameter("fid")));
						}else{
							list.addAll(templet.getScope());	
						}
						int size = list.size() % 4 == 0 ? list.size() / 4
						: list.size() / 4 + 1;
						int k = 0;
						for (int j = 0; j < size; j++) {
				%>
				<tr>
					<td align="center" nowrap="nowrap" bgcolor="#FFFFFF">
						<%
								if (k > list.size() - 1) {
								out.print("&nbsp;");
									} else {
								OrgVo orgVo = (OrgVo) list.get(k);
								k++;
						%>
						<input type="checkbox" name="delegate"
							value="<%=orgVo.getId()%>:<%=orgVo.getType().orgInt()%>:<%=flowTemplet.getTempletId()%>"
							<%=delegateMap.get(orgVo.getId() + "_"
												+ orgVo.getType().orgInt()) != null ? "disabled=\"disabled\""
										: ""%> />
						<%=orgVo.getName()%>
						<%
						}
						%>
					</td>
					<td width="156" align="center" nowrap="nowrap" bgcolor="#FFFFFF">
						<%
								if (k > list.size() - 1) {
								out.print("&nbsp;");
									} else {
								OrgVo orgVo = (OrgVo) list.get(k);
								k++;
						%>
						<input type="checkbox" name="delegate"
							value="<%=orgVo.getId()%>:<%=orgVo.getType().orgInt()%>:<%=flowTemplet.getTempletId()%>"
							<%=delegateMap.get(orgVo.getId() + "_"
												+ orgVo.getType().orgInt()) != null ? "disabled=\"disabled\""
										: ""%> />
						<%=orgVo.getName()%>
						<%
						}
						%>
					</td>
					<td width="141" align="center" nowrap="nowrap" bgcolor="#FFFFFF">
						<%
								if (k > list.size() - 1) {
								out.print("&nbsp;");
									} else {
								OrgVo orgVo = (OrgVo) list.get(k);
								k++;
						%>
						<input type="checkbox" name="delegate"
							value="<%=orgVo.getId()%>:<%=orgVo.getType().orgInt()%>:<%=flowTemplet.getTempletId()%>"
							<%=delegateMap.get(orgVo.getId() + "_"
												+ orgVo.getType().orgInt()) != null ? "disabled=\"disabled\""
										: ""%> />
						<%=orgVo.getName()%>
						<%
						}
						%>
					</td>
					<td width="148" align="center" nowrap="nowrap" bgcolor="#FFFFFF">
						<%
								if (k > list.size() - 1) {
								out.print("&nbsp;");
									} else {
								OrgVo orgVo = (OrgVo) list.get(k);
								k++;
						%>
						<input type="checkbox" name="delegate"
							value="<%=orgVo.getId()%>:<%=orgVo.getType().orgInt()%>:<%=flowTemplet.getTempletId()%>"
							<%=delegateMap.get(orgVo.getId() + "_"
												+ orgVo.getType().orgInt()) != null ? "disabled=\"disabled\""
										: ""%> />
						<%=orgVo.getName()%>
						<%
						}
						%>
					</td>
				</tr>
				<%
				}
				%>
			</table>
			<%
			}
			%>
		</form>	
          </div></td>
        </tr>
      </table>
	</body>
</html>
