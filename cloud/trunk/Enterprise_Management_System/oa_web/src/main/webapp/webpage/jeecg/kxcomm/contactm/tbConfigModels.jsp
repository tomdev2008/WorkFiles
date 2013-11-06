<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>机型配置</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
  <script type="text/javascript">
  	function t(obj){
  		var name = obj.value;
  		$.ajax({
	    	url:'tbDataSourceEntityController.do?getDataSourceByType' , // 可以获取数据的接口
	    	dataType:"json",
	    	data:{'id':name},
	    	success:function(data) {
	    		$("#dataSourceId").empty();  
                $.each(eval(data), function(i, item) {  
                    $("<option value='" + item.id + "'>" + item.sourcename + "</option>").appendTo($("#dataSourceId"));  
                }); 
	    	}
	    });
  	}
  </script>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbConfigModelsController.do?save&quotationId=${qid }">
			<input id="id" name="id" type="hidden" value="${tbConfigModelsPage.id }">
			<input id="quotationId" name="quotationId" type="hidden" value="${qid }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							分类:
						</label>
					</td>
					<td class="value">
					<c:choose>
					 <c:when test="${tbConfigModelsPage.id!=null }">
						<select id="typeId" name="typeId"  disabled = "true" >
							<option value="${tbConfigModelsPage.tbDataSource.tbDataSourceType.id }">${tbConfigModelsPage.tbDataSource.tbDataSourceType.sourcetypename }</option>
				      	</select>
				      </c:when>
				      <c:otherwise>
						<select id="typeId" name="typeId" onchange="t(this)" datatype="*" >
						<option value="${tbConfigModelsPage.tbDataSource.tbDataSourceType.id }">${tbConfigModelsPage.tbDataSource.tbDataSourceType.sourcetypename }</option>
					       <c:forEach items="${typeList}" var="temp">
					        <option value="${temp.id }">
					         ${temp.sourcetypename}
					        </option>
					       </c:forEach>
				      	</select>
					  </c:otherwise>
					 </c:choose>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							单元数据:
						</label>
					</td>
					<td class="value">
					<c:choose>
					 <c:when test="${tbConfigModelsPage.id!=null }">
						<select id="dataSourceId" name="dataSourceId" disabled = "true">
					       <option value="${tbConfigModelsPage.tbDataSource.id }">${tbConfigModelsPage.tbDataSource.sourcename }</option>
				      	</select>
				      </c:when>
				      <c:otherwise>
				      	<select id="dataSourceId" name="dataSourceId" datatype="*">
					       <option value="${tbConfigModelsPage.tbDataSource.id }">${tbConfigModelsPage.tbDataSource.sourcename }</option>
				      	</select>
				      </c:otherwise>
				     </c:choose>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							配置单名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" datatype="*"
							   value="${tbConfigModelsPage.name}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				
			</table>
		</t:formvalid>
 </body>