<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>考勤统计表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbCheckingInstanceController.do?save">
			<input id="id" name="id" type="hidden" value="${tbCheckingInstancePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							主键id:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empId" name="empId" ignore="ignore"
							   value="${tbCheckingInstancePage.empId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							员工姓名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empName" name="empName" ignore="ignore"
							   value="${tbCheckingInstancePage.empName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							orgenName:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orgenName" name="orgenName" ignore="ignore"
							   value="${tbCheckingInstancePage.orgenName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							empDue:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empDue" name="empDue" ignore="ignore"
							   value="${tbCheckingInstancePage.empDue}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							empActual:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empActual" name="empActual" ignore="ignore"
							   value="${tbCheckingInstancePage.empActual}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							neglectWork:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="neglectWork" name="neglectWork" ignore="ignore"
							   value="${tbCheckingInstancePage.neglectWork}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							empLate:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empLate" name="empLate" ignore="ignore"
							   value="${tbCheckingInstancePage.empLate}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							leaveEarly:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="leaveEarly" name="leaveEarly" ignore="ignore"
							   value="${tbCheckingInstancePage.leaveEarly}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							overtime:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="overtime" name="overtime" ignore="ignore"
							   value="${tbCheckingInstancePage.overtime}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							empLeave:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empLeave" name="empLeave" ignore="ignore"
							   value="${tbCheckingInstancePage.empLeave}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							empAway:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empAway" name="empAway" ignore="ignore"
							   value="${tbCheckingInstancePage.empAway}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							weekendOvertime:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="weekendOvertime" name="weekendOvertime" ignore="ignore"
							   value="${tbCheckingInstancePage.weekendOvertime}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							happenday:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="happenday" name="happenday" ignore="ignore"
							   value="<fmt:formatDate value='${tbCheckingInstancePage.happenday}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>