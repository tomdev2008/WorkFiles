<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file=".//web/pub/flow.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>自由流操作</title>
	</head>

	<script type="text/javascript">
	function backFreeNode(){
	if(check("toNodeCode","请选择一个要回退的目标环节！！")&&check("backWay","请选择一种路线！！")){
	form1.action = "${ROOT}/backFreeNode.do?boId=<%=request.getAttribute("boId")%>&fromNodeCode=<%=request.getAttribute("fromNodeCode")%>";
	form1.submit();
	}
	}
	
	function check(name,text)
{
  var checkit = false;
  aa=document.getElementsByName(name);
  for (i=0;i<aa.length;i++)
  {
     if (aa.item(i).checked)
        checkit =true;
   }
   if (checkit==false)
   {
   alert(text)
   return false;
   }
   else
  {
    return true;
   }

}
	
	
	function changeState(){
	var toNodeCodeValue = getRadionValue("toNodeCode"); 
	if(toNodeCodeValue=="<%=request.getAttribute("nodeCode")%>"){
	document.all.backRoute.style.display="none";
	}else{
	document.all.backRoute.style.display="";
	}
	}
	
	function getRadionValue(name){
	var aa = document.getElementsByName(name);
	var toNodeCodeValue = "";
	for   (i=0;i<aa.length;i++)   
    {   
      if(aa[i].checked) toNodeCodeValue = aa[i].value; 
  }
  return  toNodeCodeValue;
	}
</script>
	<html:base target="_self" />
	<body>


		<form id="form1" name="form1" method="post" action="">
			<br />
			<table id=tabPro height=23 cellSpacing=1 borderColorDark=#f4f5ff align="center" cellPadding=1 width="94%" borderColorLight=#b5caff border=1 width="85%" height="137">
				<tr>
					<td align="center">
						选择
					</td>
					<td align="center">
						环节名称
					</td>
				</tr>
				<logic:iterate id="toNode" name="toNodeList">
					<tr>
						<td align="center">
							<input type="radio" name="toNodeCode" value="<bean:write name="toNode" property="nodeCode"/>" onclick="changeState()" />
						</td>
						<td align="center">
							<bean:write name="toNode" property="nodeName" />
						</td>
					</tr>
				</logic:iterate>
				<tr id="backRoute">
					<td align="center" nowrap="nowrap">
						回退后执行路线：
					</td>
					<td align="center" nowrap="nowrap">
						<input type="radio" name="backWay" value="0" checked="checked" />
						顺 序
						<input type="radio" name="backWay" value="1" />
						非顺序
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" nowrap="nowrap">
						意见：<textarea name="opinion" cols="35" rows="3"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input class=button type="button" name="Submit" value="回 退" onclick="backFreeNode()" />
						<input class=button type="button" name="Submit2" value="关 闭" onclick="window.close();" />
					</td>
				</tr>
			</table>
		</form>
	</body>

</html>
