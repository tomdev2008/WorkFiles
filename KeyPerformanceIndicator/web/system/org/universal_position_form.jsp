<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ROOT}/css/layout.css" rel="stylesheet" type="text/css" />
    <title>通用岗位信息</title>
    <script type="text/javascript" src="${ROOT}/web/system/dlg/select.js"></script>
	<script type="text/javascript">
	<!--
		function ev_save(){
			var form = $_E("form");
			form.action = "${ROOT}/saveUniformType.do";
			if(CheckForm(form)){
				pageShield();
				form.submit();
			}
		}
		
		function ev_back(){
			var url = "${ROOT}/listUniformType.do?id=${uniformType.parentType.id }&type=${uniformType.typeId }";
			pageBack2List();
		}
	//-->
	</script>
  </head>

 
  <body class="LN_body">
  	<form id="form" name="form" method="post" action="">
		<table border="0" cellspacing="0" cellpadding="0" class="list-top">
		  <tr><td><h2>通用岗位</h2></td></tr>
		  <Tr><td class="list-caozuo">
		    <a href="javascript:ev_save();">保存</a>|
		    <a href="javascript:ev_back();">返回</a>
		    <%--|
		    <a href="javascript:;">保存后关闭</a>
		  --%></td></Tr>
		</table>
	    <table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
	      <tr>
	        <td   class="t"><font color="red">*</font>通用岗位名称</td>
	        <td width="30%">
	        <input name="name" type="text"size="28"  value="${uniformType.name }" check="notBlank" required="true" showName="通用岗位名称"/>&nbsp;
	        <input name="typeId" type="hidden" value="${uniformType.typeId }" />
			</td>
			</tr>
		  <Tr>
	        <td  height="30"  class="t"><font color="red">*</font>排序码</td>
	        <td width="30%"><input name="priority" type="text" size="28" value="${uniformType.priority }"  check="notBlank;isInt()" required="true" showName="排序码"/>&nbsp;
			</td>
	      </tr>
		  <tr>
	        <td  class="t"><font color="red">*</font>上级通用岗位</td>
	        <td>
	        <input type="hidden" name="id" value="${uniformType.id }" />
	        <input type="hidden" name="parentInfo" value="${parentInfo}" />
	        <input name="parent_name" type="text" size="28" readonly="readonly" value="${uniformType.parentType.name }"  check="notBlank" required="true" showName="上级专业线"/>
			&nbsp;<a href="#" onclick="getAddressList('0','1','15','parent_name','parentInfo');" class="choose">选择</a>
			</td>
		  </tr>
	      <tr>
	        <td  class="t">备注</td>
	        <td width="*"><textarea name="remark" rows="5" cols="60" type="_moz" >${uniformType.remark }</textarea>&nbsp;</td>
	      </tr>
	    </table>
	</form>
  </body>
</html>
<kpi:UIResponse/>