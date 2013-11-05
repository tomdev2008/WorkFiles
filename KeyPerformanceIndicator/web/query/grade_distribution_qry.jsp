<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>等级分布情况查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />	
	<script language="javascript" type="text/JavaScript">
	function showPlan()
    	{
    	    openFullScreenWin("${ROOT}/web/query/year_plan_qry.jsp");
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
<div class="LN_formTitle">等级分布情况查询</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">等级分布情况列表</td>
  </tr>
  <tr>
    <td class="LN_press"><div class="LN_inquiry"></div>
    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
      <tr>
        <td width="54" class="LN_tableBoxtitle2"><div align="center">序号</div></td>
        <td width="94" class="LN_tableBoxtitle2"><div align="center">部门</div></td>
        <td width="96" class="LN_tableBoxtitle2"><div align="center">考核周期</div></td>
        <td colspan="3" class="LN_tableBoxtitle2"><div align="center">优秀<strong>（≤10%）</strong></div></td>
        <td colspan="3" class="LN_tableBoxtitle2"><div align="center">良好<strong>（≤30%）</strong></div></td>
        <td class="LN_tableBoxtitle2"><div align="center">称职</div></td>
        <td class="LN_tableBoxtitle2"><div align="center">基本称职/</div></td>
        <td class="LN_tableBoxtitle2"><div align="center">不称职</div></td>
      </tr>
      <tr>
        <td width="54" class="LN_tableBoxText2">1</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">2010年2月</td>
        <td width="72" class="LN_tableBoxText2">总人数：10</td>
        <td width="69" class="LN_tableBoxText2">已使用：4</td>
        <td width="72" class="LN_tableBoxText2">未使用：6</td>
        <td width="75" class="LN_tableBoxText2">总人数：20</td>
        <td width="72" class="LN_tableBoxText2">已使用：14</td>
        <td width="75" class="LN_tableBoxText2">未使用：6</td>
        <td width="81" class="LN_tableBoxText2">总人数：10</td>
        <td width="68" class="LN_tableBoxText2">总人数：4</td>
        <td width="100" class="LN_tableBoxText2">总人数：6</td>
      </tr>
      <tr>
        <td class="LN_tableBoxText2">2</td>
        <td class="LN_tableBoxText2">综合部</td>
        <td class="LN_tableBoxText2">2010年2月</td>
        <td class="LN_tableBoxText2">总人数：12</td>
        <td class="LN_tableBoxText2">已使用：6</td>
        <td class="LN_tableBoxText2">未使用：6</td>
        <td class="LN_tableBoxText2">总人数：30</td>
        <td class="LN_tableBoxText2">已使用：15</td>
        <td class="LN_tableBoxText2">未使用：15</td>
        <td class="LN_tableBoxText2">总人数：10</td>
        <td class="LN_tableBoxText2">总人数：4</td>
        <td class="LN_tableBoxText2">总人数：6</td>
      </tr>
      <tr>
        <td class="LN_tableBoxText2">3</td>
        <td class="LN_tableBoxText2">财务部</td>
        <td class="LN_tableBoxText2">2010年2月</td>
        <td class="LN_tableBoxText2">总人数：8</td>
        <td class="LN_tableBoxText2">已使用：3</td>
        <td class="LN_tableBoxText2">未使用：5</td>
        <td class="LN_tableBoxText2">总人数：10</td>
        <td class="LN_tableBoxText2">已使用：4</td>
        <td class="LN_tableBoxText2">未使用：6</td>
        <td class="LN_tableBoxText2">总人数：10</td>
        <td class="LN_tableBoxText2">总人数：4</td>
        <td class="LN_tableBoxText2">总人数：6</td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div>
</div>
</body>
</html>
