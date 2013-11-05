<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <%@ include file="/web/pub/flow.inc" %>
    <title>流程定义</title>
    <SCRIPT type=text/javascript>
    	/**
    	  * 保存定义
    	  **/
    	function FF_Save(){
    		var fm = $_E("form1");
    		if(CheckForm(fm)){
    			fm.action = "${ROOT}/editFlow.do";
    			fm.sumit();
    		}
    	}
    	/**
    	  * 新增环节
    	  **/
    	function FF_NewNode(){
    		
    	}
    	/**
    	  * 环节排序
    	  **/
    	function FF_NodeSort(){
    		
    	}
    	/**
    	  * 模板设置
    	  **/
    	function FF_TempSet(){
    		
    	}
    </SCRIPT>
 </head>
<body>
	<form name="form1" id="form1">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="define-box">
          <tr>
          	<td class="define-titlebg"><div class="dialog-title">
          		<input type="button" class="button2" value="保存" onclick="FF_Save();" />
	          	<c:if test="${isHandler}">
		          	<!--<input type="button" class="button4" value="模板设置" onclick="FF_TempSet();" /> -->
		          	<input type="button" class="button4" value="新增环节" onclick="FF_NewNode();" /> 
		          	<input type="button" class="button4" value="环节排序" onclick="FF_NodeSort();" />
	          	</c:if>
	        </td>
          </tr>
    </table>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg">
    <div style="overflow-y:auto;height:100%" class="scroll-net">
	  <br>  
	  <input type="hidden" name="flgFree" value="${flwFlow.flgFree }"/>
	  <table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
	    <tr>
    	  <td>
    	    <br/>
	        <DIV class=tab-pane id=tabPane1>
              <SCRIPT type=text/javascript>
		        var tp1 = new WebFXTabPane( document.getElementById( "tabPane1" ) );
		        tp1.selectedIndex =0;
			  </SCRIPT>
		      <DIV class=tab-page id=tabPage1>
    			<H2 class=tab>基本配置</H2>
			    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
				<!-- 这里嵌套流程基本配置 -->
				<input name="flowCode" type="hidden" value="${flow.flowCode}"/>
		    	<table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
			  	  <TBODY>
			        <TR>
			          <TD align=right width="28%" height=35><font color="red">*</font>流程名称：</TD>
			          <TD width="72%" height=25>
			          <INPUT class=editline size=60 value="${flwFlow.flowName}" name="flowName"  check="notBlank" showName="流程名称" required="true" maxlength="50" > </TD>
			        </TR>
			  	    <TR>
			          <TD align=right width="28%" height=35>流程说明：</TD>
        			  <TD width="72%" height=25>
        			  <INPUT class=editline size=60 value="${flwFlow.memo}" name="memo" maxlength="500"> </TD>
        			</TR>
	  				<TR>
        			  <TD align=right width="28%" height=35>流程类别：</TD>
        			  <TD width="72%" height=25>
        				<INPUT type="hidden" name="busiType" value="${busi.id}">${busi.busiName}
        			  </TD>
        			</TR>
	  				<TR>
        			  <TD align=right width="28%" height=35>所属组织：</TD>
        			  <TD width="72%" height=25>
        				<INPUT type="hidden" name="orgId" value="${org.id}">${org.name}
        			  </TD>
        			</TR>
 					<!--<TR>
        			  <TD align=right width="28%" height=35><font color="red">*</font>流程绑定发起周期：</TD>
        			  <TD width="72%" height=25>
        				<kpi:dictionary-select  name='assessmentType' type='ASS_CYCLE_TYPE' style="width:30px;" selected="${flwFlow.cycleType}" htmlType="radio"/>
        			  </TD>
        			</TR> -->
        			<c:if test="${fn:length(parentFlows)>0}">
        			 <TR>
        			  <TD align=right width="28%" height=35>所属父流程：</TD>
        			  <TD width="72%" height=25>
        			    	<select name="parentFlowId" id="parentFlowId">
        			    		<option value="">--请选择--</option>
        			    		<c:forEach var="o" items="${parentFlows}">
        			    			<option value="${o.flowCode}" ${o.flowCode==flwFlow.parentFlow.flowCode?'selected':''}>${o.flowName}</option>
        			    		</c:forEach>
        			    	</select>
					  </TD>
					</TR>      
					</c:if>			
	  				<tr>
	  				  <td colspan="2" align="left">
	  				    <font color="#0099FF">说明：红星（</font><font color="red">*</font><font color="#0099FF">）不能为空</font>
	  				  	<br/><font color="#0099FF">流程名称样例:XX市XX部员工[组织]月度[季度/年度]绩效考核流程</font>
	  				  </td>
	  				</tr>
				  </table>
				</DIV>	
				<c:if test="${flwFlow!=null}">
				  <DIV class=tab-page id=tabPage5>
				    <H2 class=tab>业务参数管理</H2>
				    <SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage5" ) );</SCRIPT>
				    <!-- 这里嵌套业务参数配置 -->
				    <table class=box border=0 style="FONT-SIZE: 9pt" cellSpacing=1 cellPadding=5 width="100%" border=0>
				      <tr><td width="100%">
				  		<jsp:include flush="true" page="flow_ext_config.jsp" >
				  			<jsp:param name="mainId" value="${flwFlow.flowCode}" />	  	
				  		</jsp:include>
				  	  </td></tr>
				    </table>
				  </DIV>
				  </c:if>
				</td>
				    	
				</tr>
			</DIV>
		</table>
	</DIV><!-- 	整个TAB结束 -->
	</td>
</tr>
</table>
    </form>
</body>
</noframes>