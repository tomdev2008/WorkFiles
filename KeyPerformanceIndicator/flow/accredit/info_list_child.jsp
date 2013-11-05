<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/flow.inc" %>

<html>
  <head>  
    <title>公告管理</title>
<script language="javaScript">
    var n = 0;
 	function ev_select()
 	{
 		var checkboxes=document.getElementsByName("selectedRow");
 		for(i=0;i<checkboxes.length;i++)
 		{
 			if(n%2==0)
 			{
 			    checkboxes[i].checked=true;
 			}else
 			{
 			    checkboxes[i].checked=false;
 			}
 		}
 		n++;
 	}

function ev_add()
{
    view_form("${ROOT}/editInfo.do?method=add");
}

function ev_update()
{
    var rowid = null;
    var count =0;
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
        count = count +1;
        rowid = selectedRow[i].value;
      }
    }
   if (count >1)  {
        alert("请只选择一条记录进行修改！");
        return ;
   }
  if (count ==1) {
  	 view_form("${ROOT}/editInfo.do?method=update&infoID="+rowid);
  }
  else{
  	alert("请选择一条需要修改的记录！");
    return ;
  }
}

function ev_del()
{
   var count=0;
   var selected=new Array();
    var selectedRow = document.getElementsByName("selectedRow");
    for (i=0;i<selectedRow.length;i++){
      if (selectedRow[i].checked){
         count = count +1;
         selected[i]=selectedRow[i].value;
      }
    }
    if (count >0)  {
      if (window.confirm("您确认要删除记录？")) {
      	 infoForm.target="_self";
	     infoForm.action = "/deleteInfo.do";
         infoForm.submit();
      }
    }else {
       alert("您还没选择记录!");
    }
}

function ev_publish(){
	var ids = getAllChecked("selectedRow");
	var url = "${ROOT}/publishInfo.do?ids=" + ids;
    LoadAjaxContent(url,writePublishDate);  
}

function writePublishDate(){
	var back =this.request.responseText;
	var dateInfos = back.split(";");
	for(var i=0; i<dateInfos.length; i++){
		var dateInfo = dateInfos[i];
		var td = document.getElementById("publishDate_"+dateInfo.split(",")[0]);
		if(td){
			td.innerHTML=dateInfo.split(",")[1];
		}
	}
}


</script>
</head>

 <body>
 <table id=toolBar border=0  width="100%" ><tr><td background="${ROOT}/images/cmd.jpg" height="30"><table width="100%">
   <tr>
       <td align=left width=3 ><img src="${ROOT}/images/cmd01.gif" ></td>
          <td id=search onaction="" width="500"> 
			 <input type="button" class="button" value="新增" onclick="javascript:ev_add();">
			 <input type="button" class="button" value="修改" onclick="javascript:ev_update();">
			 <input type="button" class="button" value="删除" onclick="javascript:ev_del();">
			 <input type="button" class="button" value="发布" onclick="javascript:ev_publish();">
		  </td>
   </tr>
</table></td></tr> 
 </table>
 <div align="center" class="title">公告浏览</div>
 
 
  <form   name="infoForm" method="post" action="" >
<table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0">
  <tr>
    <td width="8%" nowrap align="center" class=header onClick="ev_select();">选择</td>
	
	<page:tabTitle title="标题" column="title"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="32%" align="center"/>
	<td width="20%" nowrap align="center" class=header >发布时间</td>
    <page:tabTitle title="起始时间" column="beginDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="20%" align="center"/>
    <page:tabTitle title="截止时间" column="endDate"  downImg="images/order-desc-red.gif" upImg="images/order-asc-red.gif" tdClass="header" width="20%" align="center"/>
  </tr>
  
 <logic:notEmpty name="infoList">
 <logic:iterate id="info" name="infoList" type="com.shengdai.kpi.common.valueobject.Info" scope="request" indexId="index" >
  <tr align="center" onmouseover='this.style.backgroundColor="#EFEFEF"'  style.cursor='default' onmouseout='this.style.backgroundColor="#ffffff"' bgColor=#ffffff>
	<td><div align="center">
		<input type="checkbox" name="selectedRow" id="<bean:write name="info" property="id"/>" value="<bean:write name="info" property="id"/>">
	</div></td>
	<td align="left"><a href="javascript: view_form('${ROOT}/editInfo.do?method=update&infoID=<bean:write name="info" property="id" />');">
			<bean:write name="info" property="title" />
		</a>
	</td>
	<td id="publishDate_<bean:write name="info" property="id" />" align="center">
	<bean:write name="info" property="publishDate" format="yyyy-MM-dd HH:mm"/></td>
	<td><bean:write name="info" property="beginDate" format="yyyy-MM-dd HH:mm"/></td>
	<td><bean:write name="info" property="endDate" format="yyyy-MM-dd HH:mm"/></td>
	</tr>
</logic:iterate>
</logic:notEmpty>
 
</table><br>

<table width="95%" border="0"><tr><td align="right">
<page:root inputclass="editline" /></td></tr></table>
  </form>
  </body>
</html>
