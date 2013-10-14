package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class CheckFile {
    public static void main(String[] args) throws Exception {
        
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path findf=new Path("/user");
        boolean isExists=hdfs.exists(findf);
        System.out.println("Exist?"+isExists);
        
       /*
         //练习一 
         Configuration conf=new Configuration();
    	FileSystem system=FileSystem.get(conf);
    	Path path=new Path("/newpath");
    	boolean bool=system.exists(path);
    	System.out.println("创建是否成功"+bool); 
         
        //练习二
        Configuration conf1=new Configuration();
        FileSystem system1=FileSystem.get(conf1);
        Path path1=new Path("/user");
        boolean bool=system1.exists(path1);
        if (bool)
        {
        	System.out.print("存在！");
        }
        else
        {
        	System.out.print("不存在！");
        }
       
        //练习三
        Configuration conf3=new Configuration();
        FileSystem system=FileSystem.get(conf3);
        Path path =new Path("/user");
        
        boolean bool=system.exists(path);
        if (bool)
        {
        	System.out.print("存在");  	
        }
        else
        {
        	System.out.print("bu 存在");  	
        }
        
        
        //练习四
        Configuration conf4=new Configuration();
        FileSystem hdfs4=FileSystem.get(conf4);
        Path findf4=new Path("/saf");
        boolean isExists4=hdfs4.exists(findf4);
        if (isExists4)
        {
        	System.out.print("存在");  	
        }
        else
        {
        	System.out.print("bu 存在");  	
        } */
    }
    
}