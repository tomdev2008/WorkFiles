<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>我的地址本</title>
		<%@ include file="/web/pub/head.inc"%>
	</head>
	
	<body style="background-color:#eff0f4">	
			
			<div align="left" style="margin-top:10px;padding-left:30px;">
				
				
				<!-- 调用弹出dlg -->
				<!-- 参数调用：
					/*
					 * 弹出地址本页面
					 * type:orgType(0;10;20)	待选列表，数据显示范围    0:部门;   10:岗位   20:人员     100:动态处理人规则
					 * multi:0,i,n	已选列表是否可多选
					 * manage:0,1	是否完整显示地址本菜单树（现默认1）
					 * targetTextId:页面显示地址数据的ELEMENT_ID
					 * targetValueId：页面储存地址数据的ELEMENT_ID
					 * onReturn:回调函数（直接调用的方法）
 					 * orgids:指定的部门id,有多个部门ID则需要用";"分隔 "id1;id2"
 					 *
					 * manage:可以直接使用现有套餐，或自定义菜单、还有单选类别等；具体使用可参考下面的参数调用方法；
					 *       套餐类别：
					 * 				===>可选套餐： 0：(我的可管理部门，收藏夹)；1:默认地址本（我的部门，我的收藏夹，组织架构）;
					 *			    ===>自定义套餐,可自由从下面的单选类别中找出对应的菜单项，以分隔符“;”,进行菜单的自由组合；
					 *								 例如:('4;6'),此套餐显示的菜单，'我的部门；组织架构'     
					 *										('4;6;7'),此套餐显示的菜单，'我的部门；我的收藏夹;组织架构'   
					 * 
					 *		 单选类别：								
					 *                 ===>组织架构类别：  3:我的可管理部门 ;4:组织架构 5:我的分公司;  6:我的部门;  7：我的收藏夹;  8:自定义组织id（根据传递的部门ID，展现部门树）;9：不做权限的全省组织架构;
					 *                 ===>非组织架构类别：10:角色；15：通用岗位 ；20：专业线; 25: 考核关系群组; 30 考核指标类型
					 *
					 *
					 * */
					getAddressList(type,multi,manage,targetTextId,targetValueId)
					
					
					
					
				 -->
				 
				<a  class="choose" href="#" onclick="getAddressList('0;10;20','1','0','targetTypeText','targetTypeID');">我的可选择部门(单选)</a>
				<a  class="choose" href="#" onclick="getAddressList('0;10;20','5','0','targetTypeText','targetTypeID');">我的可选择部门(选5个)</a>
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','0','targetTypeText','targetTypeID');">我的可选择部门(多选)</a>
          		<br/><br/>
				 
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','1','targetTypeText','targetTypeID');">默认地址本（我的部门，组织架构）</a>
          		
          		&nbsp;&nbsp;&nbsp;
          		
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','4','targetTypeText','targetTypeID');">全省组织架构</a>
          		
          		&nbsp;&nbsp;&nbsp;
          		
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','5','targetTypeText','targetTypeID');">我的分公司</a>
          		
          		&nbsp;&nbsp;&nbsp;
          		
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','6','targetTypeText','targetTypeID');">我的部门</a>
          		
          		&nbsp;&nbsp;&nbsp;<!-- 对全省管理员身份无效 -->
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','8','targetTypeText','targetTypeID','','OR1200000705');">自选部门-江门</a>
          		&nbsp;&nbsp;&nbsp;
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','8','targetTypeText','targetTypeID','','OR1200000705;OR1200000702');">自选部门-江门-广州</a>
          		<br/><br/>
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','10','targetTypeText','targetTypeID');">角色选择</a>
          		
          		&nbsp;&nbsp;&nbsp;
          		
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','15','targetTypeText','targetTypeID');">通用岗位选择</a>
          		
          		&nbsp;&nbsp;&nbsp;
          		
          		<a  class="choose" href="#" onclick="getAddressList('0;10;20','n','20','targetTypeText','targetTypeID');">专业线选择</a>
          		
          		 <br/><br/>
          		<a  class="choose" href="#" onclick="getAddressList('100','n','0','targetTypeText','targetTypeID');">动态处理人规则</a>
				 <br/>
          		
          		<br/><br/>
          		
          		
          		展现名称：
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		返回地址隐藏ID: 
          		<br />
          		<!-- 地址名称显示 -->
          		<TEXTAREA  value="" name="typeName" id="targetTypeText" rows="20" cols="30" >	</TEXTAREA>
          		
          		&nbsp;&nbsp;&nbsp;&nbsp;
          		<!-- 返回地址隐藏ID -->
          		<TEXTAREA  value="" name="targetTypeID" id="targetTypeID" rows="20" cols="30" ></TEXTAREA>
          		
          		<form action="">
          		<%
          		//动态处理人规则测试
          		//Handler k=HandlerHelper.replace("","100_个人客户室-被考核人_5#OR1200003478");
				//out.println(k.getId());
          		//	out.println(k.getText());
          		//	out.println(k.getValue());

          			
          			//8a9260f51748aef6011748ca2e220003 
          		 %>
          		
          		</form>
          		
			</div>
			
			<div>
				
			</div>
	</body>
</html>