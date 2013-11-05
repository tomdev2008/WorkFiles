<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>考核等级设置</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>
			var newItemRow = null;
			function ev_addRow(){
				var itemListObject = document.getElementById("itemList");
				if(newItemRow){
				 	var row = newItemRow.cloneNode(true);
					itemListObject.appendChild(row);		
				}			
			}
			
			function ev_delete(contralDOM){
				if(contralDOM){
					var parentDOM = contralDOM.parentNode;
					while(parentDOM){
						if(parentDOM.nodeName=='TR') {parentDOM.removeNode(true);break;}
						else parentDOM = parentDOM.parentNode;
					}
				}
			}
			
			function do_submit(){
				var form = $_E("form1");
				if (CheckForm(form)) {
					form.submit();
				}
			}

		</script>
		
		
	</head>
<body class="LN_body">
<form action="${ROOT }/saveAssessmentGradeMapping.do" name="form1" method="post">
<div class="LN_popupsBox">
<div class="LN_formBox">
<div class="LN_formTitle">分数等级映射配置</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td>
<div class="LN_Append">
<div class="LN_popupsName">等级映射列表</div>
	<div class="LN_popupsSafe"><a href="#" onclick="do_submit();return false;">保存</a></div>
  <div class="LN_popupsAdd"><a href="#" onclick="ev_addRow();return false;">添加</a></div>
</div>
    </td>
  </tr>
  <tr>
    <td class="LN_press">
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox2">
            <tr>
            <td width="5%" class="LN_tableBoxtitle2">序号</td>
            <td width="10%" class="LN_tableBoxtitle2">编码</td>
            <td width="10%" class="LN_tableBoxtitle2">等级名称</td>
            <td width="15%" class="LN_tableBoxtitle2">分数映射</td>
            <td width="20%" class="LN_tableBoxtitle2">等级描述</td>
            <td width="8%" class="LN_tableBoxtitle2">比重(%)</td>
            <td width="25%" class="LN_tableBoxtitle2">比重类型</td>
             <td width="10%" class="LN_tableBoxtitle2">操作</td>
            </tr>
            <tbody id="itemList">
            <c:forEach var="o" items="${gradeMappings}" varStatus="idx">
            <tr id="itemTr${idx.count}">
            <td  class="LN_tableBoxText2">
			<input type="text" name="priority" class="LN_Input30" value="${o.priority}"
					 check="notBlank;isInt('+')" required='true' showName='序号'/></td>
            <td class="LN_tableBoxText2">
			<input type="text" name="code"  class="input" style="width:50px;" value="${o.code}" check="notBlank;isString('#',10)" required="true" showName="等级编号"/></td>
            <td class="LN_tableBoxText2">
			<input type="text" name="name"  class="input" style="width:50px;" value="${o.name}" check="notBlank;isString('#',20)" required="true" showName="等级名称"/></td>
            <td class="LN_tableBoxText2">
            <input type="text" name="scoreLess"  class="input" style="width:40px;" value="${o.scoreLess}" check="notBlank;isFloat()" required="true" showName="开始分数"/>~
            <input type="text" name="scoreMore"  class="input" style="width:40px;" value="${o.scoreMore}" check="notBlank;isFloat()" required="true" showName="结束分数"/></td>
            <td class="LN_tableBoxText2">
            <input type="text" name="remark"  class="input" style="width:200px;" value="${o.remark}" check="isString('#',200)" required="nullable" showName="说明描述"/></td>
            <td class="LN_tableBoxText2">
            <fmt:formatNumber var="formatScale" value="${o.scale*100}" pattern="#.#"/>
			<input type="text" name="scale"  class="input" style="width:40px;" value="${formatScale}" check="notBlank;isFloat()" required="true" showName="权重比"/></td>
            <td class="LN_tableBoxText2">
            <kpi:dictionary-select  name='scaleType' type='SCALE_CAL_TYPE' selected="${o.scaleType}" />
			</td>
            <td class="LN_tableBoxText2">
            <input name="Submit6" type="button" id="Submit6" class="LN_button" value="删除" onclick="ev_delete(this);"/></td>
            </tr>
            </c:forEach>
            </tbody>
          </table>
      </td>
  </tr>
</table>
<table style="display:none;">
            <tr id="newItemRow">
            <td  class="LN_tableBoxText2">
			<input type="text" name="priority" class="LN_Input30" value=""
					 check="notBlank;isInt('+')" required='true' showName='序号'/></td>
            <td class="LN_tableBoxText2">
			<input type="text" name="code"  class="input" style="width:50px;" value="" check="notBlank;isString('#',10)" required="true" showName="等级编号"/></td>
            <td class="LN_tableBoxText2">
			<input type="text" name="name"  class="input" style="width:50px;" value="" check="notBlank;isString('#',20)" required="true" showName="等级名称"/></td>
            <td class="LN_tableBoxText2">
            <input type="text" name="scoreLess"  class="input" style="width:40px;" value="" check="notBlank;isFloat()" required="true" showName="开始分数"/>~
            <input type="text" name="scoreMore"  class="input" style="width:40px;" value="" check="notBlank;isFloat()" required="true" showName="结束分数"/></td>
            <td class="LN_tableBoxText2">
            <input type="text" name="remark"  class="input" style="width:200px;" value="" check="isString('#',200)" required="nullable" showName="说明描述"/></td>
            <td class="LN_tableBoxText2">
			<input type="text" name="scale"  class="input" style="width:40px;" value="" check="notBlank;isFloat()" required="true" showName="权重比"/></td>
            <td class="LN_tableBoxText2">
            <kpi:dictionary-select  name='scaleType' type='SCALE_CAL_TYPE' selected="" />
			</td>
            <td class="LN_tableBoxText2">
            <input name="Submit6" type="button" class="LN_button" value="删除" onclick="ev_delete(this);"/></td>
            </tr>
</table>
</div>
</div>
</form>
<script>
	window.onload = function(){
				 var tempRow = document.getElementById("newItemRow");
				 newItemRow = tempRow.cloneNode(true);
				 tempRow.removeNode(true);
	}
</script>
</body>
</html>