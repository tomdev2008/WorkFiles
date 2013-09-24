package cn.com.kxcomm.common;  
  
import java.io.BufferedInputStream;  
import java.io.BufferedReader;  
import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
import java.io.IOException;  
import java.io.InputStreamReader;  
/** 
 * 根据指定的HTML文件路径 
 * 返回一个包含html文件源码的字符串 
 *  
 */  
public class HtmlUtil {  
      
    /** 
     *  
     * @param dir 指定html的路径 
     * @return html代码 
     * @throws IOException 
     */  
    public static String getHtmlString(String dir) throws IOException{  
          
        File file=new File(dir);  
        FileInputStream fileStream=new FileInputStream(file);  
        InputStreamReader  inReader=new InputStreamReader(fileStream);  
        BufferedReader bReader=new BufferedReader(inReader);  
        StringBuffer strBuffer=new StringBuffer();  
        String temp=null;  
        while((temp=bReader.readLine())!=null){  
            strBuffer.append(temp);  
        }  
        return strBuffer.toString();  
    }  
  
}  