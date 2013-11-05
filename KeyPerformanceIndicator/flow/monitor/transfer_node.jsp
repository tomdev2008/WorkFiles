<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ include file="/web/pub/head.inc"%>
<html>
<head>
<title>迁移待办</title>
</head>
<script language="JavaScript" type="text/javascript">
function transfer(){
	if(!selectRadio()){
		alert("请选择一个环节！！");
		return;
	}
	 var obj = window.dialogArguments;
	 document.getElementById("msg_opinion").value=obj.msg_opinion;
	 document.all.tranBoIds.value = obj.ids;
	 showProcessor();
	 $_E("form1").action="${ROOT}/transferWorklistItem.do?fromNodeCode=${param.fromNodeCode}";
	 $_E("form1").submit();
}

function selectRadio() {   
    var radioObject = document.getElementsByName("toTranNodeCode");    
    for (var i = 0; i < radioObject.length; i++)    
    {   
            if(radioObject[i].checked) return true;    
    }
    return false;   
}
</script>
<body>
<iframe name="transFrame" src="" frameborder="0" style="display:none;"></iframe>
<form id="form1" target="transFrame" name="form1" method="post" action="" >
<input type="hidden" name="msg_opinion"/>
<table height="100%" width="100%" border="0" cellpadding="0" cellspacing="0" class="define-box">
        <tr>
          <td class="dialog-titlebg" width="100%"><div class="dialog-title">
            <input type="button" class="button2" value="确定" onclick="transfer();"/>
            <input type="button" class="button2" value="关闭" onclick="window.close();"/>
          </div></td>
        </tr>
        <tr>
          <td height="" valign="top" class="address-text-bg"><div style="overflow-y:auto;height:100%" class="scroll-net">

  <table class=listtable bordercolor=#B3BBC8 bordercolordark=#ffffff align="center"
      bordercolorlight=#B3BBC8 border=1 cellpadding="2" cellspacing="0" width="80%">
    <tr>
      <td width="20%" height="24" align="center">选择
      <input type="hidden" name="tranBoIds" value=""/>
      </td>
      <td width="70%" align="center">可选环节</td>
    </tr>
    <logic:iterate id="node" name="nodeList">
    <tr>
      <td align="center"><input type="radio" id="radio<bean:write name="node" property="nodeCode"/>" name="toTranNodeCode" value="<bean:write name="node" property="nodeCode"/>" /></td>
      <td align="left"><label for="radio<bean:write name="node" property="nodeCode"/>"><bean:write name="node" property="nodeName"/></label></td>
    </tr>
    </logic:iterate>
  </table>
            </div></td>
        </tr>
      </table>
</form>
</body>
</html>
