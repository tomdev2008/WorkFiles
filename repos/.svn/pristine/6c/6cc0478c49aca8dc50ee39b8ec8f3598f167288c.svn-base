package com.unicom.mms.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WriteSmil {
	public String write(List<String> list) throws IOException{
		String localPath = "";
    	String curDir = System.getProperty("user.dir");
    	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");
		String date  = df.format(new Date());
		String filePath = curDir+"/data"+"/"+date;
		File fdir = new File(filePath);
		if(!fdir.exists()){
			fdir.mkdirs();
		}
		String fileName = System.currentTimeMillis()+".smil";
		localPath = filePath+"/"+fileName;
		File f = new File(localPath);
		FileWriter fileWriter=new FileWriter(f);
		for(String str:list){
			 fileWriter.write(str+"\n");
		}
		fileWriter.flush();
		fileWriter.close();
		return localPath;
	}
	
	   public static void main(String args[]) throws IOException{
		   WriteSmil s = new WriteSmil();
		   List l = new ArrayList();
		   l.add("<smil>");
		   l.add(" <region id=\"Image\" top=\"0\" left=\"0\" height=\"50\" width=\"100\" fit=\"hidden\"/>");
		   l.add("<img src=\"30.gif\" region=\"Image\" />");
		   l.add("</par>");
		   l.add("</smil>");
		  String loaclPath =  s.write(l);
		  System.out.println(loaclPath);
	   }
}
