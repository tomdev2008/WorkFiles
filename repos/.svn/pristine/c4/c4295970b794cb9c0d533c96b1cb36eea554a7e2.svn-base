<%@page import="cn.com.mmsweb.action.util.SessionUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/jsp/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>沃爱彩信</title>
<meta name="keywords" content="沃爱彩信" />
<meta name="description" content="沃爱彩信" />
<script type="text/javascript">
function addShouCang1(cardId)
{
	  $.post(ctxPath+'/myShouCang!addShouCang.action',{//
			'cardId':cardId
		},
		function(data) {
		//	var data = eval('(' + data + ')');
			if(null!=data && ""!=data){
				if(data.msg=="error"){
				window.location.href = ctx+"timeout.jsp";
							}
				else if(data.msg=="ok"){
					alert("收藏成功！");
				}else if(data.msg=="no")
					{
					alert("收藏失败");
					}
			}
	});
}
</script>
</head>

<body>
	<div class="m-right">
		<div class="rbox rbox1">
			<div class="rbox-titbar"></div>
			<div class="rbox-cons" style="background-color: #ebebeb;">
				<ul class="img-tj">
					<s:iterator id="lists" value="newBillBoardList">
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top1.id" />);"><img src='${imgHttp}<s:property value="#lists.top1.smallPic" />'/></a><span><s:property value="#lists.top1.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top2.id" />);"><img src='${imgHttp}<s:property value="#lists.top2.smallPic" />'/></a><span><s:property value="#lists.top2.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top3.id" />);"><img src='${imgHttp}<s:property value="#lists.top3.smallPic" />'/></a><span><s:property value="#lists.top3.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top4.id" />);"><img src='${imgHttp}<s:property value="#lists.top4.smallPic" />'/></a><span><s:property value="#lists.top4.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top5.id" />);"><img src='${imgHttp}<s:property value="#lists.top5.smallPic" />'/></a><span><s:property value="#lists.top5.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top6.id" />);"><img src='${imgHttp}<s:property value="#lists.top6.smallPic" />'/></a><span><s:property value="#lists.top6.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top7.id" />);"><img src='${imgHttp}<s:property value="#lists.top7.smallPic" />'/></a><span><s:property value="#lists.top7.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top8.id" />);"><img src='${imgHttp}<s:property value="#lists.top8.smallPic" />'/></a><span><s:property value="#lists.top8.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top9.id" />);"><img src='${imgHttp}<s:property value="#lists.top9.smallPic" />'/></a><span><s:property value="#lists.top9.cardTitle"/></span></li>
						<li><a href="javascript:sendTemplate(<s:property value="#lists.top10.id" />);"><img src='${imgHttp}<s:property value="#lists.top10.smallPic" />'/></a><span><s:property value="#lists.top10.cardTitle"/></span></li>
					</s:iterator>
				</ul>
			</div>
		</div>
		
		<div class="rbox rbox2">
			<div class="rbox-titbar"></div>
			<div class="rbox-cons" style="background-color: #ebebeb;">
				<ul class="ph-list">
					<s:iterator id="hotBill" value="hotBillBoardList">
						<li class="num1"><span><s:property value="#hotBill.top1.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs"><a href="javascript:sendTemplate(<s:property value="#hotBill.top1.id" />);" title="发送"></a></i></li>
						<li class="num2"><span><s:property value="#hotBill.top2.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top2.id" />);" title="发送"></a></i></li>
						<li class="num3"><span><s:property value="#hotBill.top3.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top3.id" />);" title="发送"></a></i></li>
						<li class="num4"><span><s:property value="#hotBill.top4.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top4.id" />);" title="发送"></a></i></li>
						<li class="num5"><span><s:property value="#hotBill.top5.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top5.id" />);" title="发送"></a></i></li>
						<li class="num6"><span><s:property value="#hotBill.top6.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top6.id" />);" title="发送"></a></i></li>
						<li class="num7"><span><s:property value="#hotBill.top7.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top7.id" />);" title="发送"></a></i></li>
						<li class="num8"><span><s:property value="#hotBill.top8.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top8.id" />);" title="发送"></a></i></li>
						<li class="num9"><span><s:property value="#hotBill.top9.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs" ><a href="javascript:sendTemplate(<s:property value="#hotBill.top9.id" />);" title="发送"></a></i></li>
						<li class="num10"><span><s:property value="#hotBill.top10.cardTitle" /></span><i class="sc"><a href="#" title="收藏" onclick="addShouCang1(<s:property value="#hotBill.top1.id"  />);"></a></i><i class="fs"><a href="javascript:sendTemplate(<s:property value="#hotBill.top10.id" />);" title="发送"></a></i></li>
					</s:iterator>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
