<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@attribute name="length" type="java.lang.Integer"%>
<%@attribute name="ellipsis" type="java.lang.String"%><%
request.setAttribute("cr", "\n");  // Carriage Return
// Adding the square brackets around the <jsp:doBody> is for avoid triming the white space at the beginning and ending of the content by <c:set> automatically.
// Var isDisplayAll shows length>=htmlLength status
%><c:set var="html">[<jsp:doBody/>]</c:set>
<c:set var="htmlLength" value="${fn:length(html)}" />

<c:if test="${!empty length}">
<c:set var="html" value="${fn:substring(html, 0, (length+1))}" />
</c:if>

<c:set var="isDisplayAll" value="true" />

<c:if test="${!empty ellipsis && htmlLength>(length+2)}">
<c:set var="html">${html}${ellipsis}</c:set>
<c:set var="isDisplayAll" value="false" />
</c:if>

<c:set var="escapeXmlRemark" value="${fn:escapeXml(html)}" />
<c:choose>
<c:when test="${isDisplayAll}">
${fn:replace(fn:replace(fn:substring(escapeXmlRemark, 1, (fn:length(escapeXmlRemark)-1)), " ", "&nbsp;"), cr, "<br/>")}
</c:when>
<c:when test="${!isDisplayAll}">
${fn:replace(fn:replace(fn:substring(escapeXmlRemark, 1, fn:length(escapeXmlRemark)), " ", "&nbsp;"), cr, "<br/>")}
</c:when>
</c:choose>