<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>员工年度计划查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />	
	<script language="javascript" type="text/JavaScript">
	function showAssessment()
    	{
    	    openFullScreenWin("${ROOT}/web/query/month_assess_qry_list.jsp");
    	  // openFullScreenWin("${ROOT}/openStaticAssessmentYearByInfo.do?showType=demo");
    		return true;
    	}
	</script>
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
<div class="LN_formTitle">员工年度考核成绩查询</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">成绩查询表</td>
  </tr>
  <tr>
    <td class="LN_press"><div class="LN_inquiry">历史查询：
      <select name="select" id="select">
            <option>2010年</option>
            <option>2008年</option>
            <option>2007年</option>
          </select>
    </div>
    <table onclick="showAssessment()" width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_infbox-border">
      <tr>
        <td width="40" class="LN_tableBoxtitle2">序号</td>
        <td width="199" class="LN_tableBoxtitle2">部门</td>
        <td width="80" class="LN_tableBoxtitle2">姓名</td>
        <td width="100" class="LN_tableBoxtitle2">岗位名称</td>
        <td width="100" class="LN_tableBoxtitle2">岗位等级</td>
        <td width="75" class="LN_tableBoxtitle2">考核评分</td>
        <td width="100" class="LN_tableBoxtitle2">考核评级</td>
        <td width="100" class="LN_tableBoxtitle2">考核周期</td>
        </tr>
      <tr>
        <td width="40" class="LN_tableBoxText2">1</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">张三</td>
        <td class="LN_tableBoxText2">绩效主管</td>
        <td class="LN_tableBoxText2">管理五岗</td>
        <td class="LN_tableBoxText2">99</td>
        <td class="LN_tableBoxText2">优秀</td>
        <td class="LN_tableBoxText2">2010年</td>
        </tr>
      <tr>
        <td class="LN_tableBoxText2">2</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">张三</td>
        <td class="LN_tableBoxText2">绩效主管</td>
        <td class="LN_tableBoxText2">管理五岗</td>
        <td class="LN_tableBoxText2">98</td>
        <td class="LN_tableBoxText2">良好</td>
        <td class="LN_tableBoxText2">2010年</td>
      </tr>
      <tr>
        <td class="LN_tableBoxText2">3</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">李四</td>
        <td class="LN_tableBoxText2">招聘主管</td>
        <td class="LN_tableBoxText2">专业五岗</td>
        <td class="LN_tableBoxText2">97</td>
        <td class="LN_tableBoxText2">称职</td>
        <td class="LN_tableBoxText2">2010年</td>
        </tr>
    </table>
    </td>
  </tr>
</table>
</div>
</div>
</body>
</html>
