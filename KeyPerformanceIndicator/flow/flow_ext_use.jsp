<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="GBK"%>
<jsp:directive.page import="com.shengdai.kpi.flow.service.IFlowService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<jsp:directive.page import="java.util.List"/>
<%@ include file="/web/pub/flow.inc"%>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.FlwNodeExt"/>

<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
<TBODY>
<logic:iterate id="ext" name="flowNodeExtList" >
  
  <logic:equal name="ext" property="paraType" value="text">
  <TR>
	<TD align=right width="13%" height=35 nowrap="nowrap">
		<bean:write name="ext" property="paraDisName" />£º</TD>
	<TD width="87%" height=25>
		<input name="<bean:write name="ext" property="paraName"/>" 
		type="text" value="<bean:write name="ext" property="paraValue"/>" /></TD>
  </TR>
  </logic:equal>
  
  <logic:equal name="ext" property="paraType" value="select">
  <TR>
	<TD align=right width="13%" height=35 nowrap="nowrap">
		 <bean:write name="ext" property="paraDisName" />£º</TD>   
	<TD width="87%" height=25>
	<%FlwNodeExt flwNodeExt = (FlwNodeExt) ext;
	  String values = flwNodeExt.getListValues();             
	  String[] valueArray = values.split(";");                                                                 
	%>                                                      
	  <select name="<bean:write name="ext" property="paraName"/>">
	  <%for (int i = 0; i < valueArray.length; i++) {
	    String[] eleArray = valueArray[i].split(","); %> 
	    <option value="<%=eleArray[1]%>" <%if(eleArray[2].equals("true")){out.print("selected=\"selected\"");}%>>
		<%=eleArray[0]%></option>
	  <%}%>
	  </select></TD>
  </TR>
  </logic:equal>
  
  <logic:equal name="ext" property="paraType" value="check">
  <TR>
	<TD align=right width="13%" height=35 nowrap="nowrap">
		<bean:write name="ext" property="paraDisName" />£º</TD>
	<TD width="81%" height=25>
	<%FlwNodeExt flwNodeExt2 = (FlwNodeExt) ext;
	  String values2 = flwNodeExt2.getListValues();
	  String[] valueArray2 = values2.split(";");
	  for (int i = 0; i < valueArray2.length; i++) {
	  String[] eleArray2 = valueArray2[i].split(",");%>
		 <input name="<bean:write name="ext" property="paraName"/>" type="checkbox" value="<%=eleArray2[1]%>" <%if(eleArray2[2].equals("true")) out.print("checked=\"checked\"");%> />
		 <%=eleArray2[0]%>
	<%}%>
	</TD>
  </TR>
  </logic:equal>

  <logic:equal name="ext" property="paraType" value="radion">
  <TR>
	<TD align=right width="13%" height=35 nowrap="nowrap">
		<bean:write name="ext" property="paraDisName" />£º</TD>
	<TD width="87%" height=25>
		<%FlwNodeExt flwNodeExt3 = (FlwNodeExt) ext;
		  String values3 = flwNodeExt3.getListValues();
		  String[] valueArray3 = values3.split(";");
		  for (int i = 0; i < valueArray3.length; i++) {
	   	  String[] eleArray3 = valueArray3[i].split(",");%>
			<input name="<bean:write name="ext" property="paraName"/>" type="radio" value="<%=eleArray3[1]%>" <%if(eleArray3[2].equals("true")) out.print("checked=\"checked\"");%> />
			<%=eleArray3[0]%>
		<%}%>
	</TD>
  </TR>
  </logic:equal>
</logic:iterate>
</TBODY>
</table>