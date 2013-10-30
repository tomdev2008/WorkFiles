<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机构表</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <script type="text/javascript">
 	//初始化时勾选上用户选择的部门
 	function initCheckdept() {
 		var endid = '${tbOrgenPage.id}';
 		if(null != endid && "" != endid) {
 			var deptIds = '${deptIds}'+"";
 			if(null != deptIds && "" != deptIds) {
 				var deids = [];
 				deids = deptIds.split(",");
 				var rows = $("#departList").datagrid("getRows");
 				for(var j = 0; j < deids.length; j++) {
 					for(var i = 0; i < rows.length; i++) {
 						if(rows[i].id == deids[j]) {
 							$("#departList").datagrid("selectRow",i);
 						}
 					}
 				}
 			}
 		}
 	}
	//获得点击的行的数据
	function wantSelectRowData() {
		var ids = "";
		var rows = $("#departList").datagrid("getSelections");
		for(var i=0;i<rows.length;i++){
			ids += rows[i].id+",";
		}
		ids = ids.substring(0,ids.length-1);
		$("#ids").val(ids);
	}	
 //判断是新增还是修改
 	function checkAddOrUpdate() {
 		var endid = '${tbOrgenPage.id}';
 		if(null != endid && "" != endid) {
 			var rogenstype = '${tbOrgenPage.type}';
 			var rogensParentOrgen = '${tbOrgenPage.parentOrgen}';
 			$("#rogenTypes").val(rogenstype);
 			$("#parentOrgen").val(rogensParentOrgen);
 		}
 	}
 //根据选择的机构类型，显示不同的内容
 	function changeInfoByType() {
		 var chooesOne = $("#rogenTypes").val();
		 if("1" == chooesOne) {		//如果选择的是总公司
			 $("#shangjijigou").hide();
			 $("#zzjgdm").show();
			 $("#shoujihaoma").show();
			 $("#shuiwudengji").show();
			 $("#kaihuhang").show();
			 $("#yingyezhizhao").show();
		 } else if("2" == chooesOne ||　"3" == chooesOne) {		//如果选择的是分公司或办事处
			 $("#shangjijigou").show();	
			 $("#zzjgdm").hide();
			 $("#shoujihaoma").hide();
			 $("#shuiwudengji").hide();
			 $("#kaihuhang").hide();
			 $("#yingyezhizhao").hide();
		 }
 	}
 </script>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbOrgenController.do?save" beforeSubmit="wantSelectRowData();">
			<input id="id" name="id" type="hidden" value="${tbOrgenPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							机构名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="permName" name="permName" 
							   value="${tbOrgenPage.permName}" datatype="*">
						<input style="display: none;" id="ids" name="ids">
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
							   value="${tbOrgenPage.orgenPhone}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="place" name="place" ignore="ignore"
							   value="${tbOrgenPage.place}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							类型:
						</label>
					</td>
					<td class="value">
						<select id="rogenTypes"  name="type"  datatype="*" onchange="changeInfoByType();">
					        <option value="1">总公司</option>
					        <option value="2">分公司</option>
					        <option value="3">办事处</option>
				      	</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							成立时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker()"  style="width: 150px" id="createTime" name="createTime" ignore="ignore"
							   value="<fmt:formatDate value='${tbOrgenPage.createTime}' type="date" pattern="yyyy-MM-dd"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr id="shangjijigou">
					<td align="right">
						<label class="Validform_label">
							上级机构:
						</label>
					</td>
					<td class="value">
						<select id="parentOrgen"  name="parentOrgen" >
					       <c:forEach items="${orgenList}" var="orgen">
					        <option value="${orgen.id }" >
					         ${orgen.permName}
					        </option>
					       </c:forEach>
				      	</select>
					</td>
				</tr>
				<tr id="zzjgdm">
					<td align="right">
						<label class="Validform_label">
							组织机构代码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="number" name="number" ignore="ignore"
							   value="${tbOrgenPage.number}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr id="shoujihaoma">
					<td align="right">
						<label class="Validform_label">
							手机号码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="tellPhone" name="tellPhone" ignore="ignore"
							   value="${tbOrgenPage.tellPhone}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr id="shuiwudengji">
					<td align="right">
						<label class="Validform_label">
							税务登记证:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="businessLicenseNo" name="businessLicenseNo" ignore="ignore"
							   value="${tbOrgenPage.businessLicenseNo}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr id="kaihuhang">
					<td align="right">
						<label class="Validform_label">
							开户行名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="bankName" name="bankName" ignore="ignore"
							   value="${tbOrgenPage.bankName}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr id="yingyezhizhao">
					<td align="right">
						<label class="Validform_label">
							营业执照:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="taxRegistrationCertificate" name="taxRegistrationCertificate" ignore="ignore"
							   value="${tbOrgenPage.taxRegistrationCertificate}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
	<div id="theemploeTabel" style="width: 600px;height: 200px;">
		<t:datagrid name="departList" title="选择部门列表" checkbox="true" actionUrl="tbOrgenController.do?departgrid" idField="id" pagination="false" onLoadSuccess="initCheckdept();">
		 <t:dgCol title="编号" field="id" treefield="id" hidden="false"></t:dgCol>
		 <t:dgCol title="部门名称" field="departname"></t:dgCol>
		 <t:dgCol title="职能描述" field="description"></t:dgCol>
		</t:datagrid>
	</div>
 </body>
 <script type="text/javascript">
 checkAddOrUpdate();
 changeInfoByType();
 </script>