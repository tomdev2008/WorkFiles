<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>员工表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbEmployeeController.do?save">
			<input id="id" name="id" type="hidden" value="${tbEmployeePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							机构主键id:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orgenId" name="orgenId" ignore="ignore"
							   value="${tbEmployeePage.orgenId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							岗位主键id:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="postId" name="postId" ignore="ignore"
							   value="${tbEmployeePage.postId}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							身份证:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="identityCard" name="identityCard" ignore="ignore"
							   value="${tbEmployeePage.identityCard}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							出生年月:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="birthday" name="birthday" ignore="ignore"
							   value="<fmt:formatDate value='${tbEmployeePage.birthday}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							家庭地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="address" name="address" ignore="ignore"
							   value="${tbEmployeePage.address}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							联系电话:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orgenPhone" name="orgenPhone" ignore="ignore"
							   value="${tbEmployeePage.orgenPhone}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							籍贯:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="nativePlace" name="nativePlace" ignore="ignore"
							   value="${tbEmployeePage.nativePlace}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							户口所在地:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="domicilePlace" name="domicilePlace" ignore="ignore"
							   value="${tbEmployeePage.domicilePlace}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							毕业时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="graduationDate" name="graduationDate" ignore="ignore"
							   value="<fmt:formatDate value='${tbEmployeePage.graduationDate}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							毕业学校:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="graduateSchool" name="graduateSchool" ignore="ignore"
							   value="${tbEmployeePage.graduateSchool}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							专业:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="major" name="major" ignore="ignore"
							   value="${tbEmployeePage.major}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							学历:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="educationBackground" name="educationBackground" ignore="ignore"
							   value="${tbEmployeePage.educationBackground}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							婚否:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="marry" name="marry" ignore="ignore"
							   value="${tbEmployeePage.marry}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							名族:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="nation" name="nation" ignore="ignore"
							   value="${tbEmployeePage.nation}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							性别:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="sex" name="sex" ignore="ignore"
							   value="${tbEmployeePage.sex}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							政治面貌:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="politicsStatus" name="politicsStatus" ignore="ignore"
							   value="${tbEmployeePage.politicsStatus}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							入职时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="datesEmployed" name="datesEmployed" ignore="ignore"
							   value="<fmt:formatDate value='${tbEmployeePage.datesEmployed}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							司龄:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="workingTime" name="workingTime" ignore="ignore"
							   value="<fmt:formatDate value='${tbEmployeePage.workingTime}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							邮箱:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="eMail" name="eMail" ignore="ignore"
							   value="${tbEmployeePage.eMail}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							直系亲属:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="immediateFamily" name="immediateFamily" ignore="ignore"
							   value="${tbEmployeePage.immediateFamily}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="status" name="status" ignore="ignore"
							   value="${tbEmployeePage.status}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							银行卡开户行:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="openingBank" name="openingBank" ignore="ignore"
							   value="${tbEmployeePage.openingBank}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							银行卡号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="cardNo" name="cardNo" ignore="ignore"
							   value="${tbEmployeePage.cardNo}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							户口性质:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="householdProperties" name="householdProperties" ignore="ignore"
							   value="${tbEmployeePage.householdProperties}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							职称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="jobTitle" name="jobTitle" ignore="ignore"
							   value="${tbEmployeePage.jobTitle}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							职称级别:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="titleLevel" name="titleLevel" ignore="ignore"
							   value="${tbEmployeePage.titleLevel}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							岗位变动:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="changeJobs" name="changeJobs" ignore="ignore"
							   value="${tbEmployeePage.changeJobs}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							社保保险缴费起始月:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="socialSecurityTime" name="socialSecurityTime" ignore="ignore"
							   value="<fmt:formatDate value='${tbEmployeePage.socialSecurityTime}' type="date" pattern="yyyy-MM-dd"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							工号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="jobNo" name="jobNo" ignore="ignore"
							   value="${tbEmployeePage.jobNo}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							empName:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="empName" name="empName" ignore="ignore"
							   value="${tbEmployeePage.empName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>