package com.easyhadoop.partition;

import java.io.File;
import java.io.FileWriter;

public class makedata {
	public static void main(String[] args) throws Exception{
		  File f=new File("E://GSM_201304_test.txt");
		  FileWriter fw=new FileWriter(f);
		  String longdata="&100&99&88&sanyue&0&2343&sdjs&2345&247&234756&100&2554&3328&1212&9000&2345656&1201&1212\r\n";
		  //StringBuffer Data = new StringBuffer("1");
		  for(int i=800000000;i<800000100;i++){
			  StringBuffer Data = new StringBuffer("13");
			  System.out.println(i);
			  Data.append(i);
			  Data.append(longdata);
		   fw.write(Data.toString());
		   
		  }
		 }
}
