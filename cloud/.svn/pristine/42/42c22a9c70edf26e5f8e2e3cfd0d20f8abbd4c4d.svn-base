<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/jsp/head.jsp"%>
<%
//response.sendRedirect(request.getContextPath()+"/initIndex") ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>康讯自服务</title>
<meta name="keywords" content="康讯自服务" />
<meta name="description" content="康讯自服务" />
<link rel="Stylesheet" href="${ctx}/common/css/Style.css" />
<link rel="Stylesheet" href="${ctx}/common/css/MenuStyle.css" />
<script type="text/javascript" src="${ctx }/common/js/Menu.js"></script>
<script type="text/javascript" language="javascript">
    function show(temp)
    {
        if(temp==0)//新闻中心
        {
            $("#tagContent0").show();
            $("#tagContent1").hide();
            $("#tagContent2").hide(); 
            $("#img1").attr("src","${ctx}/common/images/test/image/xwzx_b.png");
            $("#img2").attr("src","${ctx}/common/images/test/image/zxcp_h.png");
            $("#img3").attr("src","${ctx}/common/images/test/image/hzhb_h.png");
        }
        if(temp==1)//最新产品
        {
            $("#tagContent1").show();
            $("#tagContent0").hide();              
            $("#tagContent2").hide();  
            $("#img2").attr("src","${ctx}/common/images/test/image/zxcp_b.png");
            $("#img1").attr("src","${ctx}/common/images/test/image/xwzx_h.png");
            $("#img3").attr("src","${ctx}/common/images/test/image/hzhb_h.png");
        }
        if(temp==2)//合作伙伴
        {         
            $("#tagContent2").show();
            $("#tagContent0").hide();
            $("#tagContent1").hide();
            $("#img3").attr("src","${ctx}/common/images/test/image/hzhb_b.png");
            $("#img2").attr("src","${ctx}/common/images/test/image/zxcp_h.png");
            $("#img1").attr("src","${ctx}/common/images/test/image/xwzx_h.png");
        }
    }
    
    //加载新闻中心内容
   /*  $(function(){
        $.post("Enterprise.asmx/QueryNews",function(xml){
        
            if($(xml).find("Table").length<6||$(xml)==null)
            {
                $("#more").hide();
            }else
            {
                $("#more").show();
            }
            $(xml).find("Table").each(function(i){
                if(i>8)
                {
                    return;
                }
                var $li=$("<li style='list-style-type:none;'><a href='News.htm?n_id="+$(this).find("n_id").text()+"'>"+$(this).find("n_title").text()+"</a></li>");
                $("#ul1").append($li);
            });
        });
    });
    
    //加载最新产品
    $(function(){
        $.post("Enterprise.asmx/QueryProductDataset",function(proxml){
        
            if($(proxml).find("Table").length<8 || $(proxml)==null)
            {
                $("#Div1").hide();
            }else
            {
                $("#Div1").show();
            }
            $(proxml).find("Table").each(function(j){
                if(j>8)
                {
                    return;
                }
                var $lipro = $("<li style='list-style-type:none;'><a href='ProductDetail.htm?p_id="+$(this).find("p_id").text()+"'>"+$(this).find("p_name").text()+"</a></li>");
                $("#productul").append($lipro);
            });
        });
    }); */
    
    $("#sreach").click(function(){$(this).val("");});
</script>
 

</head>
<body  style="background: url(${ctx}/common/images/bg.png)">
	 <div class="all" >
        <!--header 开始-->
        <jsp:include page="top.jsp" />
        <!--header 结束-->

        fdsafdsafdsafsdafdffffffffffffffff
        <!--内容开始 -->
        <div class="content" >
            <div style="margin-left:6px;">
                <table>
                    <tr>
                        <td onmouseover="show(0)"><img id="img1" src="${ctx}/common/images/test/image/xwzx_b.png" alt="产品介绍" /></td>
                        <td onmouseover="show(1)"><img id="img2" src="${ctx}/common/images/test/image/zxcp_h.png" alt="应用场景和案例" /></td>
                        <td onmouseover="show(2)"><img id="img3" src="${ctx}/common/images/test/image/hzhb_h.png" alt="合作伙伴" /></td>
                    </tr>
                </table>
            </div>
            <div id="tagContent">
                    <!--新闻中心标签开始 -->
                <div class="tagContent selectTag" id="tagContent0" style="overflow: hidden;">
                	  新闻中心
                       <ul id="ul1"></ul>
                        <div id="more" class="more" ><a href="News.htm?type=1" style="color:Red;">新闻中心</a></div>
                        
                    </div>
                </div>
                    <!--新闻中心结束 -->
                    
                    <!--最新产品标签开始  -->
                <div class="tagContent " id="tagContent1" style="overflow: hidden;">
                	最新产品
                    <div style="width:400px;">
                        <ul id="productul">
                            
                            
                        </ul>
                        <div id="Div1" class="more" ><a href="Product.htm" style="color:Red;">最新产品</a></div>
                    </div>
                </div>
                    <!--最新产品结束  -->
                
                <!-- 合作伙伴标签开始-->
                    <div class="tagContent" id="tagContent2" style="overflow: hidden;">
                        <div style="margin-left:20px; margin-top:10px;">
                           <a href="http://www.ccb.com"><img src="${ctx}/common/images/test/images/ccb.png" alt="" style="border:none;" /></a>
                        </div>
                        
                    </div>
                <!-- 合作伙伴标签结束-->
            </div>
        
        <!--内容结束 -->
        
        
    <!-- FOOT begin-->
		<jsp:include page="foot.jsp" />
	<!-- FOOT end-->
    </div>
    
   
</body>
</html>
