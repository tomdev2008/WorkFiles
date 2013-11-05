<%-- 整理 zyf 2008-1-14 --%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Accredit"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Busi"/>
<jsp:directive.page import="com.shengdai.kpi.flow.service.IBusiService"/>
<jsp:directive.page import="com.shengdai.kpi.system.SpringHelper"/>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.service.IUserService"/>
<jsp:directive.page import="com.shengdai.kpi.system.org.vo.User"/>
<jsp:directive.page import="com.shengdai.kpi.system.CommonLoginUser"/>
<%@ include file="/web/pub/flow.inc" %>
<%List accreditList=(List)request.getAttribute("accreditList"); 
User loginedUser = CommonLoginUser.getCurrentDefaultUserHolder();
User user=loginedUser;
String acid=(String)request.getAttribute("acid");
%>
<html>
  <head>  
    <title>考核授权</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.selectedMenuStytle {
	border-top-style: groove;
	border-right-style: groove;
	border-bottom-style: groove;
	border-left-style: groove;
	color: #0099FF;
}
</style>

<script language="javascript">

function changeAccreditType(){
	var url = "${ROOT}/listSelfAccredit.do?accreditType="+form1.accreditType.value;
	window.location.href = url;
}
function ev_add(){
	view_form("${ROOT}/viewSelfAccredit.do?method=add");
}

function ev_update(){
    var rowid = null;
    var count =0;
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
        count = count +1;
        rowid = selectedRow[i].value;
      }
    }
    if (count >1)  {
		alert("请只选择一条记录进行编辑！");
        return ;
    }
    if(count ==1) {
   		view_form("${ROOT}/viewSelfAccredit.do?method=update&accreditID="+rowid);
	}else{
	  	alert("请选择一条需要编辑的记录！");
	    return ;
	}
}

function ev_del(){
	var count=0;
    var selected=new Array();
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
    	if (selectedRow[i].checked){
	    	count = count +1;
	        selected[i]=selectedRow[i].value;
	    }
	}
	if (count >0)  {
		if (window.confirm("您确认要删除记录？")) {
	    	accreditForm.target="_self";
		    accreditForm.action = "${ROOT}/deleteSelfAccredit.do?action=listSelfOffAccredit.do";
	        accreditForm.submit();
	    }
	}else {
		alert("您还没选择记录!");
	}
}	
window.onload=function (){
	setPHeight();
}	
 </script>
</head>
<html:base target="_self"/>
<body onmousewheel='setScrollzheight();'>
    <form name="form1" method="post" style="margin-top: 0px">
    	<input type="hidden" name="orgId" value="${org.id }"/>
    	<!-- 这里用于引用下级组织的ID -->
    	<input type="hidden" name="orgNames" value=""/>
    	<input type="hidden" name="orgIds" value=""/>
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>考核授权</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
						<a onclick="ev_add();return false;" href="#">新增</a> |
						<a onclick="ev_update();return false;" href="#">编辑</a> |
						<a onclick="ev_del();return false;" href="#" >删除</a> |
						<a onclick="ev_log();return false;" href="#" >授权日志</a>
					</td>
				</tr>
  			</tbody>
  		</table>    	
  		<table class="listquery" cellpadding="0" cellspacing="1">
	      <tr>
	        <td width="12%" class="t">授权类型</td>
	        <td>
	          <select id="accreditType" name="accreditType" onchange="changeAccreditType()" >
				<option value="<%=Accredit.ACCREDIT_TYPE_FROM_ME %>">我的授权</option>
				<option value="<%=Accredit.ACCREDIT_TYPE_FROM_OTHER %>">别人给我的授权</option>
			  </select>
			  <script>
			  	var accreditType = document.getElementById("accreditType");
			  	for(var i =0;i<accreditType.options.length;i++){
			  		if(accreditType.options[i].value==${accreditType}){
			  			accreditType.options[i].selected = true;
			  			break;
			  		}
			  	}
			  </script>
	         </td>
	       </tr>
	    </table>				
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="15%">业务类型</td>
				<td class="list-title" width="10%">授权人</td>
				<td class="list-title" width="10%" >被授权人</td>
				<td class="list-title" width="10%" >状 态</td>
				<td class="list-title" width="15%" >开始时间</td>
				<td class="list-title" width="15%" >结束时间</td>				
			</tr>
 <%if(accreditList!=null)
 { 
	 IBusiService ibs=(IBusiService)SpringHelper.getBean("busiService");
	 Date d=new Date();
	 SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 for(int i=0;i<accreditList.size();i++)
	 {
		 Accredit acc=(Accredit)accreditList.get(i);
		 String busiName="";
		 if(acc.getBusi().equals("*"))
		 	busiName="所有业务类型";
		 else
		 {
		 	Busi bu=ibs.findBusiById(acc.getBusi());
		 	busiName=bu.getBusiName();
		 }
		
 %>

	<tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td align="center">
		<%=1+i %>&nbsp;<input type="checkbox" name="selectedRow" value="<%=acc.getId() %>"/>
	
	</td>
	<td><a href="javascript: view_form('${ROOT}/viewSelfAccredit.do?method=update&accreditID=<%=acc.getId() %>');">
			<%=busiName %>
		</a>
	</td>
	
	<td><%=acc.getGrantorName() %></td>
	<td><%=acc.getAcceptorName() %></td>
	<td>
		<%int xg=0;//0表示无效，1表示有效
		if(acc.getEndDate().before(d)) 
				out.print("无效"); 
			else
				{out.print("有效");xg=1;}
				String bsg=xg+","+(i+1);
				out.print("<input name=\""+acc.getId()+"xg\" type=\"hidden\" value=\""+bsg+"\">");
		%>
	</td>
	<td><%=df.format(acc.getStartDate()) %></td>
	<td><%=df.format(acc.getEndDate()) %></td>
	</tr>
 <%} }%>			
		</table>
		<kpi:page-bar formId="form1" />
	</form>
</body>
</html>


