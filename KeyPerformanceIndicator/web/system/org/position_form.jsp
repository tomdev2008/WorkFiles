<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.shengdai.kpi.system.org.vo.User" %>
<%@ include file="/web/pub/head.inc"%>
<html:html lang="true">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>岗位信息</title>
	<script type="text/javascript">
	<!--
		function ev_save(){
			var form = document.getElementById("form");
			form.action = "${ROOT}/savePosition.do";
			if(CheckForm(form)){
				pageShield();
				form.submit();
			}
		}
		
		function ev_back(){
			var url = "${ROOT}/listPosition.do?id=${position.org.id}";
			pageBack2List();
		}
	//-->
	</script>
  </head>
  
<body onmousewheel="setScrollzheight()" class="main-body">
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>岗位管理</h2></td></tr>
  <Tr>
	  <td class="list-caozuo">
	    <a id="hlinkAddNew" href="javascript:ev_save();">保存</a>|
	    <a id="hlinkAddNew" href="javascript:ev_back();">返回</a>
	    <%--<a id="hlinkAddNew" href="javascript:ev_save();">保存后关闭</a>
	  --%></td>
  </Tr>
</table>

<form name="form" method="post">
<table  width="100%" class="formtext1" border="0" cellpadding="0" cellspacing="1">
  <tr>
	<td class="t"><font color="red">*</font>所属组织</td>
	<td >
	    <input  type="hidden" name="orgId"  value="${position.org.id}"/>
	    <input  type="hidden" name="orgInfo"/>
		<input name="orgName" type="text" class="editline" value="${position.org.name }" readonly="readonly" check="notBlank" required="true" showName="所属组织" />
		<a href="#" onclick="getAddressList('0','1','1','orgName','orgInfo');" class="choose">选择</a>  
	</td>
  </tr>
      <tr>
        <td class="t"><font color="red">*</font>岗位名称</td>
        <td >
        	<input name="positionName" type="text" class="editline" value="${position.positionName }" check="notBlank;isString('#','100')" required="true" showName="岗位名称"/>
        	<input type="hidden" name="id" value="${position.id }" />
        </td>
      </tr>
       <tr>
        <td class="t"><font color="red">*</font>排序码</td>
        <td><input name="priority" type="text" class="editline" value="${position.priority }" check="notBlank;isInt('+')" required="true" showName="排序码"/>&nbsp;</td>
      </tr>
      <tr>
        <td class="t">备注</td>
        <td >
	        <textarea name="remark" rows="5" cols="50" type="_moz" >${position.remark }</textarea>
        </td>
      </tr>
      <tr>
        <td  align="center" class="t">岗位员工</td>
        <td >
        <%
        	List orgUserList = (ArrayList)request.getAttribute("orgUserList");
        	List positionUserList = (ArrayList)request.getAttribute("positionUserList");
        	User user = null;
        	for(int i=0;i<orgUserList.size();i++){
        		if((i+1)%5 == 1)
 					out.println("<br>");
        		user = (User)orgUserList.get(i);
         %>
	        	<input name="userId" value="<%=user.getId() %>" type="checkbox"  class="checkboxInput"
	        	<%=positionUserList.contains(user)?"checked":"" %>/>
	        	<%=user.getName() %>
		 <%
		 	}
		  %>

        </td>
      </tr>
    </table>
</form>
</body>
</html:html>
<script type="text/javascript">
<!--
	window.onload=function (){setPHeight();}
//-->
</script>
<kpi:UIResponse />