<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html:html>
	<head>
	<script src="${ROOT}/js/kpiCalendar.js"></script>
		<title>考核授权</title>
		<script>
			var closeWindow=0;
			function submitForm(form1,closeWindow1) {
				if(CheckForm(form1)&&checkJs()) {
					var url = "${ROOT}/isExistAccredit.do?accreditId=${accredit.id}&busiId="+form1.busi.value+"&grantor="+form1.grantor.value;
					closeWindow = closeWindow1;
					LoadAjaxContentSyn(url,isExistAccredit);		
				}
			}
			function isExistAccredit(){
				var retVal = Trim(this.request.responseText);
				if(retVal == "false"){
					pageShield();
					form1.action = "${ROOT}/saveAccredit.do?closeWindow="+closeWindow+"&id=${accredit.id}";
					form1.submit();
				}else{
					alert("该业务类型已经存在授权");
				}
			}
			function checkJs(){
				var currentDate = '<bean:write name="currentDate" format="yyyy-MM-dd HH:mm:ss"/>';
				var startDate = form1.startDate.value;
				var endDate = form1.endDate.value;
				
				if(startDate == ""){
					alert("开始时间不能为空");
					form1.startDate.focus();
					return false;
				}
				if(endDate == ""){
					alert("结束时间不能为空");
					form1.endDate.focus();
					return false;
				}
				if(currentDate>startDate)
				{
					alert("开始时间必须比当前时间晚，请重新选择时间。");
					return false;
				}
				if(startDate>=endDate ||  currentDate>=endDate)
				{
					alert("结束时间必须比当前时间和开始时间晚，请重新选择时间。");
					return false;
				}
				return true;
			}
		</script>
	</head>
	<html:base target="_self"/>
	<body>
	<table border="0" cellspacing="0" cellpadding="0" class="list-top" style="width:80%">
		<tr>
			<td colspan="2">
				<h2 style="float:none;">
					<c:if test="${accredit.id==null }">新增</c:if><c:if test="${accredit.id!=null }">修改</c:if>考核授权
				</h2>
			</td>
		</tr>
	  		<tr>
	  		<td width="50%" align="left"> 红星（<font color="red">*</font>）是必填 </td>
			<td class="list-caozuo"><a class="a" href="javascript:submitForm($_E('form1'),'0');">保存</a> | <a class="a" href="javascript:submitForm($_E('form1'),'1');">保存后关闭</a> | <a href="javascript:window.close();">关闭</a></td>
		</tr>
	</table>
	
	<form id="form1" name="form1" method="post" action="${ROOT}/saveAccredit.do"> 
	  <input type="hidden" name="id" value="${accredit.id }"/>    
	  <input type="hidden" name="grantor" value="${accredit.grantor }"/> 
	  <input type="hidden" name="grantorName" value="${accredit.grantorName }"/> 
      <table class="formtext" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td class="t" valign=top><font color="red">*</font>业务类型：</td>
          <td valign=top>
			<select id="busi" name="busi" >
			  <logic:iterate id="b" name="busiList">
			    <option value="${b.id }">${b.busiName }</option>
			  </logic:iterate>
			</select>
			<script>
			  var busi = document.getElementById("busi");
			  for(var i =0;i<busi.options.length;i++){
			  	if(busi.options[i].value=='${accredit.busi}'){
			  		busi.options[i].selected = true;
			  		break;
			  	}
			  }
			  </script>
		  </td>
        </tr>
        <tr>
		  <td height="22" class="t" valign=top nowrap><font color="red">*</font>被授权人</td>
		  <td height="22" valign=top>
		  	<input type="text" name="acceptorName" value="${accredit.acceptorName}" class="input-text" readonly="true" check="notBlank" required="true" showName="被授权人" />
			<input type="hidden" name="acceptor" value="${accredit.acceptor }"/>
			<a href="#" onclick="getAddressList('20','1','1','acceptorName','acceptor');return false;" class="choose">选择</a>
		  </td>
		</tr>
		<tr>
		  <td height="22" class="t" valign=top nowrap><font color="red">*</font>开始时间</td>
		  <td height="22" valign=top >
	     	<input type="text" name="startDate" value="<bean:write name="accredit" property="startDate" format="yyyy-MM-dd HH:mm:ss"/>" readOnly="readOnly" onfocus="calendar(this,true)" class="input-text"  />
	     	<a href="#" onclick="calendar(form1.startDate,true);return false;" class="choose">选择</a>
		  </td>
		</tr>
		<tr>
		  <td height="22" class="t" valign=top nowrap><font color="red">*</font>结束时间</td>
		  <td height="22" valign=top >
			<input type="text" name="endDate" value="<bean:write name="accredit" property="endDate" format="yyyy-MM-dd HH:mm:ss"/>" readOnly="readOnly" onfocus="calendar(this,true)" class="input-text" />      
			<a href="#" onclick="calendar(form1.endDate,true);return false;" class="choose">选择</a>
		  </td>
		</tr>
        <tr>
		  <td height="22" class="t" valign=top nowrap>备注：</td>
		  <td height="22" valign=top >
		  	<textarea rows="3" cols="70" name="remark" check="lengthNotMoreThan(500)" showName="备注">${accredit.remark }</textarea>
		  </td>
		</tr>	
      </table>
	</form>
	<kpi:UIResponse />
	</body>
</html:html>