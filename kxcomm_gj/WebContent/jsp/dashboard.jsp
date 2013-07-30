<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.kxcomm.hadoop.util.*" %>
<%@ page import="com.gaoxing.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<<html>
<head>
<script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<meta charset="utf-8" />
<title>Admin</title>
<meta name="description" content="Administry - Admin Template by www.865171.cn" />
<meta name="keywords" content="Admin,Template" />
<!-- We need to emulate IE7 only when we are to use excanvas -->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<![endif]-->
<!-- Favicons --> 
<link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
<!-- Main Stylesheet --> 
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Colour Schemes
Default colour scheme is blue. Uncomment prefered stylesheet to use it.
<link rel="stylesheet" href="css/brown.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/gray.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/green.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/pink.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/red.css" type="text/css" media="screen" />
-->
<!-- Your Custom Stylesheet --> 
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<!--swfobject - needed only if you require <video> tag support for older browsers -->
<script type="text/javascript" SRC="js/swfobject.js"></script>
<!-- jQuery with plugins -->
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
<!-- Could be loaded remotely from Google CDN : <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<!-- jQuery tooltips -->
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<!-- Superfish navigation -->
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<!-- jQuery form validation -->
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
<!-- jQuery popup box -->
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
<!-- jQuery graph plugins -->
<!--[if IE]><script type="text/javascript" src="js/flot/excanvas.min.js"></script><![endif]-->
<script type="text/javascript" SRC="js/flot/jquery.flot.min.js"></script>
<!-- Internet Explorer Fixes --> 
<!--[if IE]>
<link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
<script src="js/html5.js"></script>
<![endif]-->
<!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->
<!--[if lt IE 8]>
<script src="js/IE8.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function(){
	
	/* setup navigation, content boxes, etc... */
	Administry.setup();
	
	/* progress bar animations - setting initial values */
	Administry.progress("#progress1", 1, 5);
	Administry.progress("#progress2", 2, 5);
	Administry.progress("#progress3", 2, 5);

	/* flot graphs */
	var sales = [{
		label: 'Total Paid',
		data: [[1, 0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,900],[8,0],[9,0],[10,0],[11,0],[12,0]]
	},{
		label: 'Total Due',
		data: [[1, 0],[2,0],[3,0],[4,0],[5,0],[6,422.10],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0]]
	}
	];

	var plot = $.plot($("#placeholder"), sales, {
		bars: { show: true, lineWidth: 1 },
		legend: { position: "nw" },
		xaxis: { ticks: [[1, "Jan"], [2, "Feb"], [3, "Mar"], [4, "Apr"], [5, "May"], [6, "Jun"], [7, "Jul"], [8, "Aug"], [9, "Sep"], [10, "Oct"], [11, "Nov"], [12, "Dec"]] },
		yaxis: { min: 0, max: 1000 },
		grid: { color: "#666" },
		colors: ["#0a0", "#f00"]			
    });


});
</script>
</head>
<%
    String username=request.getParameter("username");
    //username = new String(username.getBytes("iso-8859-1"),"utf-8");
    System.out.println(username);
%>
<body>
	<!-- Header -->
	<header id="top">
		<div class="wrapper">
			<!-- Title/Logo - can use text instead of image -->
			<div id="title"><img SRC="img/logo.png" alt="Administry" /><!--<span>Administry</span> demo--></div>
			<!-- Top navigation -->
			<div id="topnav">
				<a href="#"><img class="avatar" SRC="img/user_32.png" alt="" /></a>
				Logged in as <b><%=username %> </b>
				<span>|</span> <a href="#">Settings</a>
				<span>|</span> <a href="#">Logout</a><br />
				<small>You have <a href="#" class="high"><b>1</b> new message!</a></small>
			</div>
			<!-- End of Top navigation -->
			
			<!-- End of Main navigation -->
			<!-- Aside links -->
			
			<!-- End of Aside links -->
		</div>
	</header>
	<!-- End of Header -->
	<!-- Page title -->
	<%
		List<UserInfo> list=null;
		if(request.getParameter("telphone")!=null&&!"".equals(request.getParameter("telphone"))){
			String starttime=request.getParameter("starttime").replace("-", "");
			String endtime=request.getParameter("endtime").replace("-", "");
			String mobilenum=request.getParameter("telphone");		
			String last=request.getParameter("last");
			
			String start=mobilenum+starttime;
			String end=mobilenum+endtime;
			
			list=HbaseUtil.queryByScanFilter("kxcomm_gj", start, end, last);			 
		}
	%>
	
	<div id="pagetitle">
		<div class="wrapper">
			<h1>HbaseDemo</h1>
			<form action="">
			startDate:<input name="starttime" type="text" onClick="WdatePicker()"/>
            endDate:<input name="endtime" type="text" onClick="WdatePicker()"/>
            <input name="last" type="hidden" value=<% if(list!=null) out.print(list.get(list.size()-1).getDatetime()); %>/>
			mobile_num:<input name="telphone" type="text"/>
			<input type="submit" text="查询"/>
           	</form>
		</div>
	</div>
	<!-- End of Page title -->
	<!-- Page content -->
	<div id="page">
       <table class="no-style full">

       <tr>
       <td>号码</td>
       <td>时间</td>
       <td>地址</td>
       <td>内容大小(kB)</td>
       <td>state</td>
       </tr>
       	<%
			if(list!=null){
				for(int i=0;i<list.size();i++){
					UserInfo info=list.get(i);
		%>
       <tr>
       <td><%=info.getTelphone() %></td>
       <td><%=info.getDatetime()%></td>
       <td><%=info.getUrl() %></td>
       <td><%=info.getFlowsize() %></td>
       <td><%=info.getCode() %></td>
       </tr>
       <%
			}}
       %>
       <!-- 在这里遍历就出来数据了. -->
       </table>
	</div>
	<!-- End of Page content -->
	<!-- Scroll to top link -->
	<a href="#" id="totop">^ scroll to top</a>
<!-- <div id="chartContainer">
	
	</div>
	
	<script type="text/javascript">
	  var jsondata="";
	  var myChart = new FusionCharts( "../Charts/Column3D.swf", 
		      "myChartId", "400", "300", "0" );
		      myChart.setJSONData (jsondata);
		      myChart.render("chartContainer");
	</script>-->
<!-- Admin template javascript load -->
<script type="text/javascript" SRC="js/administry.js"></script>
</body>
</html>