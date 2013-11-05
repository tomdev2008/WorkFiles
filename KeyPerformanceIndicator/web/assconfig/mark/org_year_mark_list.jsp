<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.shengdai.kpi.assconfig.web.AssessMarkAction"%>
<%@ include file="/web/pub/head.inc"%>
<%@ page import="java.util.*" %>
<% String batch=request.getParameter("batch");
	String batchId = request.getParameter("batchId"); %>
<html>
<head>
	<title>组织年度考核分数配置</title>
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
		
		function ev_add(){
			var url = "${ROOT}/listAssessMark.do?isNew=true";
			//var url = "${ROOT}/web/assconfig/mark/org_year_mark_detail.jsp";
			//openFullScreenWin(url);
			window.location.href = url;
			//openWin(url,{showCenter:true,width:750,height:600});
			
		}
		
		function ev_open(batch_id,batch){
			var url = "${ROOT}/listAssessMark.do?batch="+batch+"&batchId="+batch_id+"&isNew=false";
			//isNew ：是否为新增，0为flase,1为true
			window.location.href = url;
		}
		
		function ev_edit() {
			var number = 0;
			var checkVal ;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked){
						number = number + 1;
						checkVal = e.value+"&batch="+e.title;	
					}
				}							
			}
			if(number == 0){
				alert("请选择要修改的记录");
				return false;
			}else if(number>1){
				alert("请只选择一条要修改的记录");
				return false;
			}
			var url = "${ROOT}/listAssessMark.do?batchId="+checkVal+"&isNew=false";
			window.location.href = url;
		}
		
		function ev_del() {
			var number = 0;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked)
						number = number + 1;
				}							
			}
			if(number == 0){
				alert("请选择要删除的记录");
				return false;
			}
			if(confirm("确定删除所选的记录吗？")){
				document.form1.action="${ROOT}/deleteAssessMarkConfig.do";
				document.form1.submit();
			}	
		}

	</script>
</head>
<body class="LN_body">
<form name="form1" method="post" style="margin-top: 0px">

<div class="LN_formBox">
<div class="LN_formTitle">部门年度考核分数配置</div>
<div class="LN_Append">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
   <tr>
      <td class="list-caozuo">
	<a id="hlinkDelete" href="javascript:ev_add()">新增</a>&nbsp;|&nbsp;
	<a id="hlinkDelete" href="#" onclick="ev_edit()">修改</a>&nbsp;|&nbsp;
   	<a id="hlinkDelete" onclick="ev_del()" href="#">删除</a>
  	</td>
	</tr>
</table>
<!--  <div class="LN_popupsDel"><a href="#">删除</a></div>-->
<!--  <div class="LN_popupsSafe"><a href="#">修改</a></div>-->
<!--  <div class="LN_popupsAdd1"><a href="javascript:ev_add('')">新增</a></div>-->
 </div>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
      	<tr>	
      		<td width="100%" class="LN_tableBoxtitle2"><div align="center">部门年度考核分数配置表</div></td>
         </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
        <tr>
          <td width="9%" class="LN_tableBoxtitle2">序号
            <input type="checkbox" name="checkbox2" id="checkbox2" onclick="selectedAll();"/></td>
          <td width="15%" class="LN_tableBoxtitle2"><div >批次(周期)</div></td>
          <td width="19%" class="LN_tableBoxtitle2"><div >创建人</div></td>
          <td width="19%" class="LN_tableBoxtitle2"><div >创建时间</div></td>
          <td width="19%" class="LN_tableBoxtitle2"><div >最后修改人</div></td>
          <td width="19%" class="LN_tableBoxtitle2"><div >最后修改时间</div></td>
          </tr>
        <c:forEach var="o" items="${markConfigList}" varStatus="idx">
        <tr>
          <td class="LN_tableBoxText2">${idx.count}
              <input type="checkbox" name="selectedrow" id="checkbox3" title="${o.batch}" value="${o.id}" /></td>
          <td class="LN_tableBoxText2"><a href="javascript:ev_open('${o.id}','${o.batch}');">${o.batch}</a></td>
          <td class="LN_tableBoxText2">${o.createName}</td>
          <td class="LN_tableBoxText2">${o.createDate}</td>
          <td class="LN_tableBoxText2">${o.modifyName}</td>
          <td class="LN_tableBoxText2">${o.modifyDate}</td>
          </tr>
          </c:forEach>
      </table>
      <br />

<br />
<!--<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">-->
<!--  <tr>-->
<!--    <td height="3" bgcolor="#4F81CE"></td>-->
<!--  </tr>-->
<!--</table>-->
<div class="LN_pagebody">
	<kpi:page-bar formId="form1"/> 
</div>
</div>
</div>
</form>
</body>
</html>
