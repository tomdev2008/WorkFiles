<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/flow/secure.inc" %>
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/web/pub/head.inc"%>
	<script>
		function ev_edit(id) {
			openWin("${ROOT}/editFlowGradeNodeScaleSet.do?flowId="+id+"&busiId=${busiId}",{showCenter:true,width:850,height:500});
		}
	</script>
</head>
<body onmousewheel='setScrollzheight();'>
    <form name="form1" method="post" style="margin-top: 0px">
    	<input type="hidden" name="orgId" value="${org.id }"/>
    	<input type="hidden" name="busiId" value="${busiId }"/>
        <table cellspacing="0" cellpadding="0" border="0" class="list-top">
        	<tbody>
        		<tr>  
        			<td><h2>流程列表</h2></td>
        		</tr>
        		<tr>  
					<td class="list-caozuo">
					</td>
				</tr>
  			</tbody>
  		</table>    				
        <div align="left">
        	[<font color="#CC3300">${org.fullPathName }</font>]下的流程列表。
        </div>    
        <table class="list-box" cellspacing="0" border="0">					
			<tr>
				<td class="list-title" nowrap width="8%">全选<input type="checkbox" id="selectid22" class="checkboxInput" onclick="SelectAllCheckboxes(this);"/></td>
				<td class="list-title" width="50%">名称</td>
				<td class="list-title" width="20%">类别</td>	
			</tr>
		<c:forEach var="flow" items="${flowList}" varStatus="idx">
			<tr class="list-color${idx.index%2==0?'1':'2'}">
				<td class="list-text1"><input type="checkbox" value="${flow.id}" name="selectedrow" class="checkboxInput"/></td>
				<td class="list-text1">
					<kpi:secure name="${flow.flowName}" onClick="ev_edit('${flow.id}');return false;" code="${typeCode }200" resourceId="${orgId }" type="viewLink" title="查看流程定义" />
				</td>
				<td class="list-text1">${flow.commBusi.busiName}</td>
			</tr>
		</c:forEach>			
		</table>
		<kpi:page-bar formId="form1" />
	</form>
	
</body>
</html>
<script type="text/javascript">
<!--
	window.onload=function(){setPHeight3();}
//-->
</script>