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
<div class="LN_popupsTop"></div>
<div class="LN_Append">

 </div>
<div class="LN_formBox">
<div class="LN_formTitle">员工月度考核表(2010年1月份)</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_press"><table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
      <tr>
        <td width="8%" class="LN_tableBoxtitle">部门</td>
        <td width="10%" class="LN_tableBoxText">人力资源部</td>
        <td width="11%" class="LN_tableBoxtitle">姓名</td>
        <td width="12%" class="LN_tableBoxText">张三</td>
        <td width="8%" class="LN_tableBoxtitle">岗位名称</td>
        <td width="16%" class="LN_tableBoxText">绩效考核主管
        
        <td width="8%" class="LN_tableBoxText"><p>岗位等级</p>           </td>
        <td width="16%" class="LN_tableBoxText">管理五岗
      </tr>
    </table>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
        <tr>
          <td width="5%" class="LN_tableBoxtitle2">分类
            <input type="checkbox" name="checkbox2" id="checkbox2" /></td>
          <td width="3%" class="LN_tableBoxtitle2">序号
            <input type="checkbox" name="checkbox2" id="checkbox2" /></td>
          <td width="22%" class="LN_tableBoxtitle2"><div align="center">目标</div></td>
          <td width="22%" class="LN_tableBoxtitle2"><div align="center">考核内容</div></td>
          <td width="12%" class="LN_tableBoxtitle2"><div align="center">考核分值(100分)</div></td>
          <td colspan="2" class="LN_tableBoxtitle2"><div align="center">自评评分</div></td>
          <td colspan="2" class="LN_tableBoxtitle2"><div align="center">部门经理评分</div></td>
          </tr>
        <tr>
          <td rowspan="5" class="LN_tableBoxText2">结果类</td>
          <td class="LN_tableBoxText2">1
              <input type="checkbox" name="checkbox3" id="checkbox3" /></td>
          <td class="LN_tableBoxText2">数量</td>
          <td class="LN_tableBoxText2">按时完成</td>
          <td class="LN_tableBoxText2"><div align="center">20</div></td>
          <td width="8%" class="LN_tableBoxText2"><div align="center">20</div></td>
          <td width="6%" class="LN_tableBoxText2"><input name="Submit9" type="submit" id="Submit9" class="LN_button" value="说明" /></td>
          <td width="10%" class="LN_tableBoxText2"><div align="center">20</div></td>
          <td width="12%" class="LN_tableBoxText2">&nbsp;</td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">2
              <input type="checkbox" name="checkbox" id="checkbox" /></td>
          <td class="LN_tableBoxText2">质量</td>
          <td class="LN_tableBoxText2">按时完成</td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><input name="Submit92" type="submit" id="Submit92" class="LN_button" value="说明" /></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2">&nbsp;</td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">3
              <input type="checkbox" name="checkbox4" id="checkbox4" /></td>
          <td class="LN_tableBoxText2">成本</td>
          <td class="LN_tableBoxText2">按时完成</td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2">&nbsp;</td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">4
              <input type="checkbox" name="checkbox5" id="checkbox5" /></td>
          <td class="LN_tableBoxText2">时间</td>
          <td class="LN_tableBoxText2">按时完成</td>
          <td class="LN_tableBoxText2"><div align="center">5</div></td>
          <td class="LN_tableBoxText2"><div align="center">5</div></td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2"><div align="center">5</div></td>
          <td class="LN_tableBoxText2">&nbsp;</td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">5
              <input type="checkbox" name="checkbox6" id="checkbox6" /></td>
          <td class="LN_tableBoxText2">工作任务</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2"><div align="center">5</div></td>
          <td class="LN_tableBoxText2"><div align="center">5</div></td>
          <td class="LN_tableBoxText2"><input name="Submit95" type="submit" id="Submit95" class="LN_button" value="说明" /></td>
          <td class="LN_tableBoxText2"><div align="center">5</div></td>
          <td class="LN_tableBoxText2">&nbsp;</td>
        </tr>
        <tr>
          <td rowspan="5" class="LN_tableBoxText2"><p>行为类</p>
            </td>
          <td class="LN_tableBoxText2">6
              <input type="checkbox" name="checkbox7" id="checkbox7" /></td>
          <td class="LN_tableBoxText2">工作态度</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><input name="Submit96" type="submit" id="Submit96" class="LN_button" value="说明" /></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><input name="Submit9108" type="submit" id="Submit9108" class="LN_button" value="说明" /></td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">7
              <input type="checkbox" name="checkbox8" id="checkbox8" /></td>
          <td class="LN_tableBoxText2">努力程度</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><input name="Submit97" type="submit" id="Submit97" class="LN_button" value="说明" /></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2">&nbsp;</td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">8
              <input type="checkbox" name="checkbox9" id="checkbox9" /></td>
          <td class="LN_tableBoxText2">胜任程度</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2"><div align="center">20</div></td>
          <td class="LN_tableBoxText2"><div align="center">20</div></td>
          <td class="LN_tableBoxText2"><input name="Submit98" type="submit" id="Submit98" class="LN_button" value="说明" /></td>
          <td class="LN_tableBoxText2"><div align="center">20</div></td>
          <td class="LN_tableBoxText2"><input name="Submit91010" type="submit" id="Submit91010" class="LN_button" value="说明" /></td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">9
              <input type="checkbox" name="checkbox10" id="checkbox10" /></td>
          <td class="LN_tableBoxText2">行类</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><input name="Submit99" type="submit" id="Submit99" class="LN_button" value="说明" /></td>
          <td class="LN_tableBoxText2"><div align="center">10</div></td>
          <td class="LN_tableBoxText2"><input name="Submit91011" type="submit" id="Submit91011" class="LN_button" value="说明" /></td>
        </tr>
        <tr>
          <td class="LN_tableBoxText2">10
            <input type="checkbox" name="checkbox11" id="checkbox11" /></td>
          <td class="LN_tableBoxText2">遵守规章制度、劳动纪律</td>
          <td class="LN_tableBoxText2">是否遵守公司规章制度，是否出现迟到、早退、旷工等现象</td>
          <td class="LN_tableBoxText2"><div align="center">——</div></td>
          <td class="LN_tableBoxText2"><div align="center">-1</div></td>
          <td class="LN_tableBoxText2"><input name="Submit910" type="submit" id="Submit910" class="LN_button" value="说明" /></td>
          <td class="LN_tableBoxText2"><div align="center">0</div></td>
          <td class="LN_tableBoxText2"><input name="Submit9102" type="submit" id="Submit9102" class="LN_button" value="说明" /></td>
        </tr>
        <tr>
          <td height="47" class="LN_tableBoxText2">例外情况说明</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td class="LN_tableBoxText2">&nbsp;</td>
          <td colspan="4" class="LN_tableBoxText2">&nbsp;</td>
        </tr>
        <tr>
          <td height="47" colspan="4" class="LN_tableBoxText2"><div align="right">考核分值汇总：</div></td>
          <td class="LN_tableBoxText2"><div align="center">100</div></td>
          <td class="LN_tableBoxText2"><div align="center">评分汇总：</div></td>
          <td class="LN_tableBoxText2">99</td>
          <td class="LN_tableBoxText2">评分汇总：100</td>
          <td class="LN_tableBoxText2">考核等级：优秀</td>
        </tr>
      </table>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox">
        <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText"><textarea name="textarea" id="textarea" cols="45" rows="3" style="width:724px; font-size:12px;">1.员工根据个人实际情况填写月度考核内容 
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
              <td class="LN_tableBoxText2">员工填写月度考核表</td>
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
              <td class="LN_tableBoxText2">自评评分</td>
              <td class="LN_tableBoxText2">张三</td>
              <td class="LN_tableBoxText2">2009-10-10 10:11</td>
              <td class="LN_tableBoxText2">已评分，请审核审核</td>
            </tr>
            <tr>
              <td class="LN_tableBoxText2">部门经理评分</td>
              <td class="LN_tableBoxText2">部门经理</td>
              <td class="LN_tableBoxText2">2009-10-11 10:11</td>
            <td class="LN_tableBoxText2">已评分</td>
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
