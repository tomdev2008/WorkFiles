<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<%@ include file="/web/pub/head.inc"%> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
	<title>添加基本工作计划</title>
	<script type="text/javascript">
		function ev_save(){
		/*	var form = document.getElementById("form");
			form.action = "${ROOT}/saveOrg.do";
			if(CheckForm(form)){
				pageShield();
				form.submit();
			}	*/
		}
		
		
		/**
		*返回列表
		*/
		function ev_back(){
			//var url = "${ROOT}/listOrg.do?id=${org.org.id }";
			var url = "${ROOT}/web/plan/year_plan_qry.jsp";
			window.location.href = url;
		}
		
		function ev_editOrgDuty() {
			var form = $_E("form");
			form.action = "${ROOT}/editOrgDuty.do";
			form.submit();
		}
	//-->
	</script>
</head>
<body onmousewheel="setScrollzheight()" class="LN_body">
<form id="form" name="form" method="post" action="">
<input type="hidden" id="backUrl" name="backUrl" value="${ROOT}/editOrg.do"/>
<input type="hidden" id="editWidth" name="editWidth" value="740"/>
<input type="hidden" id="editHeight" name="editHeight" value="380"/>
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <Tr><td class="list-caozuo">
  	<a id="hlinkAddNew" href="javascript:ev_save();">保存</a>|
  	<a id="hlinkAddNew" href="javascript:ev_back();">返回</a>
	<%--<a  href="javascript:ev_history('${org.id  }');">历史版本信息</a>
    --%><%--|
    <a id="hlinkAddNew" href="javascript:ev_save();">保存后关闭</a>
  --%></td></Tr>
  <div class="LN_formTitle">员工年度工作计划表(2011年)</div>
</table>
    <table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
      <tr>
        <td class="t" align="right">工作描述</td>
        <td width="*" colspan="3"><textarea name="remark" rows="4" cols="60"  check="isString('#',500);" required="true" showName="工作描述"></textarea></td>
      </tr>
      <tr>
        <td class="t" align="right">目标进度安排</td>
        <td width="*" colspan="3"><textarea name="remark" rows="3" cols="60"  check="isString('#',500);" required="true" showName="目标进度安排"></textarea></td>
      </tr>
    </table>
</form>
</body>
</html>
<kpi:UIResponse />