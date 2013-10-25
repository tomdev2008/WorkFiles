<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>订单</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="tbOrdersController.do?save">
			<input id="id" name="id" type="hidden" value="${tbOrdersPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							订单号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="orderNumber" name="orderNumber" 
							   value="${tbOrdersPage.orderNumber}" datatype="*">
						<span class="Validform_checktip">请输入订单号</span>
					</td>
				</tr>
				<tr >
					<td align="right" >
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="remark" name="remark" ignore="ignore"
							   value="${remark.remark}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							代理商:
						</label>
					</td>
					<td class="value">
						<c:if test="${agents!=null }">
							<c:if test="${tbOrdersPage.id==null}">
								<input class="inputxt" id="agentsId.name" readonly="readonly" name="agentsId.name" ignore="ignore"
								   value="${agents.name}">			
							</c:if>
							<c:if test="${tbOrdersPage.id!=null }">
								<input class="inputxt" id="agentsId.name" readonly="readonly" name="agentsId.name" ignore="ignore"
								   value="${tbOrdersPage.agentsId.name}">
							</c:if>
						</c:if>
						<c:if test="${agents==null}">
							<input class="inputxt" id="agentsId.name" name="agentsId.name" ignore="ignore"
								   value="${tbOrdersPage.agentsId.name}">
						</c:if>
						<span class="Validform_checktip">请输入代理商</span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							渠道:
						</label>
					</td>
					<td class="value">
						<select id="channelId.id"  name="channelId.id"  datatype="*">
					       <c:forEach items="${channelList}" var="channel">
					        <option value="${channel.id }" <c:if test="${channel.id==tbOrdersPage.channelId.id}">selected="selected"</c:if>>
					         ${channel.name}
					        </option>
					       </c:forEach>
				      	</select>
						<%-- <input class="inputxt" id="channel" name="channel" 
							   value="${tbOrdersPage.channel}" datatype="*"> --%>
						<span class="Validform_checktip">请选择渠道</span>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							目的国:
						</label>
					</td>
					<td class="value">
						<%-- <select id="destinationCountry"  name="destinationCountry"  datatype="*" class="easyui-combobox" style="width:155px">
					       <c:forEach items="${countryList}" var="country">
					        <option value="${country.id }" <c:if test="${country.id==tbOrdersPage.countryId.id}">selected="selected"</c:if>>${country.destinationCountry}</option>
					       </c:forEach>
				      	</select> --%>
				      	<input class="inputxt" id="countryId.destinationCountry" name="countryId.destinationCountry" ignore="ignore"
								   value="${tbOrdersPage.countryId.destinationCountry}">
						<span class="Validform_checktip">请选择目的国</span>
					</td>
				</tr>
				<!-- 
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
						<select id="status"  name="status"  datatype="n">
					       <c:forEach items="${statusList}" var="status">
					        <option value="${status.id }" <c:if test="${status.id==tbOrdersPage.status}">selected="selected"</c:if>>
					         ${status.name}
					        </option>
					       </c:forEach>
				      	</select>
						<%-- <input class="inputxt" id="status" name="status" ignore="ignore"
							   value="${tbOrdersPage.status}" datatype="n"> --%>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				 -->
				<tr>
					<td align="right">
						<label class="Validform_label">
							重要:
						</label>
					</td>
					<td class="value">
						<select id="important"  name="important"  datatype="n" readonly="readonly">
					       <c:forEach items="${importantList}" var="important">
					        <option value="${important.id }" <c:if test="${important.id==tbOrdersPage.important}">selected="selected"</c:if>>
					         ${important.name}
					        </option>
					       </c:forEach>
				      	</select>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<!-- 
				<tr>
					<td align="right">
						<label class="Validform_label">
							创单时间:
						</label>
					</td>
					<td class="value">
					    <c:if test="${tbOrdersPage.id!=null }">
					    	<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="createTime" name="createTime" ignore="ignore"
							   value="<fmt:formatDate value='${tbOrdersPage.createTime}' type="date" pattern="yyyy-MM-dd HH:mm:ss"/>" />
					    </c:if>
					    <c:if test="${tbOrdersPage.id==null }">
					    	<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="createTime" name="createTime" ignore="ignore"
							   value="${nowDate }" />
					    </c:if>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				-->
			</table>
		</t:formvalid>
 </body>