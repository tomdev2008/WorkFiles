<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<html>
  <head>
  	<title>同步操作说明(${title })</title>
  	<script src="${ROOT}/web/system/dlg/dateselector.js"></script>
  	<script>
	<!--
		function ev_returnValue(){
			window.returnValue = document.getElementById("selYear").value+document.getElementById("selMonth").value;
			window.close();
		}
	//-->
  	</script>
  </head>
  
<body>
<table border="0" cellspacing="0" cellpadding="0" class="list-top">
  <tr><td><h5></h5></td></tr>
</table>

<table class="listquery list-top" cellpadding="0" cellspacing="1">
<tr><td width="" class="t">同步操作说明(${title })</td></tr>
<tr>
	<td>
		<c:if test="${operateCode=='5' }">
			&nbsp;&nbsp;[<font color="red">${name }</font>]员工已于${date }调入[<font color="red">${orgName }</font>]部门，请选择同步生效时间:<select id="selYear"></select>年<select id="selMonth"></select>月。
			<br/>&nbsp;&nbsp;<br/><strong>为了确保考核正常进行，请做好以下方面的确认调整工作:</strong><br/>
			&nbsp;&nbsp;1. 如果[<font color="red">${name }</font>]在[<font color="red">${orgName }</font>]部门担任部门经理，部门绩效管理员，部门第一处理人，第二处理人，请调整。 <br/>
			&nbsp;&nbsp;2. 增加[<font color="red">${name }</font>]的绩效考核表并设置好考核关系。 <br/>
			&nbsp;&nbsp;3. 确认[<font color="red">${name }</font>] 的绩效考核表是否需要加入的已发起但尚未归档的考核批次中<br/>
		</c:if>
		<c:if test="${operateCode=='6' }">
			&nbsp;&nbsp;[<font color="red">${name }</font>]员工已于${date }调出[<font color="red">${beforeOrgName }</font>]部门调入[<font color="red">${orgName }</font>]部门，请选择同步生效时间:<select id="selYear"></select>年<select id="selMonth"></select>月。
			<br/>&nbsp;&nbsp;<br/><strong>为了确保考核正常进行，请做好以下方面的确认调整工作：</strong><br/> 
			&nbsp;&nbsp;1. 如果[<font color="red">${name }</font>]在[<font color="red">${orgName }</font>]部门担任部门经理，部门绩效管理员，部门第一处理人，第二处理人，请调整。 <br/>
			&nbsp;&nbsp;2. 请联系[${beforeOrgName }]部门管理员，调整[${name }]之前的考核关系，[${name }]在[${beforeOrgName }]部门中作为评分人的考核关系。 <br/>
			&nbsp;&nbsp;3. 现有流程中[<font color="red">${name }</font>]的待办不做转移，[<font color="red">${name }</font>]登录后仍继续处理，如不需处理原有的待办，请通知[<font color="red">${beforeOrgName }</font>]部门管理员做待办的转办处理。 <br/>
			&nbsp;&nbsp;4. 确认[<font color="red">${name }</font>]部门的部门经理，部门绩效管理员，部门第一处理人，第二处理人。 <br/>
			&nbsp;&nbsp;5. 增加[<font color="red">${name }</font>]的绩效考核表并设置好考核关系。 <br/>
			&nbsp;&nbsp;6. 确认[<font color="red">${name }</font>] 的绩效考核表是否需要加入的已发起但尚未归档的考核批次中。 <br/>
		</c:if>
		<c:if test="${operateCode=='8' }">
			&nbsp;&nbsp;[<font color="red">${name }</font>]员工已于${date }调出[<font color="red">${orgName }</font>]部门，请选择同步生效时间:<select id="selYear"></select>年<select id="selMonth"></select>月。
			<br/>&nbsp;&nbsp;<br/><strong>为了确保考核正常进行，请做好以下方面的确认调整工作：</strong><br/> 
			&nbsp;&nbsp;1. 如果[<font color="red">${name }</font>]在[<font color="red">${orgName }</font>]部门担任部门经理，部门绩效管理员，部门第一处理人，第二处理人，请调整。 <br/>
			&nbsp;&nbsp;2. 调整[<font color="red">${name }</font>]之前的考核关系，[<font color="red">${name }</font>]在[<font color="red">${orgName }</font>]部门中作为评分人的考核关系。 <br/>
			&nbsp;&nbsp;3. 现有流程中[<font color="red">${name }</font>]的待办请绩效管理员在流程监控中调整转移，也可在此将待办全部转办给处理人________(选择)。<br/>
		</c:if>
		<c:if test="${operateCode=='0' }">
			<table width="100%">
			<tr>
				<th></th>
				<th>用户名</th>
				<th>登陆帐号</th>
				<th>MSS</th>
				<th>email</th>
			</tr>
			<tr>
				<th>当前信息</th>
				<th>${before.name }</th>
				<th>${before.logonId }</th>
				<th>${before.mss }</th>
				<th>${before.email }</th>
			</tr>
			<tr>
				<th>更新后信息</th>
				<th>${after.name }</th>
				<th>${after.logonId }</th>
				<th>${after.mss }</th>
				<th>${after.email }</th>
			</tr>
			<tr align="center">
				<td  align="center" class="t">
					同步生效时间
				</td>
				<td  align="center">
					<select id="selYear"></select>&nbsp;&nbsp;
					<select id="selMonth"></select>
				</td>
			</tr>
			</table>
		</c:if>
		
		<c:if test="${operateCode=='7' }">
			当前排序码:${beforePriority }<br/>
			更新后排序码：${afterPriority }<br/>
			<strong>请选择同步生效时间:</strong><select id="selYear"></select>&nbsp;&nbsp;<select id="selMonth"></select>
		</c:if>
		
		<c:if test="${operateCode=='1' }">
			&nbsp;&nbsp;[<font color="red">${name }</font>]员工已于${date }在系统中冻结。<br/>
			<strong>请选择同步生效时间:</strong><select id="selYear"></select>年<select id="selMonth"></select>月
		</c:if>
		
		<c:if test="${empty operateCode }">
			同步生效时间:<select id="selYear"></select>&nbsp;&nbsp;<select id="selMonth"></select>
		</c:if>
	</td>
</tr>
<tr align="center"><td colspan="2" align="center"><div align="center"><input type="button" onclick="ev_returnValue()" class="button2" value="确定" /></div> </td></tr>
</table>

<script type="text/javascript">
var selYear = window.document.getElementById("selYear");
var selMonth = window.document.getElementById("selMonth");
new DateSelector(selYear, selMonth );
</script>

</body>
</html>