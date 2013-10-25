<%@page import="cn.com.mmsweb.action.util.SessionUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/jsp/head.jsp" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>沃爱彩信</title>
<meta name="keywords" content="沃爱彩信" />
<meta name="description" content="沃爱彩信" />
<style >
body{text-align:center;width:100%;}  
</style>
<script type="text/javascript" src="<%= realPath%>sendTemplateCard.js"></script>
<script type="text/javascript">
$(function(){
	 //全选 
	   $("#checkAll").click(function(){
		   if ($(this).attr("checked")) { 
        $('[name=items]:checkbox').attr('checked', true);
		   }else //全不选 
			   {
			   $('[type=checkbox]:checkbox').attr('checked', false);
			   }
	   });
});


function deleteAll()
{
	var parm = "";
	flag = false;
	var de = document.getElementsByName("items");
	for(i = 0; i < de.length; i++){
	if(de[i].checked == true){
    parm +=de[i].id+",";
	flag = true;
	} 
	}
	if(flag == false){
		alert("至少选择一个待删除记录");
		return false;
		}
	deleteById(parm);
}

function deleteById(parm)
{
	if(confirm("确定删除?")) {
		jQuery.post(ctxPath+"/collectdelete!deleteById.action",{//
			'id':parm,
		},
		function(data) {
		//	var data = eval('(' + data + ')');
			if(null!=data && ""!=data){
				if(data.msg=="ok"){
					alert("删除成功！");
					location.reload();
				}else if(data.msg=="error"){
					alert("删除失败！");
				}
			}
	},'json');
			}
}
</script>
</head>

<body>
	<div class="wrap">

	<!-- Header begin -->
	<jsp:include page="../top.jsp" />
	<!-- Header end -->
	
	<div class="menu">
		<ul>
			<li><a href="<%=path%>/weclome.jsp">模版明信片</a></li>
			<li><a href="<%= realPath%>diyPostcard/diyPostcard.jsp">DIY明信片</a></li>
			<li><a href="<%= realPath%>gifPostcard/gifPostcard.jsp">动态明信片</a></li>
		</ul>
		<i></i>
	</div>
	
	<!-- 登陆 begin -->
	<jsp:include page="../login.jsp" />
	<!-- 登陆 end -->
	
	<div class="mainbox">
		<div class="m-left">
			<div class="mblock-list">
            	<div class="mltitbar"><h3>我的收藏</h3></div>
                <div class="tbl-list lsc">
                	<table cellspacing="0" cellpadding="0">
                    	<tr>
                        	<th class="w1"><input type="checkbox" name="" id="checkAll" /></th>
                            <th class="w2"><!-- <a href="" onClick="deleteAll()">删除</a> --><input type="button" onclick="deleteAll()" value="删除" /></th>
                            <th class="w3">名称</th>
                            <th class="w4">类别</th>
                            <th class="w5">文字内容</th>
                            <th class="w6">收藏时间</th>
                            <th class="w7">操作</th>
                        </tr>
                         <s:iterator value="listCollect">
                        <tr>
                        	<td class="w1"><input type="checkbox" id="<s:property value="id"/>" name="items"/></td>
                            <td class="w2"><img src="${imgHttp}<s:property value="picUrl"/>"></img></td>
                            <td class="w3"><s:property value="cardTitle"/></td>
                            <td class="w4"><s:property value="name"/></td>
                            <td class="w5"><s:property value="wishWord"/></td>
                            <td class="w6"><s:property value="time"/></td>
                            <td class="w7"><button type="button" title="发送" onClick="javascript:sendTemplate(<s:property value="templateCardId" />);">发 送</button><button onclick='deleteById(<s:property value="id"/>);' title="删除">删除</button></td>
                        </tr>
                        </s:iterator>
                    </table>
                </div>
                  <div class="in-page">
                   <s:url id="url_home" value="collect.action">
                     <s:param name="pageNow" value="1"></s:param>
                   </s:url>
                   <s:url id="url_pre" value="collect.action">
                     <s:param name="pageNow" value="pageNow-1<=0?1:pageNow-1"></s:param>
                   </s:url>
                   <s:url id="url_next" value="collect.action">
                     <s:param name="pageNow" value="pageNow+1>maxPage1?maxPage1:pageNow+1"></s:param>
                   </s:url> 
                    <s:url id="url_last" value="collect.action">
                     <s:param name="pageNow" value="maxPage1"></s:param>
                   </s:url> 
                   <s:a href="%{url_home}">首页</s:a>
                    <s:a href="%{url_pre}">上一页</s:a>
            <!--         <s:iterator value="listCollect" status="status">
       					 <s:url id="url" value="collect.action">
                           <s:param name="pageNow" value="pageNow"/>
                         </s:url>
                   </s:iterator> -->
                  <s:a href="%{url_next}">下一页</s:a>
                   <s:a href="%{url_last}">末页</s:a>
                  </div>
         <!--        <div class="in-page"><a href="#" class="a1">上一页</a><a href="#">1</a><i>2</i><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#" class="a2" title="下一页">下一页</a></div> -->
            </div>
		</div>
		
		<!-- 最新推荐，最热推荐 begin -->
		<jsp:include page="../billboard.jsp" />
		<!-- 最新推荐，最热推荐 end -->
		
		<!-- 发送模板明信片弹出框 begin -->
		<jsp:include page="../sendBox.jsp" />
		<!-- 发送模板明信片弹出框 end -->
		
	</div>
</div>
<!-- FOOT begin-->
<jsp:include page="../foot.jsp" />
<!-- FOOT end-->
</body>
</html>
