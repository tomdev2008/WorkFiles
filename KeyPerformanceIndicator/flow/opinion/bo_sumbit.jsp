<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.Iterator"  %>
<%@ page import="java.util.Map"  %>
<%@ page import="com.shengdai.kpi.flow.valueobject.FlwNode"  %>
<%@ page import="com.shengdai.kpi.flow.valueobject.RecOpinion"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<%
	String resourceId = (String)request.getAttribute("resourceId");
	FlwNode node = (FlwNode)request.getAttribute("node");
	Iterator recNodeList = (Iterator)request.getAttribute("recNodeList");
	Map opinionMap = (Map)request.getAttribute("opinionMap");
	String isWrite = (String)request.getAttribute("isWrite");
 %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>意见</title>
</head>
<script type="text/javascript">
var callFlag = "false";
function callback(){
	callFlag = Trim(this.request.responseText);
}
function createOpinion(){
	
	if(form1.opinion == null || form1.opinion.value=="")
		return ;
	
	if(form1.opinion.value.length > 500) {
		alert("意见只可以输入500个字符！");
		return;	
	} 
 		
	var opinion1 = encodeURI(form1.opinion.value);
	opinion1 = encodeURI(opinion1);
	//alert(opinion1);
	//var opinion1 = form1.opinion.value;
	if(form1.nodeId.value==""){
		alert("填写意见所在的环节不能为空!");
		return ;
	}
	var url = "${ROOT}/createOpinion.do?nodeId="+form1.nodeId.value+"&nodeName="+form1.nodeName.value+"&resourceId="+form1.resourceId.value+"&opinion="+opinion1;
	//alert(url);
    LoadAjaxContent(url,callback); 
    //alert(callFlag);
    return callFlag;
    
}
window.onload = function() {
	var  temp = this.document.body.scrollHeight;
	if(parent!=null&&parent.document.all["inputoption"]!=undefined){
		parent.document.all["inputoption"].height=temp;	
	}
};
</script>
<body>
<form name="form1" method="post" action="">
<input type="hidden" name="nodeId" value="<%=node==null?"":node.getNodeCode() %>"/>
<input type="hidden" name="nodeName" value="<%=node==null?"":node.getNodeName() %>"/>
<input type="hidden" name="resourceId" value="<%=resourceId %>"/>
<table class="list-box" cellspacing="1" border="0" width="88%" bgcolor="#D9E1F9">
  <tr>
    <td class="list-title" width="20%">环节</td>
    <td class="list-title" width="10%">处理人</td>
    <td class="list-title" width="16%">处理时间</td>
    <td class="list-title" width="*">意见</td>
  </tr>
 
  <c:forEach var="opinion" items="${opinionL}" varStatus="idx" >
  	<tr class="list-color${idx.index%2==0?'1':'2' }">
  		<td class="list-text" >${opinion.nodeName }</td>
  		<td class="list-text" >${opinion.creatorName }</td>
  		<td class="list-text" >
  			<fmt:formatDate value="${opinion.createDate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
  		</td>
  		<td class="list-text" align="left" style="word-break:break-all;">
  			${opinion.opinion }
  		</td>
  	</tr>
  </c:forEach>
 
  

</table>

<%if(!isWrite.equals(""+RecOpinion.READONLY_TRUE)){ %>
<table class="listquery" cellpadding="0" cellspacing="1" width="88%">
  <tr>
    <td class="t" width="20%">意见填写</td>
	<td width="80%">
	  <textarea id="opinion" name="opinion" rows="4" cols="50"></textarea>
      <select title="选择意见" onmousewheel="return false;"  onchange="if(this.value!='')document.getElementById('opinion').innerHTML+=this.value;">
      	<option value="">请选择意见</option>
      	<option value="已确认">已确认</option>
      	<option value="已填写,请领导审核">已填写,请领导审核</option>
      	<option value="已修改,请领导审核">已修改,请领导审核</option>
      	<option value="已审核">已审核</option>
      	<option value="已评分，请领导审核">已评分，请领导审核</option> 
      	 <option value="已评分，请确认">已评分，请确认</option>
      	<option value="请修改后再提交">请修改后再提交</option>
      </select>
	  <!-- <input type="button" value="确定" onclick="createOpinion();"/> -->
	</td>
  </tr>
</table>
<%} %>
</form>
</body>
</html>