<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:directive.page import="com.shengdai.kpi.container.EhcacheUtil"/>
<jsp:directive.page import="java.util.Iterator"/>
<jsp:directive.page import="net.sf.ehcache.CacheManager"/>
<jsp:directive.page import="net.sf.ehcache.Cache"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/web/pub/head.inc" %>
<%
	
	
	
 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>缓存管理</title>
		<script language="javascript">
			function eveict(id){
				var entryClass = document.getElementById("class_"+id).value;
				var entryId = document.getElementById("id_"+id).value;
				window.location.href = "${ROOT}/evictCache.do?class="+entryClass+"&id="+entryId;
			}
			
			function reloadAll(id){
				var entryClass = document.getElementById("class_"+id).value;
				window.location.href = "${ROOT}/reloadCache.do?class="+entryClass;
			}
		</script>
	</head>
	
	<body>
		<form action="" method="post" >
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="list-top" >
			<tr>
				<th class="list-title" width="5%">序号</th>
				<th class="list-title" width="45%">缓存对象</th>
				<th class="list-title" width="10%">容量（个）</th>
				<th class="list-title" width="20%">id</th>
				<th class="list-title" width="15%">操作</th>
			</tr>
			<%
				int i = 1;
				Iterator iter=EhcacheUtil.cacheEntries.keySet().iterator();
				String name="";
				Class entryClass =null;
				String n="";
				CacheManager manager=null;
				Cache cache =null;
				int size =0;
				while(iter.hasNext()){
					name = iter.next().toString();
					if(name!=null && !"".equals(name.trim())){
						entryClass = EhcacheUtil.cacheEntries.get(name);
						manager = CacheManager.getInstance();
						cache = manager.getCache(entryClass.getName());
						size = cache==null?-1:cache.getSize();
				

			 %>
				<tr>
					<td width="5%"><%=i%></td>
					<td width="40%" align="left"><%=name+"["+entryClass.getName()+"]"%></td>
					<td width="15%"><%=size%></td>
					<td width="20%"><input type="text" id="id_<%=i%>" /> </td>
					<td width="20%">
						<input type="hidden" id="class_<%=i%>" value="<%=entryClass.getName()%>" />
						<input type="button" value="清空" onclick="eveict('<%=i%>')" />
						<input type="button" value="重载" onclick="reloadAll('<%=i%>')" /> 
					</td>
				</tr>
			<%
				}}
			 %>
			</table>
			<input type="submit" value="submit" />
		</form>
	</body>
</html>