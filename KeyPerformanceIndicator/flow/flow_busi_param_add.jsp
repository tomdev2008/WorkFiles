<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
window.name = "flowBusiParamWin";
//新增，编辑业务参数弹出窗口
function addBusiPara(){
	var fm = $_E("form1");
	if(checkJs() && CheckForm(fm)){
		fm.target = "flowBusiParamWin";
		fm.submit();
		window.returnValue = "success";
		window.close();
	}
}

function checkJs(){
	var obj = document.all.paraType.value;
	var paramObj = document.all.listValues;
	if(obj=="select"||obj=="check"||obj=="radion"){
		if(paramObj.value==""){
		alert("请输入代选参数！！");
		document.all.listValues.focus();
		return false;
		}
		try{
			var strs = paramObj.value.split(";");
				for(var i=0;i<strs.length;i++){
					var chstr = strs[i].split(",");
					if(chstr.length!=3){
					alert("请输入正确格式的代选参数！！");
					document.all.listValues.focus();
					return false;
					}
			}
		}catch(e){
			alert("请输入正确格式的代选参数！！");
			document.all.listValues.focus();
			return false;
		}
	}
	return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>业务参数配置</title>
</head>
<html:base target="_self"/>
<body>
<FORM action="${ROOT}/addBusiParam.do?id=<%=request.getParameter("id")%>" name="form1"  method="post">
	<table border="0" cellpadding="0" cellspacing="0" class="dialog-box">
        <tr>
          <td class="dialog-titlebg"><div class="dialog-title">业务参数配置</div></td>
        </tr>
        <tr>
          <td valign="top" class="dialog-text-bg"><table class="dialog-text-box" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="34%" height="14" class="dialog-text"><font color="red">*</font>业务参数名：</td>
                <td width="66%"><input type="text" name="paraName" class="input-text" showName="业务参数名" check="notBlank" required="true"/></td>
              </tr>
              <tr>
                <td height="14" class="dialog-text"><font color="red">*</font>业务参数显示名：</td>
                <td><input type="text" name="paraDisName" class="input-text" showName="业务参数显示名" check="notBlank" required="true"/></td>
              </tr>
              <tr>
                <td height="14" class="dialog-text"><font color="red">*</font>业务参数值：</td>
                <td><input type="text" name="paraValue" class="input-text" showName="业务参数值" check="notBlank" required="true"/></td>
              </tr>
              <tr>
                <td height="14" class="dialog-text"> 参数类型：</td>
                <td><select name="paraType"><option value="hidden">隐藏</option>
							 <option value="text">文本</option>
							 <option value="select">下拉列表</option>
							 <option value="check">多选</option>
							 <option value="radion">单选</option></select>
                </td>
              </tr>
              <tr>
                <td height="14" class="dialog-text">待选参数：</td>
                <td><input type="text" name="listValues"   class="input-text"/></td>
              </tr>
              <tr>
                <td colspan="2" valign="top" class="dialog-red">待选参数格式为参数1的名字，参数1的值，是否默认值；参数2..,参数格式公对下拉列表，多选，单选有效</td>
              </tr>
            </table>
              <div class="dialog-line"></div>
			  <div><input type="button" class="dialog-button2" value="确 定" onClick="javascript:addBusiPara();" />
			       <input type="button" class="dialog-button2" value="取 消" onclick="javascript:window.close();return;" />
			  </div>
			  </td>
        </tr>
      </table>
</form>
</body>
</html>

