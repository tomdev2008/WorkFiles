<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.flow.valueobject.Accredit,
				com.shengdai.kpi.common.valueobject.Busi,
				com.shengdai.kpi.system.common.DateHelper,
				java.util.Date,
                java.util.List" %>
<%@ include file="/web/pub/flow.inc" %>

<html>
  <head>  
    <title>考核授权</title>	
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script language="javaScript">
    var n = 0;
 	function ev_select()
 	{
 		var checkboxes=document.getElementsByName("selectedRow");
 		for(i=0;i<checkboxes.length;i++)
 		{
 			if(n%2==0)
 			{
 			    checkboxes[i].checked=true;
 			}else
 			{
 			    checkboxes[i].checked=false;
 			}
 		}
 		n++;
 	}
 </script>
</head>

 <body bgcolor="#f0f0f0" text="#000000" style="overflow:auto">
 <form name="accreditForm" method="post" action="">
  <input name="st" type="hidden" value="0">
 <table width="100%"  class="sort-table">
   <tr>
	<td>
    <DIV class=tab-pane id=tabPane1>
    <SCRIPT type=text/javascript>	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );</SCRIPT>
    	
  <DIV class=tab-page id=tabPage1>
    <logic:notEqual name="viewTop" value="false">
    	<H2 class=tab><a href="javascript:parent.setToolBarState('11110110');">未启动授权</a></H2>
    </logic:notEqual>
    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
	<!-- 这里嵌套功能菜单基本配置 -->
  <table width="100%" height="100%" border="1"   cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
  <tr>
    <td width="8%" height=23 nowrap class=header onClick="ev_select();">选择<!--(<u>S</u>)--></td>

	<page:tabTitle title="业务类型" column="busi.id"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="11%" align="left"/>

    <td width="15%" nowrap class=header>授权人</td>
    <%-- <td width="15%" height=23 nowrap class=header>被授权人</td>--%>
    <%--<td width="5%" height=23 nowrap class=header>是否启动</td>--%>
    <td width="8%" height=23 nowrap class=header>状 态</td>
    
    <page:tabTitle title="开始时间" column="startDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="left"/>
    
    <page:tabTitle title="结束时间" column="endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="left"/>

  </tr>
 <logic:notEmpty name="accreditListOff">
 <logic:iterate id="accredit" name="accreditListOff" type="com.shengdai.kpi.flow.valueobject.Accredit" scope="request" indexId="index" >
<logic:notEmpty name="accredit">	
	<bean:define   id="busi"   name="accredit"   property="busi"   type="com.shengdai.kpi.common.valueobject.Busi"/>   
	
	<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td><div align="center">
		<input type="checkbox" name="selectedRow" id="<bean:write name="accredit" property="id"/>" value="<bean:write name="accredit" property="id"/>">
	</div></td>
	<td><a href="${ROOT}/system/common/accredit_self_form.jsp?method=update&accreditID=<bean:write name="accredit" property="id" />" target="_parent">
			<bean:write name="busi" property="busiName" />
		</a>
	</td>
	
	<%--<td><bean:write name="accredit" property="grantorName" /></td>--%>
	<td><bean:write name="accredit" property="acceptorName" /></td>
<%--	<td>
		<logic:equal name="accredit" property="flgStart" value="1">是</logic:equal>
		<logic:notEqual name="accredit" property="flgStart" value="1">否</logic:notEqual>
	</td>
--%>
	<td>
		<logic:lessEqual name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			<logic:greaterEqual name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
				有效
			</logic:greaterEqual>
		</logic:lessEqual>
		<logic:greaterThan name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:greaterThan>
		<logic:lessThan name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:lessThan>
	</td>
	<td><bean:write name="accredit" property="startDate" format="yyyy-MM-dd HH:mm"/></td>
	<td><bean:write name="accredit" property="endDate" format="yyyy-MM-dd HH:mm"/></td>
	<%--td><bean:write name="accredit" property="remark"/></td--%>
	</tr>
</logic:notEmpty>	
</logic:iterate>
</logic:notEmpty>
 
</table>
  <page:root inputclass="TextStyle"/>
  </DIV>
  
  <DIV class=tab-page id=tabPage2>
  <logic:notEqual name="viewTop" value="false">
    <H2 class=tab><a href="javascript:parent.setToolBarState('11001110')">已启动授权</a></H2>
  </logic:notEqual>
    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
	<!-- 这里嵌套功能菜单基本配置 -->
  <table width="100%" height="100%" border="1"   cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
  <tr>
    <td width="8%" height=23 nowrap class=header onClick="ev_select();">选择<!--(<u>S</u>)--></td>

	<page:tabTitle title="业务类型" column="busi.id"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="11%" align="left"/>

 <%--   <td width="15%" nowrap class=header>授权人</td>--%>
    <td width="15%" height=23 nowrap class=header>被授权人</td>
 <%--   <td width="5%" height=23 nowrap class=header>是否启动</td>--%>
    <td width="8%" height=23 nowrap class=header>状 态</td>
    
    <page:tabTitle title="开始时间" column="startDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="left"/>
    
    <page:tabTitle title="结束时间" column="endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="left"/>

  </tr>
 <logic:notEmpty name="accreditListOn">
 <logic:iterate id="accredit" name="accreditListOn" type="com.shengdai.kpi.flow.valueobject.Accredit" scope="request" indexId="index" >
<logic:notEmpty name="accredit">	
	<bean:define   id="busi"   name="accredit"   property="busi"   type="com.shengdai.kpi.common.valueobject.Busi"/>   
	
	<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td><div align="center">
		<input type="checkbox" name="selectedRow" id="<bean:write name="accredit" property="id"/>" value="<bean:write name="accredit" property="id"/>">
	</div></td>
	<td><a href="${ROOT}/system/common/accredit_self_form.jsp?method=update&accreditID=<bean:write name="accredit" property="id" />" target="_parent">
			<bean:write name="busi" property="busiName" />
		</a>
	</td>
	
<%--	<td><bean:write name="accredit" property="grantorName" /></td>--%>
	<td><bean:write name="accredit" property="acceptorName" /></td>
<%--	<td>
		<logic:equal name="accredit" property="flgStart" value="1">是</logic:equal>
		<logic:notEqual name="accredit" property="flgStart" value="1">否</logic:notEqual>
	</td>
--%>
	<td>
		<logic:lessEqual name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			<logic:greaterEqual name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
				有效
			</logic:greaterEqual>
		</logic:lessEqual>
		<logic:greaterThan name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:greaterThan>
		<logic:lessThan name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:lessThan>
	</td>
	<td><bean:write name="accredit" property="startDate" format="yyyy-MM-dd HH:mm"/></td>
	<td><bean:write name="accredit" property="endDate" format="yyyy-MM-dd HH:mm"/></td>
	<%--td><bean:write name="accredit" property="remark"/></td--%>
	</tr>
</logic:notEmpty>	
</logic:iterate>
</logic:notEmpty>
 
</table>
<page:root inputclass="TextStyle"/>
    </DIV>
  
   <DIV class=tab-page id=tabPage3>
  <logic:notEqual name="viewTop" value="false">
    <H2 class=tab><a href="javascript:parent.setToolBarState('10000110');">接收到授权</a></H2>
  </logic:notEqual>
    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage3" ) );</SCRIPT>
	<!-- 这里嵌套功能菜单基本配置 -->
  <table width="100%" height="100%" border="1"   cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
  <tr>
    <td width="8%" height=23 nowrap class=header onClick="ev_select();">选择<!--(<u>S</u>)--></td>

	<page:tabTitle title="业务类型" column="busi.id"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="11%" align="left"/>

    <td width="15%" nowrap class=header>授权人</td>
 <%--   <td width="15%" height=23 nowrap class=header>被授权人</td>--%>
    <td width="5%" height=23 nowrap class=header>是否启动</td>
    <td width="8%" height=23 nowrap class=header>状 态</td>
    
    <page:tabTitle title="开始时间" column="startDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="left"/>
    
    <page:tabTitle title="结束时间" column="endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="19%" align="left"/>

  </tr>
 <logic:notEmpty name="accreditListReceive">
 <logic:iterate id="accredit" name="accreditListReceive" type="com.shengdai.kpi.flow.valueobject.Accredit" scope="request" indexId="index" >
<logic:notEmpty name="accredit">	
	<bean:define   id="busi"   name="accredit"   property="busi"   type="com.shengdai.kpi.common.valueobject.Busi"/>   
	
	<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td><div align="center">
		<input type="checkbox" name="selectedRow" id="<bean:write name="accredit" property="id"/>" value="<bean:write name="accredit" property="id"/>">
	</div></td>
	<td><a href="${ROOT}/system/common/accredit_self_form.jsp?method=update&accreditID=<bean:write name="accredit" property="id" />" target="_parent">
			<bean:write name="busi" property="busiName" />
		</a>
	</td>
	
	<td><bean:write name="accredit" property="grantorName" /></td>
<%--	<td><bean:write name="accredit" property="acceptorName" /></td> --%>
	<td>
		<logic:equal name="accredit" property="flgStart" value="1">是</logic:equal>
		<logic:notEqual name="accredit" property="flgStart" value="1">否</logic:notEqual>
	</td>
	<td>
		<logic:lessEqual name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			<logic:greaterEqual name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
				有效
			</logic:greaterEqual>
		</logic:lessEqual>
		<logic:greaterThan name="accredit" property="startDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:greaterThan>
		<logic:lessThan name="accredit" property="endDate.time" value="<%=System.currentTimeMillis()+""%>">
			无效
		</logic:lessThan>
	</td>
	<td><bean:write name="accredit" property="startDate" format="yyyy-MM-dd HH:mm"/></td>
	<td><bean:write name="accredit" property="endDate" format="yyyy-MM-dd HH:mm"/></td>
	<%--td><bean:write name="accredit" property="remark"/></td--%>
	</tr>
</logic:notEmpty>	
</logic:iterate>
</logic:notEmpty>
 
</table>
<page:root inputclass="TextStyle"/>
  </DIV>
  <!-- 	整个TAB结束 -->
	</DIV>
  </td>
</tr>
</table>
  
  </form>
  </body>
</html>
