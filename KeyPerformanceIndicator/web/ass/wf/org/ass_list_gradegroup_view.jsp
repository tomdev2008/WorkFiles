<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/web/pub/head.inc"%>
<htm>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css"> 
<title>考核表列表</title>
<script type="text/javascript">
<!--
	function ev_grade(groupId, isOpen, orgName , boIds){
		if(isOpen && isOpen=='true'){
			alert("["+orgName+"]下考核对象未全部到达本环节，不可进行评级！请等待!");
			return;
		}
		var batchId = $_EV("batchId");
		var url = "${ROOT}/*.do?batchId=${batchId}&flowCode=${flowCode}&groupId="+groupId
			+"&type=${type}&nodeCode=${nodeCode}"
			+"&viewType=${viewType}&isUndo=${isUndo}";
		openFullScreenWin(url);
	}
	
	function ev_checkAll(handlerDOM, orgId){
		var selectDOMs = $_E(orgId).getElementsByTagName("input");
		if(selectDOMs && selectDOMs.length>0){
			for(var i=0;i<selectDOMs.length;i++){
				if(selectDOMs[i].type!='checkbox') continue;
				if(handlerDOM.checked) selectDOMs[i].checked = true;
				else selectDOMs[i].checked = false;
			}
		}
	}
	
	/*
	 * 环节提交验证
	 */
	function checkView(routeId){
		var selectDOMs = $_EN("groupId");
		if(selectDOMs && selectDOMs.length>0){
			for(var i=0;i<selectDOMs.length;i++){
				if(selectDOMs[i].checked && selectDOMs[i].isAll=='false'){
					alert("["+selectDOMs[i].value+"]尚未全部到达不可提交！");
					return false;
				}
			}
		}else{
			alert("请先选择要进行提交的项！");
			return false;
		}
		return true;
	}
	/**
	  * 全选按钮
	  **/
	function ev_checkGroupAll(selectDOM){
		SelectUtil.checkAll(selectDOM,'groupId');
		SelectUtil.checkAll(selectDOM,'id');
	}
//-->
</script>
</head>

<body class="LN_body">
<form name="form1" id="form1" method="post" action="${ROOT }/*.do">
<input type="hidden" name="batchId" id="batchId" value="${batchId}"/>
<input type="hidden" name="flowCode" value="${flowCode}" />
<input type="hidden" name="nodeCode" value="${nodeCode}" />
<input type="hidden" name="flgFullScreen" value="${param.flgFullScreen }"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="viewType" value="${viewType}"/>
<input type="hidden" name="isUndo" value="${isUndo}"/>
<div class="LN_popupsBox">
<div class="LN_Append">
<c:if test="${isUndo}">
      	<page:route/>
</c:if>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${WORK_LIST_NODE_TITLE}</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">审批列表</td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="7%" class="LN_tableBoxtitle2">序号
              <input type="checkbox" name="checkAll" id="checkAll" onclick="ev_checkGroupAll(this);"/>
              </td>
            <td width="45%" class="LN_tableBoxtitle2">等级群组</td>
            <td width="30%" class="LN_tableBoxtitle2">是否到达</td>
            <td width="*" class="LN_tableBoxtitle2">操作</td>
            </tr>
            <c:forEach var="o" items="${groupAssList}" varStatus="idx">
	            <tr>
	              <td  class="LN_tableBoxText2">
	              ${idx.count}
	              <input type="checkbox" name="groupId" value="${o.orgName}" onclick="ev_checkAll(this, '${o.orgId}')" isAll="${o.notArchiveAssNumber==0}"/>
	              
	              <div style="display:none;" id="${o.orgId}">
	              <c:forEach var="o1" items="${o.boInfos}" varStatus="idx1">
	              	<input type="checkbox" name="id" value="${boInfoM[o1.id].worklistItemId}" />
	              </c:forEach>
	              </div>
	              </td>
	            <td class="LN_tableBoxText2">${o.orgName }</td>
	            <td class="LN_tableBoxText2">
	            		<c:if test="${isUndo}">
	            			共计已发起：${o.totalAssNumber}&nbsp;&nbsp;&nbsp;&nbsp;
	            						已到达：${o.archiveAssNumber}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            						<c:if test="${o.notArchiveAssNumber>0}"><span class="LN_colorRed">未全部到达</span></c:if>
	            		</c:if>
	            		<c:if test="${o.notArchiveAssNumber==0}"><span class="LN_colorblue">已全部到达</span></c:if>
	            	</td>
	            <td class="LN_tableBoxText2">
	            <a href="#" class="LN_BlueLink" onclick="ev_grade('${o.orgId}','${o.notArchiveAssNumber>0}','${o.orgName}','${o.boIds}');return false;">${isUndo?'':'查看'}评定等级</a></td>
	            </tr>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
</div>
</div>
</form>
<script type="text/javascript">window.onload = function(){setPHeight3();}</script>
</body>
</html>