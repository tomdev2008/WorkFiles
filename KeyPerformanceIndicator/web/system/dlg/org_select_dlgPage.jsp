<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>
	我的地址本
</title>
</head>
<frameset id="frame" cols="200,*" framespacing="0" frameborder="no" border="0">
  	<frame src="<%=request.getContextPath()%>/org_tree.do?type=${param.type}&jsFunc=select_org_by_type&manage=${param.manage}&oids=${param.oids}" name="ftree" scrolling="no" noresize >
 	<frame src="<%=request.getContextPath()%>/orgSelecteForm.do?multi=${param.multi}&manage=${param.manage}&type=${param.type}&oids=${param.oids}" name="fbody" scrolling="no">		
</frameset>
</html>
