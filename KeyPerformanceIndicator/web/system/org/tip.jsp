<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  	<title>信息提示</title>
  	<script src="${ROOT}/web/system/dlg/dateselector.js"></script>
  	<script  type="text/javascript">
	<!--
		function ev_returnValue(){
			window.returnValue = document.getElementById("selYear").value+document.getElementById("selMonth").value+document.getElementById("selQuarter").value;
			window.close();
		}
		
		/**
		*打印预览
		**/
		function printpreview(){
			wb.execwb(7,1);
		}
		
		/**
		*打印
		**/
		function printit(){
			wb.execwb(6,6);
		}
	//-->
  	</script>
  </head>
  
<body>
<OBJECT id=wb height=0 width=0 classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 name=wb></OBJECT>
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h2>系统提示</h2></td></tr>
   <tr>
      <td class="list-caozuo">
	<a id="hlinkDelete" href="#" onclick="window.print()">打印</a>
  	</td>
	</tr>
</table>
<div>
<table class="listquery list-top" cellpadding="0" cellspacing="1">

<tr>
	<td>

		<c:if test="${type=='0' }">
			&nbsp;&nbsp;[<font color="red">${names }</font>]员工已于${date }调出[<font color="red">${beforeOrg }</font>]部门,调入[<font color="red">${afterOrg }</font>]部门，请选择调动时间:<select id="selYear"></select>年&nbsp;&nbsp;<select id="selMonth"></select>月
			<select id="selQuarter">
				<option value="21">1</option>
				<option value="22">2</option>
				<option value="23">3</option>
				<option value="24">4</option>
			</select>季度。
			<br/>&nbsp;&nbsp;<br/><strong>为了确保考核正常进行，请做好以下方面的确认调整工作：</strong><br/> 
			&nbsp;&nbsp;1. 如果[<font color="red">${names }</font>]在[<font color="red">${beforeOrg }</font>]部门担任部门经理，部门绩效管理员，部门第一处理人，第二处理人，请重新调整这些信息。 <br/>
			&nbsp;&nbsp;2. 请联系[<font color="red">${beforeOrg }</font>]部门管理员，调整[<font color="red">${names }</font>]之前的考核关系，[<font color="red">${names }</font>]在[<font color="red">${beforeOrg }</font>]部门中作为评分人的考核关系。 <br/>
			&nbsp;&nbsp;3. 现有流程中[<font color="red">${names }</font>]的待办不做转移，[<font color="red">${names }</font>]登录后仍继续处理，如不需处理原有的待办，请通知[<font color="red">${beforeOrg }</font>]部门管理员做待办的转办处理。 <br/>
			&nbsp;&nbsp;4. 确认[<font color="red">${afterOrg }</font>]部门的部门经理，部门绩效管理员，部门第一处理人，第二处理人。 <br/>
			&nbsp;&nbsp;5. 增加[<font color="red">${names }</font>]的绩效考核表并设置好考核关系。 <br/>
			&nbsp;&nbsp;6. 确认[<font color="red">${names }</font>] 的绩效考核表是否需要加入的已发起但尚未归档的考核批次中。 <br/>
		</c:if>
		
		
		<c:if test="${type=='1' }">
			&nbsp;&nbsp;[<font color="red">${names }</font>]员工已于${date }调入[<font color="red">${afterOrg }</font>]部门，请选择调入生效时间:<select id="selYear"></select>年&nbsp;&nbsp;<select id="selMonth"></select>月
			<select id="selQuarter">
				<option value="21">1</option>
				<option value="22">2</option>
				<option value="23">3</option>
				<option value="24">4</option>
			</select>季度。
			<br/>&nbsp;&nbsp;<br/><strong>为了确保考核正常进行，请做好以下方面的确认调整工作:</strong><br/>
			&nbsp;&nbsp;1. 如果[<font color="red">${names }</font>]在[<font color="red">${afterOrg }</font>]部门担任部门经理，部门绩效管理员，部门第一处理人，第二处理人，请调整。 <br/>
			&nbsp;&nbsp;2. 增加[<font color="red">${names }</font>]的绩效考核表并设置好考核关系。 <br/>
			&nbsp;&nbsp;3. 确认[<font color="red">${names }</font>] 的绩效考核表是否需要加入的已发起但尚未归档的考核批次中<br/>
		</c:if>
		
		<c:if test="${type=='2' }">
			&nbsp;&nbsp;[<font color="red">${names }</font>]员工已于${date }在[<font color="red">${beforeOrg }</font>]部门下冻结，冻结之后用户在该部门下不可见,请选择冻结生效时间:<select id="selYear"></select>年&nbsp;&nbsp;<select id="selMonth"></select>月
			<select id="selQuarter">
				<option value="21">1</option>
				<option value="22">2</option>
				<option value="23">3</option>
				<option value="24">4</option>
			</select>季度
			<br/>&nbsp;&nbsp;<br/><strong>为了确保考核正常进行，请做好以下方面的确认调整工作：</strong><br/> 
			&nbsp;&nbsp;1. 如果[<font color="red">${names }</font>]在[<font color="red">${beforeOrg }</font>]部门担任部门经理，部门绩效管理员，部门第一处理人，第二处理人，请调整。 <br/>
			&nbsp;&nbsp;2. 调整[<font color="red">${names }</font>]之前的考核关系，[<font color="red">${names }</font>]在[<font color="red">${beforeOrg }</font>]部门中作为评分人的考核关系。 <br/>
			&nbsp;&nbsp;3. 现有流程中[<font color="red">${names }</font>]的待办请绩效管理员在流程监控中调整转移。<br/>
		</c:if>
		
		<c:if test="${type=='10' }"><!-- 组织操作的提示  -->
			请选择冻结生效时间:
			<select id="selYear"></select>年&nbsp;&nbsp;<select id="selMonth"></select>月
			<select id="selQuarter">
				<option value="21">1</option>
				<option value="22">2</option>
				<option value="23">3</option>
				<option value="24">4</option>
			</select>季度
		</c:if>
		
		
		<c:if test="${type=='11' }"><!-- 组织操作的提示  -->
			请选择调动生效时间:
			<select id="selYear"></select>年&nbsp;&nbsp;<select id="selMonth"></select>月
			<select id="selQuarter">
				<option value="21">1</option>
				<option value="22">2</option>
				<option value="23">3</option>
				<option value="24">4</option>
			</select>季度
		</c:if>
		
		<c:if test="${empty type }">
			请选择调入生效时间:
			<select id="selYear"></select>年&nbsp;&nbsp;<select id="selMonth"></select>月
			<select id="selQuarter">
				<option value="21">1</option>
				<option value="22">2</option>
				<option value="23">3</option>
				<option value="24">4</option>
			</select>季度
			
		</c:if>
		
	</td>
</tr>
<tr align="center"><td colspan="2" align="center"><div align="center"><input type="button" onclick="ev_returnValue()" class="button2" value="确定" /></div> </td></tr>
</table>
</div>
<script type="text/javascript">
	var selYear = window.document.getElementById("selYear");
	var selMonth = window.document.getElementById("selMonth");
	new DateSelector(selYear, selMonth );
</script>
</body>
</html>