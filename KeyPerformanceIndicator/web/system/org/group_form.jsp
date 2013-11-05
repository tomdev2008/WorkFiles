<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<%@ page import="com.shengdai.kpi.system.org.vo.UniformType;"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>群组信息</title>
    <script type="text/javascript" src="${ROOT}/web/system/dlg/select.js"></script>
	<script type="text/javascript">
	<!--
		function ev_save(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/saveGroup.do";
			if(CheckForm(form)){
				pageShield();
				form.submit();
			}
		}
		
		function ev_back(){
			var url = "${ROOT}/listGroup.do?orgId=${group.org.id }";
			window.document.location.href = url;
		}
	//-->
	</script>
  </head>

 
  <body class="main-body">
  	<form name="form" method="post" >
  	<input type="hidden" name="id" value="${group.id }" />
		<table border="0" cellspacing="0" cellpadding="0" class="list-top">
		  <tr><td><h2>群组信息</h2></td></tr>
		  <Tr><td class="list-caozuo">
		    <a href="javascript:ev_save();">保存</a>|
		  <a href="javascript:ev_back();">返回</a>
		  </td></Tr>
		</table>
	    <table width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
	      <tr>
	        <td  height="30"  class="t"><font color="red">*</font>所属组织</td>
	        <td width="30%">
	        <input  type="text"size="28"  value="${group.org.name }" readonly/>&nbsp;
	        <input name="orgId" type="hidden" value="${group.org.id }" />
			</td>
			</tr>
		  <tr>
	        <td  height="30"  class="t"><font color="red">*</font>群组名称</td>
	        <td width="30%"><input name="name" type="text" size="28" value="${group.name }"  check="notBlank" required="true" showName="群组名称"/>&nbsp;
			</td>
	      </tr>
		  <tr>
	        <td height="30" class="t">群组类型</td>
	        <td>
	        	<select name="groupType">
	        		<option value="1">考核群组，抢分的时候使用</option>
	        		<option value="2">等级群组，仅作评级使用</option>
	        	</select>
			</td>
		  </tr>
		  <tr>
	        <td height="30" class="t"><font color="red">*</font>群组成员</td>
	        <td>
	        <input type="hidden" name="detailsinfo" value="${group.detailsId }" check="notBlank" required="true" showName="群组成员" />
	        <textarea name="detailsText" rows="5" cols="60" type="_moz" check="notBlank" required="true" showName="群组成员" readonly >${group.detailsText }</textarea>&nbsp;
	        <a href="#" onclick="getAddressList('0;20','n','1','detailsText','detailsinfo');" class="choose">选择</a>
			</td>
		  </tr>
	      <tr>
	        <td height="30" class="t">备注</td>
	        <td width="*"><textarea name="remark" rows="5" cols="60" type="_moz" >${group.remark }</textarea>&nbsp;</td>
	      </tr>
	    </table>
	</form>
  </body>
</html>
<kpi:UIResponse />