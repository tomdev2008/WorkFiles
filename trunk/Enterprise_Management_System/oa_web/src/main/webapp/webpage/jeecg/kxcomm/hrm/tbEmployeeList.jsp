<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="tbEmployeeList" title="员工表" actionUrl="tbEmployeeController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="机构主键id" field="orgenId" ></t:dgCol>
   <t:dgCol title="岗位主键id" field="postId" ></t:dgCol>
   <t:dgCol title="身份证" field="identityCard" ></t:dgCol>
   <t:dgCol title="出生年月" field="birthday" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="家庭地址" field="address" ></t:dgCol>
   <t:dgCol title="联系电话" field="orgenPhone" ></t:dgCol>
   <t:dgCol title="籍贯" field="nativePlace" ></t:dgCol>
   <t:dgCol title="户口所在地" field="domicilePlace" ></t:dgCol>
   <t:dgCol title="毕业时间" field="graduationDate" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="毕业学校" field="graduateSchool" ></t:dgCol>
   <t:dgCol title="专业" field="major" ></t:dgCol>
   <t:dgCol title="学历" field="educationBackground" ></t:dgCol>
   <t:dgCol title="婚否" field="marry" ></t:dgCol>
   <t:dgCol title="名族" field="nation" ></t:dgCol>
   <t:dgCol title="性别" field="sex" ></t:dgCol>
   <t:dgCol title="政治面貌" field="politicsStatus" ></t:dgCol>
   <t:dgCol title="入职时间" field="datesEmployed" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="司龄" field="workingTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="邮箱" field="eMail" ></t:dgCol>
   <t:dgCol title="直系亲属" field="immediateFamily" ></t:dgCol>
   <t:dgCol title="状态" field="status" ></t:dgCol>
   <t:dgCol title="银行卡开户行" field="openingBank" ></t:dgCol>
   <t:dgCol title="银行卡号" field="cardNo" ></t:dgCol>
   <t:dgCol title="户口性质" field="householdProperties" ></t:dgCol>
   <t:dgCol title="职称" field="jobTitle" ></t:dgCol>
   <t:dgCol title="职称级别" field="titleLevel" ></t:dgCol>
   <t:dgCol title="岗位变动" field="changeJobs" ></t:dgCol>
   <t:dgCol title="社保保险缴费起始月" field="socialSecurityTime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="工号" field="jobNo" ></t:dgCol>
   <t:dgCol title="empName" field="empName" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="tbEmployeeController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="tbEmployeeController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="tbEmployeeController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="tbEmployeeController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>