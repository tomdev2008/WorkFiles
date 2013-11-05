<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/web/pub/head.inc"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ROOT}/css/GDCCS.css"/>
<head>

<title>${WEB_TITLE}</title>

 
</head>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
/**
*二级菜单响应事件
*/
function ev_show(url){
	document.getElementById("workspace").src="${ROOT}"+url;
}

function ev_showHomePage(){
	document.getElementById("workspace").src="${ROOT}/commentByBusiType.do";
}
//-->

function ev_logout() {
	if (confirm("确定要退出系统吗？"))
		window.close();
		//window.location.href = "${ROOT}/logout.do";
}

</script>

<body>
<!-- 顶部导航条-->
<div class="LN_TopBox">
  <div class="LN_TopLink">
  <table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <!-- 滚动信息内容 -->
        <td class="LN_topleftnav"></td>
        <!-- END 滚动消息内容 -->
        <td width="252" class="LN_toprightnav">
        <a href="#" onclick="ev_logout();return false;" class="LN_topnav">退出</a></td>
      </tr>
    </table>
  </div>
  <div class="LN_TopImg">
    <div class="LN_Nav">
       <ul>
       <c:forEach var="o" items="${menuList}" varStatus="idx">
       	<li><a href="#" class="TP${idx.count}" onmousemove="MM_showHideLayers('apDiv${idx.count}','','show','apDiv1${idx.count}','','inherit')" onclick="${o.id=='002'?'ev_showHomePage()':'' }"
       				 onmouseout="MM_showHideLayers('apDiv1${idx.count}','','hide')">${o.name}</a>
       				 
            <div id="apDiv${idx.count}">
              <!-- 父层，绝对定位于上一层div -->
              <div class="LN_popdivbox" id="apDiv1${idx.count}" onmousemove="MM_showHideLayers('apDiv1${idx.count}','','show')"
              		 onmouseout="MM_showHideLayers('apDiv1${idx.count}','','hide')">
                <!-- 子层 相对定位与父层 -->
                <ul>
                <c:forEach var="o1" items="${o.secureResource}" varStatus="idx1">
                  <li><a href="#" onClick="ev_show('${o1.url}')" class="on">${o1.name}</a></li>
               	</c:forEach>
                </ul>
              </div>
            </div>
        </li>
        </c:forEach>
       </ul>
    </div>
  </div>
  <div class="LN_TopInfor">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td width="57%" align="left" class="LN_pt12">&nbsp;&nbsp;&nbsp;欢迎你，
				<%=com.shengdai.kpi.system.CommonLoginUser.getCurrentDefaultUserHolder().getName()%>！</td>
                <td width="43%" align="right">
                <%=com.shengdai.kpi.util.DateUtils.getCurrentFormatDate()%>
                &nbsp;&nbsp;&nbsp;</td>
      </tr>
    </table>
  </div>
</div>
<!-- end 顶部导航条 -->
<!-- 正文内容 开始 -->
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td><iframe id="workspace" name="workspace" src="${ROOT}/commentByBusiType.do" align="middle" frameborder="0" 
			  width="1002" height="700" scrolling="no"></iframe>
	</td>
</tr>
<tr>
    <td class="LN_bottomtext">${WEB_TITLE}</td>
</tr>
</table>
<!-- 正文内容 end -->
</body>
</html>