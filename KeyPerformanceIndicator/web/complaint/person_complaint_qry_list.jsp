<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
	<title>${WEB_TITLE }</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/GDCCS.css" rel="stylesheet" type="text/css" />	
	<script language="javascript" type="text/JavaScript">
	function showComplaint()
    	{
    	    openFullScreenWin("${ROOT}/web/complaint/person_complaint_content.jsp");
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
<div class="LN_formTitle">员工申诉查询</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">申诉查询表</td>
  </tr>
  <tr>
    <td class="LN_press"><div class="LN_inquiry"></div>
    <table onclick="showComplaint()" width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
      <tr>
        <td width="59" class="LN_tableBoxtitle2">序号</td>
        <td width="116" class="LN_tableBoxtitle2">部门</td>
        <td width="100" class="LN_tableBoxtitle2">姓名</td>
        <td width="139" class="LN_tableBoxtitle2">岗位名称</td>
        <td width="183" class="LN_tableBoxtitle2">岗位等级</td>
        <td width="202" class="LN_tableBoxtitle2">申诉时间</td>
        <td width="134" class="LN_tableBoxtitle2">考核周期</td>
        </tr>
      <tr>
        <td width="59" class="LN_tableBoxText2">1</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">张三</td>
        <td class="LN_tableBoxText2">绩效主管</td>
        <td class="LN_tableBoxText2">管理五岗</td>
        <td class="LN_tableBoxText2 STYLE1">张三-人力资源部-2010-4-12 17:30 </td>
        <td class="LN_tableBoxText2">2010年</td>
        </tr>
      <tr>
        <td class="LN_tableBoxText2">2</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">张三</td>
        <td class="LN_tableBoxText2">绩效主管</td>
        <td class="LN_tableBoxText2">管理五岗</td>
        <td class="LN_tableBoxText2 STYLE1">张三-人力资源部-2010-4-12 17:30 </td>
        <td class="LN_tableBoxText2">2010年</td>
      </tr>
      <tr>
        <td class="LN_tableBoxText2">3</td>
        <td class="LN_tableBoxText2">人力资源部</td>
        <td class="LN_tableBoxText2">李四</td>
        <td class="LN_tableBoxText2">招聘主管</td>
        <td class="LN_tableBoxText2">专业五岗</td>
        <td class="LN_tableBoxText2 STYLE1">李四-人力资源部-2010-4-12 17:30 </td>
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
