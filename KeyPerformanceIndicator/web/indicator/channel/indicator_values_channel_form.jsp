<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>指标取值方式</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>	
			function FF_Save(){
				var form = $_E("form1");
				if (CheckForm(form)) {
					form.submit();
				}
			}
			
		
			
			function FF_Back(){
				window.location = "${ROOT}/listIndicatorValuesChannel.do";
			}
		</script>
	</head>
<body class="LN_body">
<form action="${ROOT }/saveIndicatorValuesChannel.do" name="form1" method="post" id="form1">
<input type="hidden" name="channelId" id="channelId" value="${channel.id}"/>
<div class="LN_popupsBox">
	<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
	<div class="LN_bottomReset60"><a href="#" onclick="FF_Back();return false;">返回</a></div>
	<div class="LN_popupsSafe"><a href="#" onclick="FF_Save();return false;">保存</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">${channel.id==null?'新增':'编辑'}指标取值方式</div>
<div class="LN_colorRed">红星*是必填</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border" >
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr onclick="Util.toggle('LN_tableBox1');">
    <td class="LN_boxtitlebg">指标取值信息</td>
  </tr>
  <tr>
      <td class="LN_press" id="LN_tableBox1">
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" >
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>编码</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="code" id="code" value="${channel.code}" 
        	check="notBlank;isString('#',32)" required='true' showName='编码' class="LN_Input" />
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>名称</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="name" id="name" value="${channel.name}" 
        	check="notBlank;isString('#',100)" required='true' showName='名称' class="LN_Input" />
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">实现BEAN</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="beanName" id="beanName" 
        		check="notBlank;isString('#',100)"  showName='实现BEAN' class="LN_Input" value="${channel.beanName}"/>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">实现类</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="relaClassName" id="relaClassName" style="width:400px;" 
        		check="notBlank;isString('#',100)"  showName='实现BEAN' class="LN_Input" value="${channel.relaClassName}"/>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">是否启用</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="radio" name="flgStatus" id="flgStatus1" value="1" ${channel.flgStatus==1?'checked':''}/>是
        	<input type="radio" name="flgStatus" id="flgStatus2" value="0" ${channel.flgStatus==0?'checked':''}/>否
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">排序</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="priority" id="priority" 
        check="notBlank;isInt('+')" required='true' showName='排序' class="LN_Input" value="${channel.priority}"/>
		</td>
      </tr>
        <tr>
          <td width="15%" class="LN_tableBoxtitle">说明</td>
          <td class="LN_tableBoxText">
          <textarea name="remark" id="remark" cols="60" rows="10" style="font-size:12px;" ></textarea></td>
          </tr>
   </table>
      </td>
  </tr>
</table>
</form>
</body>
</html>