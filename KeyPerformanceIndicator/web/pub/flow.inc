<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/kpi.tld" prefix="kpi" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/WEB-INF/tld/page-tool.tld" prefix="page" %>
<%  
  response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
  response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
  response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
  response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility  
%>
<c:set var="ROOT" value="http://${header.host}${pageContext.request.contextPath}" scope="request" />
<script type="text/javascript">
	var context = "${ROOT}";
</script>
<LINK href="${ROOT}/css/kpi.css" type="text/css" rel="stylesheet" />
<script src="${ROOT}/js/Check.js" type="text/javascript"></script>
<script src="${ROOT}/js/common.js" type="text/javascript"></script>
<script src="${ROOT}/js/common1.js" type="text/javascript"></script>
<script src="${ROOT}/js/pub.js" type="text/javascript"></script>
<script src="${ROOT}/js/tip.js" type="text/javascript"></script>
<script src="${ROOT}/js/util.js" type="text/javascript"></script>
<script src="${ROOT}/js/ajax.js" type="text/javascript"></script>
<script src="${ROOT}/web/flow/js/flow.js" type="text/javascript"></script>

<LINK href="${ROOT}/web/flow/css/tab.css" type="text/css" rel="stylesheet" />
<LINK href="${ROOT}/web/flow/css/stylehm.css" type="text/css" rel="stylesheet" />
<LINK href="${ROOT}/web/flow/css/layout.css" type="text/css" rel="stylesheet" />
<script src="${ROOT}/web/flow/js/cb2.js" type="text/javascript"></script>
<script src="${ROOT}/web/flow/js/tabpane.js" type="text/javascript"></script>
<script src="${ROOT}/web/flow/js/common.js" type="text/javascript"></script>
<script>
	window.attachEvent("onload", function() {
		var tables = Util.$_ECss(document,"table","list-box");
		if(tables.length > 0) {
			for(var i=0;i<tables.length;i++) {
				if (tables[i].highLight != "false") {
					TableUtil.enableHighlightTr(tables[i]);
				}
			}
		}
	});
</script>


