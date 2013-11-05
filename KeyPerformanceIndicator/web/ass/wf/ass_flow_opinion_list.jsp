 <%@ page contentType="text/html; charset=UTF-8" %>
<!-- 流程意见 -->
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="LN_infbox-border">
  <tr>
    <td height="3" bgcolor="#4F81CE"></td>
  </tr>
  <tr>
    <td class="LN_boxtitlebg">考核过程处理意见</td>
  </tr>
<tr>
<td>
<iframe src="${ROOT}/listFlowOpinions.do?resourceId=${assessment.id}&nodeCode=${param.nodeCode}" width="100%" frameborder="0"></iframe>
  </td>
 </tr>
</table>

