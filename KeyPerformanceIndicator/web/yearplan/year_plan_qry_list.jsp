<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>

<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>员工年度计划查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/GDCCS.css" rel="stylesheet" type="text/css" />	
	<script language="javascript" type="text/JavaScript">
	function showPlan()
    	{
    	    openFullScreenWin("${ROOT}/web/yearplan/year_plan_qry.jsp");
    	  // openFullScreenWin("${ROOT}/openStaticAssessmentYearByInfo.do?showType=demo");
    		return true;
    	}
	</script>
	<% 
		 
		List list = new ArrayList();

		for(int i=0;i<5;i++){
			list.add(i);
		}
		request.setAttribute("list",list);
		
	%>
</head>
<body class="LN_body">
<div class="LN_popupsBox">
<!--<div class="LN_popupsTop"></div>-->
<!--<div class="LN_Append">-->
<!--  <div class="LN_popupsSafe-C"><a href="#">保存并关闭</a></div>-->
<!--  <div class="LN_popupsSafe"><a href="#">保存</a></div>-->
<!--  <div class="LN_popupsSubmit"><a href="#">提交</a></div>-->
<!--</div>-->
<div class="LN_formBox">
<div class="LN_formTitle">员工年度计划查询</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">计划查询表</td>
  </tr>
  <tr>
    <td class="LN_press"><div class="LN_inquiry">历史查询：
      <select name="select" id="select">
            <option>2010年</option>
            <option>2008年</option>
            <option>2007年</option>
          </select>
    </div>
    
    <table onclick="showPlan()" width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
      <tr>
        <td width="72" class="LN_tableBoxtitle2">序号</td>
        <td width="167" class="LN_tableBoxtitle2">部门</td>
        <td width="80" class="LN_tableBoxtitle2">姓名</td>
        <td width="100" class="LN_tableBoxtitle2">岗位名称</td>
        <td width="100" class="LN_tableBoxtitle2">岗位等级</td>
        <td width="415" class="LN_tableBoxtitle2">年度计划名称</td>
        </tr>
        <c:forEach items="${list}" var="o" varStatus="idx">
        	<tr>
		        <td width="72" class="LN_tableBoxText2">${idx.count}</td>
		        <td class="LN_tableBoxText2">eee</td>
		        <td class="LN_tableBoxText2">张三</td>
		        <td class="LN_tableBoxText2">绩效主管</td>
		        <td class="LN_tableBoxText2">管理五岗</td>
		        <td class="LN_tableBoxText2 STYLE1">张三-人力资源部-2010年工作计划表-(2010年02月01日)</td>
	        </tr>
        </c:forEach>

        
        
      <tr>
        <td class="LN_tableBoxText2">2</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">张三</td>
        <td class="LN_tableBoxText2">绩效主管</td>
        <td class="LN_tableBoxText2">管理五岗</td>
        <td class="LN_tableBoxText2 STYLE1">张三-人力资源部-2010年工作计划表-(2010年07月11日)</td>
        </tr>
      <tr>
        <td class="LN_tableBoxText2">3</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">李四</td>
        <td class="LN_tableBoxText2">招聘主管</td>
        <td class="LN_tableBoxText2">专业五岗</td>
        <td class="LN_tableBoxText2 STYLE1">李四-人力资源部-2010年工作计划表-(2010年02月01日)</td>
        </tr>
    </table>
    </td>
  </tr>
</table>
</div>
</div>

</body>
</html>
