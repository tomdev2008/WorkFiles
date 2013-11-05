 <%@ page contentType="text/html; charset=UTF-8" %>
<!-- 附件 -->
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
 <tr>
    <td class="LN_boxtitlebg"><strong>附件上传</strong></td>
  </tr>
  <td>
 <iframe name="attachFrame" src="${ROOT}/listResourceAttach.do?resourceId=${assessment.id}&isupload=${isUndo}&download=${isUndo}&delete=${isUndo}" 
    				width="100%" frameborder="0" ></iframe> 
  </td>
 </tr>
</table>


