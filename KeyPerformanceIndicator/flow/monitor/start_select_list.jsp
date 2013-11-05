<%@ page contentType="text/html; charset=utf-8" language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/web/pub/head.inc"%>
<html ><html:base target="_self"/>
<head>		
	<title>待发流程对象</title>
<script type="text/javascript">

function ev_ok(){
  	var value = "";
  	var c = document.getElementsByName("delegateOrg");
  	if(c && c.length>0){
	  	for(i=0;i<c.length;i++){
	    	if(c[i].checked){
		  		if(value=="") value = c[i].value;
		  		else value +=  ";"+c[i].value;
			}
	  	}
	} 
	window.returnValue = value;
  	window.close();
}
function ev_checkAll(control){
	var isChecked = control.checked;
	var c = document.getElementsByTagName("INPUT");
	if(c && c.length>0){
	  	for(i=0;i<c.length;i++){
	    	if(c[i].type=="checkbox"){
				if(isChecked) c[i].checked = true;
				else c[i].checked = false;
			}
	  	}
	} 
}

function ev_checkPart(control, index){
	var isChecked = control.checked;
	var inputs = document.getElementById("delegateTd"+index).getElementsByTagName("INPUT");
	if(inputs && inputs.length>0){
		for(i=0;i<inputs.length;i++){
	    	if(isChecked)
				 inputs[i].checked = true;
			else 
				inputs[i].checked = false;
	  	}
	}
}
</script>
</head>
<body >
	<table border="0" cellpadding="0" cellspacing="0" class="dialog-box" style="width:580px;">
        <tr>
          <td class="dialog-titlebg" ><div class="dialog-title">流程发起对象选择</div></td>
        </tr>
        <tr>
          <td height="420" valign="top" class="dialog-text-bg"><div align="left">
           <input type="checkbox" onclick="ev_checkAll(this);" checked/>
           	全选(共计应考核数量：${totalDelegateNumber}个<!-- ,共计剔除数量：${totalNotAssNumber}个-->) 
           </div>
           <table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
           <c:forEach var="o" items="${startOrgs}" varStatus="idx">
	        <tr>
	        <td> 	  	
				<table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
					<tr>
						<td  align="left">
							[${idx.count}]<input type="checkbox" name="delegateOrgAll" onclick="ev_checkPart(this,'${idx.count}');" checked value="${o.orgId}"/>
							组织名称：${o.orgName}&nbsp;&nbsp;&nbsp;&nbsp;应考核数量：${o.delegateNumber}&nbsp;&nbsp;&nbsp;&nbsp;<!-- 剔除数量：${o.notDelegateNumber }-->
						</td>
					</tr>
					<tr>
						<td align="left" id="delegateTd${idx.count}">
						<c:forEach var="o1" items="${o.subList}" varStatus="idx1">
						<c:if test="${fn:contains(o.notDelegateIds,o1.id)}"><c:set var="isHoliday" value="${true}"/></c:if>
						<c:if test="${not fn:contains(o.notDelegateIds,o1.id)}"><c:set var="isHoliday" value="${false}"/></c:if>
						<input type="checkbox" name="delegateOrg" checked value="${o1.id}" ${isHoliday?'disabled':''}/>
							${idx1.count}${o1.name}${isHoliday?'(剔除人员)':''}&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${idx1.count%5==0}"><br/></c:if>
						</c:forEach>
						</td>
					</tr>
				</table>
			</td>
	        </tr>
	        </c:forEach>
           </table>
           </td>
        </tr>
        <tr>
        	<td> <div class="dialog-line"></div>
			  <div><input type="button" class="button4" value="确 定" onClick="javascript:ev_ok();" />
			       <input type="button" class="button4" value="取 消" onclick="javascript:window.close();" />
			  </div></td>
        </tr>
      </table>
</body>

<script>
var delegate = parseInt("${totalDelegateNumber==null?0:totalDelegateNumber}");
if(delegate==null||delegate==0){
	alert("没有可发起的被考核对象!");
	window.close();
}
</script>
</html>
