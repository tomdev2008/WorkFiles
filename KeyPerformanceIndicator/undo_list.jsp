<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ include file="/web/pub/head.inc"%>
	<LINK rel="stylesheet" type="text/css" href="${ROOT}/css/layout.css"/> 
	<title>Insert title here</title>
	<script language="javascript" type="text/JavaScript">
		function toOpenMsg(wid,batchId,flowCode,nodeCode,busiType){
			var paras = "?wid="+wid+"&batchId="+
				batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&busiType="+busiType;
			var url = "${ROOT}/findWorklistInfoAjax.do"+paras;
		    LoadAjaxContent(url,function(){
		    		var flgFullScreen = this.request.responseText;
					var url = "${ROOT}/openUndoWorklist.do" + paras;
					if(flgFullScreen=="1"){
						var fwidth=screen.width-10; //屏幕的宽
				    	var fheight=screen.height-50; //屏幕的高
				    	url +=  "&flgFullScreen="+1+"&close_window="+1;
						new_window = window.open(url,'msgWin','left=2,top=2,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
					} else {
						url +=  "&flgFullScreen="+0;
						top.frames['workspace'].location.href = url;
					}
		    }); 
		}
		
		function toOpenDoneMsg(wid,batchId,flowCode,nodeCode,busiType){
			var paras = "?wid="+wid+"&batchId="+
				batchId+"&flowCode="+flowCode+"&nodeCode="+nodeCode+"&busiType="+busiType;
			var url = "${ROOT}/findWorklistInfoAjax.do"+paras;
		    LoadAjaxContent(url,function(){
		    		var flgFullScreen = this.request.responseText;
					var url = "${ROOT}/openDoneWorklist.do" + paras;
					if(flgFullScreen=="1"){
						var fwidth=screen.width-10; //屏幕的宽
				    	var fheight=screen.height-50; //屏幕的高
				    	url +=  "&flgFullScreen="+1+"&close_window="+1;
						new_window = window.open(url,'msgWin','left=2,top=2,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
					} else {
						url +=  "&flgFullScreen="+0;
						top.frames['workspace'].location.href = url;
					}
		    }); 
		}

		function openWin(batchId,boId,handlerId,nodeCode){
			var url="${ROOT}/openDoneWorklist.do?batchId="+batchId+"&boId="+boId+"&handlerId="+handlerId+"&nodeCode="+nodeCode;	
			var fwidth=screen.width; //屏幕的宽
 		  	var fheight=screen.height; //屏幕的高
			new_window = window.open(url,'_blank','left=0,top=0,width='+fwidth+', height='+fheight+', resizable=0,scrollbars=1');
			window.location.reload();
		}
	</script>
</head>
<body style="background-color:white;">
    <table width="99%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
        <tr>
          <td height="3" bgcolor="#4F81CE"></td>
        </tr>
        <tr>
          <td class="LN_boxtitlebg"><div class="LN_OAtitbg">员工月度考核</div>
              <div class="LN_morelink"><a href="${ROOT}/listUndoWorklist.do?busiType=YGKHM" target="workspace">更多</a></div></td>
        </tr>
        <tr>
          <td class="LN_press"><table class="LN_mainright" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8%" class="LN_right-field"><a href="#">序号</a></td>
                <td width="50%" class="LN_right-field"><a href="#">待办工作名称</a></td>
                <td width="22%" class="LN_right-field"><a href="#">当前环节 </a></td>
                <td width="20%" class="LN_right-field"><a href="#">到达时间</a></td>
              </tr>
              <tr>
                <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                	<c:forEach var="o" items="${YGKHMlist}" varStatus="idx">
	                    <tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''" 
	                    	class="LN_right-color${idx.count%2==0?'1':'2'}">
	                      <td width="8%" class="LN_right-text">${idx.count}</td>
	                      <td width="50%" class="LN_right-text${o.status==1?'-red':''}">
	                      <a href="#" onclick="toOpenMsg('${o.id}','${o.batchId}','${o.flowCode}','${o.nodeCode}','${o.busiType}');return false;" >${o.worklistItemTitle2}</a></td>
	                      <td width="22%" class="LN_right-text">${o.nodeName}</td>
	                      <td width="20%" class="LN_right-text"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
	                    </tr>
                	</c:forEach>
                	<c:forEach begin="1" end="${PAGE_SIZE-fn:length(YGKHMlist)}">
	                    <tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''" class="LN_right-color1">
	                      <td width="8%" class="LN_right-text">&nbsp;</td>
	                      <td width="50%" class="LN_right-text">&nbsp;</td>
	                      <td width="22%" class="LN_right-text">&nbsp;</td>
	                      <td width="20%" class="LN_right-text">&nbsp;</td>
	                    </tr>
                	</c:forEach>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br />
      <table width="99%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
        <tr>
          <td height="3" bgcolor="#4F81CE"></td>
        </tr>
        <tr>
          <td class="LN_boxtitlebg"><div class="LN_OAtitbg">员工年度考核</div>
              <div class="LN_morelink"><a href="${ROOT}/listUndoWorklist.do?busiType=YGKHY" target="workspace">更多</a></div></td>
        </tr>
        <tr>
          <td class="LN_press"><table class="LN_mainright" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8%" class="LN_right-field"><a href="#">序号</a></td>
                <td width="50%" class="LN_right-field"><a href="#">待办工作名称</a></td>
                <td width="22%" class="LN_right-field"><a href="#">当前环节 </a></td>
                <td width="20%" class="LN_right-field"><a href="#">到达时间</a></td>
              </tr>
              <tr>
                <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                	<c:forEach var="o" items="${YGKHYlist}" varStatus="idx">
	                    <tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''" 
							class="LN_right-color${idx.count%2==0?'1':'2'}${o.status==1?'2':''}">
	                      <td width="8%"  class="LN_right-text">${idx.count}</td>
	                      <td width="50%" class="LN_right-text${o.status==1?'-red':''}">
	                      <a href="#" onclick="toOpenMsg('${o.id}','${o.batchId}','${o.flowCode}','${o.nodeCode}','${o.busiType}');return false;">
	                      ${o.worklistItemTitle2}</a></td>
	                      <td width="22%"  class="LN_right-text">${o.nodeName}</td>
	                      <td width="20%"  class="LN_right-text"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
	                    </tr>                		
                	</c:forEach>
                	<c:forEach begin="1" end="${PAGE_SIZE-fn:length(YGKHYlist)}">
	                    <tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''" class="LN_right-color1">
	                      <td width="8%" class="LN_right-text">&nbsp;</td>
	                      <td width="50%" class="LN_right-text">&nbsp;</td>
	                      <td width="22%" class="LN_right-text">&nbsp;</td>
	                      <td width="20%" class="LN_right-text">&nbsp;</td>
	                    </tr>
                	</c:forEach>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <br/>
      <table width="99%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
        <tr>
          <td height="3" bgcolor="#4F81CE"></td>
        </tr>
        <tr>
          <td class="LN_boxtitlebg"><div class="LN_OAtitbg">已办信息</div>
              <div class="LN_morelink"><a href="${ROOT}/listDoneWorklist.do" target="workspace">更多</a></div></td>
        </tr>
        <tr>
          <td class="LN_press"><table class="LN_mainright" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%" class="LN_right-field"><a href="#">序号</a></td>
                <td width="46%" class="LN_right-field"><a href="#">已办工作名称</a></td>
                <td width="15%" class="LN_right-field"><a href="#">当前环节 </a></td>
                <td width="17%" class="LN_right-field"><a href="#">到达时间</a></td>
                <td width="17%" class="LN_right-field"><a href="#">处理时间</a></td>
              </tr>
              <tr>
                <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <c:forEach var="o" items="${YBlist}" varStatus="idx">
                    <tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''" class="LN_right-color1">
                      <td width="5%" class="LN_right-text">${idx.count}</td>
                      <td width="46%" class="LN_right-text">
                      <a href="#" onclick="toOpenDoneMsg('${o.id}','${o.batchId}','${o.flowCode}','${o.nodeCode}','${o.busiType}');return false;">${o.worklistItemTitle2}</a></td>
                      <td width="15%" class="LN_right-text">${o.nodeName}</td>
                      <td width="17%" class="LN_right-text"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                      <td width="17%" class="LN_right-text"><fmt:formatDate value="${o.compDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                  </c:forEach>
                	<c:forEach begin="1" end="${PAGE_SIZE-fn:length(YBlist)}">
	                    <tr onmouseover="this.style.backgroundColor='#eff7ff'" onmouseout="this.style.backgroundColor=''" class="LN_right-color1">
	                      <td width="5%" class="LN_right-text">&nbsp;</td>
	                      <td width="46%" class="LN_right-text">&nbsp;</td>
	                      <td width="15%" class="LN_right-text">&nbsp;</td>
	                      <td width="17%" class="LN_right-text">&nbsp;</td>
	                      <td width="17%" class="LN_right-text">&nbsp;</td>
	                    </tr>
                	</c:forEach>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table>
    <br/>
    <script language="javascript" type="text/JavaScript">
    	window.onload = function(){setPHeight2();}
    </script>
</body>

</html>