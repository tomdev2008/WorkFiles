<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	功能列表
</title>
	<%@ include file="/web/pub/head.inc"%>
</head>
<body >
	<div class="kpi">
		<div id="divTree" class="sidebar">
			<h3>功能列表</h3>
			<iframe id="ftree"  src="${ROOT}/getResourceTree.do?jsFunc=listResource" scrolling="auto" frameborder="0" name="ftree" width="100%" height="100%"></iframe>
		</div>
		<div id="divList" class="content2">
			<iframe src="${ROOT}/listResource.do" id="fbody" scrolling="no" frameborder="0" name="fbody" width="100%" height="100%"></iframe>
		</div>
	</div>
</body>
</html>