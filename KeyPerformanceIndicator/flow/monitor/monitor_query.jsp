<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
	<head>
		<title>流程文档监控表--${WEB_TITLE}</title>
	</head>
	<style type="text/css">
</style>
<script language="javascript">
	/**
	  *  查询按钮
	  **/	
	function ev_query(){
		form1.action = "${ROOT}/queryFlowInstance.do";
		form1.submit();
	}
	/**
	  *  查看监控按钮
	  **/
	function FF_View(id){
		openWin("${ROOT}/loadFlowInstanceHandlerDetail.do?monitorId=${monitor.id}&id="+id,{showCenter:true,width:800,height:500})
	}
	/**
	  *  删除按钮
	  **/
	function FF_Delete(){
		if(SelectUtil.checkedCount('selectrow')>0){
			form1.action ="${ROOT}/deleteRecFlow.do";
			form1.submit();
		}else{
			alert("请先选择要删除的业务实例！");
		}
	}
</script>
<body>
	  <table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">&nbsp;
             <c:if test="${status==1}">
             	<input id='recflowDelete' type="button" class="button4" value="删除" onclick="FF_Delete();"/>
             </c:if>
            </div></td>
        </tr>
        <tr>
          <td>
<form id="form1" name="form1" method="post" action="">
<input type="hidden" name="batchType" value="${batchType }"/>
<input type="hidden" id="orgValues" name="orgValues" value="${orgValues}"/>
<input type="hidden" id="monitorId" name="monitorId" value="${monitor.id}"/>

			<table border="0" align="center" valign="top" width="90%">
				<tr>
					<td nowrap="nowrap" colspan="5">
						<center>
							<br/><font size="3pt" color="#666666"><b><u>流程监控</u></b></font>
						</center>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
							<tr>
								<td nowrap="nowrap" width="20%">
									<b>流程名称:</b>
								</td>
								<td nowrap="nowrap" width="80%" colspan="3">${monitor.flow.flowName}(${monitor.flow.org.fullName})</td>
							</tr>
							<tr>
								<td nowrap="nowrap" width="20%">
									<b>查询周期:</b>
								</td>
								<td nowrap="nowrap" width="30%">
									<page:singleBatchLN batch1="${batchDate}" batchType="${batchType }"/>
								</td>
								<td nowrap="nowrap" width="20%">
									<b>状态:</b>
								</td>
								<td nowrap="nowrap" width="30%">
									<select id="status" name="status">
										<option value="1" ${status==1?'selected':''}>已发起</option>
										<option value="2" ${status==2?'selected':''}>已归档</option>
									</select>
								</td>
							</tr>
							<tr>
								<td nowrap="nowrap">
									<b>考核对象:</b>
								</td>
								<td nowrap="nowrap" colspan="3" align="left">
									<textarea rows="3" cols="50" id="orgNames" name="orgNames">${orgNames}</textarea>
									<a href="#" onclick="getAddressList('0;20','n','0','orgNames','orgValues');" class="choose">选择</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" class="button4" name="btnQuery" value="查询" onclick="ev_query();"/>		
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr id="detail">
					<td colspan="5" width="100%">
						<table id="tb1" width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF">
							<tr>
								<td class="title-header" align="center" width="10%" height="20">
									序号
									<c:if test="${stauts==1}">
										<input type='checkbox' id="selectAllHandler" onclick="SelectUtil.checkAll(this,'selectrow');"/>
									</c:if>
								</td>
								<td class="title-header" align="center" width="40%">
									名称
								</td>
								<td class="title-header" align="center" width="20%">
									创建时间
								</td>
								<td class="title-header" align="center" width="20%">
									归档时间
								</td>
								<td class="title-header" align="center" width="10%">
									监控
								</td>
							</tr>
							<c:forEach var="o" items="${monitorList}" varStatus="idx">
							<tr>
							<td>${idx.count}
								<c:if test="${status==1}">
									<input type='checkbox' id="selectrow${o.id}" name="selectrow" value="${o.id}"/>&nbsp;</td>	
								</c:if>
							<td>${o.boName}&nbsp;</td>	
							<td>&nbsp;
							<fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>	
							<td>
							<c:if test="${o.status==2}">
								<fmt:formatDate value="${o.archiveDate}" pattern="yyyy-MM-dd HH:mm"/>
							</c:if>
							<c:if test="${o.status!=2}">未归档</c:if>
							&nbsp;</td>	
							<td>&nbsp;<input type="button" class="button4" name="btnView" id="btnView${o.id}" value="查看" onclick="FF_View('${o.id}');"/></td>	
							</tr>
							</c:forEach>
						</table>
						<kpi:page-bar formId="form1" />
					</td>
				</tr>
				</table>
			<hr width="89%" align="center"/>
		</form>
         </td>
        </tr>
      </table>
</body>
</html>
