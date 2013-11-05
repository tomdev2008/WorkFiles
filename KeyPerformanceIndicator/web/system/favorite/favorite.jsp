<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	添加到收藏夹
</title>
<%@ include file="/web/pub/head.inc"%>
<script type="text/javascript">
<!--
window.returnValue ="";
function save2()
{
  //alert(document.getElementById("selectFolder").value);
  if(window.returnValue.length>2)
  {
  	window.returnValue =window.returnValue+";"+document.getElementById("selectFolder").value;
  }
  else
  {
     window.returnValue ="noAdd;"+document.getElementById("selectFolder").value;
  }
  
  window.close();
}
function close2()
{
  
   window.close();
}

		function add2(){
		    var parentId = document.getElementById("selectFolder").value;
		    var ret= window.showModalDialog('${ROOT}/createPersonFolder.do?showType=dlg&parentId='+parentId, window, 'dialogHeight:220px;dialogWidth:350px;scroll=no;resizable=no;status=no');
			
			if(ret=="true")
			{
			
			window.returnValue ="addFolder";
			//alert(ret);
			document.getElementById("ftree").src="${ROOT}/treePersonFolder.do?jsFunc=list_folder&listType=select";
			  //alert( document.frames("ftree").location);
			 //  alert(document.getElementById("ftree"));
			 //document.frames("ftree").location.src="${ROOT}/treePersonFolder.do?jsFunc=list_folder&listType=select";
			 // document.frames("ftree").document.location.reload(true);   
			  // document.ftree.location.reload()
			  //onclick="javascript:document.frames['hiddenframe'].location.reload(true);"
			}
		}
//-->
</script>
</head>
<body>
	<form id="form" name="form" method="post" action="">
	<input type="hidden" name="selectFolder" value="" />
	<table width="100%" height="260px;" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
        <td align="center" valign="top"  class="address-text-bg">
	      <table width="100%" height="186px;" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18%" valign="top"  align="left" rowspan="3" height="22px;">&nbsp;要添加的<br>&nbsp;数&nbsp;&nbsp;&nbsp; 据</td>
                <td width="72%" colspan="2" height="22px;" rowspan="3" align="left" valign="top">
                	<textarea name="showData" cols="40" rows="3" readonly= "true"></textarea>
                <br />                
                </td>
              </tr>
              <tr height="22px;">
              </tr>
              <tr height="22px;">
              </tr>
              <tr>
                <td colspan="3" height="2px;" >&nbsp;</td>
              </tr>
              <tr>
                <td colspan="3" height="118px;" >
            		<div class="collection-titlebg">
            			<div class="collection-title">添加到</div>
            		</div>
					<table width="100%" border="0" cellpadding="1" cellspacing="1" class="define-right">
  					<tr>
    					<td height="100px;"  width="88%" >
	    				<div id="divTree2" class="sidebar">
						<iframe id="ftree" src="${ROOT}/treePersonFolder.do?jsFunc=list_folder&listType=select"  scrolling="auto"  frameborder="0" name="ftree" width="100%" height="100%"></iframe>
        				</div>
	  					</td>
  					</tr>
					</table>
				</td>
              </tr>
           </table>
		    <br style='line-height:2px;'></br>     
		   <div height="72px;" >
		   <input name="Submit1" type="button" id="Submit1" class="dialog-button2" value="确 定" onClick="save2();"/>
		   <input name="Submit2" type="button" id="Submit2" class="dialog-button2" value="关 闭" onClick="close2();"/>
		   <input name="Submit3" type="button" id="Submit3" class="dialog-button2" value="新建目录" onClick="add2();"/>
		   </div>
		 </td>
        </tr>
      </table>
	
    </form>
</body>
<script>
　　var obj = window.dialogArguments;
　//　alert("您传递的参数为：" + obj.name);
   if( document.getElementById("showData")!=null)
   {
   //   alert("hoho");
     document.getElementById("showData").value=obj.name;
   }    
</script>
</html>