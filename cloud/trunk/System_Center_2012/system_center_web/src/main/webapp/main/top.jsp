<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>康讯自服务</title>
<meta name="keywords" content="康讯自服务" />
<meta name="description" content="康讯自服务" />
<script type="text/javascript">
  // 图片轮换
    /*  $(document).ready(function(){
        var objStr =".imgdiv a";
        $(objStr + ":not(:first)").css("display","none");
        setInterval(function(){
        if( 
              $(objStr + ":last").is(":visible")){
              $(objStr + ":first").fadeIn("slow").addClass("in");
              $(objStr + ":last").hide()
        }
        else{
              $(objStr + ":visible").addClass("in");
              $(objStr + ".in").next().fadeIn("slow");
              $(objStr + ".in").hide().removeClass("in")}
        },7000)  //每4秒钟切换 
    });*/
</script>
</head>
<body>
      <!--header 开始-->
      <div class="header">
    		<!--  <div class="headerright">
              <div class="title">
                  <a href="#">设为首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">收藏我们</a>
              </div>
          </div> -->
          <!--logo 开始-->
          <div class="logo" style="background: url(${ctx}/common/images/topbg.jpg);">
              <a href="${ctx }/main/home.jsp">
                  <img src="${ctx}/common/images/logon.jpg" height="60" alt="康讯通讯" style="border: none;" />
               </a>
                <img src="${ctx}/common/images/shuxian.jpg" height="60" style="border: none;" />
                <a href="#"><img src="${ctx}/common/images/cloudServer.jpg"></img></a>
                <img src="${ctx}/common/images/shu.jpg" height="60" style="border: none;" />
                <a href="#"><img src="${ctx}/common/images/firstpage.jpg"></img></a>
                <img src="${ctx}/common/images/shu.jpg" height="60" style="border: none;" />
		  <a href="#"><img src="${ctx}/common/images/usercenter.jpg"></img></a>
                <img src="${ctx}/common/images/shu.jpg" height="60" style="border: none;" />
                 <a href="#"><img src="${ctx}/common/images/managercontrol.jpg"></img></a>
          </div>
          <!-- logo 结束-->
          
          <div class="headfont" style="background: url(${ctx}/common/images/bluetiao.jpg);">
          	<a href="#"><img src="${ctx}/common/images/cloudfirst.jpg"></img></a>
          	<a href="#"><img src="${ctx}/common/images/project.jpg"></img></a>
          	<a href="#"><img src="${ctx}/common/images/friend.jpg"></img></a>
          </div>
          
           <!--图片展示开始 -->
        	<div class="move">
				<div class="leftMove">
	        		<a href="#"><img src="${ctx}/common/images/left.jpg"></img></a>
	        	</div>
		      	<div class="imgdiv">
		      		<a><img src="${ctx}/common/images/guanggao.jpg" alt="广告"></img></a>
		           <%-- <a href="#"><img src="${ctx}/common/images/test/image/03.jpg" alt="" style="width:920px; height:318px; border:none;" /></a>
		            <a href="#" style="display:none;"><img src="${ctx}/common/images/test/image/01.jpg" alt="" style="width:920px; height:318px; border:none;" /></a>
		            <a href="#" style="display:none;"><img src="${ctx}/common/images/test/image/04.jpg" alt="" style="width:920px; height:318px; border:none;" /></a> 
		            <a href="#" style="display:none;"><img src="${ctx}/common/images/test/image/02.jpg" alt="" style="width:920px; height:318px; border:none;" /></a> --%>     
		        </div>
		        <div class="rightMove">
		        	<a href="#"><img src="${ctx}/common/images/right.jpg"></img></a>	
	        	</div>
        	</div>
        <!--图片展示结束 -->
      </div>
      <!--header 结束-->
    
</body>
</html>
