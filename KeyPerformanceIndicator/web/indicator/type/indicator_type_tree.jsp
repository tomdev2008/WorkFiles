<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />   
		<%@ include file="/web/pub/head.inc"%> 
		<link href="${ROOT}/component/xtree/xtree.css" rel="stylesheet" type="text/css" />
		<script src="${ROOT}/js/pub.js"></script>	
		<script>
		function openRight_indiType(id) {
			pageShowList("${ROOT}/listIndicatorType.do?parentId=" + id);
		}
		function openRight_indi(id){
			pageShowList("${ROOT}/listIndicator.do?typeId=" + id);
		}
		
		window.onload = function() {
			setPHeight3();
		}
</script>
<script src="${ROOT}/component/xtree/xtree.js"></script>
<script src="${ROOT}/component/xtree/xloadtree.js"></script>
<script src="${ROOT}/component/xtree/xmlextras.js"></script>
<script src="${ROOT}/js/util.js"></script>
</head>
<body onmousewheel="setScrollzheight()" style="text-align:left; padding:3px;">
<script type="text/javascript">
	var url = "${ROOT}/loadIndicatorTypeTree.do?jsMethod=${jsMethod}&randomNum=" + Math.random();
	var tree = new WebFXLoadTree("${indicatorType.name}", url);
	tree.action ="javascript:${jsMethod}('${indicatorType.id}');";
	document.write(tree);
	tree.expand();
</script>
</body>
</html>
