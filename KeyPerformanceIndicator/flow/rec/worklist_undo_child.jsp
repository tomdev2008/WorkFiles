<%@ page contentType="text/html;charset=utf-8" language="java" import="java.util.*,com.shengdai.kpi.flow.valueobject.*"%>
<jsp:directive.page import="com.shengdai.kpi.util.DateUtils"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
<title>待办列表</title>
<script type="text/javascript" >
function toOpenMsg(wid,batchId,flowCode,nodeCode,busiType){
	var paras = "?wid="+wid+"&batchId="+
				batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&busiType="+busiType;
	var url = "${ROOT}/findWorklistInfoAjax.do"+paras;
    LoadAjaxContent(url,function(){
	 	var flgFullScreen = this.request.responseText;
		var url = "${ROOT}/openUndoWorklist.do" + paras ;
		if(flgFullScreen=="1"){
			var fwidth=screen.width; //屏幕的宽
	    	var fheight=screen.height; //屏幕的高
	    	url +=  "&flgFullScreen="+1+"&close_window="+1;
			new_window = window.open(url,'msgWin','left=0,top=0,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
		} else {
			url +=  "&flgFullScreen="+0;
			location.href = url;
		}   	
    }); 
}
function changeStatus(){
	form1.submit();
}

</script>
</head>
<body  class="LN_body">
<form name="form1" method="post" action="${ROOT}/listUndoWorklist.do">
<div class="LN_popupsBox">
<!--<div class="LN_Append">-->
<!--</div>-->
<div class="LN_formBox">
<div class="LN_formTitle">
待办列表
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">  
	待办列表</td>
  </tr>
  <tr>
    <td class="LN_press">
    <div class="LN_inquiry">业务类型：
    	<select name="busiType" onchange="changeStatus();">
		  <option value="">所有</option>
		  <logic:iterate id="busi" name="busiList" indexId="index">
			  <option value="${busi.id}" ${busiType == busi.id?"selected":""  }>${busi.busiName}</option>
		  </logic:iterate>
		</select>   
      </div>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
              <td width="5%" class="LN_tableBoxtitle2">序号</td>
            <td width="10%" class="LN_tableBoxtitle2">业务类型</td>
            <td width="50%" class="LN_tableBoxtitle2">任务描述</td>
            <td width="15%" class="LN_tableBoxtitle2">当前环节</td>
            <td width="15%" class="LN_tableBoxtitle2">到达时间</td>
            </tr>
            <c:forEach var="o" items="${list}" varStatus="idx">
	            <tr>
	             <td  class="LN_tableBoxText2"> 
	              ${idx.count}<input type="hidden" name="id" value="${o.boId }"/>
	            </td>
	            <td class="LN_tableBoxText2">${o.busiTypeZH}</td>
	            <td class="LN_tableBoxText2">
	            <a href="#" class="${o.status==1?'LN_RedLink':'LN_BlueLink'}" onclick="toOpenMsg('${o.id}','${o.batchId}','${o.flowCode}','${o.nodeCode}','${o.busiType}');return false;">
	            ${o.worklistItemTitle }
	            </a>&nbsp;</td>
	            <td class="LN_tableBoxText2">${o.nodeName}&nbsp;</td>
	            <td class="LN_tableBoxText2"><bean:write name="o" property="createDate" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>
	            </tr>
            </c:forEach>
          </table>
      </td>
  </tr>
</table>
</div>
</div>

<kpi:page-bar formId="form1"/>
</form>
</body>
</html>
