<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人考核</title>
</head>
<script language="javascript">

//选择路由扩展
function routeExt(){
	window.open('exts.htm','','height=300,width=500,top=200, left=200,toolbar =no, menubar=no, scrollbars=auto, resizable=no, location=no, status=no')
}
</script>
<body style="OVERFLOW: auto" text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=3>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">
<br>
<form id="form1" name="form1" method="post" action="">
<table cellSpacing=0 cellPadding=0 width=500 align=center border=0>
<tr>
	<td><br>
    <DIV class=tab-pane id=tabPane1>
    <SCRIPT type=text/javascript>
	tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
	</SCRIPT>
	
	
	
    <DIV class=tab-page id=tabPage1>
    <H2 class=tab>基本配置</H2>
    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
	<!-- 这里嵌套流程基本配置 -->
	<table class=box style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
      <TBODY>
      <TR>
	    <td width="8%" align="right"><font color="red">*</font></td>
        <TD align=left width="20%" height=35>路由名称：</TD>
        <TD width="72%" height=25><INPUT class=editline size=30 value="" name="routeFlag"  check="notBlank" showName="路由名称" required="true" maxlength="128"/> </TD></TR>
	  <TR>
        <td align="right"></td>
        <TD align=left height=35>路由说明：</TD>
        <TD height=25><INPUT class=editline size=30 value="" name="routeDesc" maxlength="500"/> </TD></TR><!--
	  <TR>
        <td align="right"></td>
        <TD align=left height=35>显示顺序：</TD>
        <TD height=25><INPUT class=editline size=30 value="" name="dd"> </TD></TR> -->
	  <TR>
       <td align="right"><font color="red">*</font></td>
        <TD align=left height=35>目标环节：</TD>
        <TD height=25>
        <html:select name="routeForm" property="nextNodeCode">
        <html:optionsCollection name="nodeList" value="nodeCode" label="nodeName"/>
        </html:select>
         </TD>
      </TR>
      <TR>
	    <td align="right">
			<font color="red">*</font>
		</td>
		<TD align=left height=35>
			排序号：
		</TD>
		<TD height=25>
			<INPUT class=editline size=30 value="1" name="priority" check="notBlank;isInt('0+')" showName="排序号" required="true"/>
		</TD>
	  </TR>
         <%-- 新版本中无此字段,暂不使用
	  <TR>
        <td align="right"><font color="red">*</font></td>
        <TD align=left height=35>提交按钮名称：</TD>
        <TD height=25><INPUT class=editline size=30 value="" name="menuName"> </TD></TR>
       
	  <TR>
        <td align="right"></td>
        <TD align=left height=35>对应的js函数：</TD>
        <TD height=25><INPUT class=editline size=30 value="" name="jsFunction"> </TD></TR>
         --%>
      <!--<TR>
	    <td align="right"></td>
        <td colspan="2"><font color="red">一个环节如果只有单条路由则不需配置。</font></td></tr>
      --><!--<TR>
        <td align="right"></td>
        <TD align=left height=35>确认提示信息：</TD>
        <TD height=25><INPUT class=editline size=30 value="" name="confirmTip"> </TD></TR>
	  <TR>
        <td align="right"></td>
        <TD align=left height=35>路由扩展程序：</TD>
        <TD height=25><INPUT class=editline size=30 value="默认上一环节分;挂靠部门得分;" name=flowName>
		<input type='button' name='add_attach_button' onclick='javascript:routeExt();' value='选择' class="button" ></TD></TR>
	  <TR>
	    <td align="right"></td>
        <td colspan="2"><font color="red">扩展程序显示的是扩展程序名，可以多个，中间用分号分隔。</font></td></tr>
	  <TR>
        <td align="right"></td>
        <TD align=left height=35>是否需要批量提交：</TD>
        <TD height=25><input type="radio" name="flgBatchSubmit" checked value="y">是&nbsp;<input type="radio" name="flgBatchSubmit" value="n">否</TD></TR>
	--></table>
	
	</DIV><!-- 	整个TAB结束 -->
	</td>
</tr>
</table>
	</form>
</div></td></tr></table>
</body>
</html>