<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="mms.tool.Tool"%>
<%@ page import="net.sf.json.*"%>
<%
Tool.reInit();
String param = request.getParameter("key");
System.out.println(param);
Hashtable<String,String> h = Tool.getBgData(param);
JSONObject jsonObject = JSONObject.fromObject(h);//格式化成json对象
out.println(jsonObject);
System.out.println(jsonObject);
%>