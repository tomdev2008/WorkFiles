<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.system.Globals"/>
<jsp:directive.page import="com.shengdai.kpi.flow.valueobject.Busi"/>
<jsp:directive.page import="com.shengdai.kpi.util.ParamUtils"/>

<html>
<%
	String listType = ParamUtils.getDefaultStringValue(request,"listType","folder");
%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
		<%@ include file="/web/pub/head.inc"%> 	
		<STYLE type=text/css><%-- 树所必须要用到的css，仅在这里使用 --%>
			TD {
				FONT-SIZE: 12px; FONT-FAMILY: 宋体
			}
			A:link {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
			A:visited {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
			A:active {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
			A:hover {
				PADDING-LEFT: 3px; FONT-SIZE: 12px; TEXT-DECORATION: none
			}
		</STYLE>
		<script src="${ROOT}/component/MzTreeView10.js"></script>	
		<script type="text/javascript">
		<!--
				var context = "${ROOT}";
				var appcontext = "";
				// 当前树的状态
				function reloadView(url){
					parent.fbody.location.href = url;
				}
				
				//组织列表
				function list_folder(id,name) {
			     //  alert("list_folder");
				   var listType = document.getElementById("listType").value;
				   
				  //alert("listType"+listType);
					var targetTypeID = ""
					if(id != 'root') {
						targetTypeID = id;
					}
					if(listType=="folder")
					{
					  
					  pageShowList('${ROOT}/listPersonFolder.do?id='+targetTypeID);
					}
					else if(listType=="data")
					{
					  pageShowList('${ROOT}/listFolderData.do?id='+targetTypeID);
					}
					else if(listType=="select")
					{  //用于添加到收藏夹
					   //alert(name);
					   //alert(parent.document.getElementById("listType"));
					   //alert(parent.document.getElementById("selectFolder").value);
					   if(parent.document.getElementById("moveFolder")!=null)//rootId
					   {
					      if(id == 'root')
					      {
					        targetTypeID = "root";
					      }
					   }
					   parent.document.getElementById("selectFolder").value = targetTypeID;
					}
					else if(listType=="addr")
					{ //用于我的收藏夹的显示
					  // parent.parent.fbody.fbody.location.href='${ROOT}/listAddrFolderData.do?id='+targetTypeID;
					  
					  var infoArray = id.split("::");
					  var objectType = infoArray[0];
					  if(objectType=="1")
					  {
					    	//alert(infoArray[1]);
					     parent.parent.fbody.addSelectedOrgsByFavorite(name,infoArray[1]);
					  } 
					}
					
					
				}
				
				
		//-->
		</script>
		<script language="javascript">
			ie4 = (document.all) ? true : false; 
			function keyDown(e){ 

				if(ie4){ 
					var realkey=String.fromCharCode(event.keyCode); 
					if(event.keyCode==27){
						//window.close();
						parent.parent.fbody.saveSelectedValue();
					} 
				} 
			} 
			//var pp = document.getElementById("listType").value;
			
		
			//  if(document.getElementById("listType").value=="addr")
			//  {
			//     document.onkeydown = keyDown; 
			//  }
			
		</script>
	</head>
	
	
	<%@ include file="/web/pub/tree.inc"%>
	<body class="textarea1" >	
		<form action="" method="get" name="thisForm"> 
		<input type="hidden" name="listType" value="<%=listType%>" />
		<div class="treeBody">
			<script>
			
			<!--
			    if(document.getElementById("listType").value=="addr")
			    {
			       document.onkeydown = keyDown; 
			    }
				${treeJS}											
			//-->
			</script>
		</div>
		</form> 
	</body>
	
</html>
