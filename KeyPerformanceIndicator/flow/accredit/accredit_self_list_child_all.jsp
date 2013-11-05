<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.shengdai.kpi.flow.valueobject.Accredit,
				com.shengdai.kpi.common.valueobject.Busi,
				com.shengdai.kpi.system.common.DateHelper,
				java.util.Date,
                java.util.List" %>
<jsp:directive.page import="com.shengdai.kpi.common.service.IBusiService"/>
<jsp:directive.page import="com.shengdai.kpi.common.SpringHelper"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="com.shengdai.kpi.system.service.IUserService"/>
<%@ include file="/web/pub/flow.inc" %>
<%
List accreditList=(List)request.getAttribute("list");
IUserService ius=(IUserService)SpringHelper.getBean("userService");
User user =ius.findUserById(loginedUser.getId());
%>
<html>
  <head>  
    <title>考核授权</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<script type="text/javascript">
function ev_search()
{
	var id=document.all.grantorId.value;
	if(id=="")
	{
		alert("请选择要查询的授权人！");return;
	}
	var uid=id.split(",")[2];
	accreditForm.action="${ROOT}/listAccreditHistory.do?showFlg=1&uid="+uid;
	accreditForm.submit();
}
//根据日志记录找曾经的待办
function ev_look(aid)
{
	var url="${ROOT}/listUndoByAccHistory.do?aid="+aid;
	window.open(url,'','left=100, top=80, width=800, height=600, resizable=1,scrollbars=1');
}
</script>
 <body>
 <%if(user.isSARole()){ %>
 <br>
 <div>
  &nbsp;请选择人员：<input name="grantor" readonly="readonly" type="text" class="editline" onClick="showAddr('grantor','grantorId','20;1')">
			<input name="grantorId" type="hidden"> <input type="button" class="button" value="查询" onclick="javascript:ev_search();">  
  </div>
  <%}%> 
  <form   name="accreditForm" method="post" action="">
  <input name="st" type="hidden" value="0">
  <div align="center" class="title">授权日志列表</div>
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="7%" nowrap align="center" class=header >序号</td>

	<page:tabTitle title="业务类型" column="a.busi"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="15%" align="center"/>

    <td width="10%" nowrap class=header align="center">授权人</td>
    <td width="10%" nowrap class=header align="center">被授权人</td>
    <td width="5%" nowrap class=header align="center">是否启动</td>
    <page:tabTitle title="开始时间" column="a.startDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="18%" align="center"/>
    <page:tabTitle title="结束时间" column="a.endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="18%" align="center"/>
	<page:tabTitle title="授权时间" column="a.grantDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="18%" align="center"/>
	
  </tr>
<%if(accreditList!=null){ 
	IBusiService ibs=(IBusiService)SpringHelper.getBean("busiService");
	Date d=new Date();
	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	for(int i=0;i<accreditList.size();i++){
		Accredit acc=(Accredit)accreditList.get(i);
		String busyName="";
		if(acc.getBusi().equals("*"))
			busyName="所有业务类型";
		else
		{
			Busi bu=ibs.findBusiById(acc.getBusi());
			busyName=bu.getBusiName();
		}
		
%>
	
	<tr <%if(i%2==0) out.print("bgcolor=\"#E8F4F4\""); %> align="center"  style.cursor='default' >
	<td align="center"><%=i+1 %></td>
	<td align="center">
		<a href="#" onclick="javascript:ev_look('<%=acc.getId() %>');"><font color="#0066FF"><%= busyName%></font></a> 
	</td>
	<td align="center"><%=acc.getGrantorName() %></td>
	<td align="center"><%=acc.getAcceptorName() %></td>
	<td align="center">
		<%if(acc.getFlgStart().intValue()==1) out.print("是"); else out.print("否"); %>
	</td>
	
	<td align="center"><%=df.format(acc.getStartDate()) %></td>
	<td align="center"><%=df.format(acc.getEndDate()) %></td>
	<td align="center"><%=df.format(acc.getGrantDate()) %></td>
	</tr>
<%} }%> 
</table><br>
<table width="95%" border="0"><tr><td align="right">
<page:root inputclass="editline" /></td></tr></table>
  </form>
  </body>
</html>
