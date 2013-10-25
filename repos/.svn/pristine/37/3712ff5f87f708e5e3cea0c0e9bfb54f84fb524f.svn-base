package com.unicom.mms.process;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProcessBuilderTest {
	public static void main(String[] args) throws IOException{
		/**
		 * convert -crop 300x300+0+0 -resize 200x200 -colors 100 +profile '*' d:\\images\\test.jpg d:\\images\\2.png
		 *  gm composite   D:\\images\\22.gif D:\\images\\bg3.png  D:\\images\\kkl.png
		 */
		List<String> command = new ArrayList();
		command.add("gm");
		command.add("convert");
		command.add("-crop");
		command.add("300x300+0+0");
		command.add("-resize");
		command.add("200x200");
		command.add("-colors");
		command.add("100");
		command.add("+profile");
		command.add("'*'");
		command.add("D://images//test.jpg");
		command.add("D://images//javaTest1.png");
		StringBuffer cmdout = new StringBuffer(); 
		
		List<String> composite  = new ArrayList();
		composite.add("gm");
		composite.add("composite");
		composite.add("-geometry");
		composite.add("+1+10");
		composite.add("D:\\images\\22.gif");
		composite.add("-geometry");
		composite.add("+50+50");
		composite.add("D:\\images\\bg3.png");
		composite.add("-geometry");
		composite.add("+200+250");
		composite.add("D:\\images\\20.gif");
		
		composite.add("D:\\images\\javaTest2.png");
		
		ProcessBuilder pb = new ProcessBuilder (command);
		ProcessBuilder compositePb = new ProcessBuilder (composite);
		System.out.println(command.toString());
		System.out.println(pb.command().toString());
		
		Process p=pb.start();
		compositePb.start();
		 InputStream fis = p.getInputStream(); 
         BufferedReader br = new BufferedReader(new InputStreamReader(fis,"gb2312")); 
         String line = null; 
         while ((line = br.readLine()) != null) { 
             cmdout.append(line); 
     } 
         System.out.print("执行系统命令后的结果为：\n" + cmdout.toString()); 
        //然后就可以对p做自己想做的事情了
        //自己这个时候就可以退出了
        System.exit(0);
	}
}
