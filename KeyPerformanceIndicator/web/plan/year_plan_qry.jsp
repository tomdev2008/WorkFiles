<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<%@ page import="java.util.*" %>

<html>
<head>
	<title>员工年度计划查询</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/GDCCS.css" rel="stylesheet" type="text/css" />	

	<script src="${ROOT}/web/system/dlg/msgDialog.js"></script>
     <script src="${ROOT}/js/dialog.js"></script>
	<script language="javascript" type="text/JavaScript">
	
		var zt=false;
		function selectedAll()
		{
		 if(zt==true){zt=false;}
		 else{zt=true;}
		   var a = document.getElementsByTagName("input");
		   for (var i=0; i<a.length; i++)  if (a[i].type == "checkbox") a[i].checked = zt;
		}
		
		function ev_add(parent_id){
			var url = "${ROOT}/web/plan/year_work_plan_add.jsp";
			//var url = "${ROOT}/createOrg.do?parentId="+parent_id;
			//openFullScreenWin(url);
			window.location.href = url;
			
		}
	</script>
</head>
<body class="LN_body">
<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
  <div class="LN_popupsSafe-C"><a href="#">保存并关闭</a></div>
  <div class="LN_popupsSafe"><a href="#">保存</a></div>
  <div class="LN_popupsDel"><a href="#">删除指标</a></div>
  <div class="LN_popupsAdd1"><a href="javascript:ev_add('')">添加制度工作</a></div>
  <div class="LN_popupsAdd2"><a href="javascript:ev_add('')">添加基本工作</a></div>
 </div>
<div class="LN_formBox">
<div class="LN_formTitle">张三-人力资源部-2010年工作计划表-(2010年02月01日)</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press"><table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
      <tr>
        <td width="8%" class="LN_tableBoxtitle">部门</td>
        <td width="10%" class="LN_tableBoxText">&nbsp;</td>
        <td width="11%" class="LN_tableBoxtitle">姓名</td>
        <td width="12%" class="LN_tableBoxText">&nbsp;</td>
        <td width="8%" class="LN_tableBoxtitle">岗位名称</td>
        <td width="16%" class="LN_tableBoxText"> </td>
        
        <td width="8%" class="LN_tableBoxText"><p>岗位等级</p></td>
        <td width="16%" class="LN_tableBoxText"> </td>
      </tr>
    </table>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
        <tr>
          <td width="11%" class="LN_tableBoxtitle2">分类
            <input type="checkbox" id="selectid22" class="checkboxInput" onclick="selectedAll() "/></td>
          <td width="10%" class="LN_tableBoxtitle2">序号
            <input type="checkbox" name="checkbox2" id="checkbox2" onclick="selectedAll();"/></td>
          <td width="36%" class="LN_tableBoxtitle2"><div align="center">工作描述</div></td>
          <td width="43%" class="LN_tableBoxtitle2"><div align="center">目标进度按排</div></td>
          </tr>
        <tr>
          <td rowspan="5" class="LN_tableBoxText2">基本工作</td>
          <td class="LN_tableBoxText2">1
              <input type="checkbox" name="checkbox3" id="checkbox3" /></td>
          <td class="LN_tableBoxText2">基本工作1</td>
          <td class="LN_tableBoxText2">提前完成</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">2
              <input type="checkbox" name="checkbox" id="checkbox" /></td>
          <td class="LN_tableBoxText2">基本工作2</td>
          <td class="LN_tableBoxText2">提前完成</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">3
              <input type="checkbox" name="checkbox4" id="checkbox4" /></td>
          <td class="LN_tableBoxText2">基本工作3</td>
          <td class="LN_tableBoxText2">提前完成</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">4
              <input type="checkbox" name="checkbox5" id="checkbox5" /></td>
          <td class="LN_tableBoxText2">基本工作4</td>
          <td class="LN_tableBoxText2">提前完成</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">5
              <input type="checkbox" name="checkbox6" id="checkbox6" /></td>
          <td class="LN_tableBoxText2">基本工作5</td>
          <td class="LN_tableBoxText2">暂无</td>
          </tr>
        <tr>
          <td rowspan="5" class="LN_tableBoxText2">制度工作</td>
          <td class="LN_tableBoxText2">6
              <input type="checkbox" name="checkbox7" id="checkbox7" /></td>
          <td class="LN_tableBoxText2">制度工作1</td>
          <td class="LN_tableBoxText2">提前完成</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">7
              <input type="checkbox" name="checkbox8" id="checkbox8" /></td>
          <td class="LN_tableBoxText2">制度工作2</td>
          <td class="LN_tableBoxText2">暂无</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">8
              <input type="checkbox" name="checkbox9" id="checkbox9" /></td>
          <td class="LN_tableBoxText2">制度工作3</td>
          <td class="LN_tableBoxText2">暂无</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">9
              <input type="checkbox" name="checkbox10" id="checkbox10" /></td>
          <td class="LN_tableBoxText2">制度工作4</td>
          <td class="LN_tableBoxText2">暂无</td>
          </tr>
        <tr>
          <td class="LN_tableBoxText2">10
              <input type="checkbox" name="checkbox11" id="checkbox11" /></td>
          <td class="LN_tableBoxText2">制度工作5</td>
          <td class="LN_tableBoxText2">暂无</td>
          </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
        <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText"><textarea name="textarea" id="textarea" cols="45" rows="3" style="width:724px; font-size:12px;">1.员工根据个人实际情况填写年度工作计划内容 
</textarea></td>
          </tr>
      </table></td>
  </tr>
</table>
<br />
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">考核过程处理意见</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="25%" class="LN_tableBoxtitle2">环节</td>
            <td width="15%" class="LN_tableBoxtitle2">处理人</td>
            <td width="20%" class="LN_tableBoxtitle2">处理时间</td>
            <td class="LN_tableBoxtitle2">意见</td>
            </tr>
            <tr>
              <td class="LN_tableBoxText2">员工填写年度工作计划</td>
              <td class="LN_tableBoxText2">张三</td>
              <td class="LN_tableBoxText2">2009-10-08 11:13</td>
            <td class="LN_tableBoxText2">请领导审批</td>
            </tr>
            <tr>
              <td class="LN_tableBoxText2">部门经理审核</td>
              <td class="LN_tableBoxText2">部门经理</td>
              <td class="LN_tableBoxText2">2009-10-09 10:11</td>
            <td class="LN_tableBoxText2">同意</td>
            </tr>
            <tr>
              <td class="LN_tableBoxText2">员工确认</td>
              <td class="LN_tableBoxText2">张三</td>
            <td class="LN_tableBoxText2">2009-11-02 09:21</td>
            <td class="LN_tableBoxText2">已确认</td>
            </tr>
            <tr>
              <td class="LN_tableBoxText2">部门经理确认</td>
              <td class="LN_tableBoxText2">部门经理</td>
              <td class="LN_tableBoxText2">2009-11-04 14:13</td>
              <td class="LN_tableBoxText2">已确认</td>
            </tr>
          </table>
      </td>
  </tr>
</table>
<br />
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
</table>
</div>
</div>
</body>
</html>
