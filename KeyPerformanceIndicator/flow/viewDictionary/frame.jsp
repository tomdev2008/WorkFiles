<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<frameset name="mainFrame" rows="60%,*" border="5" frameborder="1" FRAMESPACING="4"  TOPMARGIN="0"  LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0" bordercolor="#ECEAE6">
  <frame src="${ROOT}/listViewDictionary.do?" name="upFrame" scrolling="auto" frameborder="yes">
  <frame src="${ROOT}/showViewDictionary.do?" name="downFrame"   scrolling="auto">
</frameset>
<script>
  mainFrame.rows="100%,*"
</script>
<noframes>