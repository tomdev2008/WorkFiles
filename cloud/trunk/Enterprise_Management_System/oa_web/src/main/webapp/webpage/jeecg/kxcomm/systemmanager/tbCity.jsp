<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>区域\地市管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
//   	function changeCitys() {
//   		var checkwhich = $("#cityType").val()+"";
//   		if("1" == checkwhich) {
//   			$("#thecityrows").attr("disabled",true);
//   			$("#parentId").attr("disabled",true);
//   			$("#thecityspen").attr("disabled",true);
//   			$("#parentId").val("0");
//   		} else {
//   			$("#parentId").attr("disabled",false);
//   			$("#thecityspen").attr("disabled",false);
//   			$("#thecityrows").attr("disabled",false);
//   		}
//   	}
  </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbCityController.do?save">
			<input id="id" name="id" type="hidden" value="${tbCityPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" ignore="ignore"
							   value="${tbCityPage.name}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							地市类型：
						</label>
					</td>
					<td class="value">
						<select id="cityType"  name="cityType"  datatype="*" onchange="changeCitys();">
					        <option value="1" >区域</option>
					        <option value="2" >省份</option>
				      	</select>
						<span class="Validform_checktip">请选择上级</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label" id="thecityrows" >
							所属区域:
						</label>
					</td>
					<td class="value">
<!-- 					datatype="*" -->
						<select id="parentId.id" name="parentId.id" >
					       <c:forEach items="${cityList}" var="cityrt">
					        <option value="${cityrt.id}" >
					         	${cityrt.name}
					        </option>
					       </c:forEach>
				      	</select>
						<span class="Validform_checktip" id="thecityspen">请选择所属区域</span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>