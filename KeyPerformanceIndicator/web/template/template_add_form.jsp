<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>模板设置</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="/web/pub/head.inc"%>
		<link href="${ROOT }/css/layout.css" rel="stylesheet" type="text/css" />
		<script>	
			function ev_save(flag){
				var form = $_E("form1");
				if (CheckForm(form)) {
					form.submit();
				}
			}
			
		
			
			function ev_getAddress(){
				var type = '${template.scopeType}';
				var radioDom = $_EN("scopeType");
				if(radioDom){
					for(var i=0;i<radioDom.length;i++){
						if(radioDom[i].checked) type = radioDom[i].value;
					}
				}
				if(type=='20')
					type = "0;20;10;";
				else type = "0;";
				getAddressList(type,'n','0;10;','scopeObjectNames','scopeObjectValues');
			}
		</script>
	</head>
<body class="LN_body">
<form action="${ROOT }/addTemplate.do" name="form1" method="post" id="form1">
<input type="hidden" name="orgId" id="orgId" value="${org.id}"/>
<input type="hidden" name="resflush_parent" value="1"/>
<div class="LN_popupsBox">
	<div class="LN_popupsTop"></div>
<div class="LN_Append">
	<div class="LN_popupsClose"><a href="#" onclick="window.close();">关闭</a></div>
	<div class="LN_popupsSafe"><a href="#" onclick="ev_save(0);return false;">保存</a></div>
</div>
<div class="LN_formBox">
<div class="LN_formTitle">新增模板</div>
<div class="LN_colorRed">红星*是必填</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="LN_infbox-border" >
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr onclick="Util.toggle('LN_tableBox1');">
    <td class="LN_boxtitlebg">模板基本信息</td>
  </tr>
  <tr>
      <td class="LN_press" id="LN_tableBox1">
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_tableBox" >
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>模板名称</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="templateName" id="templateName" value="" style="width:300px;" 
        	check="notBlank;isString('#',100)" required='true' showName='模板名称' class="LN_Input" />
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">所属组织</td>
        <td width="50%" class="LN_tableBoxText">
        	${org.name}
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>适用对象类型</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="radio" name="scopeType" id="scopeType1" value="20" checked/>员工
        	<input type="radio" name="scopeType" id="scopeType2" value="0" />组织
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>适用考核周期</td>
        <td width="50%" class="LN_tableBoxText">
        	<kpi:dictionary-select  name='scopeAssCycle' type='ASS_CYCLE_TYPE' style="width:30px;" selected="1" htmlType="radio"/>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle"><span class="LN_colorRed">*</span>适用范围(不递归)</td>
        <td width="50%" class="LN_tableBoxText">
        <textarea name="scopeObjectNames" id="scopeObjectNames" readOnly="true" cols="45" rows="3" 
        check="notBlank;isString('#',500)" required='true' showName='适用范围'></textarea>
        <input type="hidden" name="scopeObjectValues" id="scopeObjectValues" class="LN_Input" value=""/>
			<span class="LN_tableBoxText2">
			<input name="Submit7" type="submit" id="Submit7" class="LN_big_button3" value="选择" onclick="ev_getAddress();return false;" />
			</span>
		</td>
      </tr>
      <tr>
        <td width="15%" class="LN_tableBoxtitle">排序</td>
        <td width="50%" class="LN_tableBoxText">
        	<input type="text" name="tpriority" id="tpriority" style="width:30px;" 
        check="notBlank;isInt()" required='true' showName='排序' class="LN_InputBorder" value="100"/>
		</td>
      </tr>
        <tr>
          <td width="15%" class="LN_tableBoxtitle">填表说明</td>
          <td class="LN_tableBoxText">
          <textarea name="remark" id="remark" cols="100" rows="13" style="font-size:12px;" ></textarea></td>
          </tr>
   </table>
     <br />
      </td>
  </tr>
</table>
<br/>
</form>
</body>
</html>