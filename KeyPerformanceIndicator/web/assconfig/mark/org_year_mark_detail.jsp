<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<%@ page import="java.util.*" %>

<html>
<head>
	<title>组织年度考核分数配置</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/GDCCS.css" rel="stylesheet" type="text/css" />	

	<script src="${ROOT}/web/system/dlg/msgDialog.js"></script>
	
     <script src="${ROOT}/js/dialog.js"></script>
	<script language="javascript" type="text/JavaScript">
		var batch ="";
		var batchId = "";
		var zt=false;
		function selectedAll()
		{
		 if(zt==true){zt=false;}
		 else{zt=true;}
		   var a = document.getElementsByTagName("input");
		   for (var i=0; i<a.length; i++)  if (a[i].type == "checkbox") a[i].checked = zt;
		}
		
		function ev_add(){
			var b = document.getElementById("batch");
			batch = b.value;
			if(batch == null||batch ==""){
				alert("请先选择批次（周期）!");
				return;
			}
			var bi = document.getElementById("batchId");
			batchId = bi.value;
			var url = "${ROOT }/web/assconfig/mark/org_year_mark_add.jsp?&batchId="+batchId+"&batch="+batch;	
			openWin(url,{showCenter:true,width:650,height:450});
		}
		
		function ev_back(){
			var url = "${ROOT }/listAssessMarkConfig.do";
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
				var b = document.getElementById("batch");
				batch = b.value;
				var bi = document.getElementById("batchId");
				batchId = bi.value;
				document.form1.action="${ROOT}/deleteAssessMark.do?batchId="+batchId+"&batch="+batch;
				document.form1.submit();
			}	
		}
		
		function ev_save(){
			document.form1.action="${ROOT}/updateAssessMark.do";
			document.form1.submit();
		}
		
		function ev_open(id){
			var b = document.getElementById("batch");
			batch = b.value;
			var bi = document.getElementById("batchId");
			batchId = bi.value;
			var url = "${ROOT }/listAssessMarkById.do?id="+id+"&batch="+batch+"&batchId="+batchId;
			openWin(url,{showCenter:true,width:650,height:450});
			//window.location.href = url;
		}
		
		function ev_add2(){
			document.form1.action="${ROOT}/addAssessMark.do";
			document.form1.submit();
		}
		
		function getValue(){
			document.form1.action="${ROOT}/listAssessMark.do";
			document.form1.submit();
		}
		function setBatch(){
			var b = document.getElementById("batch");
			var s = document.getElementById("batchList");
			var index =s.selectedIndex;
			//alert(index);
			b.value = s.options[index].value;
		}
		
		function refresh(batch_id){
			var b = document.getElementById("batch");
			batch = b.value;
			var url="${ROOT }/listAssessMark.do?batchId="+batch_id+"&batch="+batch+"&isNew=false";
			alert(url);
			document.form1.action=url;
			document.form1.submit();
		}
		
	</script>
</head>
<body class="LN_body">

<form name="form1" method="post" style="margin-top: 0px">
<div class="LN_Append">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
   <tr>
      <td class="list-caozuo">
	<a id="hlinkDelete" href="#" onclick="ev_add()">添加</a>&nbsp;|&nbsp;
<!--	<a id="hlinkDelete" href="#" onclick="ev_save()">保存</a>&nbsp;|&nbsp;-->
   	<a id="hlinkDelete" href="#" onclick="ev_del()">删除</a>&nbsp;|&nbsp;
   	<a id="hlinkDelete" href="javascript:ev_back()">返回</a>
  	</td>
	</tr>
</table>
<!--	<div class="LN_popupsDel"><a href="#">返回</a></div>-->
<!--  <div class="LN_popupsDel"><a href="#">删除</a></div>-->
<!--  <div class="LN_popupsSafe"><a href="#">保存</a></div>-->
<!--  <div class="LN_popupsAdd1"><a href="javascript:ev_add('')">添加部门</a></div>-->
 </div>
      <br />
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
      	<tr>	
      		<td width="100%" class="LN_tableBoxtitle2">
      			<div align="center">批次(周期):${batch}<input type="hidden" value="${batch}" id="batch" /><input type="hidden" value="${batchId}" id="batchId" />
      			<c:if test="${isNew }">

						<select name="monitorForm" id="batchList" property="id" onchange="setBatch()">
							<OPTION value="">
								--请选择--
							</OPTION>
							<%
							int batch = 2008;
							for (int i = 0; i < 15;i++ ) {
							  	batch ++;%>
							<option value="<%=batch%>">
								<%=batch%>
							</option><%}%>
						</select>&nbsp;									
      			</c:if>
      			
      			</div>
      		</td>
         </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
        <tr>
          <td width="9%" class="LN_tableBoxtitle2">序号 ${acceptor}
            <input type="checkbox" name="checkbox2" id="checkbox2" onclick="selectedAll();"/></td>
          <td width="15%" class="LN_tableBoxtitle2"><div >部门</div></td>
          <td width="19%" class="LN_tableBoxtitle2"><div >分数</div></td>
          <td width="19%" class="LN_tableBoxtitle2"><div >最后修改时间</div></td>
          <td width="19%" class="LN_tableBoxtitle2"><div >备注</div></td>
          </tr>
       <c:forEach var="o" items="${markList}" varStatus="idx">
        <tr>
          <td class="LN_tableBoxText2">${idx.count}
              <input type="checkbox" name="selectedrow" id="checkbox3" value="${o.id }" /></td>
          <td class="LN_tableBoxText2"><a href="javascript:ev_open('${o.id}')">${o.orgName}</a></td>
<!--          <td class="LN_tableBoxText2">${o.batchId}</td>-->
          <td class="LN_tableBoxText"> 
          	<input type="text" name="scale" id="scale" class="LN_Input50" 
        				check="notBlank;isInt()" required="true" showName='分数' value="${o.mark}" style="border:0px;background-color:transparent;"/></td>
          <td class="LN_tableBoxText2">${o.modifyDate}</td>
          <td class="LN_tableBoxText2">${o.remark}</td>
          </tr>
          </c:forEach>
      </table>
      <br />
<br />
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
</table>
<div class="LN_pagebody">
	<kpi:page-bar formId="form1"/> 
</div>
</div>
</div>
</form>
</body>
</html>
