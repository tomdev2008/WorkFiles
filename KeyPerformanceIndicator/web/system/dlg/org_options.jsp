<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:directive.page import="com.shengdai.kpi.util.AddressHelper"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>待选列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="${ROOT}/css/kpi.css" type="text/css" />
		<script language="javascript">
			function selectItem(){
				setRemark();
				if(parent!=null)
					parent.addSelectedItem();
			}
			function setRemark(){
			
				var opt=document.getElementById("orgOptions");
				var retValue="";
				
				for(var i=0;i<opt.options.length;i++){
					if(opt.options[i].selected){
					if(retValue!=""){
						retValue+=";"+opt.options[i].remark;
					}else{
						retValue+=opt.options[i].remark;
					}
						
					}
				}
				
				if(parent.document.getElementById("addressRemark")!=null){
					parent.document.getElementById("addressRemark").innerHTML=retValue;
				}
			}
		</script>
		<script language="javascript">
			ie4 = (document.all) ? true : false; 
			function keyDown(e){ 

				if(ie4){ 
					var realkey=String.fromCharCode(event.keyCode); 
					if(event.keyCode==27){
						parent.saveSelectedValue();
					} 
				} 
			} 
			document.onkeydown = keyDown; 
		</script>
	</head>
	<body style="margin:0px;padding:0px;">
		<form METHOD="post"  action="" name="optionAction" id="optionAction">
			<input type="hidden" name="keyWord" id="keyWord" />
			<input type="hidden" name="type" id="type" />
			<input type="hidden" name="manage" id="manage" />
			<input type="hidden" name="scope" id="scope" />
			<input type="hidden" name="searchFlag" id="searchFlag" value="${searchFlag}"/>
			
			<select name="orgOptions" id="orgOptions" multiple size="16" style="width:240px;height:325px;"  onDblclick="selectItem();" >
			<c:forEach var="o" items="${list}">
				<c:set var='bgColor' value='fontcolor${o.type}' />
				<option value="${o.type}<%=AddressHelper.INFOS_SPLITOR%>${o.name}<%=AddressHelper.INFOS_SPLITOR%>${o.id}" remark="${o.infoInAddressBook }" class="${bgColor}">
					${o.name}
				</option>
			</c:forEach>
			</select>
		</form>
		<script language="javascript">
			//searchFlag值为1时表示正在进行查询状态，查询栏为提示说明
			if(document.getElementById("searchFlag").value=="1"){		//如果是查询状态，则停止查询状态，返回查询栏
				document.getElementById("searchFlag").value="";
				if(parent!=null)
					parent.showSearchInfo();
			}
		</script>
	</body>
</html>