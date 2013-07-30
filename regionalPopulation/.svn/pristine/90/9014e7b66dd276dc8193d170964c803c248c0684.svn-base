<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:100%;width:20%;float:left;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=BC7153532548706c93c52f56e9b89b7b"></script>
<title>显示城市地图</title>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<%

String city = request.getParameter("city");

%>
<script type="text/javascript">
var map = new BMap.Map("allmap");           
map.centerAndZoom('<%=city%>',200);    

map.addEventListener("click",function(e){
    alert(e.point.lng + "," + e.point.lat);
});
</script>