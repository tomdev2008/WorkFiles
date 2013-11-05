<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>
<jsp:directive.page import="com.shengdai.kpi.util.AddressHelper"/>
<jsp:directive.page import="java.util.Calendar"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
   
	<title>
		${title}
	</title>
	<%@ include file="/web/pub/head.inc"%>
	
	<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout_1.css" />
   
    <script>
    
       // 去掉空格
       String.prototype.trim = function()
       {
         return this.replace(/(^[\s]*)|([\s]*$)/g, "");
        }
        
       
        function closeWin(){
          window.close();
        }
        
        function exportAssess(){
    	   document.form1.action="<%=request.getContextPath()%>/openStaticAssessmentYearByInfo.do?reportType=export";
    	   form1.target="_self";
    	   form1.enctype = "";
           form1.submit();
    	   
           return true;
    	 }
        /*
			打印考核表
		*/
        function print()
        {
        	wb.execwb(6,6);
        }
        
        /*
			打印考核表的预览页面
		*/
        function printPreView()
        {
        	wb.execwb(7,1);
        }
        
 		
    
    </script>
</head>
<body class="LN_body">
<OBJECT id="wb" height="0" width="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" name="wb"></OBJECT>

<div class="LN_popupsBox">
<div class="LN_popupsTop"></div>
<div class="LN_Append">
  
  
  
  <div class="LN_popupsClose"><a href="#" onclick="closeWin();return false;">关闭</a></div>
  <div class="LN_popupsPrint"><a href="#" onclick="print();return false;">打印</a></div>
  <div class="LN_popupsPrintBrowse"><a href="#" onclick="printPreView();return false;">打印预览</a></div>
  <div class="LN_popupsExport"><a href="#" onclick="exportAssess();return false;">导出</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${title}</div>
 <form name="form1" method="post" action="">
     <input name="id" id="id" type="hidden" value="${id}" />
     <input name="ownerId" id="ownerId" type="hidden" value="${ownerId}" />
     <input name="batchDate" id="batchDate" type="hidden" value="${batchDate}" />
     <input name="batchType" id="batchType" type="hidden" value="${batchType}" />
     <input name="loginId" id="loginId" type="hidden" value="${loginId}" />
     <input name="reportType" id="reportType" type="hidden" value="export" />
 </form>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="1" bgcolor="#DADADA" ></td>
  </tr>

  <tr>
    <td class="LN_press">
        
          <br />
          <table width="100%" border="0" cellpadding="0" cellspacing="1" class="LN_tableBox">
            <tbody>
              <tr>
                <td width="16%" colspan="2" class="LN_tableBoxtitle3">单位及部门</td>
                <td width="36%" colspan="5" class="LN_tableBoxText">${yearStatInfo.groupEndOrgName}</td>
                <td width="16%" colspan="2" class="LN_tableBoxtitle3 LN_lineR">岗位名称</td>
                <td width="32%" colspan="4" class="LN_tableBoxText LN_lineR">${yearStatInfo.positionName}</td>
              </tr>
              <tr>
                <td colspan="2" class="LN_tableBoxtitle3">姓&nbsp;&nbsp;&nbsp;名</td>
                <td colspan="5" class="LN_tableBoxText">${yearStatInfo.userName}</td>
                <td colspan="2" class="LN_tableBoxtitle3 LN_lineR">人员编号</td>
                <td colspan="4" class="LN_tableBoxText LN_lineR">${yearStatInfo.loginId}</td>
              </tr>
              <tr>
                <td width="11%" rowspan="8" class="LN_tableBoxtitle3" style="text-align:center;">工 作<br/><br/>行 为<br/><br/>测 评<br/><br/>结 果</td>
                <td width="17%" colspan="2" rowspan="2" class="LN_tableBoxtitle3 LN_lineR">领导测评分</td>
                <td width="16%" colspan="2" rowspan="2" class="LN_tableBoxText">${yearStatInfo.kciUperScore}</td>
                <td width="4%" rowspan="8" class="LN_tableBoxtitle3 LN_lineR" style="text-align:center;"	>工<br/>作<br/>业<br/>绩<br/>考<br/>核<br/>结<br/>果</td>
                <td width="4%" rowspan="7" class="LN_tableBoxtitle3 LN_lineR" style="text-align:center;"	>月<br/>度<br/>绩<br/>效<br/>考<br/>核<br/>分<br/>数</td>
                <td width="8%" class="LN_tableBoxtitle3 LN_lineR">1月</td>
                <td width="8%" class="LN_tableBoxText LN_lineR">${monList[0]}</td>
                <td width="8%" class="LN_tableBoxtitle3 LN_lineR">5月</td>
                <td width="8%" class="LN_tableBoxText LN_lineR">${monList[4]}</td>
                <td width="8%" class="LN_tableBoxtitle3 LN_lineR">9月</td>
                <td width="8%" class="LN_tableBoxText LN_lineR">${monList[8]}</td>
              </tr>
              <tr>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">2月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[1]}</td>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">6月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[5]}</td>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">10月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[9]}</td>
              </tr>
              <tr>
                <td colspan="2" rowspan="2" class="LN_tableBoxtitle3 LN_lineR">同级测评分</td>
                <td colspan="2" rowspan="2" class="LN_tableBoxText">${yearStatInfo.kciSameScore}</td>
              </tr>
              <tr>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">3月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[2]}</td>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">7月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[6]}</td>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">11月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[10]}</td>
              </tr>
              <tr>
                <td colspan="2" rowspan="2" class="LN_tableBoxtitle3 LN_lineR">下属测评分</td>
                <td colspan="2" rowspan="2" class="LN_tableBoxText">${yearStatInfo.kciLowScore}</td>
              </tr>
              <tr>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">4月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[3]}</td>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">8月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[7]}</td>
                <td rowspan="2" class="LN_tableBoxtitle3 LN_lineR">12月</td>
                <td rowspan="2" class="LN_tableBoxText LN_lineR">${monList[11]}</td>
              </tr>
              <tr>
                <td colspan="2" rowspan="2" class="LN_tableBoxtitle3 LN_lineR">工作行为得分</td>
                <td colspan="2" rowspan="2" class="LN_tableBoxText">${yearStatInfo.kpiYearScore}</td>
              </tr>
               <tr>
                <td colspan="3" class="LN_tableBoxtitle3 LN_lineR">年度绩效考核分数</td>
                <td colspan="4" class="LN_tableBoxText LN_lineR">${yearStatInfo.kpiAveScore}</td>
              </tr>
              <tr>
                <td colspan="2" class="LN_tableBoxtitle3">年度考核得分</td>
                <td colspan="11" class="LN_tableBoxText">${yearStatInfo.staScore}</td>
              </tr>
              <tr>
                <td colspan="2" class="LN_tableBoxtitle3">年度考核结果</td>
                <td colspan="11" class="LN_tableBoxText">${yearStatInfo.staGrade}</td>
              </tr>
              <tr>
                <td colspan="13" class="LN_tableBoxtitle3">发展建议：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            □继任&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            □终止、解除劳动合同&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            □其他（见直接领导意见栏）</td>
              </tr>
              <tr>
                <td  class="LN_tableBoxtitle3">直接领导意见</td>
                <td height="150" colspan="12" valign="bottom" class="LN_tableBoxText"><div align="right">签字（盖章）<br />
                年　　月　　日</div></td>
              </tr>
              <tr>
                <td colspan="13" class="LN_tableBoxtitle3">员工签字：
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                            年 &nbsp;&nbsp; &nbsp;&nbsp;月&nbsp; &nbsp; &nbsp;&nbsp; 日</td>
              </tr>
              <tr>
              <td colspan="1" class="LN_tableBoxtitle3">主管领导意见</td>
              <td height="150" colspan="5" valign="bottom" class="LN_tableBoxText LN_lineR"><div align="right">签字（盖章）<br />
                年　　月　　日</div></td>
              <td colspan="2" class="LN_tableBoxtitle3 LN_lineR">人力资源部意见</td>
              <td colspan="5" valign="bottom" class="LN_tableBoxText LN_lineR"><div align="right">签字（盖章）<br />
                年　　月　　日</div></td>
              </tr>
              
             
            </tbody>
          </table></td>
  </tr>
</table>
<div class="LN_explanation"><strong>说明：</strong>用B5纸选B5（JIS）打印，此表原件装入个人档案。市分公司员工的主管领导为市分公司总经理，省公司部门员工的主管领导为省公司分管领导，三、四岗人员的主管领导为<br />
  　　　省公司总经理！</div>
</div>
</div>
</body>




<kpi:UIResponse />	
