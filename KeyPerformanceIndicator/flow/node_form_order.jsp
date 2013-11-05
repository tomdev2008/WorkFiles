<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="GBK"%>
<%@ include file="/web/pub/flow.inc" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>节点排序</title>
<style type="text/css">
#sajax1 {
    width: 180px;
    float: left;
    margin-left: 5px;
}


</style>
<link rel="stylesheet" href="${ROOT}/web/flow/css/drag/lists.css" type="text/css">
<script language="JavaScript" type="text/javascript" src="${ROOT}/web/flow/js/drag/coordinates.js"></script>
<script language="JavaScript" type="text/javascript" src="${ROOT}/web/flow/js/drag/drag.js"></script>
<script language="JavaScript" type="text/javascript" src="${ROOT}/web/flow/js/drag/dragdrop.js"></script>

</head>
<script language="JavaScript" type="text/javascript"><!--
		
		// remote scripting library
		// (c) copyright 2005 modernmethod, inc
		var sajax_debug_mode = false;
		var sajax_request_type = "GET";
		
		function sajax_debug(text) {
			if (sajax_debug_mode)
				alert("RSD: " + text)
		}
 		function sajax_init_object() {
 			sajax_debug("sajax_init_object() called..")
 			
 			var A;
			try {
				A=new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					A=new ActiveXObject("Microsoft.XMLHTTP");
				} catch (oc) {
					A=null;
				}
			}
			if(!A && typeof XMLHttpRequest != "undefined")
				A = new XMLHttpRequest();
			if (!A)
				sajax_debug("Could not create connection object.");
			return A;
		}
		function sajax_do_call(func_name, args) {
			var i, x, n;
			var uri;
			var post_data;
			
			uri = "";
			if (sajax_request_type == "GET") {
				if (uri.indexOf("?") == -1) 
					uri = uri + "?rs=" + escape(func_name);
				else
					uri = uri + "&rs=" + escape(func_name);
				for (i = 0; i < args.length-1; i++) 
					uri = uri + "&rsargs[]=" + escape(args[i]);
				uri = uri + "&rsrnd=" + new Date().getTime();
				post_data = null;
			} else {
				post_data = "rs=" + escape(func_name);
				for (i = 0; i < args.length-1; i++) 
					post_data = post_data + "&rsargs[]=" + escape(args[i]);
			}
			
			x = sajax_init_object();
			x.open(sajax_request_type, uri, true);
			if (sajax_request_type == "POST") {
				x.setRequestHeader("Method", "POST " + uri + " HTTP/1.1");
				x.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			}
			x.onreadystatechange = function() {
				if (x.readyState != 4) 
					return;
				sajax_debug("received " + x.responseText);
				
				var status;
				var data;
				status = x.responseText.charAt(0);
				data = x.responseText.substring(2);
				if (status == "-") 
					alert("Error: " + data);
				else  
					args[args.length-1](data);
			}
			x.send(post_data);
			sajax_debug(func_name + " uri = " + uri + "/post = " + post_data);
			sajax_debug(func_name + " waiting..");
			delete x;
		}
		
				
		// wrapper for sajax_update		
		function x_sajax_update() {
			sajax_do_call("sajax_update",
				x_sajax_update.arguments);
		}
		
		       function confirm(z)
       {
          window.status = 'Sajax version updated';
       }

        function onDrop() {
          var data = DragDrop.serData('g2'); 
          x_sajax_update(data, confirm);
       }

	window.onload = function() {


                list = document.getElementById("sajax1");
                DragDrop.makeListContainer( list, 'g2' );
                list.onDragOver = function() { this.style["background"] = "#EEF"; };
                list.onDragOut = function() {this.style["background"] = "none"; };
                list.onDragDrop = function() {onDrop(); };

	};
        
        function setSort()
        {
          order = document.getElementById("NodeCodeSort");
          order.value = DragDrop.serData('g2', null);
        }
	//-->
</script>
<body style="OVERFLOW: auto" text=#000000 bgColor=#f0f0f0 leftMargin=0 topMargin=3>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" class="define-box1">
  <tr>
    <td height="100%" width="100%" valign="top" class="define-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">

<br>
<form id="form1" name="form1" method="post" action="">
<INPUT type="hidden" name="flowCode" value="<%=request.getParameter("flowCode")%>">
<INPUT type="hidden" name="NodeCodeSort" value="">
<table cellSpacing=0 cellPadding=0 width=600 align=center border=0>
环节排序
<tr>
	<td>    <ul id="sajax1" class="sortable boxy">
	    <logic:iterate id="flowNodeList" name="flowNodeList">
          <li id="<bean:write name="flowNodeList" property="nodeCode"/>"><bean:write name="flowNodeList" property="nodeName"/></li>
        </logic:iterate>
  </ul>
	</td>
</tr>
</table>
	</form>
</div></td></tr></table>
</body>
</html>