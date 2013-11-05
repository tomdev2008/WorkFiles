<%@ page contentType="text/html; charset=utf-8" language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/web/pub/head.inc"%>
<html ><html:base target="_self"/>
<head>		
	<title>待发流程对象</title>
<script type="text/javascript"><!--

function ev_ok(ee){
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
	 if(value!=""){
	 //form1.delegates.value = value;
		url= "${ROOT}/planRecBatchStart.do?batchDate="+${batchDate}+"00&delegates="+value+"&monitorId=${monitorId}&nocache="+Math.random();
		window.location.href = url;
	}
	else alert("没有选择发起对象！");
}
function ev_checkAll(control){
	var isChecked = control.checked;
	var c = document.getElementsByName("delegateOrg");
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


function autoResize(){
try{document.all["iframe"].style.height=iframe.document.body.scrollHeight}
catch(e){}
}
--></script>
</head>
<body >
	<table border="0" cellpadding="0" cellspacing="0" class="dialog-box" style="width:100%;">
        <tr>
          <td><br />
          <div align="left" >&nbsp;&nbsp;&nbsp;发起年度计划修改对象选择</div></td> 
        </tr>
        <tr>
          <td height="100%" valign="top" class="dialog-text-bg"><div align="left">
           <input type="checkbox" onclick="ev_checkAll(this);" checked/>
           	全选(共计应考核数量：${totalDelegateNumber}个) 
           </div>
           <div align="left">
	           	 正在考核的数量：${alreadyNumber}个) &nbsp;&nbsp;&nbsp;&nbsp; 提示：正在考核的对象不能选中！
	       </div>
           
	     
	        	<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolorlight="#B5CAFF" bordercolordark="#F4F5FF" align="center">
	           <tr>
						<td align="left" id="delegateTd">
						<c:forEach var="oo" items="${userList}" varStatus="indx">
						<c:if test="${oo.flgActive!=5}">
						<input type="checkbox"  name="delegateOrg" checked="checked"  value="${oo.id}"/>&nbsp;
							${indx.count}&nbsp; ${oo.name}&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${oo.flgActive==5}">
						<input type="checkbox"  name="delegateOrgs" readonly="readonly" disabled="disabled" value="${oo.id}"/>&nbsp;
							${indx.count}&nbsp; ${oo.name}&nbsp;&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${indx.count%10==0}"><br/></c:if>
						</c:forEach>
						</td>
					</tr>
				</table>
			   </td>
        </tr>
        <tr>
        	<!--<td> <div class="dialog-line"></div>
			  <div><input type="button" class="button4" value="发起" onClick="javascript:ev_ok('${monitorId}');" />
				 <input type="button" class="button4" value="取 消" onclick="javascript:window.close();" />
			  </div></td>
        --></tr>
      </table>
      <input type="hidden" id="batchDate" value="${batchDate}" />

</body>

<script>
var delegate = parseInt("${totalDelegateNumber==null?0:totalDelegateNumber}");
if(delegate==null||delegate==0){
	alert("没有可发起的被考核对象!");
	window.close();
}
</script>
</html>
