<%@ page contentType="text/html;charset=utf-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.flow.FlowHelper"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<title>模板环节配置页面</title>
<script type="text/javascript" >
	function ev_new() {
			openWin("${ROOT}/getNodeTemplate.do?",{showCenter:true,width:750,height:450});
		}
		function ev_edit2(id) {
			openWin("${ROOT}/getNodeTemplate.do?nodeCode="+id,{showCenter:true,width:750,height:450});
		}
		function ev_edit() {
			var number = 0;
			var checkVal ;
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked){
						number = number + 1;
						checkVal = e.value;	
					}
				}							
			}
			if(number == 0){
				alert("请选择要修改的记录");
				return false;
			}else if(number>1){
				alert("请只选择一条要修改的记录");
				return false;
			}
			ev_edit2(checkVal);
		}
		
		function ev_del() {
			var number = 0;
			var ids="";
			for (var i=0;i<form1.elements.length;i++){
				var e = form1.elements[i];						
				if(e.name == "selectedrow"){
					if(e.checked){
						if(ids!=""){
							ids+=";"+e.value;
						}else{
							ids=e.value;
						}
						number = number + 1;					
					}
				}							
			}
			if(number == 0){
				alert("请选择要删除的记录");
				return false;
			}
			if(confirm("确定删除所选的记录吗？")){
				document.getElementById("DIds").value=ids;
				document.form1.action="${ROOT}/delNodeTemplate.do";
				document.form1.submit();
			}	
		}
		window.onload=function (){
			setPHeight();
		}
</script>
</head>
<body onmousewheel="setScrollzheight();">
<form name="form1" method="post">
  <table border="0" cellspacing="0" cellpadding="0" class="list-top">
    <tr>
      <td><h2>模板环节配置列表</h2></td>
    </tr>
    <tr>
      <td id="tdBtn" class="list-caozuo">&nbsp;
      				    <a onclick="ev_new()" href="javascript:;">新增</a> |
						<a onclick="ev_edit()" href="javascript:;">修改</a> |
						<a onclick="ev_del()" href="#" >删除</a>
						<input type="hidden" name="DIds" />
      </td>
    </tr>
  </table>
  
  <table class="list-box" cellspacing="0" cellpadding="0" border="0" id="ctl03_GridViewUserList">
	<tr>
	  <td class="list-title" width="5%">序号</td>
	  <td class="list-title" width="30%">环节业务类型</td>
	  <td class="list-title" width="30%">环节模板名称</td>
	  <td class="list-title" >环节模板说明</td>
	</tr>
	<logic:iterate id="FlwNode" name="nodeTemplateList" indexId="index">
	<tr class="list-color${index%2==0?'1':'2' }">
	  <td class="list-text1" ><input type="checkbox" name="selectedrow" value="${FlwNode.nodeCode}"/>${index+1 }</td>
	  <td class="list-text1" >${FlwNode.busiName}</td>
	  <td class="list-text1" >${FlwNode.nodeName}</td>
	  <td class="list-text1" >${FlwNode.memo}</td>
	</tr>
	</logic:iterate>
  </table>
  <kpi:page-bar formId="form1" />
</form>

</body>
</html>
