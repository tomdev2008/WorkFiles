<%@page import="cn.com.mmsweb.action.util.SessionUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/jsp/head.jsp" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String groupsId = request.getParameter("groupsId");
   String gName = request.getParameter("groupsName");
%>

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
<link href="<%= realPath%>common/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%= realPath%>common/js/jQs.js"></script>
<script type="text/javascript" src="<%= realPath%>common/js/jstools_mini.js"></script>
<script type="text/javascript" src="<%= realPath%>common/js/light-box.js"></script>
<script type="text/javascript" src="<%= realPath%>common/js/common.js"></script>

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
})

//根据Id查询联系人
function contactById(id){
	jQuery.post(ctxPath+"/contacts!findContactById.action",{
			'model.id':id,
		},
		function(data) {
			//var data = eval('(' + data + ')');
			if(null!=data && ""!=data){
				if(data.msg=="ok"){
					$("#id").val(data.groupContactsVo.contactsId);
					$("#name").val(data.groupContactsVo.contactsName);
					$("#birthday").val(data.groupContactsVo.birthday);
					$("#phone").val(data.groupContactsVo.msn);
					$("#email").val(data.groupContactsVo.email);
					$("#groupsId").val(data.groupContactsVo.groupsId);
					addLink.Show();
				}
			}
	},'json');
}
//检测生日
function checkBir(bir)
{
	var reDate = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29))$/;
		return reDate.test(bir);
}
//检测邮箱
function isEmail(str){
    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    return reg.test(str);
}
//检测手机号
function isPhone(str)
{
	var reg=/^1[0-9]{10}$/;
	return reg.test(str);
}
//添加和修改联系人
function addContacts() {
	var id=$("#id").val();
	var contactsName=$("#name").val();
	var groupsId=$("#groupsId").val();
	var email=$("#email").val();
	var birthday=$("#birthday").val();
	var phone=$("#phone").val();
	if(null!=id && ""!=id && -1!=id){           //修改联系人
		 if(contactsName=="")
				   {
				  alert("请输入联系人名称！");
				   }else if(phone=="")
					   {
					   alert("请输入电话号码！");
					   }else if(birthday=="")
						   {
						   alert("请输入生日！");
						   }
				   else if(checkBir(birthday)==false && birthday!="")
			{
			alert("请输入正确的日期！");
			}else if(isEmail(email)==false && email!="")
				{
				alert("请输入正确的邮箱！");
				}else if(isPhone(phone)==false && phone!="")
					{
					alert("请输入正确的手机号码！");
					}
		else{
		   $.ajax({ 
			   type: "post", 
			   url: ctxPath+"/contactupdate!updateContact.action", 
			   data: {
				   'groupContactsVo.contactsId':id,
				   'groupContactsVo.contactsName':contactsName,
				   'groupContactsVo.birthday':birthday,
				   'groupContactsVo.msn':phone,
				   'groupContactsVo.email':email,
				   'groupContactsVo.groupsId':groupsId
				   },
			   success: function(data){
				   if(null!=data && ""!=data){
						if(data.msg=="ok"){
							alert("修改成功！");
							location.reload();
						}else if(data.msg=="error"){
							alert("修改失败！");
						}
					}
				   } //操作成功后的操作！msg是后台传过来的值 
		   })    
			}
	}else{                                       //添加联系人
	   if(contactsName=="")
		   {
		  alert("请输入联系人名称！");
		   }else if(phone=="")
			   {
			   alert("请输入电话号码！");
			   }else if(birthday=="")
			   {
				   alert("请输入生日！");
				   }
	   else if(checkBir(birthday)==false && birthday!="")
			{
				alert("请输入正确的日期！");
			}else if(isEmail(email)==false && email!="")
				{
					alert("请输入正确的邮箱！");
				}else if(isPhone(phone)==false && phone!="")
					{
					alert("请输入正确的手机号码！");
					}else{
			   $.ajax({ 
				   type: "post", 
				   url: ctxPath+"/contactsave!addContact.action", 
				   data: {
					   'groupContactsVo.contactsName':contactsName,
					   'groupContactsVo.birthday':birthday,
					   'groupContactsVo.msn':phone,
					   'groupContactsVo.email':email,
					   'groupContactsVo.groupsId':groupsId
					   },
				   success: function(data){
						if(null!=data && ""!=data){
							if(data.msg=="ok"){
								alert("添加成功！");
								location.reload();
							}else if(data.msg=="error"){
								alert("添加失败！");
							}
						}
					   } //操作成功后的操作！msg是后台传过来的值 
			   })
				   } 
	}
}

//根据分组查询联系人
function groupsList(id){
	jQuery.post(ctxPath+"/contactBygroups!contractByGroupsId.action",{
				'groupsId':id,
			},
			function(data){},'json');
}
//添加和修改分组
function addGroups()
{   
	var parm="";
	var groupName=$("#groupName").val();
	var gid=$("#gId").val();
	if(groupName=="")
		{
		alert("组名不能为空！");
		}else if(gid!=null && gid!="")    //修改
			{
			 $("#linkMan li").each(function(){
				 parm +=$(this).attr("id")+",";
			 })
			 $.ajax({ 
						   type: "post", 
						   url: ctxPath+"/groupupdate!updateGroup.action", 
						   data: {
							   'groupsId':gid,
							   'groupName':groupName,
							   'id':parm
							   },
						   success: function(data){
							   if(null!=data && ""!=data){
									if(data.msg=="ok"){
										alert("修改成功！");
										location.reload();
									}else if(data.msg=="error"){
										alert("修改失败！");
									}
								}
							   fzBox.Close();
							   } //操作成功后的操作！msg是后台传过来的值 
					   })
			}
	else{    //添加
	 $("#linkMan li").each(function(){
		 parm +=$(this).attr("id")+",";
	 })
	 $.ajax({ 
				   type: "post", 
				   url: ctxPath+"/groupsave!addGroup.action", 
				   data: {
					   'groupName':groupName,
					   'id':parm
					   },
				   success: function(data){
					   if(null!=data && ""!=data){
							if(data.msg=="ok"){
								alert("添加成功！");
								location.reload();
							}else if(data.msg=="error"){
								alert("添加失败！");
							}
						}
					   fzBox.Close();
					   } //操作成功后的操作！msg是后台传过来的值 
			   })
		}
}
//获取点击选择的联系人
//params联系人的value
function wantContactsForCheck(params,name) {
	//var thenewcontact = params.innerHTML;
	//var id=$(params).val();
var li= '<li title="\''+name+'\'" id="'+params+'" onclick="deletelink(\''+params+'\')">'+name+'</li>';
var flat = true;
   $("#linkMan li").each(function(){
	  if($(this).attr("id")==params){
		flat = false;
	  }
	  });
   if(flat){
	  $("#linkMan").append(li);
   }
}

function deletelink(id)
{
 $("#"+id+"").remove();
}

//批量删除
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
//根据Id删除
function deleteById(parm)
{
	if(confirm("确定删除?")) {ctxPath+"/contactsave!addContact.action",
		jQuery.post(ctxPath+"/contactdelete!deleteById.action",{//
			'id':parm,
		},
		function(data) {
		//	var data = eval('(' + data + ')');
			if(null!=data && ""!=data){
				if(data.msg=="ok"){
					alert("删除成功！");
					$("input:checked").parent().parent().remove(); 
					location.reload();
				}else if(data.msg=="error"){
					alert("删除失败！");
				}
			}
	},'json');
			}
}

//加载联系人
function loadGroupContract(){
	var groupContract = $("#groupContract");
	groupContract.html("");//清除select中的 option
	jQuery.post(ctxPath+"/getContactsByNotGroups!getContactsByNotGroups.action",
	function(data) {
		if(null!=data && ""!=data){
			for(var i = 0;i < data.groupList.length; i++) {
				/* var opt = $("<dt>").text(data.groupList[i].name).val(data.groupList[i].id); */
				var li= '<li title="\''+data.groupList[i].name+'\'" onclick="wantContactsForCheck(\''+data.groupList[i].id+'\',\''+data.groupList[i].name+'\')">'+data.groupList[i].name+'</li>';
			/* 	opt.mouseover(function(){
					$(this).addClass("over");
				});
				opt.mouseout(function(){
					$(this).removeClass("over");
				});
				opt.click(function(){
					$(this).parent().toggleClass("show-dd");
				}); */
		/* 		groupContract.append(opt);
				var contractsList = data.groupList[i].contactslist;
				for(var j = 0 ; j<contractsList.length; j++ ){
					var dd = $("<dd>").text(contractsList[j].name).val(contractsList[j].id);
					var id=dd.val();
					dd.mouseover(function(){
						$(this).addClass("over");
					});
					dd.mouseout(function(){
						$(this).removeClass("over");
					});
					dd.click(function(){
						wantContactsForCheck(this);
					});
					groupContract.append(dd);
				} */
		/* 		var id=dd.val();
				dd.mouseover(function(){
					$(this).addClass("over");
				});
				dd.mouseout(function(){
					$(this).removeClass("over");
				});
				dd.click(function(){
					wantContactsForCheck(this);
				}); */
				groupContract.append(li);
			}
		}
	},'json');
}

//删除分组
function delGroups()
{
	var gid=$("#gId").val();
	var parm="";
	 $("#linkM li").each(function(){
		 parm +=$(this).attr("id")+",";
	 })
	 $.ajax({ 
				   type: "post", 
				   url: ctxPath+"/groupdel!delGroups.action", 
				   data: {
					   'groupsId':gid,
					   'id':parm
					   },
				   success: function(data){
					   if(null!=data && ""!=data){
							if(data.msg=="ok"){
								alert("删除成功！");
								location.reload();
							}else if(data.msg=="error"){
								alert("删除失败！");
							}
						}
					   } //操作成功后的操作！msg是后台传过来的值 
			   })
}
function showAddContacts(){
	$("#delGroup").hide();
	loadGroupContract();
	fzBox.Show();
}

function showAddContacts2(){
	$("#delGroup").show();
	var groupsId = '${groupsId}';
	var gName = '${groupName}';
    if(groupsId=="" || groupsId==null)
    	{
    	alert("请选择您要管理的组！");
    	}else{
    		 $.ajax({ 
				   type: "post", 
				   url: ctxPath+"/contactGroup!listContract.action", 
				   data: {
					   'groupsId':groupsId
					   },
				   success: function(data){
					   if(null!=data && ""!=data){
							for(var i = 0;i < data.listContacts.length; i++) {
								var li= '<li title="\''+data.listContacts[i].contactsName+'\'" id="'+data.listContacts[i].contactsId+'" onclick="deletelink(\''+data.listContacts[i].contactsId+'\')">'+data.listContacts[i].contactsName+'</li>';
									  $("#linkMan").append(li);
							}
							}
					   } //操作成功后的操作！msg是后台传过来的值 
			   })
    $("#gId").val(groupsId);
    $("#groupName").val(gName);
	loadGroupContract();
	fzBox.Show();
    	}
}
function closeDIV()
{
	addLink.Close();
	$("#id").val("");
	$("#name").val("");
	$("#birthday").val("");
	$("#phone").val("");
	$("#email").val("");
}
/* function showGroupsM()
{
	var groupsId = '${groupsId}';
	var gName = '${groupName}';
    if(groupsId=="" || groupsId==null)
    	{
    	alert("请选择您要管理的组！");
    	}else{
    		 $.ajax({ 
				   type: "post", 
				   url: ctxPath+"/contactGroup!listContract.action", 
				   data: {
					   'groupsId':groupsId
					   },
				   success: function(data){
					   if(null!=data && ""!=data){
							for(var i = 0;i < data.listContacts.length; i++) {
								var li= '<li title="\''+data.listContacts[i].contactsName+'\'" id="'+data.listContacts[i].contactsId+'">'+data.listContacts[i].contactsName+'</li>';
									  $("#linkM").append(li);
							}
							}
					   } //操作成功后的操作！msg是后台传过来的值 
			   })
    $("#grId").val(groupsId);
    $("#groupNames").val(gName);
	groupsm.Show();
}
}
 */
function closeDIVM()
{
	groupsm.Close();
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
            	<div class="mltitbar">
                    <h3>我的联系人</h3>
                    <span>
                        <button type="button" title="新增" onclick="javascript:addLink.Show();">新增</button><button title="删除" onclick="deleteAll()">删除</button><button type="button" title="管理组" id="updateGroup" onclick="showAddContacts2();">管理组</button><!-- <button type="button" title="导入联系人" class="b4">导入联系人</button> -->
                    </span>
                </div>
                <div class="tbl-list llx">
                	<table cellspacing="0" cellpadding="0">
                    	<tr>
                        	<th class="w1"><input type="checkbox" name="" id="checkAll"/></th>
                            <th class="w2"></th>
                            <th class="w3">姓名</th>
                            <th class="w4">生日</th>
                            <th class="w5">移动电话</th>
                            <th class="w6">E-mail</th>
                            <th class="w7">联系组</th>
                            <th class="w8">操作</th>
                        </tr>
                        <s:iterator value="listContacts">
                        <tr>
                        	<td class="w1"><input type="checkbox" name="items" id="<s:property value="contactsId"/>_<s:property value="groupsId"/>"/></td>
                            <td class="w2"><img src="<%=realPath%>common/images/ico_lxr.gif"/></td>
                            <td class="w3"><s:property value="contactsName"/></td>
                            <td class="w4"><s:property value="birthday"/></td>
                            <td class="w5"><s:property value="msn"/></td>
                            <td class="w6"><s:property value="email"/></td>
                            <td class="w7"><s:property value="groupsName"/></td>
                            <td class="w8"><button title="编辑" onClick="contactById(<s:property value="contactsId"/>);">编 辑</button><button title="删除" onclick='deleteById("<s:property value="contactsId"/>_<s:property value="groupsId"/>");' >删 除</button></td>
                        </tr>
                        </s:iterator>
                    </table>
                </div>
                 <div class="in-page" id="all">
                   <s:url id="url_home" value="contact.action">
                     <s:param name="pageNow" value="1"></s:param>
                   </s:url>
                   <s:url id="url_pre" value="contact.action">
                     <s:param name="pageNow" value="pageNow-1<=0?1:pageNow-1"></s:param>
                   </s:url>
                   <s:url id="url_next" value="contact.action">
                     <s:param name="pageNow" value="pageNow+1>maxPage?maxPage:pageNow+1"></s:param>
                   </s:url> 
                    <s:url id="url_last" value="contact.action">
                     <s:param name="pageNow" value="maxPage"></s:param>
                   </s:url> 
                   <s:a href="%{url_home}">首页</s:a>
                    <s:a href="%{url_pre}">上一页</s:a>
                  <s:a href="%{url_next}">下一页</s:a>
                   <s:a href="%{url_last}">末页</s:a>
                  </div>
            </div>
		</div>
		<div class="m-right m-right2">
			<div class="rbox-lxr">
            	<span class="rbox-lxr-tit">联系人</span>
                <ul class="rbox-lxr-fl">
                	<li class="png on" id="allli"><a href="contact.action">所有联系人</a></li>
                    <li class="png">常用联系人</li>
                </ul>
                <span class="rbox-lxr-tit2">联系组<em title="新增联系组" id="addGroup" onclick="showAddContacts();"></em></span>
                <ul class="rbox-lxr-fz">
                 <s:iterator id="group" value="listGroups">
                	<li id="orderli"><a href='contact.action?groupsId=<s:property value="id"/>' id="<s:property value="id"/>"><s:property value="name"/></a></li>
                    </s:iterator>
                </ul>
			</div>
		</div>
	</div>
</div>
<!-- FOOT begin-->
<jsp:include page="../foot.jsp" />
<!-- FOOT end-->

<!--联系人分组弹窗 lightbox-->
<div id="fzBox" style="display:none">
	<div class="lbox538">
		<i class="lbox-tbg png"></i>
		<div class="lbox-bg png">
			<div class="lbox538-top"><h3>新建联系组</h3><span class="btn-close2" title="关闭" onClick="javascript:fzBox.Close();"></span></div>
			<div class="lbox538-cons">
				<div class="t-input"><input type="text" id="groupName" name="" /></div>
				<div class="t-choose">
					<span class="jt"></span>
					<div class="ch-left">
					<input id="gId" type="hidden"></input>
						<h3>联系人</h3>
						<div class="ch-box">
							<div class="ch-sou">
								<input type="text" name="" value="查找联系人..." onFocus="if (this.value=='查找联系人...'){this.value='';}; this.style.color='#666';" onBlur="if (this.value==''){this.value='查找联系人...';this.style.color='#666';}" />
								<button type="button" title="搜索"></button>
							</div>
							<ul class="user-box">
							    <li>
									<p>未分组联系人</p>
										<ul id="groupContract"></ul>
							    </li>
							</ul>
						</div>
					</div>
					<div class="ch-right">
						<h3>已有联系人</h3>
						<div class="ch-box">
							<ul class="user-selected" id="linkMan">
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="lbox538-bot">
			     <input type="button" id="delGroup" value="删除此分组" style="float: left;margin-left: 5px;margin-top: 5px;display: none;" onclick="delGroups();"></input>
				<button title="保存" class="btn1" onClick="addGroups();"></button>
				<button type="button" title="取消" class="btn2" onClick="javascript:fzBox.Close();"></button>
			</div>
		</div>
		<i class="lbox-bbg png"></i>
	</div>
</div>
<!--联系人分组弹窗 lightbox end-->
<!--新增联系人-->
<div id="addLink" style="display:none">
	<div class="lbox538">
		<i class="lbox-tbg png"></i>
		<div class="lbox-bg png">
		<form id="addVmform" method="post">
		<div class="lbox538-top"><h3>联系人</h3><span class="btn-close2" title="关闭" onClick="closeDIV();"></span></div>
			<div class="lbox538-cons">
			    <input id="id" name="groupContactsVo.contactsId" type="text" style="width: 250px;height: 18px; display: none;"  />
				<div ><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：</font><input id="name" name="groupContactsVo.contactsName" type="text" style="width: 250px;height: 22px;" /></div>
			     <br/>
			    <div style="margin-left: 40px"><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生日：</font><input id="birthday" name="groupContactsVo.birthday" type="text" style="width: 250px;height: 22px;" /><font style="color: red;">yyyy-mm-dd</font></div>
			     <br/>
			    <div ><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;E-mail：</font><input id="email" name="groupContactsVo.email" type="text" style="width: 250px;height: 22px;" /></div>
			     <br/>
			      <div><font style="font-size: 13px;">&nbsp;&nbsp;移动电话：</font><input id="phone" name="groupContactsVo.msn" type="text" style="width: 250px;height: 22px;" /></div>
			     <br/> 
			    <div><font style="font-size: 13px;">&nbsp;&nbsp;所属分组：</font><select id="groupsId" style="width: 255px;height: 23px;" name="groupContactsVo.groupsId"><s:iterator id="group" value="listGroups"> <option value="<s:property value="id"/>"><s:property value="name"/></option></s:iterator></select></div>
			</div>
			<div class="lbox538-bot">
			<input type="button" style="float: right;margin-right: 5px;margin-top: 2px;" value="取消" onclick="closeDIV();"/>
			<input type="button" style="float: right;margin-right: 5px;margin-top: 2px;" value="保存" onclick="addContacts();"/>
			<!-- 	<button title="保存" class="btn1" onclick="test();"></button> -->
			<!-- 	<button type="button" title="取消" class="btn2" onClick="closeDIV();"></button> -->
			</div>
			</form>
		</div>
		<i class="lbox-bbg png"></i>
	</div>
</div>	


<div id="groupsm" style="display:none;">
	<div class="lbox538" style="width: 400px">
		<!-- <i class="lbox-tbg png"></i> -->
	<!-- 	<div class="lbox-bg png" style="width: 400px"> -->
		<form id="addVmform" method="post">
		<div class="lbox538-top" style="width: 390px"><h3>管理组</h3><span class="btn-close2" title="关闭" onClick="closeDIVM();"></span></div>
			<input id="grId" type="hidden"></input>
			<div class="lbox538-cons" style="width: 338px">
			<div style="margin-left: 5px;"><font style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;组名：</font><input id="groupNames" name="" type="text" style="width: 250px;height: 22px;" /></div>
			     <br/>
			 <div class="ch-left">
						<h3>已有联系人</h3>
						<div class="ch-box">
							<ul class="user-selected" id="linkM">
							</ul>
						</div>
					</div>
			</div>
			<div class="lbox538-bot" style="width: 390px">
			<input type="button" style="float: right;margin-right: 5px;margin-top: 5px;" value="取消" onclick="closeDIVM();"/>&nbsp;&nbsp;&nbsp;
			<input type="button" id="dGroup" value="删除此分组" style="float: right;margin-left: 5px;margin-top: 5px;" onclick="delGroups();"></input>
			</div>
			</form>
		</div>
		<!-- <i class="lbox-bbg png" style="width: 410px"></i> -->
	</div>
<script type="text/javascript">
var groupsm=new LightBox("groupsm");
var fzBox = new LightBox("fzBox"); //联系人分组弹窗
var addLink=new LightBox("addLink");
</script>
</body>
</html>
